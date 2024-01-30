package com.pawelapps.wiki.solution;

import com.pawelapps.wiki.subject.Subject;
import com.pawelapps.wiki.subject.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Transactional
public class SolutionServiceImpl implements SolutionService {

    private final SolutionRepository solutionRepository;
    private final SubjectService subjectService;

    private static final String IMAGE_DIRECTORY = "C:/Users/pawel/IdeaProjects/wiki-frontend/wiki-frontend/src/assets/images/";
    private static final String ANGULAR_RELATIVE_PATH = "/assets/images/";

    @Autowired
    public SolutionServiceImpl(SolutionRepository solutionRepository, SubjectService subjectService) {
        this.solutionRepository = solutionRepository;
        this.subjectService = subjectService;
    }

    @Override
    public Solution findById(Long id) {
        return solutionRepository.findById(id).orElseThrow();
    }

    @Override
    public List<Solution> findBySubjectId(Long id) {
        return solutionRepository.findBySubjectId(id);
    }

    @Override
    public Solution updateSolution(Solution solution) {
        return solutionRepository.save(solution);
    }

    @Override
    public void deleteSolution(Long id) {
        solutionRepository.deleteById(id);
    }


    @Override
    public Solution saveSolution(Long subjectId, Solution solution) {
        List<String> base64Images = extractBase64Images(solution.getDescription());

        if (!base64Images.isEmpty()) {
            List<String> imageUrls = new ArrayList<>();

            for (String base64Image : base64Images) {
                String[] parts = base64Image.split(",");
                String imageType = parts[0].split("/")[1].split(";")[0];
                byte[] imageBytes = Base64.getDecoder().decode(parts[1]);
                String fileName = UUID.randomUUID().toString() + "." + imageType;
                saveImageOnDisk(imageBytes, fileName);
                String imageUrl = ANGULAR_RELATIVE_PATH + fileName;
                imageUrls.add(imageUrl);
            }

            String descriptionWithImageUrls = replaceBase64WithUrls(solution.getDescription(), imageUrls);
            solution.setDescription(descriptionWithImageUrls);
        }

        Subject subject = subjectService.findById(subjectId);
        solution.setSubject(subject);
        return solutionRepository.save(solution);
    }

    private List<String> extractBase64Images(String htmlWithBase64) {
        List<String> base64Images = new ArrayList<>();
        Pattern pattern = Pattern.compile("data:image/(.*?);base64,([^\"']+)");
        Matcher matcher = pattern.matcher(htmlWithBase64);
        while (matcher.find()) {
            base64Images.add(matcher.group(0));
        }
        return base64Images;
    }

    private void saveImageOnDisk(byte[] imageBytes, String fileName) {
        try (FileOutputStream fos = new FileOutputStream(IMAGE_DIRECTORY + fileName)) {
            FileCopyUtils.copy(imageBytes, fos);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String replaceBase64WithUrls(String htmlWithBase64, List<String> imageUrls) {
        for (int i = 0; i < imageUrls.size(); i++) {
            htmlWithBase64 = htmlWithBase64.replaceFirst("data:image/(.*?);base64,[^\"']+", imageUrls.get(i));
        }
        return htmlWithBase64;
    }
}

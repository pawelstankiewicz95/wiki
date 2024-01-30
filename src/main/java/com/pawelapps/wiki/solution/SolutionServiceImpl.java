package com.pawelapps.wiki.solution;

import com.pawelapps.wiki.subject.Subject;
import com.pawelapps.wiki.subject.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;

import java.io.FileOutputStream;
import java.io.IOException;
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
    public Solution saveSolution(Long subjectId, Solution solution) {
        String base64Image = extractBase64Image(solution.getDescription());
        if (base64Image != null) {
            byte[] imageBytes = Base64.getDecoder().decode(base64Image);

            String fileName = UUID.randomUUID().toString() + ".png";

            saveImageOnDisk(imageBytes, fileName);

            String imageUrl = ANGULAR_RELATIVE_PATH + fileName;
            String descriptionWithImageUrl = replaceBase64WithUrl(solution.getDescription(), imageUrl);

            solution.setDescription(descriptionWithImageUrl);
        }
        Subject subject = subjectService.findById(subjectId);
        solution.setSubject(subject);
        return solutionRepository.save(solution);
    }

    @Override
    public Solution updateSolution(Solution solution) {
        return solutionRepository.save(solution);
    }

    @Override
    public void deleteSolution(Long id) {
        solutionRepository.deleteById(id);
    }

    private String extractBase64Image(String htmlWithBase64) {
        Pattern pattern = Pattern.compile("data:image/png;base64,([^\"']+)");
        Matcher matcher = pattern.matcher(htmlWithBase64);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return null;
    }

    private void saveImageOnDisk(byte[] imageBytes, String fileName) {
        try (FileOutputStream fos = new FileOutputStream(IMAGE_DIRECTORY + fileName)) {
            FileCopyUtils.copy(imageBytes, fos);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String replaceBase64WithUrl(String htmlWithBase64, String imageUrl) {
        return htmlWithBase64.replaceAll("data:image/png;base64,[^\"']+", imageUrl);
    }
}

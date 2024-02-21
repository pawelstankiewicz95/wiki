package com.pawelapps.wiki.solution;

import com.pawelapps.wiki.solution.image.ImageService;
import com.pawelapps.wiki.subject.Subject;
import com.pawelapps.wiki.subject.SubjectService;
import com.pawelapps.wiki.user.User;
import com.pawelapps.wiki.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Transactional
@RequiredArgsConstructor
public class SolutionServiceImpl implements SolutionService {

    private final SolutionRepository solutionRepository;
    private final SubjectService subjectService;
    private final UserService userService;
    private final ImageService imageService;

    private static final String IMAGE_DIRECTORY = "C:/Users/pawel/IdeaProjects/wiki-frontend/wiki-frontend/src/assets/images/";
    private static final String ANGULAR_RELATIVE_PATH = "/assets/images/";

    @Override
    public Solution findById(Long id) {
        return solutionRepository.findById(id).orElseThrow();
    }

    @Override
    public List<SolutionResponse> findBySubjectId(Long id) {
        return solutionRepository.findBySubjectId(id).stream().map(solution -> mapToSolutionResponse(solution)).toList();
    }

    @Override
    public Solution updateSolution(Solution solution) {
        Solution solutionFromDB = solutionRepository.findById(solution.getId()).orElseThrow();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        User user = userService.findByUsername(username);
        solutionFromDB.setModifier(user);
        solutionFromDB.setTimeUpdated(solution.getTimeUpdated());
        solutionFromDB.setDescription(solution.getDescription());
        return solutionRepository.save(solutionFromDB);
    }

    @Override
    public void deleteSolution(Long id) {
        Solution solution = solutionRepository.findById(id).orElseThrow();
        solution.getSubject().getSolutions().remove(solution);
        solution.setSubject(null);
        solutionRepository.delete(solution);
    }

    @Override
    public Solution saveSolution(Long subjectId, String username, Solution solution) {
        List<String> base64Images = imageService.findBase64ImagesInHtml(solution.getDescription());

        if (!base64Images.isEmpty()) {
            List<String> imageUrls = imageService.convertBase64ImagesToUrls(base64Images);
            String descriptionWithImageUrls = imageService.replaceBase64ImagesWithUrlsInHtml(solution.getDescription(), imageUrls);
            solution.setDescription(descriptionWithImageUrls);
        }

        Subject subject = subjectService.findById(subjectId);
        User user = userService.findByUsername(username);
        solution.setSubject(subject);
        solution.setUser(user);

        return solutionRepository.save(solution);
    }


    @Override
    public SolutionResponse mapToSolutionResponse(Solution solution) {
        SolutionResponse solutionResponse = SolutionResponse.builder()
                .id(solution.getId())
                .userResponse(userService.mapToUserResponse(solution.getUser()))
                .subjectResponse(subjectService.mapToSubjectResponse(solution.getSubject()))
                .description(solution.getDescription())
                .timeCreated(solution.getTimeCreated())
                .timeUpdated(solution.getTimeUpdated())
                .build();
        return solutionResponse;
    }

}

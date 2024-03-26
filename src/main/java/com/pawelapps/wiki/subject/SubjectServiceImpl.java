package com.pawelapps.wiki.subject;

import com.pawelapps.wiki.category.Category;
import com.pawelapps.wiki.category.CategoryService;
import com.pawelapps.wiki.solution.SolutionRepository;
import com.pawelapps.wiki.user.User;
import com.pawelapps.wiki.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class SubjectServiceImpl implements SubjectService {

    private final SubjectRepository subjectRepository;
    private final SolutionRepository solutionRepository;
    private final CategoryService categoryService;
    private final UserService userService;

    @Override
    public List<SubjectResponse> findByCategoryId(Long id) {
        return subjectRepository.findByCategoryId(id).stream().map(subject -> mapToSubjectResponse(subject)).toList();
    }

    @Override
    public List<SubjectResponse> findByTitle(String title) {
        return subjectRepository.findByTitle(title).stream().map(subject -> mapToSubjectResponse(subject)).toList();
    }

    @Override
    public Subject findById(Long id) {
        return subjectRepository.findById(id).orElseThrow();
    }

    @Override
    public SubjectResponse mapToSubjectResponse(Subject subject) {
        SubjectResponse subjectResponse = SubjectResponse.builder()
                .id(subject.getId())
                .title(subject.getTitle())
                .timeCreated(subject.getTimeCreated())
                .timeUpdated(subject.getTimeUpdated())
                .userResponse(userService.mapToUserResponse(subject.getUser()))
                .build();
        return subjectResponse;
    }

    @Override
    public Subject save(Long categoryId, String username, Subject subject) {
        Category category = categoryService.findById(categoryId);
        User user = userService.findByUsername(username);
        category.addSubject(subject);
        user.addSubject(subject);
        return subjectRepository.save(subject);
    }


}

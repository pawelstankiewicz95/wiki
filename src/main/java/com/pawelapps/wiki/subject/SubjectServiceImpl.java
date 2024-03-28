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
    public List<SubjectDto> findByCategoryId(Long id) {
        return subjectRepository.findByCategoryId(id).stream().map(subject -> mapToSubjectDto(subject)).toList();
    }

    @Override
    public List<SubjectDto> findByTitle(String title) {
        return subjectRepository.findByTitle(title).stream().map(subject -> mapToSubjectDto(subject)).toList();
    }

    @Override
    public Subject findById(Long id) {
        return subjectRepository.findById(id).orElseThrow();
    }

    public SubjectDto getSubjectDto(Long subjectId) {
        return this.mapToSubjectDto(findById(subjectId));
    }

    @Override
    public SubjectDto mapToSubjectDto(Subject subject) {
        SubjectDto subjectDto = SubjectDto.builder()
                .id(subject.getId())
                .title(subject.getTitle())
                .timeCreated(subject.getTimeCreated())
                .timeUpdated(subject.getTimeUpdated())
                .userResponse(userService.mapToUserResponse(subject.getUser()))
                .build();
        return subjectDto;
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

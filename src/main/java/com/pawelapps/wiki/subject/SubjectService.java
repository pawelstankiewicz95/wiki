package com.pawelapps.wiki.subject;

import java.util.List;

public interface SubjectService {
    List<SubjectDto> findByCategoryId(Long id);

    List<SubjectDto> findByTitle(String title);

    Subject findById(Long id);

    SubjectDto mapToSubjectDto(Subject subject);

    Subject save(Long categoryId, String username,  Subject subject);

    SubjectDto getSubjectDto(Long subjectId);
}

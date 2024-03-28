package com.pawelapps.wiki.subject;

import java.util.List;

public interface SubjectService {

    Subject save(Long categoryId, String username,  Subject subject);

    List<SubjectDto> findByCategoryId(Long id);

    List<SubjectDto> findByTitle(String title);

    Subject findById(Long id);

    void deleteById(Long id);

    SubjectDto mapToSubjectDto(Subject subject);

    SubjectDto getSubjectDto(Long subjectId);
}

package com.pawelapps.wiki.subject;

import java.util.List;

public interface SubjectService {
    List<SubjectResponse> findByCategoryId(Long id);

    List<SubjectResponse> findByTitle(String title);

    Subject findById(Long id);

    SubjectResponse mapToSubjectResponse(Subject subject);
}

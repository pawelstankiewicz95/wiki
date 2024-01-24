package com.pawelapps.wiki.subject;

import java.util.List;

public interface SubjectService {
    List<Subject> findByCategoryId(Long id);

    List<Subject> findByTitle(String title);
}

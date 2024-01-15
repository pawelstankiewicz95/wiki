package com.pawelapps.wiki.subject;

import com.pawelapps.wiki.category.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubjectRepository extends JpaRepository<Subject,Long> {
}

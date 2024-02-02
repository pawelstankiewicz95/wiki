package com.pawelapps.wiki.subject;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubjectRepository extends JpaRepository<Subject,Long> {
    List<Subject> findByCategoryId(Long id);

    @Query("SELECT s FROM Subject s WHERE LOWER(s.title) LIKE LOWER(CONCAT('%', :title, '%'))")
    List<Subject> findByTitle(@Param("title") String title);
}

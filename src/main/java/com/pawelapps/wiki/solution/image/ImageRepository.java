package com.pawelapps.wiki.solution.image;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface ImageRepository extends JpaRepository<Image ,Long> {
    Set<Image> findBySolutionId(Long solutionId);
}

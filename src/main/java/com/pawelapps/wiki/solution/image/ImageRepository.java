package com.pawelapps.wiki.solution.image;

import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface ImageRepository {
    Set<Image> findBySolutionId(Long solutionId);
}

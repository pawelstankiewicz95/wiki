package com.pawelapps.wiki.solution;

import com.pawelapps.wiki.category.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SolutionRepository extends JpaRepository<Solution,Long> {
}

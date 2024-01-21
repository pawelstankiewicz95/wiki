package com.pawelapps.wiki.solution;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SolutionRepository extends JpaRepository<Solution,Long> {

    List<Solution> findBySubjectId(Long id);
}

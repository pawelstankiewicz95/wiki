package com.pawelapps.wiki.solution;

import java.util.List;

public interface SolutionService {

    List<Solution> findBySubjectId(Long id);

    Solution saveSolution(Long subjectId, Solution solution);

    Solution updateSolution(Solution solution);

    void deleteSolution(Long id);
}

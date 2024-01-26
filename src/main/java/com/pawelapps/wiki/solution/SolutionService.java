package com.pawelapps.wiki.solution;

import java.util.List;

public interface SolutionService {

    Solution findById(Long id);

    List<Solution> findBySubjectId(Long id);

    Solution saveSolution(Long subjectId, Solution solution);

    Solution updateSolution(Solution solution);

    void deleteSolution(Long id);
}

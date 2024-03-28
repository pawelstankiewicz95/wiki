package com.pawelapps.wiki.solution;

import java.util.List;

public interface SolutionService {

    Solution findById(Long id);

    List<SolutionResponse> findBySubjectId(Long id);

    Solution saveSolution(Long subjectId, String username, Solution solution);

    Solution updateSolution(Solution solution);

    void deleteSolution(Long id);

    SolutionResponse mapToSolutionResponse(Solution solution);
}

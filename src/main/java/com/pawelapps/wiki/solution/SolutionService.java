package com.pawelapps.wiki.solution;

import java.util.List;

public interface SolutionService {

    List<Solution> findBySubjectId(Long id);

    Solution saveSolution(Solution solution);
}

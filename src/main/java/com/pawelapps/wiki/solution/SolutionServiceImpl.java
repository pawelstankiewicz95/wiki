package com.pawelapps.wiki.solution;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SolutionServiceImpl implements SolutionService {

    private final SolutionRepository solutionRepository;

    @Autowired
    public SolutionServiceImpl(SolutionRepository solutionRepository) {
        this.solutionRepository = solutionRepository;
    }

    @Override
    public List<Solution> findBySubjectId(Long id) {
        return solutionRepository.findBySubjectId(id);
    }

    @Override
    public Solution saveSolution(Solution solution) {
        return this.solutionRepository.save(solution);
    }
}

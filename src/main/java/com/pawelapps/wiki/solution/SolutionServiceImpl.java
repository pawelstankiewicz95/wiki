package com.pawelapps.wiki.solution;

import com.pawelapps.wiki.subject.Subject;
import com.pawelapps.wiki.subject.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SolutionServiceImpl implements SolutionService {

    private final SolutionRepository solutionRepository;
    private final SubjectService subjectService;

    @Autowired
    public SolutionServiceImpl(SolutionRepository solutionRepository, SubjectService subjectService) {
        this.solutionRepository = solutionRepository;
        this.subjectService = subjectService;
    }

    @Override
    public List<Solution> findBySubjectId(Long id) {
        return solutionRepository.findBySubjectId(id);
    }

    @Override
    public Solution saveSolution(Long subjectId, Solution solution) {
        Subject subject = subjectService.findById(subjectId);
        solution.setSubject(subject);
        return this.solutionRepository.save(solution);
    }

    @Override
    public Solution updateSolution(Solution solution) {
        return this.solutionRepository.save(solution);
    }
}

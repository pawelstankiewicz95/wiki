package com.pawelapps.wiki.solution;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class SolutionController {
    private final SolutionService solutionService;

    @Autowired
    public SolutionController(SolutionService solutionService) {
        this.solutionService = solutionService;
    }

    @GetMapping("/solutions/solutions-by-subject-id/{subjectId}")
    public ResponseEntity<List<Solution>> getSolutionBySubjectId(@PathVariable("subjectId") Long id) {
        List<Solution> solutions = solutionService.findBySubjectId(id);
        return new ResponseEntity<>(solutions, HttpStatus.OK);
    }

    @PostMapping("/solutions/")
    public ResponseEntity<Solution> saveSolution(@RequestBody Solution solution) {
        Solution newSolution = this.solutionService.saveSolution(solution);
        return new ResponseEntity<>(newSolution, HttpStatus.CREATED);
    }
}

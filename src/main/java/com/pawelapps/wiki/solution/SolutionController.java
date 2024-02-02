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

    @GetMapping("/solutions/{solutionId}")
    public ResponseEntity<Solution> getSolutionById(@PathVariable ("solutionId") Long id) {
        Solution solution = solutionService.findById(id);
        return new ResponseEntity<>(solution, HttpStatus.OK);
    }

    @GetMapping("/solutions/solutions-by-subject-id/{subjectId}")
    public ResponseEntity<List<Solution>> getSolutionsBySubjectId(@PathVariable("subjectId") Long id) {
        List<Solution> solutions = solutionService.findBySubjectId(id);
        return new ResponseEntity<>(solutions, HttpStatus.OK);
    }

    @PostMapping("/solutions")
    public ResponseEntity<Solution> saveSolution(@RequestBody Solution solution, @RequestParam("subjectId") Long subjectId) {
        Solution newSolution = this.solutionService.saveSolution(subjectId, solution);
        return new ResponseEntity<>(newSolution, HttpStatus.CREATED);
    }

    @PutMapping("/solutions")
    public ResponseEntity<Solution> updateSolution(@RequestBody Solution solution) {
        Solution updatedSolution = this.solutionService.updateSolution(solution);
        return new ResponseEntity<>(updatedSolution, HttpStatus.OK);
    }
}

package com.pawelapps.wiki.subject;

import com.pawelapps.wiki.solution.Solution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/api")
public class SubjectController {

    private final SubjectService subjectService;

    @Autowired
    public SubjectController(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @GetMapping("subjects/subjects-by-category-id/{subjectId}")
    public ResponseEntity<List<SubjectResponse>> getSubjectsByCategoryId(@PathVariable("subjectId") Long categoryId){
        List<SubjectResponse> subjects = subjectService.findByCategoryId(categoryId);
        return new ResponseEntity<>(subjects, HttpStatus.OK);
    }

    @GetMapping("subjects/search-by-title")
    public ResponseEntity<List<SubjectResponse>> getSubjectsByTitle(@RequestParam("title") String title){
        List<SubjectResponse> subjects = subjectService.findByTitle(title);
        return new ResponseEntity<>(subjects, HttpStatus.OK);
    }

    @PostMapping("/subjects")
    public ResponseEntity<Subject> saveSubject(@RequestParam("categoryId") Long categoryId, Principal principal, @RequestBody Subject subject){
        Subject newSubject = this.subjectService.save(categoryId, principal.getName(), subject);
        return new ResponseEntity<>(newSubject, HttpStatus.CREATED);
    }
}

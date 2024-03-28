package com.pawelapps.wiki.subject;

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

    @PostMapping("/subjects")
    public ResponseEntity<Subject> saveSubject(@RequestParam("categoryId") Long categoryId, Principal principal, @RequestBody Subject subject) {
        Subject newSubject = this.subjectService.save(categoryId, principal.getName(), subject);
        return new ResponseEntity<>(newSubject, HttpStatus.CREATED);
    }

    @GetMapping("subjects/subjects-by-category-id/{subjectId}")
    public ResponseEntity<List<SubjectDto>> getSubjectsByCategoryId(@PathVariable("subjectId") Long categoryId) {
        List<SubjectDto> subjects = subjectService.findByCategoryId(categoryId);
        return new ResponseEntity<>(subjects, HttpStatus.OK);
    }

    @GetMapping("subjects/search-by-title")
    public ResponseEntity<List<SubjectDto>> getSubjectsByTitle(@RequestParam("title") String title) {
        List<SubjectDto> subjects = subjectService.findByTitle(title);
        return new ResponseEntity<>(subjects, HttpStatus.OK);
    }

    @GetMapping("subjects/{subjectId}")
    public ResponseEntity<SubjectDto> getSubjectById(@PathVariable("subjectId") Long subjectId) {
        SubjectDto subject = subjectService.getSubjectDto(subjectId);
        return new ResponseEntity<>(subject, HttpStatus.OK);
    }

    @DeleteMapping("/subjects")
    public ResponseEntity<?> deleteSolution(@RequestParam("subjectId") Long subjectId) {
        subjectService.deleteById(subjectId);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}

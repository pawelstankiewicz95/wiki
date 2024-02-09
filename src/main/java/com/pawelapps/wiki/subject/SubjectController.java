package com.pawelapps.wiki.subject;

import com.pawelapps.wiki.category.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<List<Subject>> getSubjectsByCategoryId(@PathVariable("subjectId") Long categoryId){
        List<Subject> subjects = subjectService.findByCategoryId(categoryId);
        return new ResponseEntity<>(subjects, HttpStatus.OK);
    }

    @GetMapping("subjects/search-by-title")
    public ResponseEntity<List<Subject>> getSubjectsByTitle(@RequestParam("title") String title){
        List<Subject> subjects = subjectService.findByTitle(title);
        return new ResponseEntity<>(subjects, HttpStatus.OK);
    }
}

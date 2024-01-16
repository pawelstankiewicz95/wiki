package com.pawelapps.wiki.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class CategoryController {
    private final CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/categories-by-program-id/{programId}")
    public ResponseEntity<List<Category>> getCategoriesByProgramId(@PathVariable("programId") Long programId){
        List<Category> categories = categoryService.findByProgramId(programId);
        return new ResponseEntity<>(categories, HttpStatus.OK);
    }
}

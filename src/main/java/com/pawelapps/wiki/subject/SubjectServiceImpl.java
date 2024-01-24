package com.pawelapps.wiki.subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService{

    private final SubjectRepository subjectRepository;

    @Autowired
    public SubjectServiceImpl(SubjectRepository subjectRepository) {
        this.subjectRepository = subjectRepository;
    }

    @Override
    public List<Subject> findByCategoryId(Long id){
        return subjectRepository.findByCategoryId(id);
    };

    @Override
    public List<Subject> findByTitle(String title){
        return subjectRepository.findByTitle(title);
    }
}

package com.pawelapps.wiki.program;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class ProgramServiceImpl implements ProgramService{

    private final ProgramRepository programRepository;

    @Autowired
    public ProgramServiceImpl(ProgramRepository programRepository) {
        this.programRepository = programRepository;
    }

    @Override
    public Program saveProgram(Program program) {
        return programRepository.save(program);
    }

    @Override
    public Program getProgramById(Long id) {
        return programRepository.findById(id).orElseThrow();
    }

    @Override
    public List<Program> getAllPrograms() {
        return programRepository.findAll();
    }

    @Override
    public Program updateProgram(Program program) {
        return programRepository.save(program);
    }

    @Override
    public void deleteProgramById(Long id) {
        programRepository.deleteById(id);
    }
}

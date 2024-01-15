package com.pawelapps.wiki.program;

import java.util.List;

public interface ProgramService {
    Program saveProgram(Program program);

    Program getProgramById(Long id);

    List<Program> getAllPrograms();

    Program updateProgram(Program program);

    void deleteProgramById(Long id);
}

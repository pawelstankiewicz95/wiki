package com.pawelapps.wiki.program;

import java.util.List;

public interface ProgramService {
    List<Program> getAllPrograms();

    Program saveProgram(Program program);
}

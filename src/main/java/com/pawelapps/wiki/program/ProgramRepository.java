package com.pawelapps.wiki.program;

import com.pawelapps.wiki.category.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProgramRepository extends JpaRepository<Program,Long> {
}

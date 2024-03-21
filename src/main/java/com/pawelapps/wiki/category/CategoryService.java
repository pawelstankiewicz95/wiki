package com.pawelapps.wiki.category;

import java.util.List;

public interface CategoryService {
    List<Category> findByProgramId(Long id);

    Category findById(Long id);
}

package com.pawelapps.wiki.user;

import com.pawelapps.wiki.category.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Long> {
}

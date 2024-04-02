package com.pawelapps.wiki.user;

import com.pawelapps.wiki.category.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByUsername(String username);

    Optional<UserRoleView> findRoleByUsername(String username);
}

package com.pawelapps.wiki.user;

public interface UserService {

    User findByUsername(String username);
    UserResponse mapToUserResponse(User user);
}

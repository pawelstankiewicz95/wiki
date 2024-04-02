package com.pawelapps.wiki.user;

public interface UserService {

    User findByUsername(String username);
    UserDto mapToUserDto(User user);
}

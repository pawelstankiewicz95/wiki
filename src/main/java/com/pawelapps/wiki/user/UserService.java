package com.pawelapps.wiki.user;

import java.util.List;

public interface UserService {

    User findByUsername(String username);

    List<UserDto> getUsersDto();

    UserDto mapToUserDto(User user);

    UserDto getUserDto(String username);

    UserRoleView findRoleByUsername(String username);

}

package com.pawelapps.wiki.user;

import java.util.List;
import java.util.Map;

public interface UserService {

    User findByUsername(String username);

    List<UserDto> getUsersDto();

    UserDto mapToUserDto(User user);

    UserDto updateUserByFields(String username, Map<String, Object> fields);

    UserDto getUserDto(String username);

    UserRoleView findRoleByUsername(String username);

}

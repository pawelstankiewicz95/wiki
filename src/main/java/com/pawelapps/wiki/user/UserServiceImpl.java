package com.pawelapps.wiki.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username).orElseThrow();
    }

    @Override
    public List<UserDto> getUsersDto() {
        return userRepository.findAll().stream().map(user -> mapToUserDto(user)).toList();
    }

    @Override
    public UserDto getUserDto(String username){
       return this.mapToUserDto(this.findByUsername(username));
    }

    @Override
    public UserRoleView findRoleByUsername(String username) {
        return this.userRepository.findRoleByUsername(username).orElseThrow();
    }

    @Override
    public UserDto mapToUserDto(User user) {
        UserDto userDto = UserDto.builder()
                .username(user.getUsername())
                .email(user.getEmail())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .role(user.getRole())
                .build();
        return userDto;
    }
}

package com.pawelapps.wiki.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
    public UserDto updateUserByFields(String username, Map<String, Object> fields){

        User existingUser = userRepository.findByUsername(username).orElseThrow();

        fields.forEach((key, value) -> {
            Field field = ReflectionUtils.findField(User.class, key);
            field.setAccessible(true);
            ReflectionUtils.setField(field, existingUser, value);
        });

        return mapToUserDto(userRepository.save(existingUser));
    }

    @Override
    public UserDto mapToUserDto(User user) {
        UserDto userDto = UserDto.builder()
                .username(user.getUsername())
                .email(user.getEmail())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .role(user.getRole())
                .isEnabled(user.isEnabled())
                .build();
        return userDto;
    }
}

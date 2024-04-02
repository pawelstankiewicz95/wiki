package com.pawelapps.wiki.user;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class UserController {

    private final UserService userService;

    @GetMapping("/users/{username}")
    public ResponseEntity<UserDto> getUserByUsername(@PathVariable("username") String username) {
        UserDto userDto = this.userService.getUserDto(username);
        return new ResponseEntity<>(userDto, HttpStatus.OK);
    }

    @GetMapping("/users/role")
    public ResponseEntity<UserRoleView> getUserRoleByUsername(@RequestParam("username") String username) {
        UserRoleView userRole = this.userService.findRoleByUsername(username);
        return new ResponseEntity<>(userRole, HttpStatus.OK);
    }
}

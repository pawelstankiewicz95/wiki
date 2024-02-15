package com.pawelapps.wiki.user;

public record UserResponse(String username, String email, String firstName, String lastName, Role role) {
}

package com.pawelapps.wiki.user;

import lombok.Builder;

@Builder
public record UserResponse(String username, String email, String firstName, String lastName, Role role) {
}

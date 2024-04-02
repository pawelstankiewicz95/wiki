package com.pawelapps.wiki.chat.message;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.pawelapps.wiki.user.UserDto;

import java.time.LocalDateTime;

public record MessageDto(Long id,
                         String message,
                         LocalDateTime timeCreated,
                         @JsonProperty(value = "user", access = JsonProperty.Access.READ_ONLY)
                         UserDto userDto) {
}

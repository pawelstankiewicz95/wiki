package com.pawelapps.wiki.subject;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.pawelapps.wiki.user.UserResponse;
import lombok.Builder;

import java.time.LocalDateTime;

@Builder
public record SubjectDto(Long id,
                         String title,
                         LocalDateTime timeCreated,
                         LocalDateTime timeUpdated,
                         @JsonProperty("user")
                              UserResponse userResponse
) {
}

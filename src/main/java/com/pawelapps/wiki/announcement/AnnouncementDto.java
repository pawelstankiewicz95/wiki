package com.pawelapps.wiki.announcement;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.pawelapps.wiki.user.UserResponse;
import lombok.Builder;

@Builder
public record AnnouncementDto(Long id,
                              String title,
                              String description,
                              @JsonProperty("user")
                              UserResponse userResponse) {
}

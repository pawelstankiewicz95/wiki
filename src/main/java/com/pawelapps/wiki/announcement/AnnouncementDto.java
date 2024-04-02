package com.pawelapps.wiki.announcement;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.pawelapps.wiki.user.UserDto;
import lombok.Builder;

@Builder
public record AnnouncementDto(Long id,
                              String title,
                              String description,
                              @JsonProperty("user")
                              UserDto userDto) {
}

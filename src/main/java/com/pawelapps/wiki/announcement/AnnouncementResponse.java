package com.pawelapps.wiki.announcement;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.pawelapps.wiki.user.UserResponse;

public record AnnouncementResponse(Long id,
                                   String title,
                                   String description,
                                   @JsonProperty("user")
                                   UserResponse userResponse) {
}

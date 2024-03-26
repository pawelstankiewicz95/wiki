package com.pawelapps.wiki.solution;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.pawelapps.wiki.subject.SubjectDto;
import com.pawelapps.wiki.user.UserResponse;
import lombok.Builder;

import java.time.LocalDateTime;

@Builder
public record SolutionResponse(Long id,
                               @JsonProperty("user")
                               UserResponse userResponse,
                               @JsonIgnoreProperties({"userResponse"})
                               @JsonProperty("solutionSubject")
                               SubjectDto subjectDto,
                               String description,
                               LocalDateTime timeCreated,
                               LocalDateTime timeUpdated) {
}


package com.pawelapps.wiki.solution;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.pawelapps.wiki.subject.Subject;
import com.pawelapps.wiki.user.User;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
@Entity
@Table(name = "solution")
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
public class Solution {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", updatable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name ="modifed_by_user_id", insertable = false)
    private User modifier;

    @ManyToOne
    @JoinColumn(name = "subject_id")
    @JsonIgnoreProperties({"user"})
    @JsonProperty("solutionSubject")
    private Subject subject;

    @Column(name = "description")
    private String description;

    @Column(name = "time_created", updatable = false)
    private LocalDateTime timeCreated;

    @Column(name = "time_updated", insertable = false)
    private LocalDateTime timeUpdated;

}

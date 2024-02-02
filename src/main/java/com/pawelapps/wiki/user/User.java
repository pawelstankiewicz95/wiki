package com.pawelapps.wiki.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pawelapps.wiki.role.Role;
import com.pawelapps.wiki.solution.Solution;
import com.pawelapps.wiki.subject.Subject;
import jakarta.persistence.*;
import lombok.*;

import java.util.Collection;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "password")
    @JsonIgnore
    private String password;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private List<Subject> subjects;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private List<Solution> solutions;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private Collection<Role> roles;
}

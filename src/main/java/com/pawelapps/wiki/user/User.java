package com.pawelapps.wiki.user;

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
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "password")
    private String password;

    @OneToMany(mappedBy = "user")
    @JsonIgnoreProperties("user")
    private List<Subject> subjects;

    @JsonIgnoreProperties("user")
    @OneToMany(mappedBy = "user")
    private List<Solution> solutions;

    @JsonIgnoreProperties("user")
    @OneToMany(mappedBy = "user")
    private Collection<Role> roles;
}

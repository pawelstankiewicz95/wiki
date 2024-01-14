package com.pawelapps.wiki.user;

import com.pawelapps.wiki.solution.Solution;
import com.pawelapps.wiki.subject.Subject;
import jakarta.persistence.*;

import java.util.List;

@Table(name = "user")
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
    private List<Subject> subjects;

    @OneToMany(mappedBy = "user")
    private List<Solution> solutions;
}

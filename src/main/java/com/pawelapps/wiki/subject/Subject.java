package com.pawelapps.wiki.subject;

import com.pawelapps.wiki.solution.Solution;
import com.pawelapps.wiki.user.User;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;

@Table(name = "subject")
public class Subject {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "id")
    private String tittle;

    @Column(name = "id")
    private LocalDateTime timeCreated;

    @Column(name = "id")
    private LocalDateTime timeUpdated;

    @OneToMany(mappedBy = "solution")
    private List<Solution> solutions;
}

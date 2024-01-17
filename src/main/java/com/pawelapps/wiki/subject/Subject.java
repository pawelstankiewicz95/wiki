package com.pawelapps.wiki.subject;

import com.pawelapps.wiki.category.Category;
import com.pawelapps.wiki.solution.Solution;
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
@Table(name = "subject")
public class Subject {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "tittle")
    private String tittle;

    @Column(name = "time_created")
    private LocalDateTime timeCreated;

    @Column(name = "time_updated")
    private LocalDateTime timeUpdated;

    @OneToMany(mappedBy = "subject")
    private List<Solution> solutions;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
}

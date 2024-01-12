package com.pawelapps.wiki.program;

import com.pawelapps.wiki.category.Category;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
@Entity
@Table(name = "program")
public class Program {
    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "program")
    private List<Category> categories;
}

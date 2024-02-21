package com.pawelapps.wiki.solution.image;

import com.pawelapps.wiki.solution.Solution;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "solution_image")
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Image {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "solution_id")
    private Solution solution;

    @Column(name = "path")
    private String path;
}

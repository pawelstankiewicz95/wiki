package com.pawelapps.wiki.solution;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.pawelapps.wiki.program.Program;
import com.pawelapps.wiki.solution.image.Image;
import com.pawelapps.wiki.subject.Subject;
import com.pawelapps.wiki.user.User;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.proxy.HibernateProxy;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import java.util.Objects;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Builder
@Entity
@Table(name = "solution")
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id",
        scope = Solution.class)
public class Solution {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "solution", orphanRemoval = true)
    private Collection<Image> images;

    @Column(name = "description")
    private String description;

    @Column(name = "time_created", updatable = false)
    private LocalDateTime timeCreated;

    @Column(name = "time_updated", insertable = false)
    private LocalDateTime timeUpdated;

    @Override
    public final boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        Class<?> oEffectiveClass = o instanceof HibernateProxy ? ((HibernateProxy) o).getHibernateLazyInitializer().getPersistentClass() : o.getClass();
        Class<?> thisEffectiveClass = this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass() : this.getClass();
        if (thisEffectiveClass != oEffectiveClass) return false;
        Solution solution = (Solution) o;
        return getId() != null && Objects.equals(getId(), solution.getId());
    }

    @Override
    public final int hashCode() {
        return this instanceof HibernateProxy
                ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass().hashCode()
                : getClass().hashCode();
    }

}

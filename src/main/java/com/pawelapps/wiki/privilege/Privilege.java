package com.pawelapps.wiki.privilege;

import com.pawelapps.wiki.role.Role;
import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "privilege")
public class Privilege {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @ManyToMany(mappedBy = "privileges")
    private Collection<Role> roles;
}

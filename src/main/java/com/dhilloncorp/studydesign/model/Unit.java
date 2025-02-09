package com.dhilloncorp.studydesign.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class Unit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String unitId;
    private String unitName;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<AreaOfStudy> areasOfStudy;

    // Getters and Setters
    // ...existing code...
}

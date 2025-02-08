package com.dhilloncorp.studydesign.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class AreaOfStudy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String areaId;
    private String areaName;
    private String areaDescription;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Outcome> outcomes;

    // Getters and Setters
    // ...existing code...
}

package com.dhilloncorp.studydesign.model;
    
import jakarta.persistence.*;
import java.util.List;

@Entity
public class Outcome {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String outcomeId;
    private String outcomeName;
    private String outcomeDescription;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<KeyKnowledge> keyKnowledge;

    // Getters and Setters
    // ...existing code...
}

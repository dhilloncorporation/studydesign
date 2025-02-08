package com.dhilloncorp.studydesign.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class KeyKnowledge {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String knowledgeTopicName;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<SubTopic> subTopics;

    // Getters and Setters
    // ...existing code...
}


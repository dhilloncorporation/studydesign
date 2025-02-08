package com.dhilloncorp.studydesign.repository;

import com.dhilloncorp.studydesign.model.StudyDesign;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudyDesignRepository extends JpaRepository<StudyDesign, Long> {
}

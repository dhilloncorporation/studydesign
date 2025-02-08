package com.dhilloncorp.studydesign.service;

import com.dhilloncorp.studydesign.model.StudyDesign;
import com.dhilloncorp.studydesign.repository.StudyDesignRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyDesignService {
    @Autowired
    private StudyDesignRepository studyDesignRepository;

    public List<StudyDesign> getAllStudyDesigns() {
        return studyDesignRepository.findAll();
    }

    public StudyDesign getStudyDesignById(Long id) {
        return studyDesignRepository.findById(id).orElse(null);
    }

    public StudyDesign saveStudyDesign(StudyDesign studyDesign) {
        return studyDesignRepository.save(studyDesign);
    }

    public void deleteStudyDesign(Long id) {
        studyDesignRepository.deleteById(id);
    }
}

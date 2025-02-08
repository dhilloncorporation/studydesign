package com.dhilloncorp.studydesign.controller;

import com.dhilloncorp.studydesign.model.StudyDesign;
import com.dhilloncorp.studydesign.service.StudyDesignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

@RestController
@RequestMapping("/api/studydesigns")
public class StudyDesignController {
    private static final Logger logger = LoggerFactory.getLogger(StudyDesignController.class);

    @Autowired
    private StudyDesignService studyDesignService;

    @GetMapping
    public List<StudyDesign> getAllStudyDesigns() {
        logger.info("Fetching all study designs");
        return studyDesignService.getAllStudyDesigns();
    }

    @GetMapping("/{id}")
    public StudyDesign getStudyDesignById(@PathVariable Long id) {
        return studyDesignService.getStudyDesignById(id);
    }

    @PostMapping
    public StudyDesign createStudyDesign(@RequestBody StudyDesign studyDesign) {
        return studyDesignService.saveStudyDesign(studyDesign);
    }

    @PutMapping("/{id}")
    public StudyDesign updateStudyDesign(@PathVariable Long id, @RequestBody StudyDesign studyDesign) {
        StudyDesign existingStudyDesign = studyDesignService.getStudyDesignById(id);
        if (existingStudyDesign != null) {
            studyDesign.setId(id);
            return studyDesignService.saveStudyDesign(studyDesign);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteStudyDesign(@PathVariable Long id) {
        studyDesignService.deleteStudyDesign(id);
    }
}

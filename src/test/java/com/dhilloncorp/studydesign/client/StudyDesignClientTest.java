package com.dhilloncorp.studydesign.client;

import com.dhilloncorp.studydesign.model.StudyDesign;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.client.RestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;

import java.util.List;

public class StudyDesignClientTest {
    private static final Logger logger = LoggerFactory.getLogger(StudyDesignClientTest.class);
    private static final String BASE_URL = "http://localhost:8080/api/studydesigns";
    private final RestTemplate restTemplate;

    public StudyDesignClientTest() {
        this.restTemplate = new RestTemplate();
    }

    public void testGetAllStudyDesigns() {
        try {
            logger.debug("Attempting to connect to: {}", BASE_URL);
            
            ResponseEntity<List<StudyDesign>> response = restTemplate.exchange(
                BASE_URL,
                HttpMethod.GET,
                null,
                new ParameterizedTypeReference<List<StudyDesign>>() {}
            );
            
            logger.debug("Raw response: {}", response);

            List<StudyDesign> studyDesigns = response.getBody();
            logger.info("Response Status: {}", response.getStatusCode());
            logger.info("Number of study designs retrieved: {}", studyDesigns != null ? studyDesigns.size() : 0);

            if (studyDesigns != null) {
                studyDesigns.forEach(design -> 
                    logger.info("Study Design: ID={}, Name={}, Subject={}, Class={}, Board={}, Summary={}", 
                        design.getStudyId(), 
                        design.getName(),
                        design.getSubject(),
                        design.getClassName(),
                        design.getBoard(),
                        design.getSummary())
                );
            }
        } catch (Exception e) {
            logger.error("Connection failed: {} - {}", e.getClass().getName(), e.getMessage());
            if (e instanceof org.springframework.web.client.ResourceAccessException) {
                logger.error("Server might not be running at {}", BASE_URL);
            }
            throw e;
        }
    }

    public static void main(String[] args) {
        StudyDesignClientTest client = new StudyDesignClientTest();
        client.testGetAllStudyDesigns();
    }
}
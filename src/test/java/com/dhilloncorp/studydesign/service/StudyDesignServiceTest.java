package com.dhilloncorp.studydesign.service;

import com.dhilloncorp.studydesign.model.StudyDesign;
import com.dhilloncorp.studydesign.repository.StudyDesignRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class StudyDesignServiceTest {

    @Mock
    private StudyDesignRepository studyDesignRepository;

    @InjectMocks
    private StudyDesignService studyDesignService;

    private StudyDesign testStudyDesign;

    @BeforeEach
    void setUp() {
        testStudyDesign = new StudyDesign();
        testStudyDesign.setStudyId(1L);
        testStudyDesign.setName("Test Study Design");
        testStudyDesign.setSummary("Test Summary");
        testStudyDesign.setSubject("Mathematics");
        testStudyDesign.setClassName("12");
        testStudyDesign.setBoard("VCE");
    }

    @Test
    void getAllStudyDesigns_ShouldReturnList() {
        // Given
        List<StudyDesign> expectedStudyDesigns = Arrays.asList(testStudyDesign);
        when(studyDesignRepository.findAll()).thenReturn(expectedStudyDesigns);

        // When
        List<StudyDesign> actualStudyDesigns = studyDesignService.getAllStudyDesigns();

        // Then
        assertThat(actualStudyDesigns).isNotNull();
        assertThat(actualStudyDesigns).hasSize(1);
        StudyDesign actual = actualStudyDesigns.get(0);
        assertThat(actual.getName()).isEqualTo("Test Study Design");
        assertThat(actual.getSubject()).isEqualTo("Mathematics");
        assertThat(actual.getClassName()).isEqualTo("12");
        assertThat(actual.getBoard()).isEqualTo("VCE");
        assertThat(actual.getSummary()).isEqualTo("Test Summary");
        verify(studyDesignRepository, times(1)).findAll();
    }

    @Test
    void getStudyDesignById_WhenExists_ShouldReturnStudyDesign() {
        // Given
        when(studyDesignRepository.findById(1L)).thenReturn(Optional.of(testStudyDesign));

        // When
        StudyDesign found = studyDesignService.getStudyDesignById(1L);

        // Then
        assertThat(found).isNotNull();
        assertThat(found.getName()).isEqualTo("Test Study Design");
        verify(studyDesignRepository, times(1)).findById(1L);
    }

    @Test
    void getStudyDesignById_WhenNotExists_ShouldReturnNull() {
        // Given
        when(studyDesignRepository.findById(99L)).thenReturn(Optional.empty());

        // When
        StudyDesign found = studyDesignService.getStudyDesignById(99L);

        // Then
        assertThat(found).isNull();
        verify(studyDesignRepository, times(1)).findById(99L);
    }

    @Test
    void saveStudyDesign_ShouldReturnSavedStudyDesign() {
        // Given
        when(studyDesignRepository.save(any(StudyDesign.class))).thenReturn(testStudyDesign);

        // When
        StudyDesign saved = studyDesignService.saveStudyDesign(testStudyDesign);

        // Then
        assertThat(saved).isNotNull();
        assertThat(saved.getName()).isEqualTo("Test Study Design");
        assertThat(saved.getSubject()).isEqualTo("Mathematics");
        assertThat(saved.getClassName()).isEqualTo("12");
        assertThat(saved.getBoard()).isEqualTo("VCE");
        assertThat(saved.getSummary()).isEqualTo("Test Summary");
        verify(studyDesignRepository, times(1)).save(testStudyDesign);
    }

    @Test
    void deleteStudyDesign_ShouldCallRepository() {
        // When
        studyDesignService.deleteStudyDesign(1L);

        // Then
        verify(studyDesignRepository, times(1)).deleteById(1L);
    }
}
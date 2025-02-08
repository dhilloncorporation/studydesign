
-- Create table for study design
CREATE TABLE study_design.study_design_study (
    study_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    summary TEXT,
    subject VARCHAR(255),
    class VARCHAR(50),
    board VARCHAR(50)
);

-- Create table for units
CREATE TABLE study_design.study_design_unit (
    unit_id VARCHAR(50) PRIMARY KEY,
    study_id INT REFERENCES study_design.study_design_study(study_id),
    unit_name VARCHAR(255) NOT NULL
);

-- Create table for areas of study
CREATE TABLE study_design.study_design_area_of_study (
    area_id VARCHAR(50) PRIMARY KEY,
    unit_id VARCHAR(50) REFERENCES study_design.study_design_unit(unit_id),
    area_name VARCHAR(255) NOT NULL,
    area_description TEXT
);

-- Create table for outcomes
CREATE TABLE study_design.study_design_outcome (
    outcome_id VARCHAR(50) PRIMARY KEY,
    area_id VARCHAR(50) REFERENCES study_design.study_design_area_of_study(area_id),
    outcome_name VARCHAR(255) NOT NULL,
    outcome_description TEXT
);

-- Create table for key knowledge topics
CREATE TABLE study_design.study_design_key_knowledge (
    knowledge_topic_id SERIAL PRIMARY KEY,
    outcome_id VARCHAR(50) REFERENCES study_design.study_design_outcome(outcome_id),
    knowledge_topic_name VARCHAR(255) NOT NULL
);

-- Create table for sub-topics
CREATE TABLE study_design.study_design_sub_topic (
    sub_topic_id SERIAL PRIMARY KEY,
    knowledge_topic_id INT REFERENCES study_design.study_design_key_knowledge(knowledge_topic_id),
    sub_topic_name VARCHAR(255) NOT NULL,
    details TEXT
);

-- Insert sample data
INSERT INTO study_design.study_design_study (name, summary, subject, class, board)
VALUES ('Study Design Name', 'Study Design Summary', 'Physics', 'Year 12', 'VCAA');

INSERT INTO study_design.study_design_unit (unit_id, study_id, unit_name)
VALUES ('unit_id_1', 1, 'Unit 1: How are light and heat explained?');

INSERT INTO study_design.study_design_area_of_study (area_id, unit_id, area_name, area_description)
VALUES ('area_id_1', 'unit_id_1', 'How are light and heat explained?', 'In this area of study, students explore the fundamental physics concepts of light and thermal energy.');

INSERT INTO study_design.study_design_outcome (outcome_id, area_id, outcome_name, outcome_description)
VALUES ('outcome_id_1', 'area_id_1', 'Model, investigate, and evaluate the wave-like nature of light and thermal energy.', 'On completion of this unit the student should be able to model, investigate and evaluate the wave-like nature of light, thermal energy and the emission and absorption of light by matter.');

INSERT INTO study_design.study_design_key_knowledge (outcome_id, knowledge_topic_name)
VALUES ('outcome_id_1', 'Electromagnetic radiation');

INSERT INTO study_design.study_design_sub_topic (knowledge_topic_id, sub_topic_name, details)
VALUES (1, 'Identify all electromagnetic waves as transverse waves', 'Identify all electromagnetic waves as transverse waves travelling at the same speed, c, in a vacuum as distinct from mechanical waves that require a medium to propagate.'),
       (1, 'Identify the amplitude, wavelength, period and frequency of waves', 'Identify the amplitude, wavelength, period and frequency of waves.');

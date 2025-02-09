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



-- Reset sequences
ALTER SEQUENCE study_design_study_study_id_seq RESTART WITH 1;
ALTER SEQUENCE IF EXISTS study_design_area_of_study_id_seq RESTART WITH 1;
ALTER SEQUENCE IF EXISTS study_design_unit_id_seq RESTART WITH 1;
ALTER SEQUENCE IF EXISTS study_design_outcome_id_seq RESTART WITH 1;
ALTER SEQUENCE IF EXISTS study_design_key_knowledge_knowledge_topic_id_seq RESTART WITH 1;
ALTER SEQUENCE IF EXISTS study_design_sub_topic_sub_topic_id_seq RESTART WITH 1;


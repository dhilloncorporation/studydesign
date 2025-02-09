-- Switch to study_design schema
SET search_path TO study_design;

-- Clear existing data (in correct order due to foreign key constraints)
DELETE FROM study_design_sub_topic;
DELETE FROM study_design_key_knowledge;
DELETE FROM study_design_outcome;
DELETE FROM study_design_area_of_study;
DELETE FROM study_design_unit;
DELETE FROM study_design_study;

-- Insert Study Designs
INSERT INTO study_design_study (name, summary, subject, class, board)
VALUES 
    ('Mathematics Methods', 'Year 12 Mathematics Methods Course', 'Mathematics', '12', 'VCE'),
    ('Physics', 'Year 12 Physics Course', 'Physics', '12', 'VCE');

-- Insert Units (using the generated study_ids)
INSERT INTO study_design_unit (unit_id, study_id, unit_name)
VALUES
    ('MATH-U1', 1, 'Functions and Graphs'),
    ('MATH-U2', 1, 'Calculus'),
    ('PHYS-U1', 2, 'Motion and Energy'),
    ('PHYS-U2', 2, 'Fields and Interactions');

-- Insert Areas of Study
INSERT INTO study_design_area_of_study (area_id, unit_id, area_name, area_description)
VALUES
    ('MATH-A1', 'MATH-U1', 'Polynomial Functions', 'Study of polynomial and related functions'),
    ('MATH-A2', 'MATH-U2', 'Differential Calculus', 'Introduction to differentiation'),
    ('PHYS-A1', 'PHYS-U1', 'Kinematics', 'Motion in one and two dimensions'),
    ('PHYS-A2', 'PHYS-U2', 'Electric Fields', 'Electric field concepts and applications');

-- Insert Outcomes
INSERT INTO study_design_outcome (outcome_id, area_id, outcome_name, outcome_description)
VALUES
    ('MATH-O1', 'MATH-A1', 'Function Analysis', 'Analyze and graph polynomial functions'),
    ('MATH-O2', 'MATH-A2', 'Differentiation', 'Apply rules of differentiation'),
    ('PHYS-O1', 'PHYS-A1', 'Motion Analysis', 'Analyze motion using kinematics'),
    ('PHYS-O2', 'PHYS-A2', 'Field Analysis', 'Analyze electric field patterns');

-- Insert Key Knowledge Topics
INSERT INTO study_design_key_knowledge (outcome_id, knowledge_topic_name)
VALUES
    ('MATH-O1', 'Polynomial Function Properties'),
    ('MATH-O2', 'Differentiation Rules'),
    ('PHYS-O1', 'Velocity and Acceleration'),
    ('PHYS-O2', 'Electric Field Strength');

-- Insert Sub-topics
INSERT INTO study_design_sub_topic (knowledge_topic_id, sub_topic_name, details)
VALUES
    (1, 'Quadratic Functions', 'Properties and graphs of quadratic functions'),
    (2, 'Power Rule', 'Differentiation of polynomial terms'),
    (3, 'Uniform Motion', 'Motion with constant velocity'),
    (4, 'Field Lines', 'Electric field line patterns and interpretation');

-- Verify data
SELECT 'Study Designs:' as message;
SELECT * FROM study_design_study;

SELECT 'Units:' as message;
SELECT u.*, s.name as study_name 
FROM study_design_unit u
JOIN study_design_study s ON u.study_id = s.study_id;

SELECT 'Areas of Study:' as message;
SELECT a.*, u.unit_name 
FROM study_design_area_of_study a
JOIN study_design_unit u ON a.unit_id = u.unit_id;

SELECT 'Outcomes:' as message;
SELECT o.*, a.area_name 
FROM study_design_outcome o
JOIN study_design_area_of_study a ON o.area_id = a.area_id;

SELECT 'Key Knowledge Topics:' as message;
SELECT k.*, o.outcome_name 
FROM study_design_key_knowledge k
JOIN study_design_outcome o ON k.outcome_id = o.outcome_id;

SELECT 'Sub-topics:' as message;
SELECT s.*, k.knowledge_topic_name 
FROM study_design_sub_topic s
JOIN study_design_key_knowledge k ON s.knowledge_topic_id = k.knowledge_topic_id;
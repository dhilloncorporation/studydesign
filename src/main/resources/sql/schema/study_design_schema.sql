
-- Create schema
CREATE SCHEMA study_design;

-- Check schema 
SELECT schema_name
FROM information_schema.schemata;

-- Create users
CREATE ROLE studydesign_user WITH LOGIN PASSWORD 'Password@123';
CREATE ROLE studydesign_admin WITH LOGIN PASSWORD 'Password@123';

-- Drop users
DROP ROLE IF EXISTS studydesign_user;
DROP ROLE IF EXISTS studydesign_admin;

-- Check users
SELECT rolname FROM pg_roles;


-- Grant permissions to users ... Admin users should have ALL permissions
-- Grant usage on the schema to the user
GRANT USAGE ON SCHEMA study_design TO studydesign_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA study_design TO studydesign_admin;
-- Grant create table permission on the schema to the user
GRANT CREATE ON SCHEMA study_design TO studydesign_admin;

-- Grant create table permission on the schema to the user
GRANT CREATE ON SCHEMA study_design TO studydesign_admin;

-- Grant permissions to users ... Application users should only have SELECT, INSERT, UPDATE, DELETE permissions
GRANT USAGE ON SCHEMA study_design TO studydesign_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA study_design TO studydesign_user;



SELECT current_database();
SELECT current_user;
SELECT session_user;


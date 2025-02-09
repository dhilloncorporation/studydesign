### Connecting Database, Schema Checks ##

-- Connecting to studydesign database
set PGPASSWORD=Password@123
psql -h localhost -U studydesign_user -d postgres

\c studydesign

select current_database();
SELECT current_user;
SELECT current_database();
SELECT session_user;

-- Check schema 
SELECT schema_name FROM information_schema.schemata;


# Run with output
psql -h localhost -U studydesign_user -d postgres -f "studydesign\src\main\resources\sql\schema\datamodels\studydesign_testdataload.sql"


-- List all schemas
SELECT schema_name
FROM information_schema.schemata
WHERE schema_name = 'study_design';

-- List all tables in study_design schema
SELECT table_name, table_type
FROM information_schema.tables
WHERE table_schema = 'study_design'
ORDER BY table_name;

-- Get column details for each table
SELECT 
    table_name,
    column_name,
    data_type,
    character_maximum_length,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'study_design'
ORDER BY table_name, ordinal_position;
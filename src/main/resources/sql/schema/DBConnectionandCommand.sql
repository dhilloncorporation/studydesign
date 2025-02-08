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
SELECT schema_name
FROM information_schema.schemata;


SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'your_schema';



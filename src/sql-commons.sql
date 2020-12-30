
-- CONNECT TO psql 
psql -U login -d sdad -h postgis1

-- SHOW ALL SCHEMAS 
\dt

-- SHOW ALL TABLES 
\dn

-- SHOW ALL TABLES IN SPECIFIC SCHEMA
\dt schema_name.*

-- SELECT DATA WITH LIMITS 
SELECT * 
FROM schema_name.table_name 
WHERE var = 'something' AND IS NOT NULL 
LIMIT 100; 

-- CREATE TABLE 
CREATE TABLE schema_name.new_view AS (
SELECT *
FROM schema_name.table_name
WHERE var = 'something' AND IS NOT NULL 
ORDER BY var ASC
);

-- CREATE MATERIALIZED VIEW 
CREATE MATERIALIZED VIEW schema_name.new_view AS (
SELECT *
FROM schema_name.table_name
WHERE var = 'something' AND IS NOT NULL 
ORDER BY var ASC
);

-- COUNT ROWS IN TABLE 
SELECT COUNT(DISTINCT(*)) 
FROM schema_name.table_name;

-- JOIN MULTIPLE NAMES
SELECT A.var1, var2, var3 
FROM gh.ctrs_raw AS A
FULL JOIN (SELECT login, email 
           FROM schema_name.table_name1) AS B
ON A.var1 = B.var1 
FULL JOIN (SELECT var1, 
		   var4 AS new_name1, 
		   var5 AS new_name2, 
		   var6 AS new_name3
		   FROM schema_name.table_name2) AS C
ON A.var1 = C.var1 

-- USING WITH() 
WITH new_table AS (
SELECT var1 AS something1, var2 AS something2 
FROM schema_name.table_name
)
SELECT var1, var2, COUNT(*) AS something3, SUM(var1) AS something4
FROM new_table
WHERE year > 2008 AND year < 2020
GROUP BY var1, var2);

-- ALTER OWNERSHIP AND PERMISSIONS 
ALTER SCHEMA schema_name OWNER TO person_name;
ALTER TABLE table_name OWNER TO person_name;
GRANT SELECT ON TABLE schema_name.table_name TO person_name; 
GRANT ALL PRIVILEGES ON schema_name.table_name TO person_name; 
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA schema_name TO person_name, person_name;

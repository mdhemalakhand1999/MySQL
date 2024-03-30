-- select database
use sakila; -- Here sakila is a database name
-- create a table on existing database
CREATE TABLE corporation (corp_id SMALLINT, name VARCHAR(30), CONSTRAINT pk_corporation PRIMARY KEY (corp_id));
-- insert data into existing database
INSERT INTO corporation (corp_id, name) VALUES (27, 'Acme Paper Corporation');
-- Get data from table
SELECT name FROM corporation WHERE corp_id = 27;
-- show all tables of a database
show tables;
-- get date and time
select now();
SELECT now() FROM dual;
-- get out from mysql;
quit; exit;

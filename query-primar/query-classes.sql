/**
 * Query Classes
*/

-- select: select Determines which columns to include in the query’s result set
-- from: Identifies the tables from which to retrieve data and how the tables should be joined
-- where: Filters out unwanted data
-- group by: Used to group rows together by common column values
-- having: Filters out unwanted groups
-- order by: Sorts the rows of the final result set by one or more columns

-- select based on specific attribute
SELECT language_id, name, last_update FROM language;
-- select with custom table with number/built_in function/expression
SELECT language_id, 'COMMON' language_uses, language_id * 3.1416 long_pi_value, upper(name) language_name FROM language;
-- we can also select builtin function only
SELECT version(), user(), database();
-- output
+-----------+----------------+------------+
| version() | user()         | database() |
+-----------+----------------+------------+
| 8.3.0     | root@localhost | sakila     |
+-----------+----------------+------------+
-- prevent id duplication
-- we can use DISTINCT for prevent duplication
SELECT DISTINCT actor_id FROM film_actor ORDER BY actor_id;
-- concat 2 name with select
SELECT concat( hemal.first_name, ', ', hemal.last_name ) fullname FROM ( SELECT first_name, last_name, email FROM customer WHERE last_name="HANNON" ) hemal;
-- create a temparory table
CREATE TEMPORARY TABLE actors_j( actor_id smallint(5), first_name varchar(20), last_name varchar(20) );
-- insert data into temparory table from another table
INSERT INTO actors_j SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE 'J%';
-- create a view of table
CREATE VIEW cust_vw AS SELECT customer_id, first_name, last_name, active FROM customer;
-- retrive data from view
SELECT first_name, last_name, active FROM cust_vw WHERE active=0;
/**
 * Join
*/
-- inner join of 2 table
SELECT first_name, last_name, time(rental.rental_date) FROM customer INNER JOIN rental ON customer.customer_id = rental.customer_id WHERE date(rental.rental_date) = '2005-06-14';
-- Defining Table Aliases
SELECT c.first_name, c.last_name, time(r.rental_date) FROM customer c INNER JOIN rental r ON c.customer_id = r.customer_id WHERE date(r.rental_date) = '2005-06-14';
SELECT c.first_name, c.last_name,r.rental_date,  time(r.rental_date) rental_time FROM customer AS c INNER JOIN rental AS r ON c.customer_id = r.rental_id WHERE date(r.rental_date) = '2005-05-28';
-- The where Clause
SELECT title FROM film WHERE rating = 'G' AND rental_duration >= 7;
SELECT title FROM film WHERE rating = 'G' OR rental_duration >= 7;
SELECT title, rating, rental_duration FROM film WHERE (rating = 'G' AND rental_duration >= 7) OR (rating = 'PC-13' AND rental_duration < 4);
/**
 * Group
*/
-- The group by and having Clauses
SELECT c.first_name, c.last_name, count(*) FROM customer AS c INNER JOIN rental AS r ON c.customer_id = r.customer_id GROUP BY c.first_name, c.last_name HAVING count(*) > 40;
-- order by
SELECT c.first_name, c.last_name, time(r.rental_date) rental_time FROM customer AS c INNER JOIN rental AS r ON c.customer_id = r.customer_id WHERE date(r.rental_date) = '2005-06-14' ORDER BY c.first_name;
-- selct by multiple order
SELECT c.first_name, c.last_name, time(r.rental_date) rental_time FROM customer AS c INNER JOIN rental AS r WHERE date(r.rental_date) = '2005-06-14' ORDER BY c.first_name, c.last_name;
-- selct by reverce
SELECT c.first_name, c.last_name, time(r.rental_date) FROM customer as c INNER JOIN rental AS r ON c.customer_id = r.customer_id WHERE c.customer_id = r.rental_id ORDER BY time(r.rental_date) desc;
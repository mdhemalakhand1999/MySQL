SELECT first_name FROM actor WHERE actor_id > 10 AND last_update > '2006-02-15' LIMIT 10;
SELECT first_name, actor_id FROM actor WHERE (first_name = 'DUSTIN' OR last_name = 'TAUTOU') AND last_update >= '2006-02-15';
SELECT first_name, actor_id FROM actor WHERE NOT (first_name = 'DUSTIN' OR last_name = 'PINKETT') AND last_update > '2006-02-15' LIMIT 50;
SELECT first_name, actor_id, last_update FROM actor WHERE NOT (first_name = 'DUSTIN' OR last_name <> 'PINKETT') AND last_update <> '2006-02-15' LIMIT 50;
-- Equality Conditions
SELECT c.email FROM customer c INNER JOIN rental r ON c.customer_id = r.rental_id WHERE date(r.rental_date) = '2005-05-24';
SELECT c.email FROM customer c INNER JOIN rental r ON c.customer_id = c.store_id WHERE date(r.rental_date) >= '2005-05-25' LIMIT 10;
DELETE FROM rental WHERE year(rental_date) = 2004;
DELETE from rental WHERE year(rental_date) <> 2005 AND year(rental_date) <> 2006;
-- Range Conditions
SELECT customer_id, rental_date FROM rental WHERE rental_date <= '2005-06-16' AND rental_date >= '2005-06-14' LIMIT 10;
-- THE BETWEEN OPERATOR
SELECT customer_id, rental_date FROM rental WHERE rental_date BETWEEN '2005-06-14' AND '2005-06-16' LIMIT 100;
SELECT customer_id, payment_date, amount FROM payment WHERE amount BETWEEN 10.0 AND 11.99;
-- STRING RANGES
SELECT last_name, first_name FROM customer WHERE last_name BETWEEN 'FA' AND 'FR';
-- Membership Conditions
SELECT title, rating FROM film WHERE rating = 'G' OR rating = 'PG' LIMIT 10;
SELECT title, rating FROM film WHERE rating IN ('G', 'PG') LIMIT 10;
SELECT title, rating FROM film WHERE rating IN (SELECT rating FROM film WHERE title LIKE '%PET%') LIMIT 10;
-- USING NOT IN
SELECT title, rating FROM film WHERE rating NOT IN ('PG-13', 'R', 'NC-17') LIMIT 10;
-- Matching Conditions
SELECT last_name, first_name FROM customer WHERE left(last_name, 1) = 'A'; -- ( It mean last_name start with 'A' )
-- The underscore character takes the place of a single character, while
-- the percent sign can take the place of a variable number of characters.
-- When building conditions that utilize search expressions, you use the
-- like operator, as in
SELECT last_name, first_name FROM customer WHERE last_name LIKE '_A_T%S';
+-----------+------------+
| last_name | first_name |
+-----------+------------+
| MATTHEWS  | ERICA      |
| WALTERS   | CASSANDRA  |
| WATTS     | SHELLY     |
+-----------+------------+
SELECT last_name, first_name FROM customer WHERE last_name LIKE 'Q%' OR last_name LIKE 'Y%';
+-------------+------------+
| last_name   | first_name |
+-------------+------------+
| QUALLS      | STEPHEN    |
| QUIGLEY     | TROY       |
| QUINTANILLA | ROGER      |
| YANEZ       | LUIS       |
| YEE         | MARVIN     |
| YOUNG       | CYNTHIA    |
+-------------+------------+
-- Here’s what the previous query (find all customers whose last name
-- starts with Q or Y) would look like using the MySQL implementation
-- of regular expressions
-- @see https://www.amazon.com/Mastering-Regular-Expressions-Jeffrey-Friedl/dp/0596528124
-- regular expression
SELECT last_name, first_name FROM customer WHERE last_name REGEXP '^[QY]';
SELECT rental_id, customer_id FROM rental WHERE rental_date IS NULL LIMIT 10;
SELECT rental_id, customer_id FROM rental WHERE rental_date IS NULL;
SELECT rental_id, customer_id FROM rental WHERE rental_date IS NOT NULL;
SELECT rental_id, customer_id, return_date FROM rental WHERE return_date NOT BETWEEN '2005-05-01' AND '2005-09-01';
SELECT rental_id, customer_id, return_date FROM rental WHERE return_date  IS NULL AND rental_date NOT BETWEEN '2005-05-01' AND '2005-09-01';
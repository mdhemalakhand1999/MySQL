/**
 * Step 1 - Design
*/

-- ******************** Person table ( first pass ) *******************
-- name: varchar(40)
-- eye_color: char(2) [note: allowed BL, CR, GR]
-- birth_date: date
-- address: varchar(100)
-- favourite_food: varchar(200)

-- ******************** Person table ( second pass ) *******************
-- person_id  : smallint(unsigned)
-- first_name : varchar(20)
-- last_name  : varchar(20)
-- eye_color  : cahr(2)
-- birth_date : date
-- street     : varchar(30)
-- city       : varchar(20)
-- state      : varchar(20)
-- country    : varchar(20)
-- postal_code: varchar(20)


-- ******************** favourite_food table *******************
-- person_id: smallint (unsigned)
-- food: varchar(20)

-- ******************** Query *******************
-- Create a table with this fields
CREATE TABLE person (person_id SMALLINT UNSIGNED, fname VARCHAR(20), lname VARCHAR(20), eye_color CHAR(2), birth_date DATE, street VARCHAR(20), postal_code VARCHAR(20), CONSTRAINT pk_person PRIMARY KEY (person_id));
-- eye_color enum for accept specific data
CREATE TABLE person
(person_id SMALLINT UNSIGNED,
fname VARCHAR(20),
lname VARCHAR(20),
eye_color ENUM('BR','BL','GR'),
birth_date DATE,
street VARCHAR(30),
city VARCHAR(20),
state VARCHAR(20),
country VARCHAR(20),
postal_code VARCHAR(20),
CONSTRAINT pk_person PRIMARY KEY (person_id)
);
-- Get description of table
desc table_name;

-- create table for favourite food with foreign key
CREATE TABLE favourite_food(
    person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    CONSTRAINT pk_favourite_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_favourite_food FOREIGN KEY (person_id) REFERENCES person (person_id)
);
-- Insert data into person table
INSERT INTO person( person_id, fname, lname, eye_color, birth_date ) VALUES ( 1, 'William', 'Turner', 'BR', '1972-05-27' );
-- retrive data from person table
SELECT person_id, fname, lname, eye_color, birth_date FROM person WHERE person_id = 1;
-- select using table order
SELECT food from favourite_food WHERE person_id=1 ORDER BY food;
-- insert data into person table
INSERT INTO person(person_id, fname, lname, eye_color, birth_date, street, city, state, country, postal_code) 
VALUES(2, 'MD Hemal', 'Akhand', 'BR', '1975-11-12', 'Mirpur', 'Dhaka', 'Bangladesh', 'Dhaka', '1650');
-- update data from person table
UPDATE person SET street = '1225 Tremont St.', city = 'Boston', state = 'MA', country = 'USA', postal_code = '02138' WHERE person_id = 1;
-- delete data from person table
DELETE FROM person WHERE person_id = 2;
-- update using str_to_date function
UPDATE person SET birth_date = str_to_date('APR-25-1999', '%b-%d-%Y') WHERE person_id = 1;
/**
 * Note: Date formats
*/
-- %a The short weekday name, such as Sun, Mon, ...
-- %b The short month name, such as Jan, Feb, ...
-- %c The numeric month (0..12)
-- %d The numeric day of the month (00..31)
-- %f The number of microseconds (000000..999999)
-- %H The hour of the day, in 24-hour format (00..23)
-- %h The hour of the day, in 12-hour format (01..12)
-- %i The minutes within the hour (00..59)
-- %j The day of year (001..366)
-- %M The full month name (January..December)
-- %m The numeric month
-- %p AM or PM
-- %s The number of seconds (00..59)
-- %W The full weekday name (Sunday..Saturday)
-- %w The numeric day of the week (0=Sunday..6=Saturday)
-- %Y The four-digit year

SELECT c.first_name, c.last_name, a.address FROM customer c JOIN address a LIMIT 10;
SELECT c.first_name, c.last_name, a.address FROM customer c JOIN address a;
SELECT c.first_name, c.last_name, a.address FROM customer c JOIN address a ON c.address_id = a.address_id;
SELECT c.first_name, c.last_name, a.address FROM customer c INNER JOIN address a ON c.address_id = a.address_id;
SELECT c.first_name, c.last_name, a.address FROM customer c INNER JOIN address a USING (address_id);
SELECT c.first_name, c.last_name, a.address FROM customer c, address a WHERE c.address_id = a.address_id;
SELECT c.first_name, c.last_name, a.address FROM customer c, address a WHERE c.address_id = a.address_id AND a.postal_code = 52137;
SELECT c.first_name, c.last_name, a.address FROM customer c INNER JOIN address a ON c.address_id = a.address_id WHERE a.postal_code = 52137;
SELECT c.first_name, c.last_name, ct.city FROM customer c INNER JOIN address a ON c.address_id = a.address_id INNER JOIN city ct ON a.city_id = ct.city_id;
-- this three table will give same result
SELECT c.first_name, c.last_name, ct.city FROM customer c INNER JOIN address a ON c.address_id = a.address_id INNER JOIN city ct ON a.city_id = ct.city_id;
SELECT c.first_name, c.last_name, ct.city FROM city ct INNER JOIN address a ON a.city_id = ct.city_id INNER JOIN customer c ON c.address_id = a.address_id;
SELECT c.first_name, c.last_name, ct.city FROM address a INNER JOIN city ct ON a.city_id = ct.city_id INNER JOIN customer c ON c.address_id = a.address_id;
-- --------------------------
-- Using Subqueries as Tables
SELECT c.first_name, c.last_name, addr.address, addr.city FROM customer c  INNER JOIN ( SELECT a.address_id, a.address, ct.city FROM address a INNER JOIN city ct ON a.city_id = ct.city_id WHERE a.district = 'California' ) addr ON c.address_id = addr.address_id;
SELECT a.address_id, a.address, ct.city FROM address a INNER JOIN city ct ON a.city_id = ct.city_id WHERE a.district = 'California';
-- Using the Same Table Twice
SELECT f.title FROM film f INNER JOIN film_actor fa ON f.film_id = fa.film_id INNER JOIN actor a ON fa.actor_id = a.actor_id WHERE ((a.first_name = 'CATE' AND a.last_name = 'MCQUEEN') OR (a.first_name = 'CUBA' AND a.last_name = 'BIRCH'));
SELECT f.title FROM film f INNER JOIN film_actor fa1 ON f.film_id = fa1.film_id INNER JOIN actor a1 ON fa1.actor_id = a1.actor_id INNER JOIN film_actor fa2 ON f.film_id = fa2.film_id INNER JOIN actor a2 ON fa2.actor_id = a2.actor_id WHERE (a1.first_name = 'CATE' AND a1.last_name = 'MCQUEEN') AND (a2.first_name = 'CUBA' AND a2.last_name = 'BIRCH');
-- Self-Joins
SELECT f.title, f_prnt.title prequel
-> FROM film f
-> INNER JOIN film f_prnt
-> ON f_prnt.film_id = f.prequel_film_id
-> WHERE f.prequel_film_id IS NOT NULL


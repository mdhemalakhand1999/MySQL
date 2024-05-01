-- union
SELECT 3 num, 'hemal' str UNION SELECT 3 num, 'kamal' str;
SELECT 'CUST' typ, c.first_name, c.last_name FROM customer c UNION ALL SELECT 'ACTR' typ, a.first_name, a.last_name FROM actor a LIMIT 10;
SELECT 'ACTR' typ, a.first_name, a.last_name FROM actor a UNION ALL SELECT 'actr' typ, a.first_name, a.last_name FROM actor a LIMIT 10;
SELECT c.first_name, c.last_name FROM customer c WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%' UNION ALL SELECT a.first_name, a.last_name FROM actor a WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';
SELECT c.first_name, c.last_name FROM customer c WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%' UNION SELECT a.first_name, a.last_name from actor a;
SELECT c.first_name, c.last_name FROM customer c WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%' UNION SELECT a.first_name, a.last_name from actor a WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

-- The intersect Operator
c.first_name, c.last_name FROM customer c WHERE c.first_name LIKE 'D%' AND c.last_name LIKE 'T%' INTERSECT select a.first_name, a.last_name from actor a WHERE a.first_name LIKE 'D%' AND a.last_name LIKE 'T%';
SELECT c.first_name, c.last_name from customer c where c.first_name LIKE 'J%' AND c.last_name LIKE 'D%' INTERSECT SELECT a.first_name, a.last_name from actor a WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';
-- The left join Operator ( it join only left side, right side will not work ) -> old name: excerpt
SELECT a.first_name, a.last_name
    -> FROM actor a
    -> LEFT JOIN
    -> customer c
    -> ON a.first_name = c.first_name AND a.last_name = c.last_name WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%' AND c.first_name IS NULL;

-- conditional query
SELECT a.first_name fname, a.last_name lname from actor a WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%' UNION ALL SELECT c.first_name, c.last_name FROM customer c WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%' ORDER BY fname, lname;

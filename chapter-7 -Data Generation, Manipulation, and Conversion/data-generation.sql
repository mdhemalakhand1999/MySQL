CREATE TABLE string_tbl (char_fld CHAR(30), vchar_fld VARCHAR(30), text_fld TEXT);
INSERT INTO string_tbl (char_fld, vchar_fld, text_fld) VALUES ('This is char data', 'This is varchar data', 'This is text data');
UPDATE string_tbl SET vchar_fld='This is a pice of extremely long varchar data'; -- ERROR 1406 (22001): Data too long for column 'vchar_fld' at row 1
SELECT @@session.sql_mode;
SHOW WARNINGS;
SELECT vchar_fld FROM string_tbl;
UPDATE string_tbl SET text_fld = 'This string didn''t work, but it does now';
-- [Note]
-- Oracle Database and MySQL users may also choose to escape a single quote by adding a backslash character
-- immediately before, as in
UPDATE string_tbl SET text_fld = 'This string didn\'t work, but it does now';
SELECT text_fld FROM string_tbl;
+------------------------------------------+
| text_fld                                 |
+------------------------------------------+
| This string didn't work, but it does now |
+------------------------------------------+

SELECT quote(text_fld) FROM string_tbl
+---------------------------------------------+
| quote(text_fld)                             |
+---------------------------------------------+
| 'This string didn\'t work, but it does now' |
+---------------------------------------------+

-- INCLUDING SPECIAL CHARACTERS
SELECT 'abcdefg', CHAR(97,98,99,100,101,102,103);
 +---------+--------------------------------+
| abcdefg | CHAR(97,98,99,100,101,102,103) |
+---------+--------------------------------+
| abcdefg | abcdefg |
+---------+--------------------------------+

-- SELECT CHAR(128,129,130,131,132,133,134,135,136,137);
+----------------------------------------------------------------------------------------------+
| CHAR(128,129,130,131,132,133,134,135,136,137)                                                |
+----------------------------------------------------------------------------------------------+
| 0x80818283848586878889                                                                       |
+----------------------------------------------------------------------------------------------+

SELECT CHAR(138,139,140,141,142,143,144,145,146,147);
+----------------------------------------------------------------------------------------------+
| CHAR(138,139,140,141,142,143,144,145,146,147)                                                |
+----------------------------------------------------------------------------------------------+
| 0x8A8B8C8D8E8F90919293                                                                       |
+----------------------------------------------------------------------------------------------+

SELECT CHAR(148,149,150,151,152,153,154,155,156,157);
+----------------------------------------------------------------------------------------------+
| CHAR(148,149,150,151,152,153,154,155,156,157)                                                |
+----------------------------------------------------------------------------------------------+
| 0x9495969798999A9B9C9D                                                                       |
+----------------------------------------------------------------------------------------------+

 SELECT CHAR(158,159,160,161,162,163,164,165);
+------------------------------------------------------------------------------+
| CHAR(158,159,160,161,162,163,164,165)                                        |
+------------------------------------------------------------------------------+
| 0x9E9FA0A1A2A3A4A5                                                           |
+------------------------------------------------------------------------------+

SELECT CONCAT('danke sch', CHAR(148), 'n');

+-------------------------------------+
| CONCAT('danke sch', CHAR(148), 'n') |
+-------------------------------------+
| danke schön |
+-------------------------------------+

-- Note: Oracle Database users can use the concatenation operator (||) instead of the concat() function, as in
SELECT 'danke sch' || CHR(148) || 'n' FROM dual;
SELECT 'danke sch' + CHAR(148) + 'n';
SELECT ASCII('ö');
+------------+
| ASCII('ö') |
+------------+
|        148 |
+------------+


-- String Manipulation
DELETE from string_tbl;
INSERT INTO string_tbl (char_fld, vchar_fld, text_fld) VALUES('this string is 28 characters', 'This string is 28 characters', 'This string is 28 characters');
select LENGTH(char_fld) char_length, LENGTH(vchar_fld) varchar_length, LENGTH(text_fld) text_length FROM string_tbl;
+-------------+----------------+-------------+
| char_length | varchar_length | text_length |
+-------------+----------------+-------------+
|          28 |             28 |          28 |
+-------------+----------------+-------------+
SELECT vchar_fld FROM string_tbl;
+------------------------------+
| vchar_fld                    |
+------------------------------+
| This string is 28 characters |
+------------------------------+
SELECT POSITION('characters' IN vchar_fld) FROM string_tbl;
+-------------------------------------+
| POSITION('characters' IN vchar_fld) |
+-------------------------------------+
|                                  19 |
+-------------------------------------+

-- [Warning]
-- For those of you who program in a language such as C or C++, where the first element of an array is at position
-- 0, remember when working with databases that the first character in a string is at position 1. A return value of 0
-- from instr() indicates that the substring could not be found, not that the substring was found at the first
-- position in the string.
DELETE FROM string_tbl;
INSERT INTO string_tbl(vchar_fld) VALUES('abcd'), ('xyz'), ('QRSTUV'), ('qrstuv'), ('12345');
SELECT vchar_fld FROM string_tbl ORDER BY vchar_fld;
+-----------+
| vchar_fld |
+-----------+
| 12345     |
| abcd      |
| QRSTUV    |
| qrstuv    |
| xyz       |
+-----------+

-- The next query makes six comparisons among the five different strings:
SELECT STRCMP('12345', '12345') 12345_12345, STRCMP('abcd', 'xyz') abcd_xyz, STRCMP('abcd', 'QRSTUV') abcd_QRSTUV, STRCMP('12345', 'xyz') 12345_xyz, STRCMP('xyz', 'qrstuv') xyz_qrstuv;
+-------------+----------+-------------+-----------+------------+
| 12345_12345 | abcd_xyz | abcd_QRSTUV | 12345_xyz | xyz_qrstuv |
+-------------+----------+-------------+-----------+------------+
|           0 |       -1 |          -1 |        -1 |          1 |
+-------------+----------+-------------+-----------+------------+

SELECT name, name LIKE '%y' endsin_in_y FROM category;
+-------------+-------------+
| name        | endsin_in_y |
+-------------+-------------+
| Action      |           0 |
| Animation   |           0 |
| Children    |           0 |
| Classics    |           0 |
| Comedy      |           1 |
| Documentary |           1 |
| Drama       |           0 |
| Family      |           1 |
| Foreign     |           0 |
| Games       |           0 |
| Horror      |           0 |
| Music       |           0 |
| New         |           0 |
| Sci-Fi      |           0 |
| Sports      |           0 |
| Travel      |           0 |
+-------------+-------------+

SELECT name, name REGEXP 'y$' ends_in_y FROM category;
+-------------+-----------+
| name        | ends_in_y |
+-------------+-----------+
| Action      |         0 |
| Animation   |         0 |
| Children    |         0 |
| Classics    |         0 |
| Comedy      |         1 |
| Documentary |         1 |
| Drama       |         0 |
| Family      |         1 |
| Foreign     |         0 |
| Games       |         0 |
| Horror      |         0 |
| Music       |         0 |
| New         |         0 |
| Sci-Fi      |         0 |
| Sports      |         0 |
| Travel      |         0 |
+-------------+-----------+

DELETE FROM string_tbl;
INSERT INTO string_tbl (text_fld) VALUES('This string was 29 characters');

UPDATE string_tbl SET text_fld = CONCAT(text_fld, ', but now it is longer');
SELECT text_fld FROM string_tbl;
+---------------------------------------------------------------------------+
| text_fld                                                                  |
+---------------------------------------------------------------------------+
| This string was 29 characters, but now it is longer, but now it is longer |
+---------------------------------------------------------------------------+

-- last page: 270
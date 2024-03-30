/**
 * Character Data
 *
*/
-- If length are fixed, only then use char(lenght)
char(20) -- fixd length
-- If length are can be increase then use varchar(length)
varchar(20) -- variable length ( this will increase if needed )


/**
 * Character Sets
*/
-- show character set
SHOW CHARACTER SET;
-- create database with default character set
create database europeans_sales character set latin1;
-- size of text_types
-- tinytext -> 255 bytes
-- text -> 65,535 bytes
-- mediumtext -> 16,777,215 bytes
-- longtext -> 4,294,967,295 bytes
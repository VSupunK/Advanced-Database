-- Exercise-1
Create a database “stored_function_class ”

Create a MySQL stored function that prompts the user to input  his/her first name and last name.

The function should output the full name of the user.

First Name : Hello
Last Name :  World

Full Name  : Hello World -- Output
---------------------------------------

create database stored_function_class;

USE stored_function_class;

DELIMITER |
CREATE FUNCTION full_name(first_name varchar(10), last_name varchar(10))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CONCAT(first_name," ", last_name);
END |

DELIMITER;

----
SELECT full_name("Hello", "World") AS full_name;

---------------------------------------------

-- Exercise 02

Utilize the database “stored_function_class ”

Create a MySQL stored function that prompts the user to input a string.

The function should output the total number of characters in the string .

String : “ Sabaragamuwa” – input
Number of characters : 12 -- Output
----------------------------

DELIMITER |
CREATE FUNCTION word_length(Word varchar(50))
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN length(Word);
END |

DELIMITER;

----
SELECT word_length("Hello mysql");


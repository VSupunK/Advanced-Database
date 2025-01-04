-- Exercise 1

CREATE DATABASE Stored_Procedure_Class;

USE Stored_Procedure_Class;

-----
CREATE TABLE Employee(
    ID VARCHAR(10),
    Name VARCHAR(10),
    Age INT
);

INSERT INTO Employee VALUES
    ("Emp_01", "Samal", 30),
    ("Emp_02", "Nimal", 40),
    ("Emp_03", "Roy", 80),
    ("Emp_04", "Jonny", 20);

-----

Create a MySQL stored procedure to get the first record  from the aforementioned table

----Way 1 - Without passing parameter 
DELIMITER |
CREATE PROCEDURE Exercise()
BEGIN
SELECT ID, Name, Age FROM Employee LIMIT 1;
END |

DELIMITER ;
-----
call Exercise();

-------Way 2 - Bypassing parameter

DELIMITER |
CREATE PROCEDURE Exercise_Way2 (IN emp_id VARCHAR(10))
BEGIN
    SELECT ID, Name, Age from Employee WHERE ID = emp_id LIMIT 1;
END |

DELIMITER ;
-----
call Exercise_Way2("Emp_01");

------------------------

-- Exercise 2

CREATE TABLE Temperature(Substance VARCHAR(10), Boiling_Point INT);

INSERT INTO Temperature VALUES 
    ("Water", 100),
    ("Mercury", 357),
    ("Copper", 1187),
    ("Silver", 2193);

    --------

Write a MySQL stored procedure that prompts the user to input the boiling point. 

The procedure should output the substance corresponding to the boiling point listed in the table. 

The procedure should output the message “Substance Unknown”, when it does not match any substance.

---answer---By using If-Else

DELIMITER |

CREATE PROCEDURE Exercise2_IF_ELSE(IN boil_point INT)
BEGIN 
    IF (boil_point = 100)
    THEN SELECT "Water";
    ELSEIF (boil_point = 357)
    THEN SELECT "Mercury";
    ELSEIF (boil_point = 1187)
    THEN SELECT "Copper";
    ELSEIF (boil_point = 2193)
    THEN SELECT "Silver";
    ELSE 
    SELECT "Substance Unknown";
    END IF;
    END |

    DELIMITER ;


CALL Exercise2_IF_ELSE(100);

-----By using CASE

DELIMITER |
CREATE PROCEDURE Exercise2_CASE(IN boil_point INT)
BEGIN 
CASE boil_point
WHEN 100 THEN SELECT "Water";
WHEN 357 THEN SELECT "Mercury";
WHEN 1187 THEN SELECT "Copper";
WHEN 2193 THEN SELECT "Silver";
ELSE SELECT "Substance Unknown";
END CASE;
END |
DELIMITER ;

CALL Exercise2_CASE(357);

----------------

--Exercise 3

Write down a MySQL stored procedure that allows the user to pass the scholarship id as a parameter.
The procedure should output the new scholarship value according to the conditions given in the table. 

Scholarship value should be read from the table Scholarship.

CREATE TABLE scholarship(
    sd_ID VARCHAR(20),
    Organization VARCHAR(30),
    Amount DOUBLE
);

INSERT INTO scholarship VALUES
("S1","UNICEF", 20000),
("S2","WHO", 40000),
("S3","ROTARY", 80000),
("S4","UNESCO", 65000);

----

DELIMITER |
CREATE PROCEDURE Exercise3 (IN schol_id VARCHAR(10), OUT schol_amount DOUBLE)

BEGIN
    DECLARE new_amount DOUBLE;
    SELECT Amount INTO new_amount FROM scholarship WHERE sd_ID = schol_id LIMIT 1;

    IF(new_amount>100000) THEN 
    SET schol_amount = new_amount + new_amount*(10/100);
    ELSEIF(new_amount>50000) THEN 
    SET schol_amount = new_amount + new_amount*(15/100);
    ELSEIF(new_amount<50000) THEN 
    SET schol_amount = new_amount + new_amount*(20/100);
    ELSE
    SELECT "Individual student ID";
    ENDIF;
    END |
    DELIMITER ;
    ---
CALL Exercise3("S1", @schol_amount);
SELECT @schol_amount;

-- Syntax for a Stored Function

CREATE FUNCTION function_name ([parameter1 [...]])
    RETURNS Type
    [
        LANGUAGE SQL
        | [NOT] DETERMINISTIC
        | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
        | SQL SECURITY { DEFINER | INVOKER }
        | COMMENT 'string'
    ]
SQL statements

    ---------------------------------------

-- A Stored Function Example

mysql> DELIMITER |
mysql> 
    CREATE FUNCTION WEIGHTED_AVERAGE (n1 INT, n2 INT, n3 INT, n4 INT)
    RETURNS INT
        DETERMINISTIC
            BEGIN
                DECLARE average INT;
                SET average = (n1 + n2 + n3*3 + n4*4) / 8;
                RETURN average;
            END|

mysql> SELECT WEIGHTED_AVERAGE(10, 20, 30, 40)\G

-- -----------------------------------------

-- Example 02

-- Creating a table

CREATE TABLE s_marks(mark1 INT, mark2 INT, mark3 INT, mark4 INT, name VARCHAR(50));

INSERT INTO s_marks(mark1, mark2, mark3, mark4, name) VALUES
    (70, 65, 65, 60, 'Mark'),
    (95, 94, 75, 50, 'Pavlov');

-- Creating a stored function

DELIMITER |
CREATE FUNCTION WEIGHTED_AVERAGE2 (v1 VARCHAR(50))
RETURNS INT
    DETERMINISTIC
        BEGIN
            DECLARE i1, i2, i3, i4, avg INT;
            SELECT mark1, mark2, mark3, mark4 INTO i1, i2, i3, i4 FROM s_marks WHERE name = v1;
            SET avg = (i1 + i2 + i3*3 + i4*4) / 8;
            RETURN avg;
        END|
DELIMITER ;

-- Calling the stored function
SELECT WEIGHTED_AVERAGE2('Pala')\G
SELECT WEIGHTED_AVERAGE2('Mark') AS Mark\G

-----------------------------------------

CREATE FUNCTION WEIGHTED_AVERAGE3 (n1 INT, n2 INT, n3 INT, n4 INT, v1 VARCHAR(50)) 
    RETURNS INT
        DETERMINISTIC
            BEGIN
                DECLARE i1, i2, i3, i4, avg INT;
                INSERT INTO s_marks(mark1, mark2, mark3, mark4, name) VALUES (n1, n2, n3, n4, v1);
                RETURN 1;
            END|

SELECT WEIGHTED_AVERAGE3(50, 60, 60, 50, 'Tharanga')\G
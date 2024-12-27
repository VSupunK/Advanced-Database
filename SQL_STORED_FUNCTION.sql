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
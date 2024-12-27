-- Syntax for a Stored Function

CREATE FUNCTION function_name ([parameter1 [...]])
    RETURN Type
    [
        LANGUAGE SQL
        | [NOT] DETERMINISTIC
        | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
        | SQL SECURITY { DEFINER | INVOKER }
        | COMMENT 'string'
    ]
    SQL statements

    ---------------------------------------

    
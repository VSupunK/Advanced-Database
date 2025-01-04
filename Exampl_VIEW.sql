---------Example 2--------------

Construct a view that shows all provinces to which the bills are being sent.Also
display the total amount of money and the total number of bills being sent to each
Province.


CREATE TABLE COMPANY (
    Name VARCHAR(50),
    Province VARCHAR(50)
);

INSERT INTO COMPANY (Name, Province)
VALUES
    ('ABC', 'Western'),
    ('DEF', 'Northern'),
    ('GHI', 'Western'),
    ('JKL', 'Southern');

CREATE TABLE SENT_BILLS (
    Name VARCHAR(50),
    Amount DOUBLE
);

INSERT INTO SENT_BILLS (Name, Amount)
VALUES
    ('ABC', 5000),
    ('DEF', 3000),
    ('GHI', 4500),
    ('JKL', 2000),
    ('ABC', 6000),
    ('DEF', 2500);

-----------------------

CREATE VIEW EXAMPLE (Province, TOTAL_BILLS, TOTAL_AMOUNT) AS 
SELECT 
    COMPANY.Province, 
    COUNT(SENT_BILLS.Name) AS TOTAL_BILLS, 
    SUM(SENT_BILLS.Amount) AS TOTAL_AMOUNT 
FROM 
    SENT_BILLS
INNER JOIN 
    COMPANY 
ON 
    SENT_BILLS.Name = COMPANY.Name
GROUP BY 
    COMPANY.Province;

---------Example 2--------------

➢ Assume EXERCISE; that government decided to add10 percent service tax for all
payments. You want to see the new charges along with the type of
accounts the payments are coming from.
➢ You can add the 10 percent service tax and present it as a field within the
view. From that point on, you can select records from the view and already
have the total amount calculated for you

CREATE TABLE BILLS (
    NAME VARCHAR(50),
    AMOUNT DOUBLE,
    ACCOUNT_ID INT
);

INSERT INTO BILLS (NAME, AMOUNT, ACCOUNT_ID)
VALUES
    ('Raj', 5000, 101),
    ('Varo', 3000, 102),
    ('Rohan', 4500, 103);

CREATE TABLE BANK_ACCOUNT (
    ACCOUNT_ID INT,
    TYPE VARCHAR(50)
);

INSERT INTO BANK_ACCOUNT (ACCOUNT_ID, TYPE)
VALUES
    (101, 'Savings'),
    (102, 'Checking'),
    (103, 'Business');

-----------------------------------------

CREATE VIEW NEW_PAYMENT (NAME, OLD_VALUE, NEW_TOTAL, ACCOUNT_TYPE) AS 
SELECT 
    BILLS.NAME, 
    BILLS.AMOUNT AS OLD_VALUE, 
    BILLS.AMOUNT * 1.10 AS NEW_TOTAL, 
    BANK_ACCOUNT.TYPE AS ACCOUNT_TYPE
FROM 
    BILLS
INNER JOIN 
    BANK_ACCOUNT 
ON 
    BILLS.ACCOUNT_ID = BANK_ACCOUNT.ACCOUNT_ID;

-----

SELECT * FROM NEW_PAYMENT;

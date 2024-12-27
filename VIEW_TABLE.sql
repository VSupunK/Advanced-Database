-- CREATE VIEW TABLE

1. CREATE DATABASE adbms_practice;

2. USE adbms_practice;

3.
CREATE TABLE Salary(
	Account_ID INT AUTO_INCREMENT,
    Company VARCHAR(50),
    Account VARCHAR(50),
    Amount DOUBLE,
    PRIMARY KEY(Account_ID)
);

4.
INSERT INTO Salary(Company, Account, Amount) VALUES
    ('ABC', '111111', 450.00),
    ('XYZ', '222222', 15000.00),
    ('QRT', '333333', 10000.00),
    ('SSSS', '444444', 5000.00);

5.
CREATE VIEW Debits AS SELECT * FROM Salary;

6.SELECT BILLS.NAME, BILLS.AMOUNT, BANK_ACCOUNT.BALANCE,
BANK_ACCOUNT.BANK FROM BILLS, BANK_ACCOUNT
WHERE BILLS.ACCOUNT_ID = BANK_ACCOUNT.ACCOUNT_ID
AND BANK_ACCOUNT.BALANCE > 500;

-----------------------------------------
CREATE TABLE Bank_Account (
    Account_ID INT AUTO_INCREMENT PRIMARY KEY,
    Balance DOUBLE NOT NULL,
    Bank VARCHAR(50) NOT NULL,
    Type VARCHAR(20) NOT NULL
);

INSERT INTO Bank_Account (Balance, Bank, Type)
VALUES
(5000.75, 'Bank of America', 'Savings'),
(12000.50, 'Wells Fargo', 'Checking'),
(750.00, 'Chase', 'Business'),
(9500.25, 'CitiBank', 'Savings'),
(2200.00, 'PNC Bank', 'Checking');
-----------------------------------------

-- To rename a table
ALTER TABLE table_name
RENAME TO new_table_name;

ALTER TABLE Salary
RENAME TO Bills;

-- CREATE NEW VIEWS FROM EXISTING VIEWS

CREATE VIEW CreditCard_Debits 
AS SELECT * FROM Debits 
WHERE Account_ID = 4;

-- The CREATE VIEW also enables you to select individual
-- columns from a table and place them in a view

CREATE VIEW Company_Info (Name, City) AS
SELECT Name, City FROM Company;

Company (Company_ID, Name, City, Type);

-- The CREATE VIEW also enables you to select columns from
-- several tables and place them in a view

CREATE VIEW Company_Info All_Info (Name, Amount, Balance, Bank) AS
SELECT Bills.Name, Bills.Amount, Bank_Account.Balance, Bank_Account.Bank
FROM Bills, Bank_Account
WHERE Bills.Account_ID = Bank_Account.Account_ID;

-- HOW TO GET A LIST OF MYSQL VIEWS?

USE Information_Schema;

SELECT TABLE_SCHEMA, TABLE_NAME
FROM Information_Schema.TABLES 
WHERE TABLE_TYPE = 'VIEW';

-- HOW TO GET A LIST OF VIEWS IN A SPECIFIC DATABASE?
SELECT TABLE_SCHEMA, TABLE_NAME
FROM information_schema.TABLES
WHERE TABLE_TYPE = 'VIEW'
AND TABLE_SCHEMA = 'ADBMS_PRACTICE';

-- RENAMING COLUMNS

-- The SQL + operator to combine the several fields into one long field
-- by combining spaces and commas with the character data

CREATE VIEW Envelope (Company, Mailing_Address)
AS SELECT Name, Address + " " + City + "," + Province
FROM Company;

-- THE DROP VIEW STATEMENT
DROP VIEW view_name;
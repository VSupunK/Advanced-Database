Create database pastpaper2021;

use pastpaper2021;

Create table Research_paper (
    PID varchar(5) NOT NULL,
    Author1 varchar(10),
    Author2 varchar(10),
    JID varchar(5),
    Status varchar(10)
    );

insert into Research_paper VALUES 
    ('P1', 'Suranga', 'Mali', 'J03', 'Accept'),
    ('P2', 'Suranga', 'Surangi', 'J02', 'Reject'),
    ('P3', 'Suranga', 'Rani', 'J01', 'Accept');

CREATE TABLE Journal (
    JID VARCHAR(5) NOT NULL,
    J_Name VARCHAR(10),
    `Index` VARCHAR(10),
    Fee DOUBLE
);

INSERT INTO Journal VALUES
    ('J01', 'IEEE TSC', 'SCI-E', 200000.00),
    ('J02', 'IJWSR', 'SCI-E', 150000.00),
    ('J03', 'IJIR', 'EI', 50000.00);

    ------cretae a view-----

CREATE VIEW Pub_details AS
SELECT 
    PID, 
    CONCAT(Author1, ', ', Author2) AS Authors, 
    JID 
FROM 
    Research_paper;

SELECT * FROM Pub_details;

----------

Create view Suranga_pub AS
SELECT 
    Journal.JID as FID, Journal.J_Name as Journal_Name, Research_paper.Author2 as Co_Author, Research_paper.Status From Research_paper, Journal
WHERE Research_paper.JID = Journal.JID;

---------

create view INFO as SELECT Journal_Name, Co_Author from Suranga_pub;

select * from INFO;

------------

CREATE VIEW AINFO AS
SELECT 
    Status, 
    COUNT(*) AS Number
FROM 
    Research_paper
GROUP BY 
    Status;

select * from AINFO;

-----------------

create view New_PublicationFees AS
select J_Name as Journal_Name, Fee as Old_fee, (Fee-20000) as New_fee from Journal;

select * from New_PublicationFees;

-------------

Update AINFO SET Number = Number + 2;

select * from AINFO;
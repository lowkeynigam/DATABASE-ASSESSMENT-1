--Rishabh Nigam 103607336
-- EVENT (EventYear, EventMonth, EventDay)
-- PRIMARY KEY (EventYear, EventMonth,EventDay)
-- FOREIGN KEY (FEE) REFERENCES COST

-- BOOKING (DateBooked, Payment)
-- PRIMARY KEY (DateBooked, Payment)

-- CLIENT (ClientID, Surname, GivenName, Gender)
-- PRIMARY KEY (ClientID)
-- FOREIGN KEY (Surname, GivenName, Gender)

-- TOUR (TourName, Descriotion)
-- PRIMARY KEY (TourName)
-- FOREIGN KEY Descriotion

IF OBJECT_ID('TOUR') IS NOT NULL
DROP TABLE TOUR;
IF OBJECT_ID('EVENT') IS NOT NULL
DROP TABLE EVENT;
IF OBJECT_ID('BOOKING') IS NOT NULL
DROP TABLE BOOKING;
IF OBJECT_ID('CLIENT') IS NOT NULL
DROP TABLE CLIENT;
GO

CREATE TABLE TOUR(
    TourName NVARCHAR(100),
    Descriotion NVARCHAR(500),
);

CREATE TABLE CLIENT(
    ClientID INT
    ,Surname NVARCHAR(100)
    ,GivenName NVARCHAR(100)
    ,Gender NVARCHAR(1)
);
CREATE TABLE EVENT(
    TourName NVARCHAR(100)
    ,EventMonth NVARCHAR(3)
    ,EventDay INT
    ,EventYear INT
    ,EventFee MONEY
);
CREATE TABLE BOOKING(
    ClientID INT
    ,TourName NVARCHAR(100)
    ,EventMonth NVARCHAR(3)
    ,EventDay INT
    ,EventYear INT
    ,Payment MONEY
    ,DateBooked DATE
);
SELECT * FROM TOUR
SELECT * FROM CLIENT
SELECT * FROM EVENT
SELECT * FROM BOOKING
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
--I've mispelled 'Description' as it was in the document given to us
CREATE TABLE TOUR(
    TourName NVARCHAR(100),
    Descriotion NVARCHAR(500),
);

CREATE TABLE CLIENT(
    ClientID INT
    ,Surname NVARCHAR(100)
    ,GivenName NVARCHAR(100)
    ,Gender NVARCHAR(1) check (Gender in ('M','F','I'))
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
INSERT INTO CLIENT (ClientID, Surname, GivenName, Gender) VALUES
('1', 'Price', 'Taylor', 'M'),
('2', 'Gamble', 'Ellyse', 'F'),
('3', 'Tan', 'Tilly', 'F'),
('4', 'Nigam', 'Rishabh', 'M');

INSERT INTO BOOKING (ClientID,TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES
('1', 'North', 'Jan', '9','2016','200', '2015-12-10'),
('2', 'North', 'Jan', '9','2016','200', '2015-12-16'),
('1', 'North', 'Feb', '13','2016','225', '2016-01-8'),
('2', 'North', 'Feb', '13','2016','125', '2016-01-8'),
('3', 'North', 'Feb', '13','2016','225', '2016-02-3'),
('1', 'South', 'Jan', '9','2016','200', '2015-12-10'),
('2', 'South', 'Jan', '16','2016','200', '2015-12-18'),
('3', 'South', 'Jan', '16','2016','200', '2016-01-9'),
('2', 'West', 'Jan', '29','2016','225', '2015-12-17'),
('3', 'West', 'Jan', '29','2016','200', '2015-12-18');

INSERT INTO EVENT (TourName,EventMonth,EventDay,EventYear,EventFee) VALUES
('North', 'Jan', '9', '2016', '200'),
('North', 'Feb', '13', '2016', '225'),
('South', 'Jan', '9', '2016', '200'),
('South', 'Jan', '16', '2016', '200'),
('West', 'Jan', '29', '2016', '225');

INSERT INTO TOUR (TourName,Descriotion) VALUES
('North','Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South','Tour of wineries and outlets of Mornington Penisula'),
('West','Tour of wineries and outlets of the Geelong and Otways region');

--Task 4 Query 1
    -- SELECT GivenName, Surname, BOOKING.TourName, Descriotion,EventYear,EventMonth,DateBooked,EventFee
    -- FROM CLIENT, BOOKING, EVENT, TOUR
--Task 4 Query 2
    --SELECT EventMonth,TourName, COUNT(*) AS "NUM OF BOOKINGS"
    --FROM BOOKING
    --GROUP BY EventMonth,TourName
--Task 4 Query 3
    SELECT * FROM BOOKING
    GROUP BY Payment
    HAVING
        Payment > AVG(Payment)

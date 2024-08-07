//Database Tables
CREATE DATABASE Insurance
CREATE TABLE Customer
(
 CustomerId int IDENTITY (1, 1) NOT NULL,
 Firstname nvarchar(20) NOT NULL,
 LastName nvarchar(20) Not NULL,
 DOBDate date NOT NULL,
 EmailId nvarchar(20),
 PhoneNum bigint not null,
 City nvarchar(20) NOT NULL,
 State nvarchar(20) Not NULL,
 ZipCode nvarchar(20) NOT NULL,
 CONSTRAINT Customer_PK PRIMARY KEY(customerId)
)
GO
CREATE TABLE Policy
(
 PolicyId int IDENTITY (1, 1) NOT NULL,
 PolicyTypeID INT NOT NULL,
 CustomerID INT NOT NULL,
 Coverage bigint NOT NULL,
 IssuedDate DateTime NOT NULL,
 Expiry DateTime NOT NULL,
 CONSTRAINT Policy_PK PRIMARY KEY(PolicyId)
)
GO
CREATE TABLE PolicyTypes
(
 PolicyTypeID INT IDENTITY (1, 1) NOT NULL,
 PolicyName nvarchar(20) NOT NULL,
 CONSTRAINT Types_PK PRIMARY KEY(PolicyTypeID)
)
GO
CREATE TABLE PolicyPayment
(
 PaymentId int IDENTITY (1, 1) NOT NULL,
 PolicyID int NOT NULL,
 PaymentStatus nvarchar(30) NOT NULL,
 PaymentType nvarchar(30) NOT NULL,
 TransactionId bigint NOT NULL,
 CONSTRAINT PolicyPayment_PK PRIMARY KEY(PaymentId)
)
GO
ALTER TABLE Policy ADD CONSTRAINT Customer_FK FOREIGN KEY (CustomerID) REFERENCES
Customer(CustomerID) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE Policy ADD CONSTRAINT PolicyType_FK FOREIGN KEY (PolicyTypeID) REFERENCES
PolicyTypes(PolicyTypeID) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE PolicyPayment ADD CONSTRAINT PolicyPayment_FK FOREIGN KEY (PolicyID)
REFERENCES Policy(PolicyID) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
CREATE TABLE EventLogger (CustomerId INT ,
 PolicyID INT
,
 Logtime DateTime
,
 [Message] NVARCHAR
(100))
GO
CREATE TABLE CustomerPolicyDeadline (CustomerId INT ,
 Firstname nvarchar
(20
) NOT NULL,
 LastName nvarchar
(20
) Not NULL,
 PolicyID INT
,
 Coverage bigint NOT NULL,
 IssuedDate DateTime NOT NULL,
 Expiry DateTime NOT NULL,
 Logtime DateTime
,
 [Message] NVARCHAR
(100))
GO

//Inserting Data into Tables:
Insert into Customer values
('Praveen Kumar', 'Siddela','05-18-1998', 'praveen@asu.edu',9876554334, 'tempe', 'Arizona', 85281),
('Subadra Devi', 'Venkatesan','09-25-1998', 'devi@asu.edu',7656257678, 'phoenix', 'Arizona', 85226),
('Prema Bhaavani', 'Doddanari','05-05-1999', 'prema@asu.edu',2432534276, 'chandler', 'Arizona', 85231),
('Sumanth', 'Vema','07-07-1998', 'sumanth@asu.edu',3465899575,'Cerritos','California', 90784),
('Sindhuri', 'Munjila','12-12-1997', 'sindhu@asu.edu',7467312340, 'Scottsdale', 'Arizona', 85265),
('Andrew', 'Josh','06-18-1995', 'andrew@asu.edu',9124765333, 'Los Angeles', 'California', 90001),
('Sushmita', 'Yadav','01-13-1979', 'sushmitha@asu.edu',2349875645, 'Georgia', 'Atlanta', 30304);

INSERT INTO PolicyTypes VALUES ('Housing'),
 ('Life Insurance'),
 ('Automobile');

 INSERT INTO Policy VALUES (1, 1, 2000,'03/05/1999', '03/05/2029'),
 (2, 2, 2500,'09/24/2001', '09/24/2031'),
 (3, 3, 3400,'11/22/2014', '11/22/2054'),
 (1, 4, 5200,'08/13/2005', '08/13/2035'),
 (2, 5, 2200,'02/15/2010', '02/15/2040'),
 (3, 6, 5600,'06/05/2020', '06/05/2050'),
 (2, 7, 1000,'12/05/2009', '12/05/2049');

 Insert into PolicyPayment values(1,'Success','Cash',9127),
 (2,'Success','Credit/Debit',7389),
 (3,'Success','Netbanking',2739),
 (4,'Success','Cash',1935),
 (5,'Fail','Credit/Debit',4792),
 (6,'Success','Credit/Debit',6500),
 (7,'Fail','Netbanking',2794);

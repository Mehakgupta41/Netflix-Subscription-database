DROP DATABASE IF EXISTS netflix;
CREATE DATABASE netflix;
USE netflix;

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Plans;
DROP TABLE IF EXISTS PaymentMethod;
DROP TABLE IF EXISTS Profiles;
DROP TABLE IF EXISTS Content;
DROP TABLE IF EXISTS Devices;
DROP TABLE IF EXISTS Subscribes;
DROP TABLE IF EXISTS PaymentHistory;
DROP TABLE IF EXISTS ViewingHistory;
DROP TABLE IF EXISTS CustomersLanguagePreferred;
DROP TABLE IF EXISTS Uses;
DROP TABLE IF EXISTS ChildAcc;
DROP TABLE IF EXISTS AdultAcc;
DROP TABLE IF EXISTS Devices;

-- CUSTOMERS -- 

CREATE TABLE Customers(
CUSTID VARCHAR(10),
FNAME VARCHAR(30),
LNAME VARCHAR(30),
BDATE DATE,
GENDER VARCHAR(1),
COUNTRY VARCHAR(30),
EMAIL VARCHAR(30),
CONSTRAINT Customers_PK PRIMARY KEY (CUSTID)
);

-- 6 Customers --
INSERT INTO Customers(CUSTID,FNAME,LNAME,BDATE,GENDER,COUNTRY,EMAIL) VALUES ('C1','Jane','Porter','1990-02-17','M', 'US','jane27@colorado.edu');
INSERT INTO Customers(CUSTID,FNAME,LNAME,BDATE,GENDER,COUNTRY,EMAIL) VALUES ('C2','Hank','Smith','1984-03-20','F', 'US','hank34@icloud.com');
INSERT INTO Customers(CUSTID,FNAME,LNAME,BDATE,GENDER,COUNTRY,EMAIL) VALUES ('C3','Bill','Dobbs','2001-04-17','M', 'US','bill71@gmail.com');
INSERT INTO Customers(CUSTID,FNAME,LNAME,BDATE,GENDER,COUNTRY,EMAIL) VALUES ('C4','Sandy','Peters','1994-03-10','F', 'US','sandy21@mac.com');
INSERT INTO Customers(CUSTID,FNAME,LNAME,BDATE,GENDER,COUNTRY,EMAIL) VALUES ('C5','Josh','Jacobs','1975-11-15','F', 'US','josh35@aol.com');
INSERT INTO Customers(CUSTID,FNAME,LNAME,BDATE,GENDER,COUNTRY,EMAIL) VALUES ('C6','Tim','Allen','2001-03-21','M', 'US','allen34@gmail.com');


-- CustomersLanguagePreferred

Create table CustomersLanguagePreferred (
CustID VARCHAR(10),
Language VARCHAR(10),
CONSTRAINT Devices_FK_CustID FOREIGN KEY (CustID) REFERENCES `Customers`(CustID)
);

-- 19 records --
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C1', 'English');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C1', 'Japanese');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C1', 'Spanish');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C1', 'French');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C1', 'Hindi');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C2', 'English');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C2', 'French');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C2', 'Hindi');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C3', 'English');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C3', 'Spanish');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C4', 'English');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C4', 'Japanese');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C4', 'Spanish');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C4', 'French');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C3', 'Korean');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C4', 'Korean');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C5', 'English');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C5', 'Japanese');
INSERT INTO CustomersLanguagePreferred(CustID, Language) VALUES ('C5', 'Korean');

-- PLANS --

CREATE TABLE Plans(
PlanID VARCHAR(10),
AdSupport VARCHAR(3),
NumOfSupportDevForDownload INT,
PlanName VARCHAR(30),
NumOfProfiles INT,
VideoQuality VARCHAR(30),
NumOfSupportDevForView INT,
MonthlyPrice FLOAT(5,2),
ContentAccess VARCHAR(30),
CONSTRAINT Plans_PK PRIMARY KEY (PlanID)
);

-- 3 Records --
INSERT INTO Plans(PlanID,AdSupport,NumOfSupportDevForDownload,PlanName,NumOfProfiles,VideoQuality,NumOfSupportDevForView,MonthlyPrice,ContentAccess) VALUES ('P1','Yes','0','Standard w/ Ads','1','Full HD','2','6.99','limited');
INSERT INTO Plans(PlanID,AdSupport,NumOfSupportDevForDownload,PlanName,NumOfProfiles,VideoQuality,NumOfSupportDevForView,MonthlyPrice,ContentAccess) VALUES ('P2','No','2','Standard ','2','Full HD','2','15.49','unlimited');
INSERT INTO Plans(PlanID,AdSupport,NumOfSupportDevForDownload,PlanName,NumOfProfiles,VideoQuality,NumOfSupportDevForView,MonthlyPrice,ContentAccess) VALUES ('P3','No','6','Premium','4','Ultra HD','4','22.99','unlimited');



-- PAYMENT METHOD --

CREATE TABLE PaymentMethod(
CardID VARCHAR(10),
CVV VARCHAR(3),
ExpirationDate Date,
CardNumber VARCHAR(30),
ZipCode INT,
State VARCHAR(30),
City VARCHAR (30),
Street VARCHAR (30),
CUSTID VARCHAR(10),
CONSTRAINT PaymentMethod_PK PRIMARY KEY(CardID),
CONSTRAINT PaymentMethod_FK_Customers FOREIGN KEY (CUSTID) REFERENCES `Customers`(CUSTID)
);

-- 5 Records --
INSERT INTO PaymentMethod(CardID, CVV, ExpirationDate, CardNumber, ZipCode,State,City, Street, CustID) VALUES ('CP2645','3xx','2028-04-23','xxxx-xxxx-6372','80023','Colorado','Denver','2755 Olive Street','C1');
INSERT INTO PaymentMethod(CardID, CVV, ExpirationDate, CardNumber, ZipCode,State,City, Street, CustID) VALUES ('CP3847','6xx','2030-09-02','xxxx-xxxx-7845','89954','Colorado','Boulder','147 Pearl Street','C2');
INSERT INTO PaymentMethod(CardID, CVV, ExpirationDate, CardNumber, ZipCode,State,City, Street, CustID) VALUES ('CP7489','8xx','2024-02-17','xxxx-xxxx-1234','78521','Texas','Austin','130 Lyndhurst st','C3');
INSERT INTO PaymentMethod(CardID, CVV, ExpirationDate, CardNumber, ZipCode,State,City, Street, CustID) VALUES ('CP0346','7xx','2026-12-28','xxxx-xxxx-7777','82001','Wyoming','Cody','567 Fox Street','C4');
INSERT INTO PaymentMethod(CardID, CVV, ExpirationDate, CardNumber, ZipCode,State,City, Street, CustID) VALUES ('CP1280','9xx','2025-06-07','xxxx-xxxx-5643','84404','Utah','Salt Lake City','789 Drake Street','C5');

-- CONTENT -- 

Create table Content(
ContentID VARCHAR(10),
Genre VARCHAR(20),
TitleName VARCHAR(30),
Category VARCHAR(10),
UnlimitedAccess VARCHAR (5),
CONSTRAINT Content_PK PRIMARY KEY (ContentID)
);

-- 8 Records --
INSERT INTO Content(ContentID, Genre, TitleName, Category, UnlimitedAccess) VALUES ('Con1','Horror', 'Conjuring', 'Movie', 'Yes');
INSERT INTO Content(ContentID, Genre, TitleName, Category, UnlimitedAccess) VALUES ('Con2','Action','Extraction','Movie','Yes');
INSERT INTO Content(ContentID, Genre, TitleName, Category, UnlimitedAccess) VALUES ('Con3','Romantic','Titanic','Movie','No');
INSERT INTO Content(ContentID, Genre, TitleName, Category, UnlimitedAccess) VALUES ('Con4','Comedy','Friends', 'TV Show', 'Yes');
INSERT INTO Content(ContentID, Genre, TitleName, Category, UnlimitedAccess) VALUES ('Con5','Action', 'Spider-Man','Movie','Yes');
INSERT INTO Content(ContentID, Genre, TitleName, Category, UnlimitedAccess) VALUES ('Con6','Action', 'Hulk','Movie', 'No');
INSERT INTO Content(ContentID, Genre, TitleName, Category, UnlimitedAccess) VALUES ('Con7','Crime','Catch Me If You Can','Movie', 'Yes');
INSERT INTO Content(ContentID, Genre, TitleName, Category, UnlimitedAccess) VALUES ('Con8','Crime','Money Heist', 'TV Show', 'Yes');



-- SUBSCRIBES --

CREATE TABLE Subscribes(
StartDate DATE,
CustID VARCHAR(10),
PlanID VARCHAR(10),
Status VARCHAR(30),
EndDate DATE,
CONSTRAINT Subscribes_PK PRIMARY KEY (CustID, PlanID, Status),
CONSTRAINT Subscribes_FK_Customers FOREIGN KEY (CUSTID) REFERENCES `Customers`(CUSTID),
CONSTRAINT Subscribes_FK_Plans FOREIGN KEY (PLANID) REFERENCES `Plans`(PLANID)
);

-- 7 Records --
INSERT INTO Subscribes(StartDate,CustID,PlanID,Status,EndDate) VALUES ('2021-08-16','C1','P1','Active',Null);
INSERT INTO Subscribes(StartDate,CustID,PlanID,Status,EndDate) VALUES ('2022-11-26','C2','P3','Inactive','2023-08-14');
INSERT INTO Subscribes(StartDate,CustID,PlanID,Status,EndDate) VALUES ('2019-10-08','C3','P1','Inactive','2020-11-06');
INSERT INTO Subscribes(StartDate,CustID,PlanID,Status,EndDate) VALUES ('2021-06-22','C4','P2','Active',Null);
INSERT INTO Subscribes(StartDate,CustID,PlanID,Status,EndDate) VALUES ('2023-01-01','C5','P3','Active',Null);
INSERT INTO Subscribes(StartDate,CustID,PlanID,Status,EndDate) VALUES ('2020-11-06','C3','P2','Active',Null);
INSERT INTO Subscribes(StartDate,CustID,PlanID,Status,EndDate) VALUES ('2020-11-06','C6','P3','Inactive','2023-06-14');


-- Payment History --

CREATE TABLE PaymentHistory(
PaymentID VARCHAR(10),
PaymentDate VARCHAR(10),
PaymentAmount VARCHAR(10),
CardID VARCHAR(30),
CONSTRAINT PaymentHistory_PK PRIMARY KEY (PaymentID, PaymentDate, PaymentAmount, CardID),
CONSTRAINT PaymentHistory_FK_CardID FOREIGN KEY (CardID) REFERENCES `PaymentMethod`(CardID)
);

-- 5 Records --
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV156','2023-11-16','6.99','CP2645');
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV478','2023-11-26','22.99','CP3847');
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV567','2023-11-08','15.49','CP7489');
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV098','2023-11-22','15.49','CP0346');
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV234','2023-11-01','22.99','CP1280');



-- PROFILES --

CREATE TABLE Profiles(
ProfileID VARCHAR(10),
ProfileName VARCHAR(30),
CustID VARCHAR(10),
CONSTRAINT Profiles_PK PRIMARY KEY (ProfileID),
CONSTRAINT Profiles_FK_Customers FOREIGN KEY (CUSTID) REFERENCES `Customers`(CUSTID)
);

-- 17 Records --
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C1','John','C1');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C2','Boney','C2');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('B01C2','Jennie','C2');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('C01C2','Peter','C2');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('D01C2','Harsh','C2');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C3','Pretty','C3');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C4','Ben','C4');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('B01C4','Sally','C4');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C5','Pinky','C5');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('B01C5','Sophia ','C5');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('C01C5','Jane','C5');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('D01C5','James','C5');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A02C3','Billy','C3');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('B02C3','Max','C3');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C6','Mat','C6');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A02C6','Tia','C6');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A03C6','Bill','C6');


-- ChildAcc --

-- Ratings Type: TV-Y, G, PG, TV-Y7, PG-13, R

CREATE TABLE ChildAcc(
ProfileID VARCHAR(10),
MaxParentalRating VARCHAR(30),
CONSTRAINT ChildAcc_FK_ProfileID FOREIGN KEY (ProfileID) REFERENCES `Profiles`(ProfileID)
);

-- 7 Records --
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('A01C2', 'TV-Y7');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('A01C4', 'G');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('A02C6', 'G');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('A01C6', 'PG-13');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('C01C5', 'PG-13');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('B01C4', 'R');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('B02C3', 'R');

-- AdultAcc --

CREATE TABLE AdultAcc(
ProfileID VARCHAR(10),
NoOfChildren int,
CONSTRAINT AdultAcc_FK_ProfileID FOREIGN KEY (ProfileID) REFERENCES `Profiles`(ProfileID)
 );
 
-- 10 Records -- 
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A01C1', 2);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A01C3', 2);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A02C3', 1);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A01C5', 1);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A03C6', 0);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('B01C2', 1);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('C01C2', 1);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('D01C5', 0);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('D01C2', 0);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('B01C5', 1);
 
-- VIEWINGHISTORY --

CREATE TABLE ViewingHistory(
ContentID VARCHAR(10),
ProfileID VARCHAR(10),
LastWatchedDate DATE,
Runtime INT,
CONSTRAINT ViewingHistory_PK PRIMARY KEY (ContentID, ProfileID),
CONSTRAINT ViewingHistory_FK_ContentID FOREIGN KEY (ContentID) REFERENCES `Content`(ContentID),
CONSTRAINT ViewingHistory_FK_ProfileID FOREIGN KEY (ProfileID) REFERENCES `Profiles`(ProfileID)
);


-- 17 Records --
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con5','A01C6','2022-12-14','60');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con2','A01C2','2023-08-14','20');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con1','A01C5','2023-11-01','20');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con2','A01C5','2023-10-08','16');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con3','A01C5','2023-10-20','35');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con4','A01C5','2023-08-01','47');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con5','A01C5','2023-01-19','29');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con3','B01C5','2023-11-01','46');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con5','B01C5','2023-10-08','10');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con6','B01C5','2023-10-20','13');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con8','B01C5','2023-08-01','18');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con1','C01C5','2023-01-19','30');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con3','C01C5','2023-11-01','26');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con5','C01C5','2023-10-08','29');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con7','D01C5','2023-10-20','31');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con8','D01C5','2023-08-01','42');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con2','A01C1','2023-01-19','28');


-- DEVICES --

Create table Devices (
DeviceID VARCHAR(10),
DeviceType VARCHAR(10),
CONSTRAINT Devices_PK PRIMARY KEY (DeviceID)
);

-- 28 Records --
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T001','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T002','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T003','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T004','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T005','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T006','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T007','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T008','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T009','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T010','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T011','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T012','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T013','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T014','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V001','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V002','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0M001','Mobile');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0L001','Laptop');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V003','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0M002','Mobile');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0L002','Laptop');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V004','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0M003','Mobile');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0L003','Laptop');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V005','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0M004','Mobile');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0L004','Laptop');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V006','Smart TV');


-- Uses -- 

Create table Uses (
ProfileID VARCHAR(10),
DeviceID VARCHAR(10),
CONSTRAINT Uses_FK_DeviceID FOREIGN KEY (DeviceID) REFERENCES `Devices`(DeviceID),
CONSTRAINT Uses_FK_ProfileID FOREIGN KEY (ProfileID) REFERENCES `Profiles`(ProfileID)
);

-- 28 Records --
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C1','D0T001');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C2','D0T002');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C2','D0T003');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('C01C2','D0T004');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('D01C2','D0T005');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C3','D0T006');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C4','D0T007');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C4','D0T008');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C5','D0T009');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C5','D0T010');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('C01C5','D0T011');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('D01C5','D0T012');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A02C3','D0T013');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B02C3','D0T014');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C1','D0V001');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C2','D0V002');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C2','D0M001');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('C01C2','D0L001');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('D01C2','D0V003');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C3','D0M002');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C4','D0L002');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C4','D0V004');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C5','D0M003');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C5','D0L003');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('C01C5','D0V005');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('D01C5','D0M004');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A02C3','D0L004');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B02C3','D0V006');


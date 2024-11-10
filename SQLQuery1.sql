CREATE DATABASE COMMUNITY_EYE

CREATE TABLE CrimeCase(
CaseID int Primary Key,
CrimeType varchar(100),
Province varchar(50),
Recency varchar(100),
Detail varchar(5000),
Evidence binary,
PlaintiffID int,
)

CREATE TABLE CommunityMember(
MemberID varchar(13) Primary Key,
Email varchar(100),
CellNum varchar(100),
Password_ varchar(100)
)

CREATE TABLE PaymentInformation(
PaymentID int Primary Key,
UserID int not null,
CardName varchar(100),
CardNumber varchar(20),
CVV int,
ExpiryDate varchar(10),
PaymentDate date
)

CREATE TABLE Incidents(
IncidentID INT IDENTITY(1,1) PRIMARY KEY,
WatchID int Not null,
Area varchar(50),
Description_ varchar(1000),
ReportDate datetime,
MemberID int 
)

alter table CommunityMember Add UserType varchar(50);
alter table CrimeCase Alter column PlaintiffID varchar(13);
alter table CrimeCase Alter column Evidence Varbinary(max);
alter table CrimeCase Add Area varchar(50);
alter table CrimeCase drop column Province;
alter table CrimeCase Add Status_ varchar(50);
alter table CrimeCase Add EvidenceFileType varchar(50);
insert into CommunityMember (MemberID, Email, CellNum, Password_, UserType) Values('0404206117081', 'vutuinga@gmail.com', '0737655554', 'Walebale@04', 'Officer');
alter table CrimeCase Add ReportDate Date;
ALTER TABLE CrimeCase DROP Constraint PK__CrimeCas__6CAE526CD0A34630;
ALTER TABLE CrimeCase DROP Column CaseID;
ALTER TABLE CrimeCase ADD CaseID INT IDENTITY(1,1) PRIMARY KEY;
alter table Watch Add Members int;
alter table Members Add Email varchar(200);
alter table Members Add Password_ varchar(200);
alter table Members Add UserID varchar(13);
alter table Members Drop Column MemberName;
alter table Members Add Column MemberName;
alter table Watch Add Area varchar(50);
alter table Watch Add Description_ varchar(400);
alter table Watch Drop Column Longitude;
alter table Watch Drop Column Latitude;
alter table PaymentInformation Add Plan_ varchar(20);
alter table PaymentInformation Add Price varchar(10);
alter table CrimeCase Add  OfficerID varchar(13);
alter table Watch Add Cap int;

SELECT
    tc.CONSTRAINT_NAME,
    tc.TABLE_NAME
FROM
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
WHERE
    tc.TABLE_NAME = 'PaymentInformation' AND
    tc.CONSTRAINT_TYPE = 'PRIMARY KEY';
ALTER TABLE PaymentInformation DROP Constraint PK__PaymentI__9B556A5844D4BDCB;
ALTER TABLE PaymentInformation DROP Column PaymentID;
ALTER TABLE PaymentInformation ADD PaymentID INT IDENTITY(1,1) PRIMARY KEY;
alter table PaymentInformation Alter column UserID varchar(13);
alter table PaymentInformation Alter column PaymentDate datetime;
alter table PaymentInformation Alter column CVV varchar(3);
alter table PaymentInformation Alter column ExpiryDate varchar(13);
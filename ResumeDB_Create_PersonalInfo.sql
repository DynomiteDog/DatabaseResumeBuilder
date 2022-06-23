--USE Applicant;
--GO
/*This page catagorizes personal information into several tables*/
BEGIN TRY
/*The relations created for these tables is based on the idea that someone could exist without having contact information and/or address information, and the oppsite relation exists between for any contact information and addresses*/
--create tables for the resume's personal information and addresses schema
--create a personal information table 
CREATE TABLE ApplicantPersonalInformation.PersonalInformation 
	(
		ApplicantName_ID SMALLINT IDENTITY(100, 1) NOT NULL,
			FirstName NVARCHAR(48),
			MiddleNameInitial NCHAR(1),
			LastName NVARCHAR(48),
		BirthDate DATE NOT NULL,
		SSN CHAR(11) NOT NULL,
				CONSTRAINT PK_PersonalInfo_ApplicantNameID PRIMARY KEY (ApplicantName_ID)
	);
	
--create a contact information table 
CREATE TABLE ApplicantPersonalInformation.ContactInfo 
	(
		ContactInfo_ID SMALLINT IDENTITY(100, 1) NOT NULL,
			PhoneNumber CHAR(14),
			EmailAddress VARCHAR(128),
			Facebook VARCHAR(128),
			LinkedIn VARCHAR(128),
			Instagram VARCHAR(128),
			Twitter VARCHAR(128),
			YouTube VARCHAR(128),
			Reddit VARCHAR(128),
			Other VARCHAR(128),
					ApplicantName_ID SMALLINT,
				CONSTRAINT PK_ContactInfo_ContactInfoID PRIMARY KEY (ContactInfo_ID)
	);

--create an address table
CREATE TABLE ApplicantAddresses.PersonalAddress
	(
		PersonalAddress_ID SMALLINT IDENTITY(100, 1) NOT NULL,
			StreetAddress VARCHAR(256),
			City VARCHAR(128),
			StateABBR CHAR(2),
			ZipCode	CHAR(5),
					ApplicantName_ID SMALLINT,
				CONSTRAINT PK_PersonalInfo_AddressID PRIMARY KEY (PersonalAddress_ID)
	);

--add foreign key constraints 
ALTER TABLE ApplicantPersonalInformation.ContactInfo
	ADD CONSTRAINT FK_Applicant_ContactID FOREIGN KEY (ApplicantName_ID) 
		REFERENCES PersonalInformation (ApplicantName_ID)
	ON UPDATE CASCADE;

ALTER TABLE ApplicantAddresses.PersonalAddress
	ADD CONSTRAINT FK_Applicant_AddressID FOREIGN KEY (ApplicantName_ID) 
		REFERENCES ApplicantPersonalInformation.PersonalInformation (ApplicantName_ID)
	ON UPDATE CASCADE;
	
--create an index for the applicants unique personal ID
CREATE UNIQUE INDEX IX_Applicant_SSN
	ON ApplicantPersonalInformation.PersonalInformation (SSN);
	
END TRY
BEGIN CATCH
EXECUTE ResumeSP_GetErrorInfo
END CATCH

/*
CREATE CERTIFICATE NationalID  
   WITH SUBJECT = 'Employee Social Security Numbers';  
GO  

CREATE SYMMETRIC KEY SSN_Key_01  
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE NationalID;  
GO  

USE Applicant;  
GO  

-- Create a column in which to store the encrypted data.  
ALTER TABLE ApplicantPersonalInformation.PersonalInformation  
    ADD EncryptedNationalIDNumber varbinary(128);   
GO  

-- Open the symmetric key with which to encrypt the data.  
OPEN SYMMETRIC KEY SSN_Key_01  
   DECRYPTION BY CERTIFICATE NationalID;  

-- Encrypt the value in column NationalIDNumber with symmetric   
-- key SSN_Key_01. Save the result in column EncryptedNationalIDNumber.  
UPDATE ApplicantPersonalInformation.PersonalInformation  
SET EncryptedNationalIDNumber = EncryptByKey(Key_GUID('SSN_Key_01'), NationalIDNumber);  
GO 
*/
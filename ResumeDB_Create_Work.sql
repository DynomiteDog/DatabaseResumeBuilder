--USE Applicant;
--GO
/*This page create tables for storing information for a resume's work history*/
BEGIN TRY
/*The relations created for these tables is based on the idea that a person can hold a position without a company however a company will always have at least one position.*/
--Create tables for the applicants work history
--create a company addresses table
CREATE TABLE ApplicantAddresses.CompanyAddress
	(
		CompanyAddress_ID SMALLINT IDENTITY(100, 1) NOT NULL,
			City VARCHAR(128),
			StateABBR CHAR(2),
			ZipCode	CHAR(5),
				CONSTRAINT PK_Company_AddressID PRIMARY KEY (CompanyAddress_ID)
	);
--create position details table
CREATE TABLE ApplicantWorkExperience.PositionResponsibilities
	(
		Responsibilities_ID SMALLINT IDENTITY(100, 1) NOT NULL, 
			PrimaryDuties VARCHAR(256),
			SecondaryDuties VARCHAR(256),
			OtherDuties VARCHAR(256),
					ApplicantName_ID SMALLINT,
				CONSTRAINT PK_Position_ResponsibilitiesID PRIMARY KEY (Responsibilities_ID)
	);

-- create work experience Table
CREATE TABLE ApplicantWorkExperience.Company
	(
		Company_ID SMALLINT IDENTITY(100, 1) NOT NULL, 
			CompanyName VARCHAR(128),
			JobTitle VARCHAR(128),
		StartDate DATE NOT NULL,
			EndDate Date,
					CompanyAddress_ID SMALLINT,
					Responsibilities_ID SMALLINT,
				CONSTRAINT PK_WorkExperience_CompanyID PRIMARY KEY (Company_ID),
	);

--create foreign key constraints 
ALTER TABLE ApplicantWorkExperience.Company
	ADD CONSTRAINT FK_Company_AddressID FOREIGN KEY (CompanyAddress_ID) 
		REFERENCES ApplicantAddresses.CompanyAddress (CompanyAddress_ID)
	ON UPDATE CASCADE;
	
ALTER TABLE ApplicantWorkExperience.Company
	ADD CONSTRAINT FK_Company_DutiesID FOREIGN KEY (Responsibilities_ID) 
		REFERENCES ApplicantWorkExperience.PositionResponsibilities (Responsibilities_ID)
	ON UPDATE CASCADE;
	
ALTER TABLE ApplicantWorkExperience.PositionResponsibilities
	ADD CONSTRAINT FK_Duties_ApplicantID FOREIGN KEY (ApplicantName_ID) 
		REFERENCES ApplicantPersonalInformation.PersonalInformation (ApplicantName_ID)
	ON UPDATE CASCADE;
	
END TRY
BEGIN CATCH
EXECUTE ResumeSP_GetErrorInfo
END CATCH
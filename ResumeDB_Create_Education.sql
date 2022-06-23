--USE Applicant;
--GO
/*This page creates tables to store education, skill, and any certifications*/
BEGIN TRY
/*The relations created for these tables is based on the idea that an educational institution will always have one primary address*/
--create tables for the applicants education and skills in the educational skills schema 
-- Education information table
CREATE TABLE ApplicantEducationalSkills.Education
	(
		Education_ID SMALLINT IDENTITY(100, 1) NOT NULL,
		EducationalFacility VARCHAR(128) NOT NULL,
		DiscplineStudied VARCHAR(128) NOT NULL,
			SecondaryDiscipline VARCHAR(128),
			LevelOfCompletion VARCHAR(128),
		StartDate DATE NOT NULL, 
			EndDate DATE,
				EducationAddress_ID SMALLINT,
				ApplicantName_ID SMALLINT,
					CONSTRAINT PK_Education_EducationID PRIMARY KEY (Education_ID)
	);

-- Education address table
CREATE TABLE ApplicantAddresses.EducationAddress
	(
		EducationAddress_ID SMALLINT IDENTITY(100, 1) NOT NULL,
			City NVARCHAR(128),
			StateABBR NCHAR(2),
			ZipCode	CHAR(5),
				Education_ID SMALLINT,
					CONSTRAINT PK_Education_AddressID PRIMARY KEY (EducationAddress_ID)
	);

-- Education skills/certification table
CREATE TABLE ApplicantEducationalSkills.Skills
	(
		Skills_ID SMALLINT IDENTITY(100, 1) NOT NULL,
			SkillName VARCHAR(128),
			SkillType VARCHAR(128),
			Certification VARCHAR(5),
				ApplicantName_ID SMALLINT,
					CONSTRAINT PK_Skills_SkillID PRIMARY KEY (Skills_ID)		
	);

--add foreign key constraints 
ALTER TABLE ApplicantEducationalSkills.Education
	ADD CONSTRAINT FK_Education_ApplicantID FOREIGN KEY (ApplicantName_ID) 
		REFERENCES ApplicantPersonalInformation.PersonalInformation (ApplicantName_ID)
	ON UPDATE CASCADE;

ALTER TABLE ApplicantAddresses.EducationAddress
	ADD CONSTRAINT FK_Address_EducationID FOREIGN KEY (Education_ID) 
		REFERENCES ApplicantEducationalSkills.Education (Education_ID)
	ON UPDATE CASCADE;

ALTER TABLE ApplicantEducation.Education
	ADD CONSTRAINT FK_Education_EducationAddressID FOREIGN KEY (EducationAddress_ID) 
		REFERENCES ApplicantAddresses.EducationAddress (EducationAddress_ID)
	ON UPDATE CASCADE;
	
ALTER TABLE ApplicantEducationalSkills.Skills
	ADD CONSTRAINT FK_Skills_ApplicantID FOREIGN KEY (ApplicantName_ID) 
		REFERENCES ApplicantPersonalInformation.PersonalInformation (ApplicantName_ID)
	ON UPDATE CASCADE;
	
END TRY
BEGIN CATCH
EXECUTE ResumeSP_GetErrorInfo
END CATCH
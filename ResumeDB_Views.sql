--use Applicant;
--go
/*utilizing views protect the data integrity and database access to the underlying table(s)*/
/*create views for each section of the resume*/
--select * FROM ApplicantPersonalInformation.PersonalInformation;
--select * FROM ApplicantAddresses.PersonalAddress;
--select * FROM ApplicantPersonalInformation.ContactInfo;
CREATE VIEW ApplicantPersonalInformation.ResumeView_ApplicantInfo 
WITH ENCRYPTION
	AS
select 	P.FirstName AS "First Name", 
		P.LastName AS "Last Name", 
		C.PhoneNumber AS "Phone Number", 
		C.EmailAddress AS "E-mail",
		A.StreetAddress AS "Address", 
		A.City, 
		A.StateABBR AS "State" 
	FROM 	ApplicantPersonalInformation.PersonalInformation AS P  
		join 	ApplicantAddresses.PersonalAddress AS A
			ON 		P.ApplicantName_ID = A.ApplicantName_ID
		join	ApplicantPersonalInformation.ContactInfo AS C
			ON P.ApplicantName_ID = C.ApplicantName_ID;
GO

--select * FROM ApplicantAddresses.EducationAddress;
--select * FROM ApplicantEducationalSkills.Education;
--SELECT * FROM ApplicantEducationalSkills.Skills;
CREATE VIEW ApplicantEducationalSkills.ResumeView_ApplicantEducation 
WITH ENCRYPTION
	AS
select 	E.EducationalFacility, 
		A.City, 
		A.StateABBR, 
		E.DiscplineStudied, 
		E.LevelOfCompletion
	FROM 	ApplicantAddresses.EducationAddress AS A
		join 	ApplicantEducationalSkills.Education AS E
			ON 		E.Education_ID = A.Education_ID
				ORDER BY E.StartDate DESC;
GO
/*
select TOP(10) PERCENT 	S.SkillName AS "Skill",
						S.SkillType AS "Skill Type", 
						S.Certification AS "Certified"
	FROM ApplicantEducationalSkills.Skills AS S
		ORDER BY S.Skill;
GO
*/

--select * FROM ApplicantWorkExperience.Company;
--select * FROM ApplicantAddresses.CompanyAddress;
--select * FROM ApplicantWorkExperience.PositionResponsibilities;
CREATE VIEW ApplicantWorkExperience.ResumeView_ApplicantWorkHistory 
WITH ENCRYPTION
AS
select TOP(3) 	C.CompanyName AS "Company", 
				A.City, 
				A.StateABBR AS "State", 
				C.JobTitle AS "Title", 
				C.StartDate AS "Start Date", 
				C.EndDate AS "End Date", 
				P.PrimaryDuties AS "Main Role", 
				P.SecondaryDuties AS "Achivements", 
				P.OtherDuties AS "Honorable Mentions"
	FROM ApplicantWorkExperience.Company AS C
		join ApplicantAddresses.CompanyAddress AS A 
			ON C.CompanyAddress_ID = A.CompanyAddress_ID
		join ApplicantWorkExperience.PositionResponsibilities AS P 
			ON C.Company_ID = P.PositionResponsibilities_ID
	ORDER BY C.StartDate DESC;
GO

/* here are a couple of select statements that can confirm that the view(s) was committed to the database
--To check view information with T-SQL Object Catalog Views.
select * from sys.views;
select * from sys.all_views 
				where name= N%'ResumeView';
select * from sys.system_views 
				where name= N%'ResumeView';
select * from sys.objects 
				where type='VIEW';
*/
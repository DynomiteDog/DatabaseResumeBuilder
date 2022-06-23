--USE Applicant;
--go
/*By creating a procedure that utilizes views instead of the tables it allows for manipulation of the data and information without effecting the underlying table(s)*/
Create PROCEDURE ResumeSP_JSI
AS
SELECT * FROM ApplicantPersonalInformation.ResumeView_ApplicantInfo;
select TOP(10) /*PERCENT - add syntax for a percentage*/ 	S.SkillName AS "Skill",
						S.SkillType AS "Skill Type", 
						S.Certification AS "Certified"
	FROM ApplicantEducationalSkills.Skills AS S
		ORDER BY S.Skill;
SELECT * FROM ApplicantEducationalSkills.ResumeView_ApplicantEducation;
SELECT * FROM ApplicantWorkExperience.ResumeView_ApplicantWorkHistory;
GO

EXEC ResumeSP_JSI;
GO

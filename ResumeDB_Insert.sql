--USE Applicant;
--GO
/*This page takes all of the information from my resume and stores it into the tables*/
BEGIN TRY
	-- insert information into the personal information table
INSERT INTO ApplicantPersonalInformation.PersonalInformation
(
	FirstName, MiddleNameInitial, LastName, BirthDate, SSN
)
VALUES 
	(
		'Jeffrey', 'S', 'Igo', '1983-02-21', '123-45-6789' 
	);
END TRY
BEGIN CATCH
	EXECUTE ResumeSP_GetErrorInfo
END CATCH
BEGIN TRY
	-- insert information into the Contact Info table
INSERT INTO ApplicantPersonalInformation.ContactInfo 
(
	PhoneNumber, EmailAddress, Facebook, YouTube, ApplicantName_ID 
)
VALUES 
	(
		'1-513-908-6386', 'igo.jeff@yahoo.com', 'https://www.facebook.com/jeff.igo.9', 'https://www.youtube.com/channel/UC24ivMc61zDsGozl9K7iWsw', '100' 
	);
END TRY
BEGIN CATCH
	EXECUTE ResumeSP_GetErrorInfo
END CATCH
BEGIN TRY
	-- insert information into the Address tables
INSERT INTO ApplicantAddresses.PersonalAddress 
(
	StreetAddress, City, StateABBR, ZipCode, ApplicantName_ID
)
VALUES
	( '894 Mohawk Trail, unit 4', 'Milford', 'OH', '45150', '100');
END TRY
BEGIN CATCH
	EXECUTE ResumeSP_GetErrorInfo
END CATCH
BEGIN TRY
INSERT INTO ApplicantAddresses.EducationAddress 
(
	City, StateABBR, Education_ID
)
VALUES
	('Cincinnati', 'OH', '100'),	
	('Highland Heights', 'KY', '101'),	
	('Batavia', 'OH', '102');
END TRY
BEGIN CATCH
	EXECUTE ResumeSP_GetErrorInfo
END CATCH
BEGIN TRY
	-- insert information into the education tables
INSERT INTO ApplicantEducationalSkills.Education
(
	EducationalFacility, DiscplineStudied, SecondaryDiscipline, LevelOfCompletion, StartDate, EndDate, ApplicantName_ID
)
VALUES
	( 'University Of Cincinnati', 'Information Tech1logy','', 'Sophmore', '2016-08-15', '2018-05-15', '100'),
	
	( 'Northern Kentucky University', 'Business Administration', 'Graphic Design', 'Bachelors Degree', '2010-08-15', '2012-05-15', '100'),
	
	( 'University Of Cincinnati, Clermont', 'General Studies','', 'Two year transfer program (NKY)', '2007-08-15', '2010-05-15', '100');
END TRY
BEGIN CATCH
	EXECUTE ResumeSP_GetErrorInfo
END CATCH
BEGIN TRY
	-- insert information into the skills/certification tables
INSERT INTO ApplicantEducationalSkills.Skills
(
	SkillName, SkillType, Certification
)
	VALUES
	('T-SQL', 'Database Query Language', 'False', '100'),

	('Relational databases', 'Database Query Language', 'False', '100'),
	
	('Data structures', 'Database Query Language', 'False', '100'),
	
	('SQL', 'Database Query Language', 'False', '100'),
	
	('PostgreSQL', 'Database Query Language', 'False', '100'),
		
	('SSIS', 'Database Query Language', 'False', '100'),
	
	('SSRS', 'Database Query Language', 'False', '100'),
	
	('SSAS', 'Database Query Language', 'False', '100'),

	('Microsoft SQL Server 2019, 2016, 2012, and 2008 (R2)', 'Database Management Studio', 'False', '100'),

	('Azure', 'Database Cloud Platform', 'False', '100'),
	
	('MySQL', 'Open-Source Database Management Studio', 'False', '100'),
	
	('MS Access', 'Database Management Studio', 'False', '100'),
	
	('Java', 'Programming Language', 'False', '100'),
	
	('JavaScript', 'Programming Language', 'False', '100'),
	
	('PHP', 'Programming Language', 'False', '100'),
	
	('HTML 5', 'Web Design Programming Language', 'False', '100'),
	
	('CSS3', 'Web Design Programming Language', 'False', '100'),
		
	('Photoshop', 'Graphic Design Program', 'True', '100'),
	
	('Illustrator', 'Graphic Design Program', 'True', '100'),
	
	('Dreamweaver', 'Web Design Program', 'False', '100'),
		
	('Eclipse Java Neon', 'Computer Programming Program', 'False', '100'),
	
	('Visual Studio', 'Computer Programming Program', 'False', '100'),

	('Git', 'Cloud Programming Platform', 'False', '100'),
	
	('XML', 'Programming Language', 'False', '100'),
	
	('C#', 'Programming Language', 'False', '100'),
	
	('JSON', 'Programming Language', 'False', '100'),
	
	('AJAX', 'Programming Language', 'False', '100'),

	('Python', 'Programming Language', 'False', '100'),
	
	('Scripting', 'Programming', 'False', '100'),
	
	('ASP.NET', 'Programming Platform', 'False', '100'),
	
	('.NET', 'Programming Platform', 'False', '100'),
	
	('GitHub', 'Cloud Programming Platform', 'False', '100'),
		
	('APIs', 'Web Design Programming Language', 'False', '100'),

	('MS Office', 'Standard Computer Program', 'True', '100'),
	
	('MS Outlook', 'Business Computer Program', 'True', '100'),
	
	('Marketing', 'Business Communications', 'True', '100'),
	
	('Asset retention', 'Business Management', 'True', '100'),
	
	('Customer Service', 'Business Communications', 'True', '100'),
	
	('Inventory Management', 'Business Administration', 'True'), '100',
	
	('Communications', 'Business Management', 'True', '100'),

	('Realtor', 'Real Estate, 2020 - Present', 'True', '100'),
	
	('Insurance Agent', 'Life Insurance, 2021 - Present', 'True', '100'),
	
	('Insurance Agent', 'Health Insurance, 2013 - 2017', 'False', '100');
END TRY
BEGIN CATCH
	EXECUTE ResumeSP_GetErrorInfo
END CATCH
BEGIN TRY
	--insert information into the Company history table
INSERT INTO ApplicantWorkExperience.Company
(
	CompanyName, JobTitle, StartDate, EndDate, CompanyAddress_ID, Responsibilities_ID, ApplicantName_ID
)
VALUES
	( 'Sibcy Cline Realtors', 'Realtor', '2020-01-01', GETDATE(), '100', '100', '100'),
	
	('The Cheesecake Factory', 'Customer Service Associate', '2019-04-01', GETDATE(), '101', '101', '100'), 

	('Stanley Steemers', 'Air Duct Techniction', '2018-08-01', '2019-05-01', '102','102', '100'),
	
	('Firebirds: Wood-fire Grill', 'Saute Chef', '2016-03-01', '2018-11-01', '103','103', '100'),
	
	('Transamerica Retirement Solutions', '401K Representative', '2015-02-01', '2015-10-01','104','104', '100'),
	
	('Anthem, Blue Cross & Blue Shield', 'Licensed Representative', '2014-09-01', '2015-02-01','105','105', '100'),
	
	('AFLAC', 'Licensed Agent', '2013-06-01', '2014-08-01','106','106', '100'),
	
	('Darden Corp.: Longhorn Staekhouse', 'Customer Service Associate', '2013-02-15', '2013-07-30', '107','107', '100');
	
	('Darden Corp.: Red Lobster', 'Customer Service Associate', '2008-06-01', '2012-12-31', '107','107', '100');

END TRY
BEGIN CATCH
	EXECUTE Applicant_GetErrorInfo
END CATCH
BEGIN TRY
INSERT INTO ApplicantAddresses.CompanyAddress 
(
	City, StateABBR, ZipCode
)
VALUES
	('Milford','OH','45150'),
	('Kenwood','OH','45236'),
	('Sharonville','OH','45241'),
	('Mason','OH','45040'),
	('West Chester','OH','45069'),
	('Mason','OH','45040'),
	('Sharonville','OH','45241'),
	('Beechmont/Amelia', 'OH', '45102');
END TRY
BEGIN CATCH
	EXECUTE ResumeSP_GetErrorInfo
END CATCH
BEGIN TRY
	-- insert information into the position duties table
INSERT INTO ApplicantWorkExperience.PositionResponsibilities
(
	PrimaryDuties, SecondaryDuties, OtherDuties
)
VALUES
	('As a realtor we are held to the highest standards of fiduciary responsibilities, integrity, and ethics.', 
	'I completed my first transaction within the first few months of being licensed.', 
	'I negotiate on behalf of the client, prepare and explain paperwork, transfer funds to company escrow, and submit closing documents.'),
	
	('High standards of service by consistently completing tasks correctly, anticipating guests needs, and contributing to the overall success to the store.',
	'I am k1wledgeable about 200+ products that Cheesecake Factory provides to guests.',
	'I am one of the top associates in my store based off of guest’s feedback, and revenue generated per shift.'),
	
	('Daily tasks included scheduling clients for air duct cleanings, assigning crew members and their daily driving route.',
	'Increased our locations Airduct cleaning revenue over 100% within six months.', 
	'Defensive driving, transit van, and box truck safe driving certified.'),
	
	('Responsibilities include following cooking procedures and recipes to prepare to our guests.',
	'The ability to multi-task in a very fast-paced work environment by making quick decisions in high pressure situations.', 
	'Implement food/health standards and understand emergency procedures to ensure safety.'),
	
	('Identified assets that investors held outside of the company.',
	'Retained over $2M in assets from 401k plans to IRA plans and assisted in the rollovers of nearly $5M in assets from outside sources.',
	'Other job functions included loan processing, withdrawal requests, and fund transfers.'),
	
	('Provided explanations of an individual(s) health coverage and options for renewing their health plan according to HIPAA regulations, and the Affordable Care Act.',
	'I also provided internet instructional assistance for filing forms and finding documents. Renewed over 3,000 insurance policies during the open enrollment period.',
	'Helped educate individuals on the new policies in place and how to move forward and have protection for their families and themselves.'),
	
	('Conducted Business to Business sales of supplemental health insurance.'
	,'Contacted small business owners to assists them in their healthcare coverage to make it as affordable as possible.'
	,'I grew and maintained a book of business during a time of major changes in the industry with the Affordable Care Act regulations.'),
	
	('Providing excellent customer service in conjunction with Dardens standards, also monthly goals based on customer feedback, and sales.',
	'Received three letters of recognition for outstanding performance from corporate headquarters.', 
	'It was a fast-paced position that was 1t only challenging but also rewarding.');
END TRY
BEGIN CATCH
	EXECUTE ResumeSP_GetErrorInfo
END CATCH
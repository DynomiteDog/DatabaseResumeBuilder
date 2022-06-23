/*
This Database is intended for demostration purposes with the transact sql language. The following code has been personally crafted and was not created through any GUI application such as SSMS.
Throughout this design additional scripts for encryption, error handeling, and permissions will be shown in examples.
furthermore, this is a static database in which the design requirements for some of the tables are second natural form (2NF), however if this where a database that was going to continually add new resumes the tables would be sorted down to 3NF or down to BNF.  
*/

USE MASTER;
DROP DATABASE IF EXISTS Applicant;
CREATE DATABASE Applicant; 
GO

USE Applicant;
GO
-- Create procedure to retrieve error information.  
CREATE PROCEDURE ResumeSP_GetErrorInfo  
	AS
	  SELECT  
		ERROR_NUMBER() AS 'Error Number',
		ERROR_SEVERITY() AS 'Error Severity',
		ERROR_STATE() AS 'Error State',
		ERROR_PROCEDURE() AS 'Error Procedure',
		ERROR_LINE() AS 'Error Line',
		ERROR_MESSAGE() AS 'Error Message';
GO  

/**** there are multiple ways to encrypt the data in a database,
this example is for database level encryption 
CREATE DATABASE ENCRYPTION KEY  
   WITH ALGORITHM = { AES_128 | AES_192 | AES_256 | TRIPLE_DES_3KEY }  
ENCRYPTION BY SERVER   
{  
	CERTIFICATE Encryptor_Name |  
	ASYMMETRIC KEY Encryptor_Name  
};   
****/
/*Schemas help the RDBMS to index, reference, call information, and execution planning as a whole for faster front end preformance*/
USE Applicant;
GO
--create a personal info schema
CREATE SCHEMA ApplicantPersonalInformation; 
GO
--create education and skills schema
CREATE SCHEMA ApplicantEducationalSkills; 
GO
-- create work experience schema
CREATE SCHEMA ApplicantWorkExperience;
GO
--create an address schema
CREATE SCHEMA ApplicantAddresses;
GO

/**** the importance of creating back-ups cannot be stressed enough, and depending on what type of transaction is taking place will determine how often and when to create a backup of the database.
BACKUP DATABASE Applicant
TO 	DISK = 'X:\SQLServerBackups\Applicant1.bak',
	--DISK = 'Y:\SQLServerBackups\Applicant2.bak',
	--DISK = 'Z:\SQLServerBackups\Applicant3.bak'
WITH FORMAT,
	MEDIANAME = 'Applicant_set001',
	MEDIADESCRIPTION = 'Striped media set for Applicant database';
GO
****/

/****
--To Restore an Entire Database from a Full database backup (a Complete Restore):
RESTORE DATABASE Applicant
[ FROM 	DISK = 'X:\SQLServerBackups\Applicant1.bak',
		--DISK = 'Y:\SQLServerBackups\Applicant2.bak',
		--DISK = 'Z:\SQLServerBackups\Applicant3.bak']
[ WITH RESTART, RECOVERY];
GO
****/


/**** controlling access to the database is also crucial when it comes to (not only) data integrity also security of the data that is not ment for a particular person, department, or the public to be able to view (or worse be able to make changes to).
Below are examples of and syntax for creating permissions within an organization taken from Micrsoft Doc's web page
https://docs.microsoft.com/en-us/sql/t-sql/statements/grant-object-permissions-transact-sql?view=sql-server-ver15

GRANT <permission> [ ,...n ] ON   
[ OBJECT :: ][ schema_name ]. object_name [ ( column [ ,...n ] ) ]  
TO <database_principal> [ ,...n ]   
[ WITH GRANT OPTION ]  
[ AS <database_principal> ]  

<permission> ::=  
ALL [ PRIVILEGES ] | permission [ ( column [ ,...n ] ) ]  

<database_principal> ::=   
	Database_user   
| Database_role   
| Application_role   
| Database_user_mapped_to_Windows_User   
| Database_user_mapped_to_Windows_Group   
| Database_user_mapped_to_certificate   
| Database_user_mapped_to_asymmetric_key   
| Database_user_with_no_login
****//***** Examples
--The following example grants SELECT permission to user RosaQdM on table Person.Address in the AdventureWorks2012 database.
GRANT SELECT ON OBJECT::Person.Address TO RosaQdM;  
GO

--The following example grants EXECUTE permission on stored procedure HumanResources.uspUpdateEmployeeHireInfo to an application role called Recruiting11.
USE AdventureWorks2012;   
GRANT EXECUTE ON OBJECT::HumanResources.uspUpdateEmployeeHireInfo  
TO Recruiting11;  
GO

--The following example grants REFERENCES permission on column BusinessEntityID in view HumanResources.vEmployee to user Wanida with GRANT OPTION.
GRANT REFERENCES (BusinessEntityID) ON OBJECT::HumanResources.vEmployee   
TO Wanida WITH GRANT OPTION;  
GO

--The following example grants SELECT permission to user RosaQdM on table Person.Address in the AdventureWorks2012 database.
GRANT SELECT ON Person.Address TO RosaQdM;  
GO

--The following example creates a role and then grants EXECUTE permission to the role on procedure uspGetBillOfMaterials in the AdventureWorks2012 database.
CREATE ROLE newrole ;  
GRANT EXECUTE ON dbo.uspGetBillOfMaterials TO newrole ;  
GO

****/

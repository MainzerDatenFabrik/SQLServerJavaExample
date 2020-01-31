
-- Create a database to define the external language and libaries in
CREATE DATABASE JavaTest

USE JavaTest
GO

-- Define Java as an external language
-- The <os-default-path> tag must be replaced below
CREATE EXTERNAL LANGUAGE Java 
FROM (CONTENT = N'<os-default-path>\MSSQL\Binn\java-lang-extension.zip', FILE_NAME = 'javaextension.dll');
GO

-- Define the mssql-java-lang-extension.jar as external library
-- The <os-default-path> tag must be replaced below
CREATE EXTERNAL LIBRARY sdk 
FROM (CONTENT = '<os-default-path>\MSSQL\Binn\mssql-java-lang-extension.jar') WITH (LANGUAGE = 'Java'); 
GO

-- Define the user created .jar file as external library
-- The <path-to-jar> tag must be replaced below
CREATE EXTERNAL LIBRARY helloWorld
FROM (CONTENT = '<path-to-jar>')
WITH (LANGUAGE = 'Java');
GO

-- Define the stored procedure used to call the Java application
CREATE OR ALTER PROCEDURE [dbo].[java_hello_world]
AS
BEGIN
EXEC sp_execute_external_script
  @language = N'Java'
, @script = N'pkg.HelloWorld'
with result sets ((text nvarchar(100)));
END
GO

-- Execute the Java application
EXECUTE [dbo].[java_hello_world] 
GO
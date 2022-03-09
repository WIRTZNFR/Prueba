DROP DATABASE IF EXISTS TestDB
GO
CREATE DATABASE TestDB
GO

USE TestDB;
GO

--Creamos el esquema
DROP SCHEMA IF EXISTS HR
GO
CREATE SCHEMA HR
GO

--creamos una tabla
DROP TABLE IF EXISTS HR.Employee
GO
CREATE TABLE HR.Employee
(
	EmployeeID CHAR(2),
	GivenName VARCHAR(50),
	Surname VARCHAR(50),
	SSN CHAR(9)
);
GO

-- Vamos a importar registros de un fichero txt o csv que vamos a crear con un notepad
-- GUI IMPORT FLAT FILE Employees
-- Employees.txt
-- Tasks Import in GUI


--Crear una vista
DROP VIEW IF EXISTS HR.LookupEmployee
GO
CREATE OR ALTER VIEW HR.LookupEmployee
AS
SELECT
	EmployeeID, GivenName, Surname
FROM HR.Employee;
GO

--crear un rol o grupo
DROP ROLE IF EXISTS HumanResourcesAnalyst
GO
CREATE ROLE HumanResourcesAnalyst;
GO

--cargo concedo permisos al rol
GRANT SELECT ON HR.lookupEmployee TO HumanResourcesAnalyst
GO

--creo usuario y lo meto en el rol
DROP USER IF EXISTS JaneDoe 
GO

CREATE USER JaneDoe Without LOGIN
GO

ALTER ROLE HumanResourcesAnalyst
ADD MEMBER JaneDoe;
GO


--Esto funciona
--JaneDoe has select against the view
--Seh does not have Select against the table
--ownership chaining makes this happen

Execute as user = 'JaneDoe';
GO
--aqui demostramos que no puede acceder pq no está en el rol
--de los permisos de la vista
SELECT * FROM HR.LookupEmployee;
GO
--PRINT USER Nos dice que usuario esta usandolo
PRINT USER 
GO
--aqui demostramos que no puede acceder pq no está en el rol
--de los permisos de la tabla

--Msg 229, Level 14, State 5, Line 79
--The SELECT permission was denied on the object 'employee', database 'TestDB', schema 'HR'.

EXECUTE AS USER = 'JaneDoe';
GO
SELECT * FROM HR.Employee;
GO
--Msg 229, Level 14, State 5, Line 79
--The SELECT permission was denied on the object 'employee', database 'TestDB', schema 'HR'.

REVERT 
GO

-- y vemos q somos dbo y no janedoe
PRINT USER
GO


--Creacion de procedimiento almacenado

CREATE OR ALTER PROC HR.InsertNewEmployee
	-- INPUT PARAMETERS
	@EmployeeID INT,
	@GivenName VARCHAR(50),
	@Surname VARCHAR(50),
	@SSN CHAR(9)
AS
BEGIN
	INSERT INTO HR.Employee
	( EmployeeID, GivenName, Surname, SSN )
	VALUES
	(@EmployeeID, @GivenName, @Surname, @SSN);
END;
GO
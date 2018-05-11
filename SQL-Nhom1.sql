  CREATE DATABASE TTCSDL

  USE TTCSDL
  CREATE TABLE batch
  (
  code VARCHAR(10) PRIMARY KEY,
  name NVARCHAR(50),
  daystart date
  )

  CREATE TABLE level
  (
  code VARCHAR(10) PRIMARY KEY,
  name NVARCHAR(50)
  )

   CREATE TABLE facility
 (
 code VARCHAR(10) PRIMARY KEY,
 name NVARCHAR(50)
 )

  CREATE TABLE major
 (
 code VARCHAR(10) PRIMARY KEY,
 name NVARCHAR(50),
 facilitycode VARCHAR(10) REFERENCES dbo.facility
 )

  CREATE TABLE class
  (
  code VARCHAR(10) PRIMARY KEY,
  name NVARCHAR(50),
  batchcode VARCHAR(10) REFERENCES dbo.batch,
  levelcode VARCHAR(10) REFERENCES dbo.level,
  majorcode VARCHAR(10) REFERENCES dbo.major
  )
  
    CREATE TABLE student 
  (
  code VARCHAR(10) PRIMARY KEY,
  filecode VARCHAR(50),
  lastname NVARCHAR(30),
  firstname NVARCHAR(30),
  dateofbirth DATE,
  sex SMALLINT,
  placeofbirth NVARCHAR(255),
  permanenaddress NVARCHAR(255),
  nation NVARCHAR(50),
  nationality NVARCHAR(50),
  religion NVARCHAR(50),
  email NVARCHAR(50),
  phone VARCHAR(50),
  idcardnumber VARCHAR(12),
  note NVARCHAR(50),
  classcode VARCHAR(10) REFERENCES dbo.class
  )

    CREATE TABLE relative
  (
  code VARCHAR(10) PRIMARY KEY,
  name NVARCHAR(50),
  dateofbirth DATE,
  workplace NVARCHAR(255),
  address NVARCHAR(255),
  placeofbirth NVARCHAR(255),
  relationship NVARCHAR(50),
  studentcode VARCHAR(10) REFERENCES dbo.student
  )

CREATE TABLE changeclass
(
code VARCHAR(10) PRIMARY KEY,
studentcode VARCHAR(10) REFERENCES dbo.student,
daychange DATE,
oldclasscode VARCHAR(10) REFERENCES dbo.class,
newclasscode VARCHAR(10) REFERENCES dbo.class
)
 --Thêm mới sinh viên
CREATE PROCEDURE addstudent 
(@filecode varchar(50), 
@lastname nvarchar(30), 
@firstname nvarchar(30), 
@dateofbirth date, 
@sex smallint, 
@placeofbirth nvarchar(255), 
@permanenaddress nvarchar(255), 
@note nvarchar(50), 
@nation nvarchar(50),
@nationality varchar(50),
@religion nvarchar(50),
@email nvarchar(50),
@phone nvarchar(50), 
@idcardnumber nvarchar(12), 
@classcode varchar(10)
)
AS
BEGIN
DECLARE @code VARCHAR(5)
	IF (SELECT COUNT(code) FROM student) = 0
	BEGIN
		SET @code = '0'
	END
	ELSE
	BEGIN
		SELECT @code = MAX(RIGHT(code, 4)) FROM student
		SELECT @code= CASE
			WHEN @code >= 0 and @code < 9 THEN '000' + CONVERT(CHAR, CONVERT(INT, @code) + 1)
			WHEN @code >= 9 and @code < 99 THEN '00' + CONVERT(CHAR, CONVERT(INT, @code) + 1)
			WHEN @code >= 99 and @code < 999 THEN '0' + CONVERT(CHAR, CONVERT(INT, @code) + 1)
			WHEN @code >= 999 THEN CONVERT(CHAR, CONVERT(INT, @code) + 1)
		END
	END
INSERT INTO student 
(	code, 
	filecode,
	lastname, 
	firstname, 
	dateofbirth, 
	sex, 
	placeofbirth, 
	permanenaddress, 
	note, 
	nation, 
	nationality, 
	religion, 
	email, 
	phone, 
	idcardnumber, 
	classcode)
VALUES (
@code,
@filecode,
@lastname, 
@firstname, 
@dateofbirth, 
@sex, 
@placeofbirth, 
@permanenaddress, 
@note, 
@nation,
@nationality,
@religion,
@email,
@phone, 
@idcardnumber, 
@classcode
)
END
--Thêm mới thân nhân
CREATE PROCEDURE addrelative 
(	@name varchar(50), 
@dateofbirth date, 
@workplace nvarchar(255), 
@address nvarchar(255),
@placeofbirth nvarchar(255),
@relationship nvarchar(50),
@studentcode varchar(10)
)
AS
BEGIN
DECLARE @code VARCHAR(5)
	IF (SELECT COUNT(code) FROM relative) = 0
	BEGIN
		SET @code = '0'
	END
	ELSE
	BEGIN
		SELECT @code = MAX(RIGHT(code, 4)) FROM relative
		SELECT @code= CASE
			WHEN @code >= 0 and @code < 9 THEN '000' + CONVERT(CHAR, CONVERT(INT, @code) + 1)
			WHEN @code >= 9 and @code < 99 THEN '00' + CONVERT(CHAR, CONVERT(INT, @code) + 1)
			WHEN @code >= 99 and @code < 999 THEN '0' + CONVERT(CHAR, CONVERT(INT, @code) + 1)
			WHEN @code >= 999 THEN CONVERT(CHAR, CONVERT(INT, @code) + 1)
		END
	END
INSERT INTO relative (code, name, dateofbirth, workplace, address,placeofbirth, relationship, studentcode) values
(
@code,
	@name, 
@dateofbirth, 
@workplace, 
@address,
@placeofbirth,
@relationship,
@studentcode
)
END

--Thêm mới lớp học
CREATE PROCEDURE addclass
(@code varchar(10),
@name nvarchar(50), 
@batchcode varchar(10), 
@levelcode varchar(10), 
@majorcode varchar(10)
)
AS
BEGIN
INSERT INTO class (code, name, batchcode, levelcode, majorcode) values
(
@code,
@name,
@batchcode, 
@levelcode, 
@majorcode
)
END
--Thêm niên khóa
CREATE PROCEDURE addbatch
(@code varchar(10),
@name nvarchar(50), 
@daystart date 
)
AS
BEGIN
INSERT INTO batch (code, name, daystart) values
(
@code,
@name,
@daystart
)
END
--Thêm cấp học
CREATE PROCEDURE addlevel (@code varchar(10),@name nvarchar(50))
AS
BEGIN
INSERT INTO level (code, name) values
(
@code,
@name
)
END
--Thêm ngành
CREATE PROCEDURE addmajor (@code varchar(10),@name nvarchar(50),@facilitycode char(10))
AS
BEGIN
INSERT INTO major (code, name, facilitycode) values
(
@code,
@name,
@facilitycode
)
END

--Thêm khoa
CREATE PROCEDURE addfacility (@code varchar(10),@name nvarchar(50))
AS
BEGIN
INSERT INTO major (code, name) values
(
@code,
@name
)
END

--Thêm chuyển lớp
CREATE PROCEDURE addchangeclass
(
@studentcode varchar(10), 
@newclasscode varchar(10)
)
AS
BEGIN
DECLARE @code VARCHAR(10)
	IF (SELECT COUNT(code) FROM changeclass) = 0
	BEGIN
		SET @code = '0'
	END
	ELSE
	BEGIN
		SELECT @code = MAX(RIGHT(code, 4)) FROM changeclass
		SELECT @code= CASE
			WHEN @code >= 0 and @code < 9 THEN '000' + CONVERT(CHAR, CONVERT(INT, @code) + 1)
			WHEN @code >= 9 and @code < 99 THEN '00' + CONVERT(CHAR, CONVERT(INT, @code) + 1)
			WHEN @code >= 99 and @code < 999 THEN '0' + CONVERT(CHAR, CONVERT(INT, @code) + 1)
			WHEN @code >= 999 THEN CONVERT(CHAR, CONVERT(INT, @code) + 1)
		END
	END
DECLARE @daychange date = GETDATE()
DECLARE @oldclasscode varchar(10)
SELECT @oldclasscode = st.classcode from student st where code = @studentcode;
INSERT INTO changeclass (code, studentcode, daychange, oldclasscode, newclasscode) values
(
@code,
@studentcode,
@daychange, 
@oldclasscode, 
@newclasscode
)
END

--trigger cập nhật lớp mới cho sinh viên

CREATE TRIGGER UDChangeClassStudent ON dbo.changeclass FOR INSERT
AS
BEGIN
	UPDATE dbo.student SET classcode = i.newclasscode FROM Inserted i WHERE i.studentcode = student.code
END



USE [master]
GO
/****** Object:  Database [TTCSDL]    Script Date: 5/11/2018 10:55:37 PM ******/
CREATE DATABASE [TTCSDL]
GO
ALTER DATABASE [TTCSDL] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TTCSDL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TTCSDL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TTCSDL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TTCSDL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TTCSDL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TTCSDL] SET ARITHABORT OFF 
GO
ALTER DATABASE [TTCSDL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TTCSDL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TTCSDL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TTCSDL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TTCSDL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TTCSDL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TTCSDL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TTCSDL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TTCSDL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TTCSDL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TTCSDL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TTCSDL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TTCSDL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TTCSDL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TTCSDL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TTCSDL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TTCSDL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TTCSDL] SET RECOVERY FULL 
GO
ALTER DATABASE [TTCSDL] SET  MULTI_USER 
GO
ALTER DATABASE [TTCSDL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TTCSDL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TTCSDL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TTCSDL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TTCSDL] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TTCSDL', N'ON'
GO
ALTER DATABASE [TTCSDL] SET QUERY_STORE = OFF
GO
USE [TTCSDL]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TTCSDL]
GO
/****** Object:  Table [dbo].[batch]    Script Date: 5/11/2018 10:55:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[batch](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[daystart] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[changeclass]    Script Date: 5/11/2018 10:55:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[changeclass](
	[code] [varchar](10) NOT NULL,
	[studentcode] [varchar](10) NULL,
	[daychange] [date] NULL,
	[oldclasscode] [varchar](10) NULL,
	[newclasscode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class]    Script Date: 5/11/2018 10:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[batchcode] [varchar](10) NULL,
	[levelcode] [varchar](10) NULL,
	[majorcode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facility]    Script Date: 5/11/2018 10:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facility](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[level]    Script Date: 5/11/2018 10:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[level](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[major]    Script Date: 5/11/2018 10:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[major](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[facilitycode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[relative]    Script Date: 5/11/2018 10:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relative](
	[code] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[dateofbirth] [date] NULL,
	[workplace] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[placeofbirth] [nvarchar](255) NULL,
	[relationship] [nvarchar](50) NULL,
	[studentcode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 5/11/2018 10:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[code] [varchar](10) NOT NULL,
	[filecode] [varchar](50) NULL,
	[lastname] [nvarchar](30) NULL,
	[firstname] [nvarchar](30) NULL,
	[dateofbirth] [date] NULL,
	[sex] [smallint] NULL,
	[placeofbirth] [nvarchar](255) NULL,
	[permanenaddress] [nvarchar](255) NULL,
	[nation] [nvarchar](50) NULL,
	[nationality] [nvarchar](50) NULL,
	[religion] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [varchar](50) NULL,
	[idcardnumber] [varchar](12) NULL,
	[note] [nvarchar](50) NULL,
	[classcode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[changeclass]  WITH CHECK ADD FOREIGN KEY([newclasscode])
REFERENCES [dbo].[class] ([code])
GO
ALTER TABLE [dbo].[changeclass]  WITH CHECK ADD FOREIGN KEY([oldclasscode])
REFERENCES [dbo].[class] ([code])
GO
ALTER TABLE [dbo].[changeclass]  WITH CHECK ADD FOREIGN KEY([studentcode])
REFERENCES [dbo].[student] ([code])
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD FOREIGN KEY([batchcode])
REFERENCES [dbo].[batch] ([code])
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD FOREIGN KEY([levelcode])
REFERENCES [dbo].[level] ([code])
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD FOREIGN KEY([majorcode])
REFERENCES [dbo].[major] ([code])
GO
ALTER TABLE [dbo].[major]  WITH CHECK ADD FOREIGN KEY([facilitycode])
REFERENCES [dbo].[facility] ([code])
GO
ALTER TABLE [dbo].[relative]  WITH CHECK ADD FOREIGN KEY([studentcode])
REFERENCES [dbo].[student] ([code])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([classcode])
REFERENCES [dbo].[class] ([code])
GO
/****** Object:  StoredProcedure [dbo].[addbatch]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addbatch]
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
GO
/****** Object:  StoredProcedure [dbo].[addchangeclass]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addchangeclass]
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
GO
/****** Object:  StoredProcedure [dbo].[addclass]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addclass]
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
GO
/****** Object:  StoredProcedure [dbo].[addfacility]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addfacility] (@code varchar(10),@name nvarchar(50))
AS
BEGIN
INSERT INTO major (code, name) values
(
@code,
@name
)
END
GO
/****** Object:  StoredProcedure [dbo].[addlevel]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addlevel] (@code varchar(10),@name nvarchar(50))
AS
BEGIN
INSERT INTO level (code, name) values
(
@code,
@name
)
END

GO
/****** Object:  StoredProcedure [dbo].[addmajor]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addmajor] (@code varchar(10),@name nvarchar(50),@facilitycode char(10))
AS
BEGIN
INSERT INTO major (code, name, facilitycode) values
(
@code,
@name,
@facilitycode
)
END
GO
/****** Object:  StoredProcedure [dbo].[addrelative]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addrelative] 
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
GO
/****** Object:  StoredProcedure [dbo].[addstudent]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addstudent] 
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



GO
/****** Object:  StoredProcedure [dbo].[delBatch]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delBatch](
	@code varchar(10)
)
as
begin
	declare @classcode varchar(10), @studentcode varchar(10)
	select @classcode = code from class where batchcode = @code
	select @studentcode = code from student where classcode = @classcode
	delete from relative
	where studentcode = @studentcode
	delete from changeclass
	where studentcode = @code
	delete from student
	where classcode = @classcode
	delete from class
	where batchcode = @code
	delete from batch
	where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[delChangeClass]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delChangeClass](
	@code varchar(10)
)
AS
BEGIN
	DECLARE @studentcode VARCHAR(10)
	DECLARE @oldclasscode VARCHAR(10)
	SELECT @studentcode = studentcode, @oldclasscode = oldclasscode FROM dbo.changeclass WHERE code = @code
	UPDATE dbo.student SET classcode = @oldclasscode WHERE code = @studentcode
	DELETE FROM dbo.changeclass WHERE code = @code
END
GO
/****** Object:  StoredProcedure [dbo].[delClassByCode]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delClassByCode](
	@code varchar(10)
)
as
begin
	declare @studentcode varchar(10)
	select @studentcode = code from student where classcode = @code
	delete from relative
	where studentcode = @studentcode
	delete from changeclass
	where studentcode = @code
	delete from	student
	where classcode = @code
	delete from class
	where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[delClassByName]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delClassByName](
	@name nvarchar(50)
)
as
begin
	declare @classcode varchar(10), @studentcode varchar(10)
	select @classcode = code from class where name = @name
	select @studentcode = code from student where classcode = @classcode
	delete from relative
	where studentcode = @studentcode
	delete from changeclass
	where studentcode = @studentcode
	delete from student
	where classcode = @classcode
	delete from class
	where name = @name
end
GO
/****** Object:  StoredProcedure [dbo].[delFacility]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delFacility](
	@code varchar(10)
)
as
begin
	declare @majorcode varchar(10), @classcode varchar(10), @studentcode varchar(10)
	select @majorcode = code from major where facilitycode = @code
	select @classcode = code from class where majorcode = @code
	select @studentcode = code from student where classcode = @classcode
	delete from relative
	where studentcode = @studentcode
	delete from changeclass
	where studentcode = @code
	delete from student
	where classcode = @classcode
	delete from class
	where majorcode = @majorcode
	delete from major
	where facilitycode = @code
	delete from facility
	where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[delLevel]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delLevel](
	@code varchar(10)
)
as
begin
	declare @classcode varchar(10), @studentcode varchar(10)
	select @classcode = code from class where levelcode = @code
	select @studentcode = code from student where classcode = @classcode
	delete from relative
	where studentcode = @studentcode
	delete from changeclass
	where studentcode = @code
	delete from student
	where classcode = @classcode
	delete from class
	where levelcode = @code
	delete from level
	where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[delMajor]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delMajor](
	@code varchar(10)
)
as
begin
	declare @classcode varchar(10), @studentcode varchar(10)
	select @classcode = code from class where majorcode = @code
	select @studentcode = code from student where classcode = @classcode
	delete from relative
	where studentcode = @studentcode
	delete from changeclass
	where studentcode = @code
	delete from student
	where classcode = @classcode
	delete from class
	where majorcode = @code
	delete from major
	where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[delRelativeByCode]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delRelativeByCode](
	@code varchar(10)
)
as
begin
	delete from relative
	where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[delRelativeByCodeStudent]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delRelativeByCodeStudent](
	@code varchar(10)
)
as
begin
	delete from relative
	where studentcode = @code
end
GO
/****** Object:  StoredProcedure [dbo].[delStudentByCode]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delStudentByCode](
	@code varchar(10)
)
as
begin
	delete from relative 
	where studentcode = @code 
	delete from changeclass
	where studentcode = @code
	delete from student 
	where code = @code 
end
GO
/****** Object:  StoredProcedure [dbo].[delStudentByName]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delStudentByName](
	@firstname nvarchar(30),
	@lastname nvarchar(30)
)
as
begin
	declare @code varchar(10)
	select @code = code from student where firstname = @firstname AND lastname = @lastname
	delete from relative
	where studentcode = @code
	delete from changeclass
	where studentcode = @code
	delete from student
	where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[TK_HoSV]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_HoSV] (@lastname nvarchar(30))
as begin
select *from student
where lastname = @lastname
end
GO
/****** Object:  StoredProcedure [dbo].[TK_HoTenSV]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_HoTenSV] (@lastname nvarchar(30), @firstname nvarchar(30))
as begin
select *from student
where lastname=@lastname and firstname=@firstname
end
GO
/****** Object:  StoredProcedure [dbo].[TK_MaCH]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_MaCH] (@code varchar(10))
as begin
select *from level
where @code = code
end
GO
/****** Object:  StoredProcedure [dbo].[TK_Makhoa]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_Makhoa] (@code varchar(10))
as begin
select *from facility 
where @code=code
end
GO
/****** Object:  StoredProcedure [dbo].[TK_MaLop]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_MaLop] (@code varchar(10))
as begin
select *from class
where @code = code
end
GO
/****** Object:  StoredProcedure [dbo].[TK_Manganh]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_Manganh] (@code varchar(10))
as begin
select *from major 
where code=@code
end
GO
/****** Object:  StoredProcedure [dbo].[TK_MaTN]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_MaTN] (@code varchar(10))
as begin
select *from relative
where code=@code
end
GO
/****** Object:  StoredProcedure [dbo].[TK_TenCH]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_TenCH] (@name nvarchar(30))
as begin
select *from level
where @name = name
end
GO
/****** Object:  StoredProcedure [dbo].[TK_TenKH]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_TenKH] (@name nvarchar(30))
as begin
select *from batch
where @name = name
end
GO
/****** Object:  StoredProcedure [dbo].[TK_Tenkhoa]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_Tenkhoa] (@name nvarchar(30))
as begin
select *from facility
where @name =name
end
GO
/****** Object:  StoredProcedure [dbo].[TK_TenLop]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_TenLop] (@name nvarchar(30))
as begin
select *from class
where @name = name
end
GO
/****** Object:  StoredProcedure [dbo].[TK_Tennganh]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_Tennganh] (@name nvarchar(30))
as begin
select *from major
where @name =name
end
GO
/****** Object:  StoredProcedure [dbo].[TK_TenSV]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_TenSV] (@firstname nvarchar(30))
as begin
select *from student
where student.firstname = @firstname
end
GO
/****** Object:  StoredProcedure [dbo].[TK_TenTN]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_TenTN] (@name nvarchar(30))
as begin
select *from relative
where name =@name
end
GO
/****** Object:  StoredProcedure [dbo].[TK_TN]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_TN] (@codeSt varchar(10))
as begin
select *from relative
where @codeSt = studentcode
end
GO
/****** Object:  StoredProcedure [dbo].[TK_TongSV]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_TongSV]
as
begin

select'Tổng sinh viên'=count(code),'Tổng sinh viên nữ'=sum(case sex when N'nữ'then 1 else 0 end)
from student

end
GO
/****** Object:  StoredProcedure [dbo].[TK_TT_chuyenlop]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TK_TT_chuyenlop] (@code varchar(10))
as begin
select *from changeclass
where @code =studentcode
end
GO
/****** Object:  StoredProcedure [dbo].[TKCaphoc]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TKCaphoc]
as
begin
select level.code 'Cấp học', COUNT (student.code)
from student, level
where student.classcode in (select code from class where levelcode in (select code from level ))

group by level.code

end
GO
/****** Object:  StoredProcedure [dbo].[Tuoi]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Tuoi]
as
begin
select year(getdate())-year(dateofbirth)'Tuổi',count(code)'Số sinh viên'
from student
group by ( year(getdate())-year(dateofbirth) )

end
GO
/****** Object:  StoredProcedure [dbo].[updatebatch]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatebatch](			
				@code varchar(10),
				@name nvarchar(50),
				@daystart date		
			   )
as
begin
		update  batch
		set	
			name = @name,	
			daystart = @daystart
		WHERE code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[updatechangeclass]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatechangeclass](			
				@code varchar(10),
				@studentcode varchar(10),
				@daychange date,
				@newclasscode varchar(10)		
			   )
as
begin
		update  changeclass
		set	code = @code,
				daychange = @daychange,
				newclasscode = @newclasscode		
		where code = @code
		update  student
		set	classcode = @newclasscode	
		where code = @studentcode
end
GO
/****** Object:  StoredProcedure [dbo].[updateclass]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateclass](			
				@code varchar(10),
				@name nvarchar(50),
				@batchcode 	varchar(10)	,						
				@levelcode varchar(10)	,																		
				@majorcode varchar(10)			
			   )
as
begin
		update  class
		set	name = @name,
				batchcode = @batchcode,						
				levelcode = @levelcode,																		
				majorcode = @majorcode 					
		where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[updatefacility]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatefacility](			
				@code varchar(10),
				@name nvarchar(50)	
			   )
as
begin
		update  facility
		set
			name = @name					
		where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[updatelevel]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatelevel](			
				@code varchar(10),
				@name nvarchar(50)	
			   )
as
begin
		update  level
		set	
			name = @name					
		where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[updatemajor]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatemajor](			
				@code varchar(10),
				@name nvarchar(50),
				@facilitycode varchar(10)		
			   )
as
begin
		update  major
		set
			name = @name,	
			facilitycode = @facilitycode
		where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[updaterelative]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updaterelative](
				@code varchar(10),
				@name nvarchar(50),
				@dateofbirth date, 		
				@workplace nvarchar(255), 		
				@address nvarchar(255), 																	
				@placeofbirth nvarchar(255), 															
				@relationship nvarchar(50), 								
				@studentcode varchar(10)				
			   )
as
begin
		update  relative
		set	name = @name,
				dateofbirth = @dateofbirth, 									
				workplace = @workplace , 		
				address = @address , 		 										
				placeofbirth = @placeofbirth, 	
				relationship = @relationship , 								
				studentcode = @studentcode				
		where code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[updatestudent]    Script Date: 5/11/2018 10:55:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatestudent](	
				@code varchar(10),
				@filecode varchar(10),
				@lastname nvarchar(30),
				@firstname nvarchar(30),
				@dateofbirth date, 									
				@sex smallint, 										
				@placeofbirth nvarchar(255), 	
				@permanenaddress nvarchar(255), 																
				@nation nvarchar(50), 	
				@nationality nvarchar(50),						
				@religion nvarchar(50), 								
				@email nvarchar(50), 								
				@phone nvarchar(50), 								
				@idcardnumber varchar(12), 							
				@note nvarchar(50),
				@classcode varchar(10)	
			   )
as
begin
		update student
		set
				filecode = @filecode ,
				lastname = @lastname,
				firstname = @firstname,
				dateofbirth = @dateofbirth, 									
				sex = @sex, 										
				placeofbirth = @placeofbirth, 	
				permanenaddress = @permanenaddress, 																
				nation = @nation, 	
				nationality = @nationality,							
				religion = @religion, 								
				email = @email, 								
				phone = @phone, 								
				idcardnumber = @idcardnumber, 							
				note = @note,
				classcode = @classcode							
		where code = @code
end
GO
USE [master]
GO
ALTER DATABASE [TTCSDL] SET  READ_WRITE 
GO

Create table previoussubject
(
subjectcode varchar(10) references subject(code),
previouscode varchar(10)
)



Create table subject
(
code varchar(10) primary key,
name nvarchar(50),
numbercredit int,
theory int,
task int,
practice int,
discussion int,
totalsesion int,
)

Create table facility
(
code varchar(10) primary key,
name nvarchar(50)
)

Create table major
(
code varchar(10) primary key,
name nvarchar(50),
facilitycode varchar(10) references facility(code),
levelcode varchar(10) references level(code)
)

Create table educationprogram
(
code varchar(10) primary key,
name nvarchar(50),
majorcode varchar(10) references major(code)
)

Create table level
(
code varchar(10) primary key,
name nvarchar(50),
)

Create table detailsubjecteducationprogram
(
educationprogramcode varchar(10) references educationprogram(code),
subjectcode varchar(10) references subject(code),
term varchar(10),
type bit
)

-- Tạo Proc Insert dữ liệu vào bảng
Create Proc InsertDataIntoSubject
@code varchar(10),
@name nvarchar(50),
@numbercredit int,
@theory int,
@task int,
@practice int,
@discussion int,
@tatalsesion int
As
Begin
	Insert Into dbo.subject
	Values (@code, @name, @numbercredit, @theory, @task, @practice, @discussion, @tatalsesion)
End

--Trigger Tính TotalSesion
Create Trigger tg_subject_totalsesion
	on dbo.subject
	after Insert, Update
As
	update dbo.subject set totalsesion = sub.theory + sub.task + sub.practice + sub.discussion from inserted i, dbo.subject sub where sub.code =i.code

go



-- Tạo Proc Update dữ liệu 
Create proc UpdateDataInsideSubject
@code varchar(10),
@name nvarchar(50),
@numbercredit int,
@theory int,
@task int,
@practice int,
@discussion int
As
Begin
	Update dbo.subject
	Set name = @name, numbercredit = @numbercredit, theory = @theory, task = @task, practice = @practice, discussion = @discussion
	Where  code = @code
End

--Tạo Proc Delete học phần theo mã học phần
create proc DeleteDataFromSubject
@code varchar(10)
As
Begin
	Delete from dbo.subject
	Where code = @code
End

-- Hàm show ra thông tin tổng quan của Học Phần (Mã HP, Tên HP, Số TC, Số tiết TKB, Phân bố số tiết lên lớp, Kỳ dự kiến, HP học kỳ trước)
Create function fn_ThongTinHocPhan()
returns Table
 As return
(
	Select sub.code, sub.name, sub.numbercredit, sub.totalsesion, sub.theory, sub.task, sub.practice, sub.discussion, dsep.term , ps.previouscode  from dbo.subject As sub, dbo.detailsubjecteducationprogram as dsep, dbo.previoussubject as ps
	where sub.code= dsep.subjectcode and sub.code = ps.subjectcode
)




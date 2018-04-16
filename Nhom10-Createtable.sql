use QLDiem
/* hanh kiem */
create table ClassifyConduct
(
code varchar(10),
nameclassifyconduct varchar(20),
primary key(code)
)
create table conduct
(
code varchar(10),
note varchar(200),
classifyconductcode varchar(10) references ClassifyConduct (code),
semetercode varchar(10) references Semester(code),
studentcode varchar(10) references Student(code),
primary key (code)
)
/* hoc bong*/
create table ScholarshipType
(
code varchar(10),
name nvarchar(200),
note nvarchar(200),
primary key (code)
)
create table Scholarship
(
code varchar(10) primary key,
namescship nvarchar (200),
timescship datetime,
durationscship datetime,
valuescship decimal,
studentcode varchar(10) references student(code),
semetercode varchar(10) references semester(code),
classifyscshipcode varchar(10) references ScholarshipType(code)
)

/* ban ki luat */ 
create table Departmentdiscipline
(
code varchar(10),
name nvarchar(200),
primary key (code)
)
/* Ki luat*/

create table formDiscipline(
 code varchar(10) primary key,
 nameformdiscipli varchar(20)
)
create table Discipline(
 code varchar(10) primary key,
 olddiscipline int,
 newdiscipline int,
 note varchar(200),
 studentcode varchar(10) references student(code),
 semetercode varchar(10) references Semester(code),
 formDisclipliunecode varchar(10) references formDiscipline (code),
 departmentcode varchar(10)references Departmentdiscipline (code),
)
/* xoa ki luat */

create table deletediscipline
(
 code varchar(10) primary key,
 olddiscipline int,
 newdiscipline int,
 note varchar(200),
 studentcode varchar(10) references student(code),
 semetercode varchar(10) references Semester(code),
 formDisclipliunecode varchar(10) references formDiscipline (code),
 departmentcode varchar(10)references Departmentdiscipline (code),
)
/* khen thuong */
create table Commended
(
code varchar(10),
classifycommended varchar(20),
timebonus datetime,
durationbonus datetime,
valuebonus decimal(15,2),
studentcode varchar(10),
semetercode varchar(10),
node varchar(300),
PRIMARY KEY (code),
FOREIGN KEY (studentcode) REFERENCES student(code),
FOREIGN KEY (semetercode) REFERENCES semester(code)
)
/* hàm trả về danh sách sinh viên có điểm trung bình theo kì  , số tín chỉ qua, tổng số tín chỉ */
create function fnc_CommendStudent( @semestercode varchar(10) )
returns @tb_CommendStudent TABLE 
(
studentcode varchar(10),
namestudent nvarchar(200),
semestercode varchar(10),
avgpoint float,
numbercredits int,
sumcredit int
)
as
begin
declare @studentcode varchar(10),
@namestudent nvarchar(200),
@avgpoint float, @numbercredit int, @subjectcode varchar(10)
set @studentcode = ( select code from Student)
set @namestudentcode = (select name from student where code= @studentcode)
set @semestercode = (select code from semester)
set @subjectcode = (select code from semester)
declare @tongtb float,@tongtc int
select @tongtb=sum(average) from Semester
where studentcode=@studentcode and semestercode=@semestercode
set @tongtc = (select sum(numbercredit) from Subject
where studentcode=@studentcode and semestercode=@semestercode and code = @subjectcode)
set @avgpoint = (@tongtb)/(@tongtc)
return 
end
/*ha*/
/*thong ke sv da dc xet hanh kiem */
alter function Return_ListSV()
returns @bangthongke table(
code varchar(10),
SoLuongSV int
)
as
begin
declare @Sl int
insert into @bangthongke
select  cd.code ,count(cd.code)from conduct cd , Student st
where cd.code=cd.studentcode
group by cd.code
return
END
select * from Return_ListSV()
 
/*thong ke dua ra sinh vien có Commended*/
alter FUNCTION return_listsvhb()
RETURNS @thongke TABLE( code varchar(10) , soluong int)
AS BEGIN
DECLARE @s1 INT
INSERT INTO @thongke
SELECT cm.code , COUNT(cm.code) FROM dbo.Commended cm, dbo.Student st
WHERE cm.code=cm.studentcode
GROUP BY cm.code
RETURN
end
/*thong ke sinh vien dc xoa ky luat*/
create function return_listxsvkl()
returns @thongkesvkl table( code varchar(10),Soluong int)
as begin 
declare @hihi int
insert into @thongkesvkl
select dld.code, count(dld.code) from dbo.deletediscipline dld, dbo.Student st
where dld.code=dld.studentcode
group by dld.code
return
end
 /*ham tra ve ten hb khi nhap mahb*/
create function Return_Tenlhb(@code varchar(10))
returns nvarchar(200)
as
begin
declare @name nvarchar(50)
select @name= name from dbo.ScholarshipType where code=@code
return @name
end
 
select dbo.Return_Tenlhb('hb01')
 
/* dua ra danh sach sv co hoc bong, diem tb theo ky, so tctl, ten hb, loai hb theo ky*/
create function fnc_Listsv()
returns @table table( studentcode varchar(10),
namestudent nvarchar(200),
semestercode varchar(10),
avgpoint float,
numbercredits int,
sumcredit int,
namescship nvarchar (200),
classifyscshipcode varchar(10)
)
as begin
declare @studentcode varchar(10),@namestudent nvarchar(200),@semestercode varchar(10),@avgpoint float,@numbercredits int,
@sumcredit int,@namescship nvarchar (200),@classifyscshipcode varchar(10),@subjectcode varchar(10)
set @studentcode = (select code from Student)
set @namestudent = (select code from Student where code=@studentcode)
set @namescship = (select code from Scholarship where code=@studentcode)
set @classifyscshipcode = (select sc.code , name from Scholarship sc, ScholarshipType scl where sc.code=sc.studentcode )
set @semestercode = (select code from semester)
set @subjectcode = (select code from semester)
declare @tongtb float,@tongtc int
select @tongtb=sum(average) from Semester
where studentcode=@studentcode and semestercode=@semestercode
set @tongtc = (select sum(numbercredit) from Subject
where studentcode=@studentcode and semestercode=@semestercode and code = @subjectcode)
set @avgpoint = (@tongtb)/(@tongtc)
return 
end
/* quyết định xóa kỉ luật tăng kỉ luật */
create function ds_kiluat
returns @ds_kiluat TABLE 
(
studentcode varchar(10),
namestudent nvarchar(200),
avgpoint float,
olddiscipline int,
newdiscipline int,
semetercode varchar(10),
)
as
begin
declare @studentcode varchar(10),
@namestudent nvarchar(200),
@avgpoint float,
@semetercode varchar(10),
@olddiscipline int,
@newdiscipline int
set @studentcode = ( select code from Student)
set @namestudentcode = (select name from student where code= @studentcode)
set @semestercode = (select code from semester)
set @avgpoint =(select avgpoint from fnc_CommendStudent where fnc_CommendStudent.code =  @studentcode)
set @olddiscipline = (select olddiscipline from Discipline)
if @avgpoint < 1.0
begin
set @newdiscipline = @olddiscipline +1
end
else
begin
set @newdiscipline = @olddiscipline -1
end
/* quyết định hb , khen thưởng */ 
/*Hàm dua quyet dinh hoc bong*/
CREATE FUNCTION  Decisionscholarship (@semestercode VARCHAR(10) )
RETURNS @tb_Decisioncholarship TABLE
(
studencode varchar(10),
namestudentcode nvarchar(200),
semestercode varchar(10),
namesemester NVARCHAR(200),
classifyconduct VARCHAR(20),
namescships  NVARCHAR(200),
avgpoint float
)
AS
BEGIN
DECLARE @studencode VARCHAR(10), @namestudencode NVARCHAR(200), @semestercode varchar(10) ,
 @namesemester NVARCHAR(200), @classifyconduct VARCHAR(20), @namescships NVARCHAR(200),
 @avgpoint FLOAT
 SET @studencode = (SELECT code FROM dbo.Student)
 SET @namestudencode = (SELECT name FROM dbo.Student)
 SET @semestercode = ( SELECT code FROM dbo.Semester)
 SET @namesemester = (SELECT name FROM dbo.Semester)
 SET @classifyconduct = (SELECT classifyconduct FROM dbo.conduct)
 SET @namescships = ( SELECT name FROM dbo.ScholarshipType)
 DECLARE @tongtb FLOAT, @tongtc INT
 SELECT @tongtb = SUM(average) FROM semester
 WHERE studentcode=@studentcode and semestercode=@semestercode
 SET @tongtc = (select sum(numbercredit) from Subject
 WHERE studentcode=@studentcode and semestercode=@semestercode and code = @subjectcode)
 SET @avgpoint = (@tongtb)/(@tongtc)
 
 
 SELECT @studencode,@namestudencode,@namesemester,@namescships,@semestercode,@avgpoint
 FROM @tb_Decisioncholarship
 WHERE @avgpoint >4 
 
 
 IF @avgpoint > 4 AND @classifyconduct = 't?t' 
 SELECT * FROM @tb_Decisioncholarship
 WHERE @classifyconduct ='t?t'
ELSE
 PRINT 'không có sinh viên nào dat hoc bong'
 RETURN
 END 
 /* tự động cập nhật vào các bảng khi có mã kì được nhập vào csdl  */
 create trigger INSTEAD_Scholarship_INSERT ON Scholarship INSTEAD OF INSERT
AS
	BEGIN 
		DECLARE @classifyship varchar(20),@Semetercode Varchar(10),@code varchar(10),@namescship nvarchar(200),@Studentcode Varchar(10)
		set @code =(Select CODE from inserted)
		set @Semetercode =(select Semetercode from inserted)
		set @Studentcode=(Select Studentcode from inserted)
		set @classifyship=(SELECT classifyship FROM inserted)
		set @namescship=(Select namescships from ScholarshipType where code=@code)
		insert into Scholarship(code,classifyship,namescship,Studentcode,Semetercode) values(@code,@classifyship,@namescship,@Studentcode,@Semetercode)
	end
go 



---------Trigger tinh diem trung binh-------------
CREATE TRIGGER tinh_diemtb ON [mark] 
FOR INSERT
AS 
BEGIN     
    SET NOCOUNT ON 
    -- Lay ma sinh vien
    DECLARE @studentcode char(10) = (SELECT studentcode FROM inserted)
    -- inserted chinh la mark
    -- tinh diem trung binh cua tung sinh vien
    DECLARE @diemtb float = (SELECT AVG(fourpoint) FROM mark WHERE studentcode=@studentcode)
   
END

------------Bang Hoc Ky--------------
create table semester(
semestercode varchar(20) NOT NULL,
namesemester varchar(20) NOT NULL,
schoolyear varchar(20) NOT NULL,
pricepercredit float NOT NULL,
typesemester varchar(20) NOT NULL,
primary key (semestercode)
)
------------Bang Diem--------------
create table mark(
code varchar(20) NOT NULL,
studentcode varchar(20) NOT NULL,
semestercode varchar(20) NOT NULL,
coursecode varchar(20) NOT NULL,
attendancepoint varchar(20) NOT NULL,
midtermpoint varchar(20) NOT NULL,
endingpoint varchar(20) NOT NULL,
tenpoint float NOT NULL,
fourpoint float NOT NULL,
wordpoint varchar(10) NOT NULL,
average float NOT NULL,
numbered varchar(10) NOT NULL,
dateupdate datetime NOT NULL,
primary key (code),
foreign key (studentcode) references student(studentcode),
foreign key (coursecode) references courseclass(coursecode),
foreign key (semestercode) references semester(semestercode)
)

------------Du lieu bang Hoc Ky--------------
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('1','Hoc Ky 1','2014-2015',300.000,'He so 1')
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('2','Hoc Ky 2','2014-2015',300.000,'He so 1')
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('3','Hoc Ky 3','2015-2016',300.000,'He so 1')
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('4','Hoc Ky 4','2015-2016',300.000,'He so 1')
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('5','Hoc Ky 5','2016-2017',300.000,'He so 2')
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('6','Hoc Ky 6','2016-2017',300.000,'He so 2')
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('7','Hoc Ky 7','2017-2018',300.000,'He so 2')
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('8','Hoc Ky 8','2017-2018',300.000,'He so 2')
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('9','Hoc Ky 9','2018-2019',300.000,'He so 3')
insert into semester(semestercode,namesemester,schoolyear,pricepercredit,typesemester)
values ('10','Hoc Ky 10','2018-2019',300.000,'He so 3')
------------Du lieu bang Diem--------------
insert into mark(code,studentcode,coursecode,attendancepoint,midtermpoint,endingpoint,tenpoint,fourpoint,wordpoint,average)
values ('','','','','','', , ,'', )



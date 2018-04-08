
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






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
  nationnality NVARCHAR(50),
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





CREATE DATABASE QUANLYGIAOVIEN
USE QUANLYGIAOVIEN

CREATE TABLE faculty(
code varchar(10) primary key,
name nvarchar(50) not null,
amount int,
adress nvarchar(100),
phone char(15),
codefacultyboss varchar(10)
)


CREATE TABLE department(
code varchar(10) primary key,
name nvarchar(50) not null,
amount int,
adress nvarchar(100),
phone char(15),
codefaculty varchar(10) references faculty(code),
codedepartmentboss varchar(10) 
)

CREATE TABLE teacher(
code varchar(10) primary key,
name nvarchar(50) not null,
position nvarchar(50),
academic nvarchar(50),
diploma nvarchar(50),
email nvarchar(50),
note nvarchar(1000),
codedepartment varchar(10) references department(code),
codeview varchar(20) unique
)



INSERT INTO faculty(code,name,amount,adress,phone,codefacultyboss)
values ('K1',N'CÔNG NGHỆ THÔNG TIN','6',N'TẦNG 19 NHÀ S1','0969515329','G2'),
('K2',N'CƠ KHÍ','6',N'TẦNG 18 S1','0938533333','G25'),
('K3',N'KỸ THUẬT ĐIỀU KHIỂN','3',N'TẦNG 17 S1','0947544444','G33'),
('K4',N'HÓA LÝ KỸ THUẬT','4',N'TẦNG 16 S1','0948944464','G41')


INSERT INTO department(code,name,amount,adress,phone,codefaculty,codedepartmentboss)
VALUES ('BM1',N'HỆ THỐNG THÔNG TIN','10',N'PHÒNG 1901 TẦNG 19 NHÀ S1','0983627484','K1','G2'),
('BM2',N'KHOA HỌC MÁY TINH','11',N'PHÒNG 1902 TẦNG 19 NHÀ S1','0937285833','K1','G5'),
('BM3',N'TOÁN','12',N'PHÒNG 1903 TẦNG 19 NHÀ S1','0938583964','K1','G8'),
('BM4',N'CÔNG NGHỆ PHẦN MỀM','10',N'PHÒNG 1904 TẦNG 19 NHÀ S1','0933596040','K1','G11'),
('BM5',N'CÔNG NGHỆ MẠNG','11',N'PHÒNG 1905 TẦNG 19 NHÀ S1','0939584646','K1','G14'),
('BM6',N'AN TOÀN THÔNG TIN','12',N'PHÒNG 1906 TẦNG 19 NHÀ S1','0935939555','K1','G17'),

('BM7',N'CƠ HỌC MÁY','5',N'PHÒNG 1801 TẦNG 18 NHÀ S1','0935939455','K2','G19'),
('BM8',N'CƠ HỌC VẬT RẮN','6',N'PHÒNG 1802 TẦNG 18 NHÀ S1','0937939555','K2','G21'),
('BM9',N'NHIỆT THỦY KHÍ','5',N'PHÒNG 1803 TẦNG 18 NHÀ S1','0935839555','K2','G23'),
('BM10',N'CHẾ TẠO MÁY','5',N'PHÒNG 1804 TẦNG 18 NHÀ S1','0935899555','K2','G25'),
('BM11',N'GIA CÔNG ÁP LỰC','6',N'PHÒNG 1805 TẦNG 18 NHÀ S1','0935830555','K2','G27'),
('BM12',N'VẬT LIỆU & CÔNG NGHỆ VẬT LIỆU','5',N'PHÒNG 1806 TẦNG 18 NHÀ S1','0933839555','K2','G29'),

('BM13',N'KỸ THUẬT ĐIỆN','5',N'PHÒNG 1701 TẦNG 17 NHÀ S1','0933879555','K3','G31'),
('BM14',N'ĐIỆN TỬ Y SINH','4',N'PHÒNG 1702 TẦNG 17 NHÀ S1','0983879555','K3','G33'),
('BM15',N'TỰ ĐỘNG VÀ KỸ THUẬT TÍNH','5',N'PHÒNG 1703 TẦNG 17 NHÀ S1','0963879555','K3','G35'),

('BM16',N'CÔNG NGHỆ HÓA HỌC','5',N'PHÒNG 1601 TẦNG 16 NHÀ S1','0963879655','K4','G37'),
('BM17',N'PHÒNG HÓA','5',N'PHÒNG 1602 TẦNG 16 NHÀ S1','0963879675','K4','G39'),
('BM18',N'KỸ THUẬT MÔI TRƯỜNG','5',N'PHÒNG 1603 TẦNG 16 NHÀ S1','0963879685','K4','G41'),
('BM19',N'VẬT LÝ','5',N'PHÒNG 1603 TẦNG 16 NHÀ S1','0963879695','K4','G43')




INSERT INTO teacher(code,name,position,academic,diploma,email,note,codedepartment,codeview)
VALUES('G1',N'TỐNG MINH ĐỨC', N'Phó chủ nhiệm bộ môn',N'GVC',N'TS',N'ductm75@Gmail.com',N'Tốt nghiệp kỹ sư tại Học viện Kỹ thuật Quân sự năm 2000, ngành Công nghệ thông tin. Tốt nghiệp nghiên cứu sinh tại Trường Đại học Tổng hợp Kỹ thuật điện Xanh Pêtécbua - Nga, năm 2007, chuyên ngành Tự động hóa và điều khiển các quy trình công nghệ sản xuất. ','BM1','GV1'),
('G2', N'HOA TẤT THẮNG',N'Chủ nhiệm bộ môn',N'GVC',N'TS',N'hoatatthang@gmail.com',N'Tốt nghiệp đại học năm 2005 tại LB Nga, ngành "Hệ thống tự động hóa, xử lý thông tin và quản lý". Bảo vệ luận án TS năm 2009 tại LB Nga, ngành "Phân tích hệ thống, quản lý và xử lý thông tin".','BM1','GV2'),
('G3',N'NGUYỄN VĂN GIANG', N'Phó chủ nhiệm bộ môn',N'GVC',N'TS',N'giangnv@mta.edu.vn',N'Education: Paichai University, Korea - Ph.D. Electronic Engineering, 2012 (Academic genealogy).Paichai University, Korea - M.S. Electronic Engineering, 2009. Le Quy Don Technical University - B.S. Computer Science, 2005','BM1','GV3'),
('G4',N'TRẦN VĂN AN', N'Giáo viên',N'GVC',N'TS',N'tavistu@gmail.com',N'Tốt nghiệp đại học năm 2011 tại LB Nga chuyên nghành "Hệ thống tự động xử lý thông tin và điều khiển". Bảo vệ luận án TS năm 2013 tại LB Nga, ngành "Mô hình hóa toán học, phương pháp số và tổ hợp các chương trình"','BM1','GV4'),
('G5',N'NGÔ HỮU PHÚC', N'Chủ nhiệm bộ môn',N'GVC',N'TS',N'ngohuuphuc76@gmail.com','','BM2','GV5'),
('G6',N'NGUYỄN TRUNG TÍN', N'Giáo viên',N'TG',N'TS',N'khachmoscow@gmail.com','','BM2','GV6'),
('G7',N'HÀ CHÍ TRUNG', N'Giáo viên',N'GV',N'TS',N'hct2009@yahoo.com',N'Quê quán: Vĩnh Phúc. Tốt nghiệp kỹ sư chuyên ngành đảm bảo chương trình máy tính và các hệ thống tự động hóa năm 2005 tại Đại học Tổng hợp kỹ thuật Sông Đông, LB Nga. Bảo vệ luận án tiến sĩ chuyên ngành Lý thuyết tin học năm 2009 tại Học viện Công nghệ Taganrog, Đại học Miền nam Liên bang Nga. Công tác tại Bộ môn Khoa học máy tính, Khoa Công nghệ thông tin từ năm 2009.','BM2','GV7'),
('G8',N'TẠ NGỌC ÁNH', N'Chủ nhiệm bộ môn',N'GVC',N'TS',N'tangocanh@gmail.com',N'Là cựu sinh viên Khoa Toán Cơ Tin học - Đại học Khoa học Tự nhiên - ĐHQG HN.','BM3','GV8'),
('G9',N'HY ĐỨC MẠNH', N' Phó chủ nhiệm bộ môn',N'GVC',N'TS',N'hdmanh_ktqs@mail.ru',N'Tốt nghiệp Đại học KHTN - ĐHQG Hà Nội ngành Toán học 2002, Tốt nghiệp thạc sỹ  Đại học KHTN - ĐHQG Hà Nội chuyên ngành "Phương trình vi phân và tích phân" 2006','BM3','GV9'),
('G10',N'PHẠM THẾ ANH', N'Giáo viên',N'GV',N'TS',N'phamtheanh.vn@gmail.com',N'Giáo viên bắt đầu từ  3/2004','BM3','GV10'),
('G11',N'BÙI THU LÂM', N'Chủ nhiệm bộ môn',N'PGS',N'TS',N'Lam.bui@mta.edu.vn',N'Lam Thu BUI received the Ph.D. degree in computer science from the University of New South Wales (UNSW), Australia, in 2007. He did postdoctoral training at UNSW from 2007 until 2009.','BM4','GV11'),
('G12',N'NGUYỄN QUỐC KHÁNH', N'Phó chủ nhiệm bộ môn',N'GV',N'TS',N'khanh29bk@mta.edu.vn',N'Nguyen Quoc Khanh graduated in software engineering and computer networks at Moscow State Institute of Radio-engineering Electronics and Automation in 2009','BM4','GV12'),
('G13',N'PHAN VIỆT ANH', N'Giáo viên',N'GV',N'TS',N'pvanhth@yahoo.com','','BM4','GV13'),
('G14',N'TẠ MINH THANH', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'thanhtm AT mta DOT edu DOT vn',N'Ta Minh Thanh received the Bachelor of Engineering degree and the Master degree of Computer Science from National Defence Academy, Japan, in 2005 and 2008, respectively. He was lecturer of Le Quy Don university, Ha Noi, Viet Nam from 2005.','BM5','GV14'),
('G15',N'LƯU HỒNG DŨNG', N'Phó chủ nhiệm bộ môn',N'GV',N'TS',N' luuhongdung@gmail.com',N'Hướng nghiên cứu: Mật mã và An toàn thông tin.','BM5','GV15'),
('G16',N'NGUYỄN TRUNG THÀNH', N'Giáo viên',N'GV',N'TS',N' trungthanh@mta.edu.vn',N'2007: Tốt nghiệp khóa 37 - Học viện kỹ thuật quân sự. Hệ Đại học 2010: Tốt nghiệp khóa 20 cao học, học viện kỹ thuật quân sự 2015: Bảo vệ xong luận án TS cấp cơ sở.','BM5','GV16'),
('G17',N'NGUYỄN VIỆT HÙNG', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'hungnv@mta.edu.vn',N'Tốt nghiệp cử nhân (2006) và cao học (2008) trường Đại học Vật lý kĩ thuật Matxcova chuyên ngành "Máy tính nơron và mạng nơron". Bảo vệ thành công luận án TS năm 2012 tại LB Nga, ngành "Phân tích hệ thống, điều khiển và xử lý thông tin".','BM6','GV17'),
('G18',N'HOÀNG TUẤN HẢO', N'Giáo viên',N'GV',N'TS',N'haohth@gmail.com','','BM6','GV18'),

('G19',N'NGUYỄN TUẤN HẢO', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'tuanhao@gmail.com','','BM7','GV19'),
('G20',N'NGUYỄN VĂN HẢO', N'Giáo viên',N'GV',N'TS',N'vanhao@gmail.com','','BM7','GV20'),

('G21',N'NGUYỄN TUẤN ANH', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'tuananh@gmail.com','','BM8','GV21'),
('G22',N'NGUYỄN VĂN HẬU', N'Giáo viên',N'GV',N'TS',N'vanhau@gmail.com','','BM8','GV22'),

('G23',N'LÊ TUẤN ANH', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'letuananh@gmail.com','','BM9','GV23'),
('G24',N'NGUYỄN VĂN NAM', N'Giáo viên',N'GV',N'TS',N'vannam@gmail.com','','BM9','GV24'),

('G25',N'LÊ VĂN TUẤN', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'letuan@gmail.com','','BM10','GV25'),
('G26',N'NGUYỄN VĂN CƯỜNG', N'Giáo viên',N'GV',N'TS',N'vancuong@gmail.com','','BM10','GV26'),

('G27',N'LÊ VĂN BẢO', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'vanbao@gmail.com','','BM11','G2V7'),
('G28',N'NGUYỄN VĂN TÂN', N'Giáo viên',N'GV',N'TS',N'vantan@gmail.com','','BM11','GV28'),

('G29',N'LÊ TUẤN CƯỜNG', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'letuancuong@gmail.com','','BM12','G2V9'),
('G30',N'NGUYỄN VĂN THÀNH', N'Giáo viên',N'GV',N'TS',N'vanthanh@gmail.com','','BM12','GV30'),

('G31',N'LÊ VĂN THẮNG', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'lethang@gmail.com','','BM13','GV31'),
('G32',N'NGUYỄN VĂN CHÂU', N'Giáo viên',N'GV',N'TS',N'vanchâu@gmail.com','','BM13','GV32'),

('G33',N'LÊ VĂN KHÁNH', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'vankhanh@gmail.com','','BM14','GV33'),
('G34',N'NGUYỄN VĂN TUẤN', N'Giáo viên',N'GV',N'TS',N'nguyentuan@gmail.com','','BM14','GV34'),

('G35',N'LÊ VĂN SƠN', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'leson@gmail.com','','BM15','GV35'),
('G36',N'NGUYỄN VĂN HẢI', N'Giáo viên',N'GV',N'TS',N'vanhai@gmail.com','','BM15','GV36'),

('G37',N'LÊ ANH NAM', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'leanhnam@gmail.com','','BM16','GV37'),
('G38',N'NGUYỄN VĂN QUYẾT', N'Giáo viên',N'GV',N'TS',N'vanquyet@gmail.com','','BM16','GV38'),

('G39',N'LÊ VĂN ĐĂNG', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'ledang@gmail.com','','BM17','GV39'),
('G40',N'NGUYỄN VĂN THỊNH', N'Giáo viên',N'GV',N'TS',N'vantHinh@gmail.com','','BM17','GV40'),

('G41',N'LÊ VĂN GIANG', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'legiang@gmail.com','','BM18','GV41'),
('G42',N'NGUYỄN VĂN ĐÔNG', N'Giáo viên',N'GV',N'TS',N'vandong@gmail.com','','BM18','GV42'),

('G43',N'LÊ VĂN THẾ', N'Chủ nhiệm bộ môn',N'GV',N'TS',N'lethe@gmail.com','','BM19','GV43'),
('G44',N'NGUYỄN VĂN TÂM', N'Giáo viên',N'GV',N'TS',N'vantam@gmail.com','','BM19','GV44')




                             ----TÌM KIẾM -----

--- tìm kiếm chủ nhiệm bộ môn theo mã bộ môn
CREATE PROC Timkiem_TruongBM(@code varchar(10))
as
begin
select*
from teacher
where code in (select codedepartmentboss from department where code= @code)
end 

exec Timkiem_TruongBM @code='BM3'

--- tìm kiếm chủ nhiệm khoa theo mã khoa

CREATE PROC Timkiem_TruongKHOA(@code varchar(10))
as
begin
select*
from teacher
where code in (select codefacultyboss from faculty where code= @code)
end 

exec Timkiem_TruongKHOA @code='K4'


--- thủ tục tìm kiếm gv theo mã GV

create proc Timkiem_maGV (@code varchar(10))
as
begin
select * from teacher
where code=@code
end 

exec Timkiem_maGV @code='G3'

--- thủ tục tìm kiếm gv theo tên chính xác hoặc gần đúng 
alter proc Timkiem_tenGV(@name nvarchar(50))
as
begin
select * from teacher
where name LIKE @name
end 

exec Timkiem_tenGV @name=N'%LÊ VĂN GIANG%'

--- thủ tục tìm kiếm bộ môn theo mã bộ môn
create proc Timkiem_maBM (@code varchar(10))
as
begin
select * from department
where code=@code
end 

exec Timkiem_maBM @code='BM3' 

--- thủ tục tìm kiếm bộ môn theo tên chính xác hoặc gần đúng
ALTER proc Timkiem_tenBM (@name nvarchar(50))
as
begin
select * from department
where name LIKE @name
end 

exec Timkiem_tenBM @name = N'%CHẾ TẠO%'

--- thủ tục tìm kiếm khoa theo mã khoa
create proc Timkiem_maKHOA (@code varchar(10))
as
begin
select * from faculty
where code=@code
end 

exec Timkiem_maKHOA @code='K3' 

--- thủ tục tìm kiếm KHOA theo tên chính xác hoặc gần đúng 
create proc Timkiem_tenKHOA (@name nvarchar(50))
as
begin
select * from faculty
where name LIKE @name
end 

exec Timkiem_tenKHOA @name =N'%CÔNG NGHỆ%'




-- Sửa thông tin giáo viên

create proc updateteacher(	
				@code varchar(10),
				@name nvarchar(50),
				@position nvarchar(50),
				@academic nvarchar(50),
				@diploma nvarchar(50),
				@email nvarchar(50),
				@note nvarchar(1000),
				@codedepartment nvarchar(10),
				@codeview nvarchar(10)		
			   )
as
begin
		update teacher
		set	name =@name,
			position =@position,
			academic =@academic,
			diploma =@diploma,
			email =@email,
			note =@note,
			codedepartment =@codedepartment,
			codeview =@codeview
		where code = @code
end

-- sửa thông tin bộ môn

create proc updatedepartment(	
				@name nvarchar(50),
				@code varchar(10),
				@amount int,
				@adress nvarchar(100),
				@phone char(15),
				@codefaculty varchar(10),
				@codedepartmentboss varchar(10)
			   )
as
begin
		update department
		set	name =@name,		
			amount=@amount,	
			adress=@adress,
			phone=@phone,	
			codefaculty=@codefaculty,
			codedepartmentboss=@codedepartmentboss	
		where code = @code
end

-- sửa thông tin khoa

create proc updatefaculty(	
				@name nvarchar(50),
				@code varchar(10),
				@amount int,
				@adress nvarchar(100),
				@phone char(15),
				@codefacultyboss varchar(10)


			   )
as
begin
		update faculty
		set	name=@name,	
			amount=@amount,
			adress=@adress,
			phone=@phone,	
			codefacultyboss=@codefacultyboss
		where code = @code
end



--thêm giáo viên
create proc Them_GV(@ten nvarchar(50),@hocham nvarchar(50),@hocvi nvarchar(50),@email nvarchar(30),@mota nvarchar(1000),@chucvu nvarchar(50),@mabm varchar(10))
as
begin
insert into teacher(name,position,diploma,academic,email,note,codedepartment)
values(@ten,@chucvu,@hocvi,@hocham,@email,@mota,@mabm)
end
--thêm khoa
alter proc Them_Khoa(@ten nvarchar(50),@diadiem nvarchar(50),@dt varchar(20),@matk nvarchar(10))
as
begin
insert into faculty(name,adress,phone,codefacultyboss)
values(@ten,@diadiem,@dt,@matk)
end


--thêm bộ môn
create proc Them_BoMon(@ten nvarchar(50),@diadiem nvarchar(50),@dt varchar(20),@matbm nvarchar(10),@mak varchar(10))
as
begin
INSERT INTO department(name,adress,phone,codefaculty,codedepartmentboss)
values(@ten,@diadiem,@dt,@mak,@matbm)
end


---- xóa giáo viên
create proc Xoa_GVma(@code varchar(10))
as
begin 
delete from teacher where code= @code
end

exec Xoa_GVma @code ='G3'

---- xóa bộ môn 
create proc Xoa_BMma(@code varchar(10))
as
begin 
delete from department where code= @code
end

exec Xoa_BMma @code ='BM3'

---- xóa khoa
create proc Xoa_KHOAma(@code varchar(10))
as
begin 
delete from faculty where code= @code
end

exec Xoa_KHOAma @code ='K4'

--thống kê giáo viên theo bộ môn
create function func_xemgv_bm(@ma varchar(10))
returns
table 
as return
(
	select teacher.name, teacher.diploma, teacher.academic, teacher.email, teacher.note
	from teacher inner join department on teacher.codedepartment = department.code
	where department.code = @ma
)

select * from func_xemgv_bm('BM3')

--thống kê giáo viên theo khoa
create function func_xemgv_khoa(@ma varchar(10))
returns 
table
as return
(
	select teacher.name, teacher.diploma, teacher.academic, teacher.email, teacher.note
	from teacher inner join department on teacher.codedepartment = department.code
	inner join faculty on department.codefaculty = faculty.code
	where faculty.code = @ma
)

select * from func_xemgv_khoa('K2')

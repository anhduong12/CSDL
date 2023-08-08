create database QLCH

-- Tạo bảng CUAHANG
create table CUAHANG 
(MaCH varchar (15) not null primary key,
TenCH nvarchar (30),
DiaChi nvarchar (50),
SDT varchar (15),
MaNQL varchar (15))

-- Tạo bảng NHANVIEN
create table NHANVIEN
(MaNV varchar (15) not null primary key,
MaCH varchar (15),
TenNV nvarchar (20),
GioiTinh nvarchar (5),
DiaChi nvarchar (50),
SDT varchar (15),
Luong int,
foreign key (MaCH) references CUAHANG (MaCH))

Alter table CUAHANG
Add constraint NV_FK foreign key (MaNQL) references NHANVIEN (MaNV)

-- Tạo bảng NCC
create table NHACUNGCAP
(MaNCC varchar (15) not null primary key,
TenNCC nvarchar(20),
DiaChi nvarchar (50),
SDT varchar (15))

-- Tạo bảng phiểu nhập
create table PHIEUNHAP
(SoPhieu varchar (15) not null primary key,
MaNCC varchar(15),
MaNV varchar (15),
NgayNhap date not null,
foreign key (MaNCC) references NHACUNGCAP(MaNCC),
foreign key (MaNV) references NHANVIEN(MaNV))

-- Tạo bảng khách hàng
create table KHACHHANG
(MaKhach varchar (15) not null primary key,
TenKhach nvarchar (20) not null,
DiaChi nvarchar (50),
SDT varchar (15) not null)

-- Tạo bảng Hàng
create table HANG
(MaHang varchar (15) not null primary key,
TenHang nvarchar(50) not  null,
SLton int not null)

-- Tạo bảng Hóa đơn bán hàng
create table HOADONBANHANG
(SoHD varchar (15) not null primary key,
MaNV varchar(15),
MaKhach varchar (15),
NgayBan date not null,
foreign key (MaNV) references NHANVIEN(MaNV),
foreign key (MaKhach) references KHACHHANG(MaKhach))
-- Tạo bảng chi tiết phiếu nhập
create table CHITIETPHIEUNHAP
(SoPhieu varchar (15),
MaHang varchar(15),
SoLuong int not null,
DonGia int not null,
Primary key (SoPhieu,MaHang),
foreign key (SoPhieu) references PHIEUNHAP(SoPhieu),
foreign key (MaHang) references HANG(MaHang))

-- Tạo bảng Chi Tiết Hóa Đơn
create table CHITIETHOADON
(SoHD varchar (15) ,
MaHang varchar(15),
SoLuong int not null,
DonGia int not null,
Primary key (SoHD,MaHang),
foreign key (SoHD) references HOADONBANHANG(SoHD),
foreign key (MaHang) references HANG(MaHang))

-- Chèn dữ liệu cho các bảng
insert into CUAHANG
values
('CH01',N'Cửa hàng A - Đống Đa',N'Đống Đa - Hà Nội','0976348261', 'NV01'),
('CH02',N'Cửa hàng A - Hoàn Kiếm',N'Hoàn Kiếm - Hà Nội','0989362101', 'NV04'),
('CH03',N'Cửa hàng A - Ba Đình',N'Ba Đình - Hà Nội','0954378293', 'NV07');

insert into NHANVIEN
values
('NV01','CH01',N'Nguyễn Ánh Dương',N'Nữ',N'Ba Đình - Hà Nội','0945672813',7000000),
('NV02','CH01',N'Nguyễn Ngọc Dương',N'Nữ',N'Thanh Xuân - Hà Nội','0948563891',5000000),
('NV03','CH01',N'Bùi Thị Thu Uyên',N'Nữ',N'Thanh Xuân - Hà Nội','0975768351',3000000),
('NV04','CH02',N'Thân Thị Thùy',N'Nữ',N'Đống Đa - Hà Nội','0967392562',7000000),
('NV05','CH02',N'Hoàng Văn Mạnh',N'Nam',N'Hoàn Kiếm - Hà Nội','09689452781',5000000),
('NV06','CH02',N'Nguyễn Thị Mai',N'Nữ',N'Cầu Giấy - Hà Nội','0986452870',3000000),
('NV07','CH03',N'Đỗ Văn Đức',N'Nam',N'Hoàng Mai - Hà Nội','0986453278',7000000),
('NV08','CH03',N'Nguyễn Thu Huyền',N'Nữ',N'Cầu Giấy - Hà Nội','0976534291',2500000),
('NV09','CH03',N'Đào Thị Kiều Trang',N'Nữ',N'Cầu Giấy - Hà Nội','0865348245',2000000),
('NV10','CH03',N'Lê Nam Anh',N'Nam',N'Hai Bà Trưng - Hà Nội','0864832913',3000000);

insert into HANG
values
('MH01',N'Bút bi Thiên Long',200),
('MH02',N'Bút chì kim',150),
('MH03',N'Vở Hải Tiến',300),
('MH04',N'Vở Campus',50),
('MH05',N'Bút chì 2B',180),
('MH06',N'Bút màu',200),
('MH07',N'Kéo', 70),
('MH08',N'Tẩy',30),
('MH09',N'Thước kẻ',50),
('MH10',N'Compa',100);

insert into KHACHHANG
values
('KH01',N'Nguyễn Văn Dũng',N'Hoàn Kiếm - Hà Nội','0984672891'),
('KH02',N'Phạm Gia Văn',N'Ba Đình - Hà Nội','0956348219'),
('KH03',N'Đào Quang Tú',N'Hai Bà Trưng - Hà Nội','0956348219'),
('KH04',N'Nguyễn Hải Yến',N'Bắc Từ Liêm - Hà Nội','0974673992'),
('KH05',N'Nguyễn Như Quỳnh',N'Ba Đình - Hà Nội','0845382774'),
('KH06',N'Bùi Hà Vi',N'Nam Từ liêm - Hà Nội','095984335'),
('KH07',N'Phùng Thị Ninh',N'Gia Lâm - Hà Nội','0956338277'),
('KH08',N'Bùi Tuấn Kiệt',N'Đống Đa - Hà Nội','0985432779'),
('KH09',N'Nguyễn Quang Hảo',N'Hoài Đức - Hà Nội','0987489332'),
('KH10',N'Vũ Thị Linh',N'Quốc Oai - Hà Nội','095783235');

insert into NHACUNGCAP
values
('NCC01',N'Công ty A',N'Hoài Đức - Hà Nội','0987362712'),
('NCC02',N'Công ty B',N'Quốc Oai - Hà Nội','0964539208'),
('NCC03',N'Công ty C',N'Lục Ngạn - Bắc Giang','0945678324'),
('NCC04',N'Công ty D',N'An Dương - Hải Phòng','0967445392'),
('NCC05',N'Công ty E',N'Bãi Cháy - Quảng Ninh','0946778398');

insert into PHIEUNHAP
values
('PN01','NCC01','NV01','2021-01-02'),
('PN02','NCC01','NV01','2021-01-25'),
('PN03','NCC02','NV02','2021-05-12'),
('PN04','NCC03','NV03','2021-02-02'),
('PN05','NCC05','NV05','2021-04-23'),
('PN06','NCC04','NV05','2021-04-24'),
('PN07','NCC04','NV06','2021-05-10');

insert into HOADONBANHANG
values
('HD01','NV01','KH01','2021-02-21'),
('HD02','NV01','KH02','2021-02-21'),
('HD03','NV01','KH03','2021-03-22'),
('HD04','NV02','KH04','2021-03-22'),
('HD05','NV03','KH05','2021-03-27'),
('HD06','NV03','KH06','2021-03-27'),
('HD07','NV04','KH07','2021-04-22'),
('HD08','NV05','KH01','2021-04-22'),
('HD09','NV05','KH01','2021-05-25'),
('HD10','NV06','KH01','2021-05-25'),
('HD11','NV07','KH01','2021-06-20'),
('HD12','NV08','KH01','2021-09-05'),
('HD13','NV09','KH01','2021-09-05'),
('HD14','NV10','KH01','2021-10-20');
insert into CHITIETPHIEUNHAP
values
('PN01','MH01',250,50000),
('PN01','MH02',100,150000),
('PN02','MH01',100,50000),
('PN02','MH04',200,70000),
('PN02','MH03',150,50000),
('PN03','MH02',50,150000),
('PN03','MH09',200,7000),
('PN03','MH10',200,15000),
('PN04','MH04',50,70000),
('PN04','MH05',150,15000),
('PN06','MH07',100,7000),
('PN06','MH10',40,15000),
('PN07','MH08',150,5000);
insert into CHITIETHOADON
values 
('HD01','MH01',3,5000),
('HD01','MH02',1,20000),
('HD01','MH05',5,10000),
('HD02','MH02',2,20000),
('HD03','MH09',4,5000),
('HD03','MH01',2,5000),
('HD04','MH03',10,7000),
('HD05','MH02',2,10000),
('HD05','MH05',8,10000),
('HD06','MH04',20,10000),
('HD07','MH09',6,10000),
('HD08','MH04',10,20000),
('HD09','MH07',1,10000),
('HD10','MH09',6,10000),
('HD11','MH10',3,20000),
('HD12','MH07',2,10000),
('HD13','MH08',2,10000),
('HD14','MH03',15,7000);

-- Các câu lệnh truy vấn SQL
--1) Đưa ra thông tin của tất cả các bảng  
select * from CUAHANG
select * from NHANVIEN
select * from NHACUNGCAP
select * from PHIEUNHAP
select * from KHACHHANG 
select * from HANG
select * from HOADONBANHANG 
select * from CHITIETPHIEUNHAP
select * from CHITIETHOADON

--2) Đưa ra thông tin người quản lý của từng cửa hàng.     
select distinct ch.MaNQL , TenNV , GioiTinh, Luong , NV.diachi , NV.SDT
from cuahang ch,nhanvien nv 
where ch.manql = nv.manv

--3) Nêu ra các mặt hàng có số lượng tồn >150. 
select * from hang
where slton > 150

--4) Đưa ra danh sách các mặt hàng có tên mặt hàng bắt đầu bằng là chữ 'Vở' 
select * from hang
where tenhang like N'Vở%'

--5) Đưa ra các khách hàng ở Ba Đình – Hà Nội 
select * from khachhang
where diachi like N'Ba Đình - Hà Nội'

--6) Đưa ra 3 sản phẩm bán được nhiều nhất.  
select top 3 MaHang
from CHITIETHOADON
group by mahang
order by sum(soluong) desc

--7) Đưa ra những nhân viên có lương từ 3000000 đến 5000000
select * from nhanvien 
where luong between 3000000 and 5000000

--8) Đưa ra SoPhieu, MaHang, DonGia, SoLuong và Thành tiền (dongia*soluong) của tất cả các hàng.  
select * , dongia*soluong as ThanhTien from chitietphieunhap 

--9) Đưa ra SoHD, MaHang, DonGia, SoLuong và Thành tiền (dongia*soluong) của tất cả các hàng.  
select * , dongia*soluong as ThanhTien from chitiethoadon

--10) Tính tổng tiền nhập hàng theo từng phiếu nhập.  
select sophieu , sum(soluong*dongia) as ThanhTien from chitietphieunhap 
group by sophieu

--11) Tính tổng tiền bán hàng theo từng hóa đơn bán.  
select sohd , sum(soluong*dongia) as ThanhTien from CHITIETHOADON
group by sohd

--12) Đưa ra tổng lương, trung bình lương của nhân viên theo từng cửa hàng.  
select MaCH , sum(luong) as LuongTong, avg(luong) as LuongTB from nhanvien
group by mach
select * from chitiethoadon
select * from hoadonbanhang

--13) Đưa ra mã hàng các mặt hàng chưa từng được bán từ ngày 23/03/2021 
select distinct MaHang 
from CHITIETHOADON  
where MaHang not in (select MaHang from CHITIETHOADON  
where SoHD in (select SoHD from HOADONBANHANG 
where day  (NgayBan) >=23 and month (NgayBan) >=03 and year(NgayBan) >=2021 
or month (NgayBan) >03 and year (NgayBan) >= 2021)) 

--14) Đưa ra Hoten, LuongQuy của tất cả các nhân viên, với LuongQuy= Luong*3. 
select TenNV , LuongQuy=Luong*3 from NHANVIEN

--15) Đưa ra số nhân viên của mỗi cửa hàng. 
select MaCH , count(manv) as SoNV from nhanvien
group by mach

--16) Đưa ra số hóa đơn, tên các khách hàng mua hàng từ mới đến cũ  
select SoHD, NgayBan, TenKhach 
from KHACHHANG K, HOADONBANHANG H 
where K.MaKhach = H.MaKhach 
order by H.NgayBan desc 
 
--17) Đưa ra mặt hàng có số lượng bán trung bình lớn nhất. 
select MaHang,AVG(SoLuong) as Luong_ban_TB 
from CHITIETHOADON  
group by MaHang 
having AVG(SoLuong) >= all (select avg(SoLuong) from CHITIETHOADON group by MaHang) 

--18) Tính doanh thu bán được theo từng ngày.  
select NgayBan , sum(soluong*dongia) as ThanhTien  
from CHITIETHOADON cthd,HOADONBANHANG hdbh 
where cthd.sohd = hdbh.SoHD 
group by NgayBan 

--19) Đưa ra những Khách Hàng mua hàng trong tháng 3 năm 2021 
select kh.MaKhach , TenKhach , DiaChi , SDT
from KHACHHANG KH, HOADONBANHANG HDBH
where KH.MaKhach = HDBH.MaKhach and (month(NgayBan) = 03 and year(NgayBan) = 2021)

--20) Có bao nhiêu mặt hàng khác nhau được bán trong ngày 25/05/2021 
Select count (distinct MaHang) as So_mat_hang 
from CHITIETHOADON
where SoHD in ( select SoHD from HOADONBANHANG where day(NgayBan) = 25 and month(NgayBan) = 05 and year(NgayBan) = 2021) 

--21) Tìm hóa đơn mua ít nhất 2 mặt hàng.  
select SoHD, count(distinct MaHang) as So_mat_hang 
from CHITIETHOADON 
group by SoHD 
having count(distinct MaHang) >= 2 

--22) Tìm các khách hàng đã mua sản phẩm có mã 'MH02' hoặc 'MH05' 
select * 
from KHACHHANG K 
where K.MaKhach in  
( select MaKhach from HOADONBANHANG H where H.SoHD in  
(select SoHD from CHITIETHOADON C where C.MaHang in ('MH02','MH05'))) 

--23) Tìm các số hóa đơn có 2 sản phẩm có mã 'MH02' và 'MH05' 
(select SoHD from CHITIETHOADON where MaHang = 'MH02') 
intersect  
(select SoHD from CHITIETHOADON where MaHang ='MH05') 

--24) Đưa ra nhân viên mà lương của họ thấp nhất trong cửa hàng của họ làm việc 
select *  
from NHANVIEN A 
where Luong in 
(select min(Luong) 
from NHANVIEN B  
where A.MaCH = B.MaCH 
group by MaCH) 
 
--25) Đưa ra tên các Nhân Viên làm việc cho CH03.  
select TenNV  
from NHANVIEN 
where MaCH like 'CH03' 

--26) Đưa ra MaHang,TenHang có giá nhập nhỏ hơn 30000 
select distinct H.MaHang,TenHang 
from HANG H, CHITIETPHIEUNHAP CTPN 
where H.MaHang = CTPN.MaHang and DonGia < 30000

--27) Đưa ra mã nhà cung cấp cung cấp từ 3 mặt hàng trở lên 
select MaNCC 
from PHIEUNHAP
where SoPhieu in
(select SoPhieu from CHITIETPHIEUNHAP group by SoPhieu
having count(MaHang) >=3)

--28) Đưa ra mã hàng được cung cấp bởi nhà cung cấp 01

select distinct MaHang
from CHITIETPHIEUNHAP CTPN, PHIEUNHAP PN
where CTPN.SoPhieu = PN.SoPhieu and MaNCC = 'NCC01'

--29) đưa ra số mặt hàng cung cấp theo từng nhà cung cấp 
select MaNCC,CTPN.SoPhieu,MaHang into banga
from CHITIETPHIEUNHAP CTPN , PHIEUNHAP PN
where CTPN.SoPhieu = PN.SoPhieu

select * from Banga
select MaNCC, count(MaHang)as SoMaHang 
from banga
group by MaNCC

--30) Đưa ra MaHang,TenHang của mặt hàng đắt nhất được cung cấp bới công ty B 
select distinct H.MaHang,TenHang 
from HANG H, CHITIETPHIEUNHAP C1 
where H.MaHang = C1.MaHang  
and 
C1.DonGia in (select max(DonGia)  from CHITIETPHIEUNHAP C2,NHACUNGCAP N  
where N.TenNCC like N'Công ty B')

--31) Cho biết mỗi phiếu nhập có bao nhiêu mặt hàng. 
select SoPhieu,count(distinct MaHang) as Tong_so_mat_hang 
from CHITIETPHIEUNHAP 
group by SoPhieu 

--32) Đưa ra mặt hàng có tổng số lượt bán nhỏ nhất.  
select MaHang, count (MaHang) as Tong_luot_ban 
from CHITIETHOADON 
group by MaHang  
having count (MaHang) <= all (select count (SoLuong) from CHITIETHOADON group by MaHang) 

-- 33) Đưa ra Hoten, MaDV, Luong của các nhân viên có Luong=Luong thấp nhất trong một cửa hàng nào đó.
Select TenNV,MaCH, Luong
From NHANVIEN
where Luong = (select min (Luong) from NHANVIEN)

--34) Đưa ra MaCH, AVG(Luong) của cửa hàng có trung bình lương lớn hơn lương nhỏ nhất của cửa hàng có mã cửa hang là CH01. 
select MaCH, AVG(Luong) as Luong_Trung_Binh 
from NHANVIEN N 
group by N.MaCH 
having  
avg(Luong) >(select min(Luong) from NHANVIEN where MaCH like 'CH01') 

--35) Đưa ra thông tin hóa đơn có tongtien thanh toán lớn nhất. 
select * 
from HOADONBANHANG 
where SoHD in (select CTHD.SoHD 
from CHITIETHOADON CTHD, HOADONBANHANG HD 
where CTHD.SoHD = HD.SoHD 
group by CTHD.SoHD 
having sum(SoLuong*DonGia) >= all (select sum(SoLuong*DonGia)  
from CHITIETHOADON CTHD, HOADONBANHANG HD  
where CTHD.SoHD = HD.SoHD group by CTHD.SoHD)) 

--36) Đưa ra thông tin hóa đơn có tongtien thanh toán nhỏ nhất. 
select * 
from HOADONBANHANG 
where SoHD in (select CTHD.SoHD 
from CHITIETHOADON CTHD, HOADONBANHANG HD 
where CTHD.SoHD = HD.SoHD 
group by CTHD.SoHD 
having sum(SoLuong*DonGia) <= all (select sum(SoLuong*DonGia)  
from CHITIETHOADON CTHD, HOADONBANHANG HD 
where CTHD.SoHD = HD.SoHD group by CTHD.SoHD)) 

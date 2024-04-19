create database quanlybanhang;
create table khachhang(
    MaKH char(4) primary key ,
    TenKH varchar(30) not null,
    Diachi varchar(50)  null,
    Ngaysinh date  null ,
    SoDT varchar(15) null,
    unique (SoDT)
);

create table nhanvien(
    MaNV char(4) primary key ,
    HoTen varchar(30) not null ,
    GioiTinh bit not null ,
    Diachi varchar(50) not null,
    NgaySinh date not null ,
    DienThoai varchar(15) null ,
    Email text null ,
    NoiSinh varchar(20) not null ,
    NgayVaoLam date null ,
    MaNQL char(4)
);

create table nhacungcap(
    MaNCC char(5) primary key ,
    TenNCC varchar(50) not null ,
    Diachi varchar(50) not null ,
    Dienthoai varchar(15) not null ,
    Email varchar(30) not null ,
    Website varchar(30)
);

create table LOAISP(
    MaloaiSP char(4) primary key ,
    TenloaiSP varchar(30) not null ,
    Ghichu varchar(100) not null
);

create table SANPHAM(
    MaSP char(4) primary key ,
    MaloaiSP char(4) not null ,
    TenSP varchar(50) not null ,
    Donvitinh varchar(10) not null ,
    Ghichu varchar(100)
);

create table PHIEUNHAP(
    SoPN char(5) primary key ,
    MaNV char(4) not null ,
    MaNCC char(5) not null ,
    Ngaynhap date not null default (now()),
    Ghichu varchar(100)
);

create table CTPHIEUNHAP(
    MaSP char(4),
    SoPN char(5),
    Soluong smallint not null default 0,
    Gianhap real not null check ( Gianhap>=0 ),
    primary key (MaSP,SoPN)
);

create table PHIEUXUAT(
    SoPX char(5) primary key ,
    MaNV char(4) not null ,
    MaKH varchar(4) not null ,
    NgayBan date not null,
    GhiChu text null
);

create table CTPHIEUXUAT(
 SoPX char(5),
    MaSP char(4),
    SoLuong smallint not null ,
    GiaBan real not null ,
    primary key (SoPX,MaSP)
);

-- Thêm phiếu nhập thứ nhất
INSERT INTO PHIEUNHAP (SoPN, MaNV, MaNCC, Ngaynhap, Ghichu)
VALUES ('PN001', 'NV01', 'NCC01', CURRENT_DATE, 'Ghi chú cho phiếu nhập 1');

-- Thêm sản phaamr vào phiếu nhập thứ nhất
INSERT INTO CTPHIEUNHAP (MaSP, SoPN, Soluong, Gianhap)
VALUES ('SP01','PN001',2,10000),
       ('SP02','PN001',2,15000);

-- Thêm phiếu nhập thứ hai
INSERT INTO PHIEUNHAP (SoPN, MaNV, MaNCC, Ngaynhap, Ghichu)
VALUES ('PN002', 'NV02', 'NCC02', CURRENT_DATE, 'Ghi chú cho phiếu nhập 2');

-- Thêm sản phaamr vào phiếu nhập thứ hai
INSERT INTO CTPHIEUNHAP (MaSP, SoPN, Soluong, Gianhap)
VALUES ('SP03', 'PN002', 2, 20000),
       ('SP04', 'PN002', 2, 25000);


INSERT INTO PHIEUXUAT (SoPX, MaNV, MaKH, NgayBan, GhiChu)
VALUES ('PX001', 'NV01','KH01',CURRENT_DATE, 'Ghi chú cho phiếu xuất 1');


INSERT INTO CTPHIEUXUAT (SoPX, MaSP, SoLuong, GiaBan)
VALUES ('PX001' , 'SP01' , 3, 20000),
       ('PX001' , 'SP02' , 3, 25000),
       ('PX001' , 'SP03' , 3, 30000);


INSERT INTO PHIEUXUAT (SoPX, MaNV, MaKH, NgayBan, GhiChu)
VALUES ('PX002', 'NV02','KH02',CURRENT_DATE, 'Ghi chú cho phiếu xuất 2');

-- thieu san pham vào phieu thu 2
INSERT INTO CTPHIEUXUAT (SoPX, MaSP, SoLuong, GiaBan)
VALUES ('PX002' , 'SP04' , 3, 40000),
       ('PX002' , 'SP05' , 3, 5000),
       ('PX002' , 'SP06' , 3, 60000);

-- thêm nhân vien moi
INSERT INTO nhanvien (MaNV, HoTen, GioiTinh, Diachi, NgaySinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES ('NV03', 'Nguyen Van A', 1, '123 Đường ABC, Quận 1', '1990-01-01', '0123456789', 'email@example.com', 'TPHCM', CURRENT_DATE, 'NV01');

INSERT INTO khachhang(MaKH, TenKH, Diachi, Ngaysinh, SoDT)
values ('KH01','Nguyen Giang','HungYen','2024-01-01','0977414302');

UPDATE khachhang
SET SoDT = '0911111111'
WHERE MaKH ='KH01';

UPDATE nhanvien
SET Diachi = 'Hà Nội'
WHERE MaNV = 'NV03';

-- Bai 5
DELETE FROM nhanvien
WHERE MaNV = 'NV03';

INSERT INTO sanpham(MaSP, MaloaiSP, TenSP, Donvitinh, Ghichu)
VALUES ('SP15','1','Lenovo','5','xịn xịn');

DELETE FROM sanpham
WHERE MaSP = 'SP15';


-- Bài 6 :

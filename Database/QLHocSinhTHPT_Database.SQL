/* Da chinh sua hoan chinh */
USE master
GO
IF EXISTS
(
	SELECT * 
	FROM   master..sysdatabases 
	WHERE  name = N'QLHocSinhTHPT'
)
DROP DATABASE QLHocSinhTHPT
GO

CREATE DATABASE QLHocSinhTHPT
ON
(
	NAME		= 'QLHocSinhTHPT',
	FILENAME	= 'C:\QLHocSinhTHPT.MDF',
	SIZE		= 20,
	MAXSIZE		= 100,
	FILEGROWTH	= 5
)
GO

USE QLHocSinhTHPT
GO
--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE LOAINGUOIDUNG
(
	MaLoai		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenLoaiND	NVARCHAR (30)	NOT NULL
)

-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE  NGUOIDUNG
(
	MaND 		VARCHAR (6) 	NOT NULL	PRIMARY KEY,
	MaLoai		VARCHAR (6)		NOT NULL,
	TenND		NVARCHAR (30)	NOT NULL,
	TenDNhap	VARCHAR (30)	NOT NULL,
	MatKhau		VARCHAR (30)	NOT NULL,
	
	CONSTRAINT F_ND_LND FOREIGN KEY(MaLoai) 	REFERENCES LOAINGUOIDUNG(MaLoai)
)

--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE DANTOC
(
	MaDanToc	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenDanToc	NVARCHAR (30)	NOT NULL
)

-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE TONGIAO
(
	MaTonGiao	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenTonGiao	NVARCHAR (30)	NOT NULL
)

--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE NAMHOC
(
	MaNamHoc	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenNamHoc	VARCHAR (30)	NOT NULL
)

-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE HOCKY
(
	MaHocKy		VARCHAR (3)		NOT NULL	PRIMARY KEY,
	TenHocKy	NVARCHAR (30)	NOT NULL,
	HeSo		INT
)

--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE KHOILOP
(
	MaKhoiLop	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenKhoiLop	NVARCHAR (30)	NOT NULL
)
-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE MONHOC
(
	MaMonHoc	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenMonHoc	NVARCHAR (30)	NOT NULL,
	SoTiet		INT				NOT NULL,
	HeSo		INT				NOT NULL
)

--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE HOCLUC
(
	MaHocLuc		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenHocLuc		NVARCHAR (30)	NOT NULL,
	DiemCanDuoi		FLOAT			NOT NULL,
	DiemCanTren		FLOAT			NOT NULL,
	DiemKhongChe	FLOAT			NOT NULL
)

-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE HANHKIEM
(
	MaHanhKiem		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenHanhKiem		NVARCHAR (30)	NOT NULL
)

-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE KETQUA
(
	MaKetQua	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenKetQua	NVARCHAR (30)	NOT NULL
)

--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE NGHENGHIEP
(
	MaNghe		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenNghe		NVARCHAR (30)	NOT NULL
)

-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE GIAOVIEN
(
	MaGiaoVien	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenGiaoVien NVARCHAR (30)	NOT NULL,
	DiaChi		NVARCHAR (50)	NOT NULL,
	DienThoai	VARCHAR (15)	NOT NULL,
	MaMonHoc	VARCHAR (6)		NOT NULL,
	
	-- (1 khoa ngoai)
	CONSTRAINT F_GV_MH FOREIGN KEY(MaMonHoc)	REFERENCES MONHOC(MaMonHoc)
)

-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE HOCSINH
(
	MaHocSinh		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	HoTen			NVARCHAR (30)	NOT NULL,
	GioiTinh		BIT,
	NgaySinh		DATETIME,
	NoiSinh			NVARCHAR (50)	NOT NULL,
	MaDanToc		VARCHAR (6)		NOT NULL,
	MaTonGiao		VARCHAR (6)		NOT NULL,
	HoTenCha		NVARCHAR (30)	NOT NULL,
	MaNNghiepCha	VARCHAR (6)		NOT NULL,
	HoTenMe			NVARCHAR (30)	NOT NULL,
	MaNNghiepMe		VARCHAR (6)		NOT NULL,
	
	-- (4 khoa ngoai)
	CONSTRAINT F_HS_DT	FOREIGN KEY(MaDanToc)		REFERENCES DANTOC(MaDanToc),
	CONSTRAINT F_HS_TG	FOREIGN KEY(MaTonGiao)		REFERENCES TONGIAO(MaTonGiao),
	CONSTRAINT F_HS_NNC	FOREIGN KEY(MaNNghiepCha)	REFERENCES NGHENGHIEP(MaNghe),
	CONSTRAINT F_HS_NNM	FOREIGN KEY(MaNNghiepMe)	REFERENCES NGHENGHIEP(MaNghe)
)	'0','01/02/1992','Long Xuyen',	'DT0001','TG0005','Biet chet lien',	'NN0005','Biet chet lien',	'NN0002')
INSERT INTO HOCSINH VALUES('HS0046','Ho Thanh Vu',			'0','01/02/1992','Ben Tre',		'DT0001','TG0002','Biet chet lien',	'NN0003','Biet chet lien',	'NN0001')
INSERT INTO HOCSINH VALUES('HS0047','Phan Quoc Vuong',		'0','04/15/1992','Cho Moi',		'DT0001','TG0004','Biet chet lien',	'NN0005','Biet chet lien',	'NN0005')
--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE LOP
(
	MaLop		VARCHAR (10)	NOT NULL	PRIMARY KEY,
	TenLop		NVARCHAR (30)	NOT NULL,
	MaKhoiLop	VARCHAR (6)		NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	SiSo		INT 			NOT NULL,
	MaGiaoVien	VARCHAR (6)		NOT NULL,
	
	-- (3 khoa ngoai)
	CONSTRAINT F_LOP_KL FOREIGN KEY(MaKhoiLop)	REFERENCES KHOILOP(MaKhoiLop),
	CONSTRAINT F_LOP_NH FOREIGN KEY(MaNamHoc)	REFERENCES NAMHOC(MaNamHoc),
	CONSTRAINT F_LOP_GV FOREIGN KEY(MaGiaoVien)	REFERENCES GIAOVIEN(MaGiaoVien)
)
-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE PHANLOP
(
	MaNamHoc	VARCHAR (6)		NOT NULL,
	MaKhoiLop	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaHocSinh	VARCHAR (6)		NOT NULL,
	
	PRIMARY KEY(MaNamHoc, MaKhoiLop, MaLop, MaHocSinh),
	
	-- (4 khoa ngoai)
	CONSTRAINT F_PL_NH		FOREIGN KEY(MaNamHoc)	REFERENCES NAMHOC(MaNamHoc),
	CONSTRAINT F_PL_KHOI	FOREIGN KEY(MaKhoiLop)	REFERENCES KHOILOP(MaKhoiLop),
	CONSTRAINT F_PL_LOP		FOREIGN KEY(MaLop)		REFERENCES LOP(MaLop),
	CONSTRAINT F_PL_HS		FOREIGN KEY(MaHocSinh)	REFERENCES HOCSINH(MaHocSinh)
)
-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE PHANCONG
(
	STT			INT				IDENTITY	PRIMARY KEY,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaMonHoc	VARCHAR (6)		NOT NULL,
	MaGiaoVien	VARCHAR (6)		NOT NULL,
	
	-- PRIMARY KEY(MaNamHoc, MaLop, MaMonHoc, MaGiaoVien),
	
	-- (4 khoa ngoai)
	CONSTRAINT F_PC_NH	FOREIGN KEY(MaNamHoc)	REFERENCES NAMHOC(MaNamHoc),
	CONSTRAINT P_PC_LOP	FOREIGN KEY(MaLop)		REFERENCES LOP(MaLop),
	CONSTRAINT P_PC_MH	FOREIGN KEY(MaMonHoc)	REFERENCES MONHOC(MaMonHoc),
	CONSTRAINT P_PC_GV	FOREIGN KEY(MaGiaoVien)	REFERENCES GIAOVIEN(MaGiaoVien)
)

--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE LOAIDIEM
(
	MaLoai		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenLoai		NVARCHAR (30)	NOT NULL,
	HeSo		INT				NOT NULL
)

-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE DIEM
(
	STT			INT				IDENTITY	PRIMARY KEY,
	MaHocSinh	VARCHAR (6)		NOT NULL,
	MaMonHoc	VARCHAR (6)		NOT NULL,
	MaHocKy		VARCHAR (3)		NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaLoai		VARCHAR (6)		NOT NULL,
	Diem		FLOAT			NOT NULL,
	
	-- (5 khoa ngoai)
	CONSTRAINT F_DIEM_HS	FOREIGN KEY(MaHocSinh)	REFERENCES HOCSINH(MaHocSinh),
	CONSTRAINT F_DIEM_MH	FOREIGN KEY(MaMonHoc)	REFERENCES MONHOC(MaMonHoc),
	CONSTRAINT F_DIEM_HK	FOREIGN KEY(MaHocKy)	REFERENCES HOCKY(MaHocKy),
	CONSTRAINT F_DIEM_NH	FOREIGN KEY(MaNamHoc)	REFERENCES NAMHOC(MaNamHoc),
	CONSTRAINT F_DIEM_LOP	FOREIGN KEY(MaLop)		REFERENCES LOP(MaLop),
	CONSTRAINT F_DIEM_LD	FOREIGN KEY(MaLoai)		REFERENCES LOAIDIEM(MaLoai)
)
--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE KQ_HOC_KY_MON_HOC
(
	MaHocSinh	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaMonHoc	VARCHAR (6)		NOT NULL,
	MaHocKy		VARCHAR (3)		NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	DTBKiemTra	FLOAT			NOT NULL,
	DTBMonHocKy	FLOAT			NOT NULL,	-- Cua tung mon
	
	PRIMARY KEY(MaHocSinh, MaLop, MaMonHoc, MaHocKy, MaNamHoc),
	
	-- (5 khoa ngoai)
	CONSTRAINT F_KQHKMH_HS FOREIGN KEY(MaHocSinh)	REFERENCES HOCSINH(MaHocSinh),
	CONSTRAINT F_KQHKMH_LO FOREIGN KEY(MaLop)		REFERENCES LOP(MaLop),
	CONSTRAINT F_KQHKMH_MH FOREIGN KEY(MaMonHoc)	REFERENCES MONHOC(MaMonHoc),
	CONSTRAINT F_KQHKMH_HK FOREIGN KEY(MaHocKy)		REFERENCES HOCKY(MaHocKy),
	CONSTRAINT F_KQHKMH_NH FOREIGN KEY(MaNamHoc)	REFERENCES NAMHOC(MaNamHoc)
)
-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE KQ_CA_NAM_MON_HOC
(
	MaHocSinh	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaMonHoc	VARCHAR (6)		NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	DiemThiLai	FLOAT,
	DTBCaNam	FLOAT			NOT NULL,	-- Cua tung mon
	
	PRIMARY KEY(MaHocSinh, MaLop, MaMonHoc, MaNamHoc),
	
	-- (4 khoa ngoai)
	CONSTRAINT F_KQCNMH_HS 	FOREIGN KEY(MaHocSinh)		REFERENCES HOCSINH(MaHocSinh),
	CONSTRAINT F_KQCNMH_LOP	FOREIGN KEY(MaLop)			REFERENCES LOP(MaLop),
	CONSTRAINT F_KQCNMH_MH 	FOREIGN KEY(MaMonHoc)		REFERENCES MONHOC(MaMonHoc),
	CONSTRAINT F_KQCNMH_NH	FOREIGN KEY(MaNamHoc)		REFERENCES NAMHOC(MaNamHoc)
)
-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE KQ_HOC_KY_TONG_HOP
(
	MaHocSinh	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaHocKy		VARCHAR (3)		NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	MaHocLuc	VARCHAR (6)		NOT NULL,
	MaHanhKiem	VARCHAR (6)		NOT NULL,
	DTBMonHocKy	FLOAT,						-- Cua tat ca cac mon
	
	PRIMARY KEY(MaHocSinh, MaHocKy, MaLop, MaNamHoc),
	
	-- (6 khoa ngoai)
	CONSTRAINT F_KQHK_HS	FOREIGN KEY(MaHocSinh)		REFERENCES HOCSINH(MaHocSinh),
	CONSTRAINT F_KQHK_LOP	FOREIGN KEY(MaLop)			REFERENCES LOP(MaLop),
	CONSTRAINT F_KQHK_HK	FOREIGN KEY(MaHocKy)		REFERENCES HOCKY(MaHocKy),
	CONSTRAINT F_KQHK_NH	FOREIGN KEY(MaNamHoc)		REFERENCES NAMHOC(MaNamHoc),
	CONSTRAINT F_KQHK_HL	FOREIGN KEY(MaHocLuc)		REFERENCES HOCLUC(MaHocLuc),
	CONSTRAINT F_KQHK_HKIEM	FOREIGN KEY(MaHanhKiem)		REFERENCES HANHKIEM(MaHanhKiem)
)
-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE KQ_CA_NAM_TONG_HOP
(
	MaHocSinh	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	MaHocLuc	VARCHAR (6)		NOT NULL,
	MaHanhKiem	VARCHAR (6)		NOT NULL,
	DTBCaNam	FLOAT			NOT NULL,	-- Cua tat ca cac mon
	MaKetQua	VARCHAR (6)		NOT NULL,
	
	PRIMARY KEY(MaHocSinh, MaLop, MaNamHoc),
	
	-- (6 khoa ngoai)
	CONSTRAINT F_KQCN_HS	FOREIGN KEY(MaHocSinh)		REFERENCES HOCSINH(MaHocSinh),
	CONSTRAINT F_KQCN_LOP	FOREIGN KEY(MaLop)			REFERENCES LOP(MaLop),
	CONSTRAINT F_KQCN_NH	FOREIGN KEY(MaNamHoc)		REFERENCES NAMHOC(MaNamHoc),
	CONSTRAINT F_KQCN_HL	FOREIGN KEY(MaHocLuc)		REFERENCES HOCLUC(MaHocLuc),
	CONSTRAINT F_KQCN_HKIEM	FOREIGN KEY(MaHanhKiem)		REFERENCES HANHKIEM(MaHanhKiem),
	CONSTRAINT F_KQCN_KQ	FOREIGN KEY(MaKetQua)		REFERENCES KETQUA(MaKetQua)
)
--===================================================================================================================================================
/* Da chinh sua hoan chinh */
CREATE TABLE QUYDINH
(
	TuoiCanDuoi		INT		NOT NULL,
	TuoiCanTren		INT		NOT NULL,
	SiSoCanDuoi		INT		NOT NULL,
	SiSoCanTren		INT		NOT NULL,
	ThangDiem		INT		NOT NULL,
	TenTruong		NVARCHAR (100),
	DiaChiTruong	NVARCHAR (100)
)s
--===================================================================================================================================================
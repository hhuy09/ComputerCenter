USE [master]
GO
/****** Object:  Database [TRUNGTAMTINHOC]    Script Date: 7/12/2021 8:47:22 AM ******/
CREATE DATABASE [TRUNGTAMTINHOC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRUNGTAMTINHOC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TRUNGTAMTINHOC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TRUNGTAMTINHOC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TRUNGTAMTINHOC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRUNGTAMTINHOC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET RECOVERY FULL 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET  MULTI_USER 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TRUNGTAMTINHOC', N'ON'
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET QUERY_STORE = OFF
GO
USE [TRUNGTAMTINHOC]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDHOCVIEN]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[AUTO_IDHOCVIEN]()
returns varchar(6)
as
begin
	declare @ID varchar(20)
	if (select COUNT(MaHocVien) from dbo.HOCVIEN) = 0
		SET @ID = '0'
	else
		select @ID = MAX(RIGHT(MaHocVien, 3)) from dbo.HOCVIEN
		select @ID = case
			WHEN @ID >= 0 and @ID < 9 THEN 'MHV00' + CONVERT(char, CONVERT(int, @ID) + 1)
			WHEN @ID >= 9 THEN 'MHV0' + CONVERT(char, CONVERT(int, @ID) + 1)
			WHEN @ID >= 99 THEN 'MHV' + CONVERT(char, CONVERT(int, @ID) + 1)
		end
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDLICHTHI]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[AUTO_IDLICHTHI]()
returns varchar(6)
as
begin
	declare @ID varchar(6)
	if (select COUNT(MaLichThi) from dbo.LICHTHI) = 0
		SET @ID = '0'
	else
		select @ID = MAX(RIGHT(MaLichThi, 3)) from dbo.LICHTHI
		select @ID = case
			WHEN @ID >= 0 and @ID < 9 THEN 'MLT00' + CONVERT(char, CONVERT(int, @ID) + 1)
			WHEN @ID >= 9 THEN 'MLT0' + CONVERT(char, CONVERT(int, @ID) + 1)
			WHEN @ID >= 99 THEN 'MLT' + CONVERT(char, CONVERT(int, @ID) + 1)
		end
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[func_DiemTB]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[func_DiemTB]
(@mahocvien NVARCHAR(20),
@maNHP NVARCHAR(20))
RETURNS FLOAT
AS
BEGIN
DECLARE @DiemTB FLOAT;
SET @DiemTB = (SELECT DISTINCT AVG(dt.DiemThiHP) DiemTrungBinh
FROM dbo.DIEMTHI dt,dbo.LICHTHI lt,dbo.LOPHOC lh,dbo.HOCPHAN hp,dbo.NHOMHOCPHAN nhp
WHERE dt.LichThi = lt.MaLichThi
AND dt.LopHoc =lh.MaLopHoc
AND lh.HocPhan = hp.MaHocPhan
AND hp.NhomHocPhan = nhp.MaNhomHP
AND dt.HocVien = @mahocvien
AND nhp.MaNhomHP = @maNHP
GROUP BY(nhp.MaNhomHP))
RETURN @DiemTB
END
GO
/****** Object:  UserDefinedFunction [dbo].[func_hocphandaDAT]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_hocphandaDAT]
(@mahocvien NVARCHAR(20),
@maNHP NVARCHAR(20))
RETURNS INT
AS
BEGIN
DECLARE @SohocphanDAT FLOAT;
SET @SohocphanDAT = (SELECT DISTINCT COUNT(MaHocPhan) SoHocPhanDat
FROM dbo.DIEMTHI dt,dbo.LICHTHI lt,dbo.LOPHOC lh,dbo.HOCPHAN hp,dbo.NHOMHOCPHAN nhp
WHERE dt.LichThi = lt.MaLichThi
AND dt.LopHoc =lh.MaLopHoc
AND lh.HocPhan = hp.MaHocPhan
AND hp.NhomHocPhan = nhp.MaNhomHP
AND dt.Dat = 1
AND dt.HocVien = @mahocvien
AND nhp.MaNhomHP = @maNHP
GROUP BY(nhp.MaNhomHP))
RETURN @SohocphanDAT
END
GO
/****** Object:  UserDefinedFunction [dbo].[func_hocphandaHOC]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[func_hocphandaHOC]
(@mahocvien NVARCHAR(20),
@maNHP NVARCHAR(20))
RETURNS INT
AS
BEGIN
DECLARE @SohocphanHOC FLOAT;
SET @SohocphanHOC = (SELECT  COUNT(MaHocPhan) SoHocPhanDaHoc
FROM dbo.DIEMTHI dt,dbo.LICHTHI lt,dbo.LOPHOC lh,dbo.HOCPHAN hp,dbo.NHOMHOCPHAN nhp
WHERE dt.LichThi = lt.MaLichThi
AND dt.LopHoc =lh.MaLopHoc
AND lh.HocPhan = hp.MaHocPhan
AND hp.NhomHocPhan = nhp.MaNhomHP
AND dt.HocVien = @mahocvien
AND nhp.MaNhomHP = @maNHP
GROUP BY(nhp.MaNhomHP))
RETURN @SohocphanHOC
END
GO
/****** Object:  Table [dbo].[HOCVIEN]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCVIEN](
	[MaHocVien] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](20) NULL,
	[HoTen] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[Email] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
 CONSTRAINT [PK_HV] PRIMARY KEY CLUSTERED 
(
	[MaHocVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [nvarchar](20) NOT NULL,
	[PhongBan] [nvarchar](20) NULL,
	[MatKhau] [nvarchar](20) NULL,
	[HoTen] [nvarchar](100) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[Email] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
 CONSTRAINT [PK_NV] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DANGNHAP]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DANGNHAP]
AS
SELECT        MAHOCVIEN "ID", HOTEN, EMAIL, MATKHAU
FROM            DBO.HOCVIEN
UNION
SELECT        MANV "ID", HOTEN, EMAIL, MATKHAU
FROM            DBO.NHANVIEN;
GO
/****** Object:  Table [dbo].[CHUNGCHIVANBANG]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUNGCHIVANBANG](
	[MaCCVB] [nvarchar](20) NOT NULL,
	[TenCCVN] [nvarchar](100) NULL,
	[MoTa] [nvarchar](1000) NULL,
 CONSTRAINT [PK_CCVB] PRIMARY KEY CLUSTERED 
(
	[MaCCVB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUYENDE]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUYENDE](
	[MaChuyenDe] [nvarchar](20) NOT NULL,
	[TenChuyenDe] [nvarchar](100) NULL,
	[MoTa] [nvarchar](1000) NULL,
 CONSTRAINT [PK_CD] PRIMARY KEY CLUSTERED 
(
	[MaChuyenDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANGKYHOCPHAN]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANGKYHOCPHAN](
	[HocVien] [nvarchar](20) NOT NULL,
	[LopHoc] [nvarchar](20) NOT NULL,
	[SoLanDaThi] [int] NULL,
 CONSTRAINT [PK_DKHP] PRIMARY KEY CLUSTERED 
(
	[HocVien] ASC,
	[LopHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHGIAKHOAHOC]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIAKHOAHOC](
	[HocVien] [nvarchar](20) NOT NULL,
	[KhoaHoc] [nvarchar](20) NOT NULL,
	[SoHPDaHoc] [int] NULL,
	[SoHPDaDat] [int] NULL,
	[CapCCVB] [nvarchar](20) NULL,
 CONSTRAINT [PK_DGKH] PRIMARY KEY CLUSTERED 
(
	[HocVien] ASC,
	[KhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHGIANHP]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIANHP](
	[HocVien] [nvarchar](20) NOT NULL,
	[NhomHocPhan] [nvarchar](20) NOT NULL,
	[SoHPDaHoc] [int] NULL,
	[SoHPDaDat] [int] NULL,
	[DiemTrungBinh] [float] NULL,
	[CapCCVB] [nvarchar](20) NULL,
 CONSTRAINT [PK_DGNHP] PRIMARY KEY CLUSTERED 
(
	[HocVien] ASC,
	[NhomHocPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIEMTHI]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIEMTHI](
	[HocVien] [nvarchar](20) NOT NULL,
	[LopHoc] [nvarchar](20) NOT NULL,
	[LichThi] [nvarchar](20) NOT NULL,
	[DiemThiHP] [float] NULL,
	[Dat] [nvarchar](20) NULL,
 CONSTRAINT [PK_DT] PRIMARY KEY CLUSTERED 
(
	[HocVien] ASC,
	[LopHoc] ASC,
	[LichThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCPHAN]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCPHAN](
	[MaHocPhan] [nvarchar](20) NOT NULL,
	[NhomHocPhan] [nvarchar](20) NOT NULL,
	[TenHocPhan] [nvarchar](100) NULL,
 CONSTRAINT [PK_HP] PRIMARY KEY CLUSTERED 
(
	[MaHocPhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCVIEN_KDT]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCVIEN_KDT](
	[HocVien] [nvarchar](20) NOT NULL,
	[LopDaoTao] [nvarchar](20) NOT NULL,
	[NgayGhiDanh] [date] NULL,
	[TongSoHP] [int] NULL,
	[HocPhi] [int] NULL,
	[NopHocPhi] [nvarchar](20) NULL,
	[DiemTotNghiep] [float] NULL,
	[CapCCVB] [nvarchar](20) NULL,
 CONSTRAINT [PK_HV_KDT] PRIMARY KEY CLUSTERED 
(
	[HocVien] ASC,
	[LopDaoTao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCVIEN_LCD]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCVIEN_LCD](
	[HocVien] [nvarchar](20) NOT NULL,
	[LopChuyenDe] [nvarchar](20) NOT NULL,
	[NgayGhiDanh] [date] NULL,
 CONSTRAINT [PK_HV_LCD] PRIMARY KEY CLUSTERED 
(
	[HocVien] ASC,
	[LopChuyenDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOADAOTAO]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOADAOTAO](
	[MaLopDT] [nvarchar](20) NOT NULL,
	[KhoaHoc] [nvarchar](20) NULL,
	[NamKy] [nvarchar](20) NULL,
	[NVTroLy] [nvarchar](20) NULL,
	[NgayKhaiGiang] [date] NULL,
	[NgayThiTN] [date] NULL,
	[SiSo] [int] NULL,
	[DaDangKy] [int] NULL,
 CONSTRAINT [PK_KDT] PRIMARY KEY CLUSTERED 
(
	[MaLopDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOAHOC]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOAHOC](
	[MaKhoaHoc] [nvarchar](20) NOT NULL,
	[CCVB] [nvarchar](20) NULL,
	[TenKhoaHoc] [nvarchar](50) NULL,
	[MoTa] [nvarchar](1000) NULL,
	[SoNHP] [int] NULL,
	[SoHocPhan] [int] NULL,
 CONSTRAINT [PK_KH] PRIMARY KEY CLUSTERED 
(
	[MaKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LICHTHI]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICHTHI](
	[MaLichThi] [nvarchar](20) NOT NULL,
	[LopHoc] [nvarchar](20) NOT NULL,
	[NgayThi] [date] NULL,
	[LanThi] [int] NULL,
 CONSTRAINT [PK_LT] PRIMARY KEY CLUSTERED 
(
	[MaLichThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOPCHUYENDE]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPCHUYENDE](
	[MaLopCD] [nvarchar](20) NOT NULL,
	[ChuyenDe] [nvarchar](20) NULL,
	[NamKy] [nvarchar](20) NULL,
	[NVTroLy] [nvarchar](20) NULL,
	[NgayHoc] [date] NULL,
	[SiSo] [int] NULL,
	[DaDangKy] [int] NULL,
 CONSTRAINT [PK_LCD] PRIMARY KEY CLUSTERED 
(
	[MaLopCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOPHOC]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPHOC](
	[MaLopHoc] [nvarchar](20) NOT NULL,
	[NamKy] [nvarchar](20) NULL,
	[HocPhan] [nvarchar](20) NULL,
	[NVChuyenMon] [nvarchar](20) NULL,
	[LichHoc] [nvarchar](100) NULL,
	[SiSo] [int] NULL,
	[DaDangKi] [int] NULL,
 CONSTRAINT [PK_LH] PRIMARY KEY CLUSTERED 
(
	[MaLopHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NAMKY]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NAMKY](
	[NamKy] [nvarchar](20) NOT NULL,
	[BatDau] [date] NULL,
	[KetThuc] [date] NULL,
	[MucHocPhi] [int] NULL,
 CONSTRAINT [PK_NK] PRIMARY KEY CLUSTERED 
(
	[NamKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHOMHOCPHAN]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOMHOCPHAN](
	[MaNhomHP] [nvarchar](20) NOT NULL,
	[KhoaHoc] [nvarchar](20) NULL,
	[CCVB] [nvarchar](20) NULL,
	[TenNhomHP] [nvarchar](100) NULL,
	[SoHocPhan] [int] NULL,
 CONSTRAINT [PK_NHP] PRIMARY KEY CLUSTERED 
(
	[MaNhomHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 7/12/2021 8:47:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGBAN](
	[MaPhongBan] [nvarchar](20) NOT NULL,
	[TenPhongBan] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](200) NULL,
 CONSTRAINT [PK_PB] PRIMARY KEY CLUSTERED 
(
	[MaPhongBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHUNGCHIVANBANG] ([MaCCVB], [TenCCVN], [MoTa]) VALUES (N'CCVB001', N'Văn bằng Kỹ thuật viên', N'Công việc kỹ thuật chuyên nghiệp về lập trình máy tính, quản trị hệ thống mạng - phần cứng và thiết kế viên đồ họa...')
INSERT [dbo].[CHUNGCHIVANBANG] ([MaCCVB], [TenCCVN], [MoTa]) VALUES (N'CCVB002', N'Chứng chỉ tin học A', N'Chứng chỉ này được dùng cho học sinh, sinh viên và một số chức danh, chức vụ đi làm trong nhà nước.')
INSERT [dbo].[CHUNGCHIVANBANG] ([MaCCVB], [TenCCVN], [MoTa]) VALUES (N'CCVB003', N'Chứng chỉ tin học B', N'Chứng chỉ này thường được dùng khi nộp hồ sơ tốt nghiệp đại học, hồ sơ xin việc và chuẩn tin học của một số chức danh, chức vụ trong Nhà nước.')
INSERT [dbo].[CHUNGCHIVANBANG] ([MaCCVB], [TenCCVN], [MoTa]) VALUES (N'CCVB004', N'Chứng chỉ lập trình viên', N'Lập trình viên trên các ngôn ngữ lập trình phổ biến.')
INSERT [dbo].[CHUNGCHIVANBANG] ([MaCCVB], [TenCCVN], [MoTa]) VALUES (N'CCVB005', N'Chứng chỉ phân tích viên', N'Phân tích nghiệp vụ và thiết kế hệ thống phần mềm')
INSERT [dbo].[CHUNGCHIVANBANG] ([MaCCVB], [TenCCVN], [MoTa]) VALUES (N'CCVB006', N'Chứng chỉ tin học văn phòng', N'Chứng chỉ đánh giá khả năng sử dụng các phần mền tin học văn phòng.')
GO
INSERT [dbo].[CHUYENDE] ([MaChuyenDe], [TenChuyenDe], [MoTa]) VALUES (N'MCD001', N'Kỹ năng làm chủ ngôn ngữ lập trình mới', N'Kỹ năng')
INSERT [dbo].[CHUYENDE] ([MaChuyenDe], [TenChuyenDe], [MoTa]) VALUES (N'MCD002', N'Ứng dụng tin học văn phòng', N'Ứng dụng')
INSERT [dbo].[CHUYENDE] ([MaChuyenDe], [TenChuyenDe], [MoTa]) VALUES (N'MCD003', N'Tìm kiếm tài liệu phù hợp', N'Tìm kiếm')
GO
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH001', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH002', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH003', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH004', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH005', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH006', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH001', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH002', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH003', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH004', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH005', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH006', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV003', N'MLH007', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV003', N'MLH008', 1)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV003', N'MLH009', 1)
GO
INSERT [dbo].[DANHGIAKHOAHOC] ([HocVien], [KhoaHoc], [SoHPDaHoc], [SoHPDaDat], [CapCCVB]) VALUES (N'MHV001', N'MKH001', 6, 6, N'Đạt')
INSERT [dbo].[DANHGIAKHOAHOC] ([HocVien], [KhoaHoc], [SoHPDaHoc], [SoHPDaDat], [CapCCVB]) VALUES (N'MHV001', N'MKH002', NULL, NULL, NULL)
INSERT [dbo].[DANHGIAKHOAHOC] ([HocVien], [KhoaHoc], [SoHPDaHoc], [SoHPDaDat], [CapCCVB]) VALUES (N'MHV002', N'MKH001', 6, 6, N'Đạt')
INSERT [dbo].[DANHGIAKHOAHOC] ([HocVien], [KhoaHoc], [SoHPDaHoc], [SoHPDaDat], [CapCCVB]) VALUES (N'MHV003', N'MKH002', 3, 3, N'Đạt')
GO
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV001', N'NHP001', 2, 2, 9.25, N'Đạt')
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV001', N'NHP002', 2, 2, 8, N'Đạt')
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV001', N'NHP003', 2, 2, 8.25, N'Đạt')
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV001', N'NHP004', NULL, NULL, NULL, NULL)
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV002', N'NHP001', 2, 2, 8.75, N'Đạt')
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV002', N'NHP002', 2, 2, 9, N'Đạt')
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV002', N'NHP003', 2, 2, 8.5, N'Đạt')
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV003', N'NHP004', 3, 3, 8.5, N'Đạt')
GO
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH001', N'MLT001', 9, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH002', N'MLT002', 9.5, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH003', N'MLT003', 7, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH004', N'MLT004', 9, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH005', N'MLT005', 8, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH006', N'MLT006', 8.5, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH001', N'MLT001', 8, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH002', N'MLT002', 9.5, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH003', N'MLT003', 8, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH004', N'MLT004', 10, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH005', N'MLT005', 9, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH006', N'MLT006', 8, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV003', N'MLH007', N'MLT007', 7, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV003', N'MLH008', N'MLT008', 9.5, N'Đạt')
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV003', N'MLH009', N'MLT009', 9, N'Đạt')
GO
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP001', N'NHP001', N'Lập trình căn bản')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP002', N'NHP001', N'Lập trình nâng cao')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP003', N'NHP002', N'Phân tích thiêt kế cơ bản')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP004', N'NHP002', N'Phân tích thiêt kế nâng cao')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP005', N'NHP003', N'Tin học văn phòng cơ bản')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP006', N'NHP003', N'Tin học văn phòng nâng cao')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP007', N'NHP004', N'Microsoft Word A')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP008', N'NHP004', N'Microsoft Excel A')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP009', N'NHP004', N'Microsoft Access A')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP010', N'NHP005', N'Microsoft Word B')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP011', N'NHP005', N'Microsoft Excel B')
INSERT [dbo].[HOCPHAN] ([MaHocPhan], [NhomHocPhan], [TenHocPhan]) VALUES (N'MHP012', N'NHP005', N'Microsoft Access B')
GO
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV001', N'123456', N'Phạm Minh Anh Hữu', N'Nam', N'pmahuu@gmail.com', N'0879564567')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV002', N'123456', N'Phạm Đức Huy', N'Nam', N'pdhuy@gmail.com', N'0879135656')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV003', N'123456', N'La Nhật Hy', N'Nam', N'lnhy@gmail.com', N'0879564432')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV004', N'123456', N'Ngô Nhân Khả', N'Nam', N'nhk@gmail.com', N'0879345678')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV005', N'123456', N'Trần Hữu Khải', N'Nam', N'thkhai@gmail.com', N'0879980098')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV006', N'123456', N'Nguyễn Tấn Khang', N'Nam', N'ntkhang@gmail.com', N'0879876765')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV007', N'123456', N'Trần Ngọc Lan Khanh', N'Nữ', N'tnlkhanh@gmail.com', N'0879678898')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV008', N'123456', N'Phạm Quốc Khánh', N'Nam', N'pqkhanh@gmail.com', N'0879433421')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV009', N'123456', N'Nguyễn Anh Khiêm', N'Nam', N'nakhiem@gmail.com', N'0871049829')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV010', N'123456', N'Đỗ Liên Khoa', N'Nam', N'dlkhoa@gmail.com', N'0879222642')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV011', N'123456', N'Phạm Minh Thi', N'Nữ', N'pmthi@gmail.com', N'0879398457')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV012', N'123456', N'Trịnh Tấn Khoa', N'Nam', N'ttkhoa@gmail.com', N'0950792749')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV013', N'123456', N'Lê Anh Khương', N'Nam', N'lakhuong@gmail.com', N'0473850796')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV014', N'123456', N'Nguyễn Hà Anh Kiểm', N'Nam', N'nhakiem@gmail.com', N'0794715409')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV015', N'123456', N'Võ Thị Hiếu', N'Nữ', N'vthieu@gmail.com', N'0705933858')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV016', N'123456', N'Nguyễn Văn Hoài', N'Nam', N'nvhoai@gmail.com', N'0891232433')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV017', N'123456', N'Trần Thanh Hiền', N'Nam', N'tthien@gmail.com', N'0850709089')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV018', N'123456', N'Huỳnh Văn	Hiền', N'Nam', N'hvhien@gmail.com', N'0873571221')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV019', N'123456', N'Bùi Hoàn Hảo', N'Nam', N'bhhao@gmail.com', N'0876795784')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV020', N'123456', N'Phạm Mỹ Hoa', N'Nữ', N'pmhoa@gmail.com', N'0879567890')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV021', N'123456', N'Bùi Công Nam', N'Nam', N'bcnam@gmail.com', N'0912758334')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV022', N'123456', N'Nguyễn Văn Toàn', N'Nam', N'nvtoan@gmail.com', N'091275867')
GO
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV001', N'LDT001', CAST(N'2021-07-04' AS Date), 6, 1500000, N'Đã nộp', 8.75, N'Không')
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV001', N'LDT002', CAST(N'2021-07-11' AS Date), 0, 0, N'0', 0, N'Không')
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV002', N'LDT001', CAST(N'2021-07-05' AS Date), 6, 1500000, N'Đã nộp', 9, N'Không')
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV003', N'LDT002', CAST(N'2021-07-06' AS Date), 3, 750000, N'Đã nộp', 8.5, N'Không')
GO
INSERT [dbo].[HOCVIEN_LCD] ([HocVien], [LopChuyenDe], [NgayGhiDanh]) VALUES (N'MHV003', N'LCD002', CAST(N'2021-07-06' AS Date))
GO
INSERT [dbo].[KHOADAOTAO] ([MaLopDT], [KhoaHoc], [NamKy], [NVTroLy], [NgayKhaiGiang], [NgayThiTN], [SiSo], [DaDangKy]) VALUES (N'LDT001', N'MKH001', N'2021-1', N'MNV001', CAST(N'2021-01-15' AS Date), CAST(N'2021-06-15' AS Date), 10, 2)
INSERT [dbo].[KHOADAOTAO] ([MaLopDT], [KhoaHoc], [NamKy], [NVTroLy], [NgayKhaiGiang], [NgayThiTN], [SiSo], [DaDangKy]) VALUES (N'LDT002', N'MKH002', N'2021-1', N'MNV001', CAST(N'2021-01-15' AS Date), CAST(N'2021-05-15' AS Date), 10, 2)
INSERT [dbo].[KHOADAOTAO] ([MaLopDT], [KhoaHoc], [NamKy], [NVTroLy], [NgayKhaiGiang], [NgayThiTN], [SiSo], [DaDangKy]) VALUES (N'LDT003', N'MKH003', N'2021-1', N'MNV002', CAST(N'2021-01-15' AS Date), CAST(N'2021-05-15' AS Date), 10, 0)
GO
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [CCVB], [TenKhoaHoc], [MoTa], [SoNHP], [SoHocPhan]) VALUES (N'MKH001', N'CCVB001', N'Khóa đào tạo Kỹ thuật viên', N'Nhiều nhóm học phần đào tạo các loại kỹ thuật viên khác nhau (lập trình, phân tích, thiết kế...), hoàn thành nhóm học phần được cấp chứng chỉ tương ứng. Sau khi hoàn thành khóa học được cấp một văn bằng Kỹ thuật viên.', 3, 6)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [CCVB], [TenKhoaHoc], [MoTa], [SoNHP], [SoHocPhan]) VALUES (N'MKH002', N'CCVB002', N'Khóa đào tạo Chứng chỉ tin học A', N'Nhóm học phần Chứng chỉ A gồm 3 môn học phần, hoàn thành khóa học được cấp Chứng chỉ tin học A.', 1, 3)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [CCVB], [TenKhoaHoc], [MoTa], [SoNHP], [SoHocPhan]) VALUES (N'MKH003', N'CCVB003', N'Khóa đào tạo Chứng chỉ tin học B', N'Nhóm học phần Chứng chỉ B gồm 3 môn học phần như Chứng chỉ A, hoàn thành 2/3 học phần trong khóa học được cấp Chứng chỉ tin học A.', 1, 3)
GO
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT001', N'MLH001', CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT002', N'MLH002', CAST(N'2021-05-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT003', N'MLH003', CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT004', N'MLH004', CAST(N'2021-05-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT005', N'MLH005', CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT006', N'MLH006', CAST(N'2021-05-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT007', N'MLH007', CAST(N'2021-04-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT008', N'MLH008', CAST(N'2021-04-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT009', N'MLH009', CAST(N'2021-04-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT010', N'MLH010', CAST(N'2021-05-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT011', N'MLH011', CAST(N'2021-05-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT012', N'MLH012', CAST(N'2021-05-01' AS Date), 1)
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi], [LanThi]) VALUES (N'MLT013', N'MLH005', CAST(N'2021-07-04' AS Date), 2)
GO
INSERT [dbo].[LOPCHUYENDE] ([MaLopCD], [ChuyenDe], [NamKy], [NVTroLy], [NgayHoc], [SiSo], [DaDangKy]) VALUES (N'LCD001', N'MCD001', N'2021-1', N'MNV001', CAST(N'2021-03-01' AS Date), 12, 0)
INSERT [dbo].[LOPCHUYENDE] ([MaLopCD], [ChuyenDe], [NamKy], [NVTroLy], [NgayHoc], [SiSo], [DaDangKy]) VALUES (N'LCD002', N'MCD002', N'2021-1', N'MNV002', CAST(N'2021-04-01' AS Date), 10, 1)
INSERT [dbo].[LOPCHUYENDE] ([MaLopCD], [ChuyenDe], [NamKy], [NVTroLy], [NgayHoc], [SiSo], [DaDangKy]) VALUES (N'LCD003', N'MCD003', N'2021-1', N'MNV002', CAST(N'2021-05-01' AS Date), 10, 0)
GO
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH001', N'2021-1', N'MHP001', N'MNV003', N'20g00 thứ 2 từ ngày 15/01/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH002', N'2021-1', N'MHP002', N'MNV004', N'20g00 thứ 2 từ ngày 15/03/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH003', N'2021-1', N'MHP003', N'MNV005', N'20g00 thứ 4 từ ngày 15/01/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH004', N'2021-1', N'MHP004', N'MNV006', N'20g00 thứ 4 từ ngày 15/03/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH005', N'2021-1', N'MHP005', N'MNV003', N'20g00 thứ 6 từ ngày 15/01/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH006', N'2021-1', N'MHP006', N'MNV004', N'20g00 thứ 6 từ ngày 15/03/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH007', N'2021-1', N'MHP007', N'MNV005', N'20g00 thứ 3 từ ngày 15/01/2021', 10, 1)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH008', N'2021-1', N'MHP008', N'MNV006', N'20g00 thứ 5 từ ngày 15/01/2021', 10, 1)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH009', N'2021-1', N'MHP009', N'MNV003', N'20g00 th? 7 t? ngày 15/01/2021', 10, 1)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH010', N'2021-1', N'MHP010', N'MNV004', N'20g00 thứ 3 từ ngày 01/03/2021', 10, 0)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH011', N'2021-1', N'MHP011', N'MNV005', N'20g00 thứ 5 từ ngày 01/03/2021', 10, 0)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH012', N'2021-1', N'MHP012', N'MNV006', N'20g00 thứ 7 từ ngày 01/03/2021', 10, 0)
GO
INSERT [dbo].[NAMKY] ([NamKy], [BatDau], [KetThuc], [MucHocPhi]) VALUES (N'2021-1', CAST(N'2021-01-01' AS Date), CAST(N'2021-06-30' AS Date), 250000)
INSERT [dbo].[NAMKY] ([NamKy], [BatDau], [KetThuc], [MucHocPhi]) VALUES (N'2021-2', CAST(N'2021-07-01' AS Date), CAST(N'2021-12-31' AS Date), 260000)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV001', N'MPB001', N'123456', N'Ngô Quang Huy', N'Nam', N'nqhuy@gmail.com', N'0905123456')
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV002', N'MPB001', N'123456', N'Nguyễn Thị Hoa', N'Nữ', N'nthoa@gmail.com', N'0905782305')
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV003', N'MPB002', N'123456', N'Mai Khánh Huyền', N'Nữ', N'mkhuyen@gmail.com', N'0905354609')
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV004', N'MPB002', N'123456', N'Trần Thái Đăng Khoa', N'Nam', N'ttdkhoa@gmail.com', N'0905458094')
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV005', N'MPB002', N'123456', N'Dương Minh Tâm', N'Nam', N'dmtam@gmail.com', N'0905267876')
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV006', N'MPB002', N'123456', N'Lâm Ngọc Anh Duy', N'Nam', N'lnaduy@gmail.com', N'0905900897')
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV007', N'MPB003', N'123456', N'Nguyễn Đặng Hồng Huy', N'Nam', N'ndhhuy@gmail.com', N'0905998799')
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV008', N'MPB003', N'123456', N'Nguyễn Lệ Hằng', N'Nữ', N'nlhang@gmail.com', N'0905090087')
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV009', N'MPB004', N'123456', N'Đinh Thị Minh Hiếu', N'Nữ', N'dtmhieu@gmail.com', N'0905564532')
INSERT [dbo].[NHANVIEN] ([MaNV], [PhongBan], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MNV010', N'MPB004', N'123456', N'Trần Thị Mai', N'Nữ', N'ttmai@gmail.com', N'0905713958')
GO
INSERT [dbo].[NHOMHOCPHAN] ([MaNhomHP], [KhoaHoc], [CCVB], [TenNhomHP], [SoHocPhan]) VALUES (N'NHP001', N'MKH001', N'CCVB004', N'Lập trình', 2)
INSERT [dbo].[NHOMHOCPHAN] ([MaNhomHP], [KhoaHoc], [CCVB], [TenNhomHP], [SoHocPhan]) VALUES (N'NHP002', N'MKH001', N'CCVB005', N'Phân tích thiêt kế', 2)
INSERT [dbo].[NHOMHOCPHAN] ([MaNhomHP], [KhoaHoc], [CCVB], [TenNhomHP], [SoHocPhan]) VALUES (N'NHP003', N'MKH001', N'CCVB006', N'Tin học văn phòng', 2)
INSERT [dbo].[NHOMHOCPHAN] ([MaNhomHP], [KhoaHoc], [CCVB], [TenNhomHP], [SoHocPhan]) VALUES (N'NHP004', N'MKH002', N'CCVB002', N'Tin học văn phòng A', 3)
INSERT [dbo].[NHOMHOCPHAN] ([MaNhomHP], [KhoaHoc], [CCVB], [TenNhomHP], [SoHocPhan]) VALUES (N'NHP005', N'MKH003', N'CCVB003', N'Tin học văn phòng B', 3)
GO
INSERT [dbo].[PHONGBAN] ([MaPhongBan], [TenPhongBan], [GhiChu]) VALUES (N'MPB001', N'Phòng trợ lý khóa học', N'Phụ trách lên lịch học lịch thi cho các lớp đào tạo của các khóa học.')
INSERT [dbo].[PHONGBAN] ([MaPhongBan], [TenPhongBan], [GhiChu]) VALUES (N'MPB002', N'Phòng chuyên môn', N'Phụ trách giảng dạy và đào tạo cho học viên.')
INSERT [dbo].[PHONGBAN] ([MaPhongBan], [TenPhongBan], [GhiChu]) VALUES (N'MPB003', N'Phòng đào tạo', N'Phụ trách đánh giá và cấp chứng chỉ văn bằng cho học viên.')
INSERT [dbo].[PHONGBAN] ([MaPhongBan], [TenPhongBan], [GhiChu]) VALUES (N'MPB004', N'Phòng tài vụ', N'Phụ trách tính học phí và thu học phí học viên.')
GO
ALTER TABLE [dbo].[HOCVIEN] ADD  CONSTRAINT [MaHocVien]  DEFAULT ([dbo].[AUTO_IDHOCVIEN]()) FOR [MaHocVien]
GO
ALTER TABLE [dbo].[LICHTHI] ADD  CONSTRAINT [MaLichThi]  DEFAULT ([dbo].[AUTO_IDLICHTHI]()) FOR [MaLichThi]
GO
ALTER TABLE [dbo].[DANGKYHOCPHAN]  WITH CHECK ADD  CONSTRAINT [FK_DKHP_HV] FOREIGN KEY([HocVien])
REFERENCES [dbo].[HOCVIEN] ([MaHocVien])
GO
ALTER TABLE [dbo].[DANGKYHOCPHAN] CHECK CONSTRAINT [FK_DKHP_HV]
GO
ALTER TABLE [dbo].[DANGKYHOCPHAN]  WITH CHECK ADD  CONSTRAINT [FK_DKHP_LH] FOREIGN KEY([LopHoc])
REFERENCES [dbo].[LOPHOC] ([MaLopHoc])
GO
ALTER TABLE [dbo].[DANGKYHOCPHAN] CHECK CONSTRAINT [FK_DKHP_LH]
GO
ALTER TABLE [dbo].[DANHGIAKHOAHOC]  WITH CHECK ADD  CONSTRAINT [FK_DGKH_HV] FOREIGN KEY([HocVien])
REFERENCES [dbo].[HOCVIEN] ([MaHocVien])
GO
ALTER TABLE [dbo].[DANHGIAKHOAHOC] CHECK CONSTRAINT [FK_DGKH_HV]
GO
ALTER TABLE [dbo].[DANHGIAKHOAHOC]  WITH CHECK ADD  CONSTRAINT [FK_DGKH_KH] FOREIGN KEY([KhoaHoc])
REFERENCES [dbo].[KHOAHOC] ([MaKhoaHoc])
GO
ALTER TABLE [dbo].[DANHGIAKHOAHOC] CHECK CONSTRAINT [FK_DGKH_KH]
GO
ALTER TABLE [dbo].[DANHGIANHP]  WITH CHECK ADD  CONSTRAINT [FK_DGNHP_HV] FOREIGN KEY([HocVien])
REFERENCES [dbo].[HOCVIEN] ([MaHocVien])
GO
ALTER TABLE [dbo].[DANHGIANHP] CHECK CONSTRAINT [FK_DGNHP_HV]
GO
ALTER TABLE [dbo].[DANHGIANHP]  WITH CHECK ADD  CONSTRAINT [FK_DGNHP_NHP] FOREIGN KEY([NhomHocPhan])
REFERENCES [dbo].[NHOMHOCPHAN] ([MaNhomHP])
GO
ALTER TABLE [dbo].[DANHGIANHP] CHECK CONSTRAINT [FK_DGNHP_NHP]
GO
ALTER TABLE [dbo].[DIEMTHI]  WITH CHECK ADD  CONSTRAINT [FK_DT_DKHP] FOREIGN KEY([HocVien], [LopHoc])
REFERENCES [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc])
GO
ALTER TABLE [dbo].[DIEMTHI] CHECK CONSTRAINT [FK_DT_DKHP]
GO
ALTER TABLE [dbo].[DIEMTHI]  WITH CHECK ADD  CONSTRAINT [FK_DT_LT] FOREIGN KEY([LichThi])
REFERENCES [dbo].[LICHTHI] ([MaLichThi])
GO
ALTER TABLE [dbo].[DIEMTHI] CHECK CONSTRAINT [FK_DT_LT]
GO
ALTER TABLE [dbo].[HOCPHAN]  WITH CHECK ADD  CONSTRAINT [FK_HP_NHP] FOREIGN KEY([NhomHocPhan])
REFERENCES [dbo].[NHOMHOCPHAN] ([MaNhomHP])
GO
ALTER TABLE [dbo].[HOCPHAN] CHECK CONSTRAINT [FK_HP_NHP]
GO
ALTER TABLE [dbo].[HOCVIEN_KDT]  WITH CHECK ADD  CONSTRAINT [FK_HVKDT_HV] FOREIGN KEY([HocVien])
REFERENCES [dbo].[HOCVIEN] ([MaHocVien])
GO
ALTER TABLE [dbo].[HOCVIEN_KDT] CHECK CONSTRAINT [FK_HVKDT_HV]
GO
ALTER TABLE [dbo].[HOCVIEN_KDT]  WITH CHECK ADD  CONSTRAINT [FK_HVKDT_LDT] FOREIGN KEY([LopDaoTao])
REFERENCES [dbo].[KHOADAOTAO] ([MaLopDT])
GO
ALTER TABLE [dbo].[HOCVIEN_KDT] CHECK CONSTRAINT [FK_HVKDT_LDT]
GO
ALTER TABLE [dbo].[HOCVIEN_LCD]  WITH CHECK ADD  CONSTRAINT [FK_HVLCD_HV] FOREIGN KEY([HocVien])
REFERENCES [dbo].[HOCVIEN] ([MaHocVien])
GO
ALTER TABLE [dbo].[HOCVIEN_LCD] CHECK CONSTRAINT [FK_HVLCD_HV]
GO
ALTER TABLE [dbo].[HOCVIEN_LCD]  WITH CHECK ADD  CONSTRAINT [FK_HVLCD_LCD] FOREIGN KEY([LopChuyenDe])
REFERENCES [dbo].[LOPCHUYENDE] ([MaLopCD])
GO
ALTER TABLE [dbo].[HOCVIEN_LCD] CHECK CONSTRAINT [FK_HVLCD_LCD]
GO
ALTER TABLE [dbo].[KHOADAOTAO]  WITH CHECK ADD  CONSTRAINT [FK_KDT_KH] FOREIGN KEY([KhoaHoc])
REFERENCES [dbo].[KHOAHOC] ([MaKhoaHoc])
GO
ALTER TABLE [dbo].[KHOADAOTAO] CHECK CONSTRAINT [FK_KDT_KH]
GO
ALTER TABLE [dbo].[KHOADAOTAO]  WITH CHECK ADD  CONSTRAINT [FK_KDT_NK] FOREIGN KEY([NamKy])
REFERENCES [dbo].[NAMKY] ([NamKy])
GO
ALTER TABLE [dbo].[KHOADAOTAO] CHECK CONSTRAINT [FK_KDT_NK]
GO
ALTER TABLE [dbo].[KHOADAOTAO]  WITH CHECK ADD  CONSTRAINT [FK_KDT_NV] FOREIGN KEY([NVTroLy])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[KHOADAOTAO] CHECK CONSTRAINT [FK_KDT_NV]
GO
ALTER TABLE [dbo].[KHOAHOC]  WITH CHECK ADD  CONSTRAINT [FK_KH_CCVB] FOREIGN KEY([CCVB])
REFERENCES [dbo].[CHUNGCHIVANBANG] ([MaCCVB])
GO
ALTER TABLE [dbo].[KHOAHOC] CHECK CONSTRAINT [FK_KH_CCVB]
GO
ALTER TABLE [dbo].[LICHTHI]  WITH CHECK ADD  CONSTRAINT [FK_LT_LH] FOREIGN KEY([LopHoc])
REFERENCES [dbo].[LOPHOC] ([MaLopHoc])
GO
ALTER TABLE [dbo].[LICHTHI] CHECK CONSTRAINT [FK_LT_LH]
GO
ALTER TABLE [dbo].[LOPCHUYENDE]  WITH CHECK ADD  CONSTRAINT [FK_LCD_CD] FOREIGN KEY([ChuyenDe])
REFERENCES [dbo].[CHUYENDE] ([MaChuyenDe])
GO
ALTER TABLE [dbo].[LOPCHUYENDE] CHECK CONSTRAINT [FK_LCD_CD]
GO
ALTER TABLE [dbo].[LOPCHUYENDE]  WITH CHECK ADD  CONSTRAINT [FK_LCD_NK] FOREIGN KEY([NamKy])
REFERENCES [dbo].[NAMKY] ([NamKy])
GO
ALTER TABLE [dbo].[LOPCHUYENDE] CHECK CONSTRAINT [FK_LCD_NK]
GO
ALTER TABLE [dbo].[LOPCHUYENDE]  WITH CHECK ADD  CONSTRAINT [FK_LCD_NV] FOREIGN KEY([NVTroLy])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[LOPCHUYENDE] CHECK CONSTRAINT [FK_LCD_NV]
GO
ALTER TABLE [dbo].[LOPHOC]  WITH CHECK ADD  CONSTRAINT [FK_LH_HP] FOREIGN KEY([HocPhan])
REFERENCES [dbo].[HOCPHAN] ([MaHocPhan])
GO
ALTER TABLE [dbo].[LOPHOC] CHECK CONSTRAINT [FK_LH_HP]
GO
ALTER TABLE [dbo].[LOPHOC]  WITH CHECK ADD  CONSTRAINT [FK_LH_NV] FOREIGN KEY([NVChuyenMon])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[LOPHOC] CHECK CONSTRAINT [FK_LH_NV]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NV_PB] FOREIGN KEY([PhongBan])
REFERENCES [dbo].[PHONGBAN] ([MaPhongBan])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NV_PB]
GO
ALTER TABLE [dbo].[NHOMHOCPHAN]  WITH CHECK ADD  CONSTRAINT [FK_NHP_CCVB] FOREIGN KEY([CCVB])
REFERENCES [dbo].[CHUNGCHIVANBANG] ([MaCCVB])
GO
ALTER TABLE [dbo].[NHOMHOCPHAN] CHECK CONSTRAINT [FK_NHP_CCVB]
GO
ALTER TABLE [dbo].[NHOMHOCPHAN]  WITH CHECK ADD  CONSTRAINT [FK_NHP_KH] FOREIGN KEY([KhoaHoc])
REFERENCES [dbo].[KHOAHOC] ([MaKhoaHoc])
GO
ALTER TABLE [dbo].[NHOMHOCPHAN] CHECK CONSTRAINT [FK_NHP_KH]
GO
/****** Object:  StoredProcedure [dbo].[SP_ALL_LDT]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_ALL_LDT] @NAMKY NVARCHAR(20) AS
BEGIN
	SELECT NAMKY, MALOPDT, TENKHOAHOC 
	FROM DBO.KHOADAOTAO L, DBO.KHOAHOC K
	WHERE L.KhoaHoc = K.MaKhoaHoc AND L.NamKy = @NAMKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BANGDIEM]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_BANGDIEM] @MAHV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN
	SELECT MaLopHoc, TenHocPhan,  NgayThi, DiemThiHP
	FROM DBO.DIEMTHI, DBO.LICHTHI, DBO.LOPHOC, DBO.HOCPHAN
	WHERE DIEMTHI.HocVien = @MAHV 
		AND DIEMTHI.LichThi = LICHTHI.MaLichThi
		AND LICHTHI.LopHoc = LOPHOC.MaLopHoc
		AND LOPHOC.HocPhan = HOCPHAN.MaHocPhan
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BANGDIEM_KHOAHOC]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_BANGDIEM_KHOAHOC] @MAHV NVARCHAR(20), @KHOAHOC NVARCHAR(20) AS
BEGIN
	SELECT distinct NhomHocPhan, TenHocPhan, DiemThiHP, LanThi
	FROM DANHGIAKHOAHOC D, HOCVIEN H, KHOAHOC O, NHOMHOCPHAN N, HOCPHAN P, LOPHOC l, DANGKYHOCPHAN k, LICHTHI t, diemthi dt
	WHERE D.HocVien = H.MaHocVien AND D.KhoaHoc = O.MaKhoaHoc 
	AND o.MaKhoaHoc = n.KhoaHoc and n.MaNhomHP = p.NhomHocPhan 
	and p.MaHocPhan = l.HocPhan and l.MaLopHoc = k.LopHoc and k.HocVien = h.MaHocVien and  t.LopHoc = l.MaLopHoc
	and k.LopHoc = l.MaLopHoc and dt.HocVien = k.HocVien and dt.LopHoc = k.LopHoc and dt.LichThi = t.MaLichThi
	and dt.HocVien = @MAHV and o.MaKhoaHoc = @KHOAHOC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BANGDIEMTN]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_BANGDIEMTN] @MAHV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN 
	SELECT MaLopDT, TenKhoaHoc, NgayThiTN, DiemTotNghiep
	FROM DBO.HOCVIEN_KDT, DBO.KHOADAOTAO, DBO.KHOAHOC
	WHERE HOCVIEN_KDT.LopDaoTao = KHOADAOTAO.MaLopDT 
		AND KHOADAOTAO.KhoaHoc = KHOAHOC.MaKhoaHoc
		AND HOCVIEN_KDT.HocVien = @MAHV AND KHOADAOTAO.NamKy = @NAMKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CAPNHATDIEMTHIHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[SP_CAPNHATDIEMTHIHP] 
	@MAHV NVARCHAR(20), 
	@MALT NVARCHAR(20), 
	@MALH NVARCHAR(20), 
	@DIEM FLOAT
AS
BEGIN
	DECLARE @DAT NVARCHAR(20);
	IF (@DIEM >= 5)
	BEGIN
		SET @DAT = N'Đạt'
	END
	ELSE
	BEGIN
		SET @DAT = N'Không đạt'
	END

	UPDATE DBO.DIEMTHI
	SET DiemThiHP = @DIEM, Dat = @DAT
	WHERE HocVien = @MAHV AND LopHoc = @MALH AND LichThi = @MALT	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CAPNHATDIEMTN]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[SP_CAPNHATDIEMTN] @MAHV NVARCHAR(20), @MALDT NVARCHAR(20), @DIEM FLOAT
AS
BEGIN
	UPDATE DBO.HOCVIEN_KDT
	SET DiemTotNghiep = @DIEM
	WHERE HocVien = @MAHV AND LopDaoTao = @MALDT
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CAPNHATLICHTHI]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_CAPNHATLICHTHI] @MALT NVARCHAR(20), @NGAYTHI DATE
AS
BEGIN
	UPDATE DBO.LICHTHI
	SET NgayThi = @NGAYTHI
	WHERE MaLichThi = @MALT
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CAPNHATLTTN]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_CAPNHATLTTN] @MALDT NVARCHAR(20), @NGAYTHI NVARCHAR(20)
AS
BEGIN
	UPDATE DBO.KHOADAOTAO
	SET NgayThiTN = @NGAYTHI
	WHERE MaLopDT = @MALDT
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DANGNHAP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DANGNHAP] @TENDN NVARCHAR(100), @MATKHAU NVARCHAR(20), @TYPE INT OUT
AS
BEGIN
	IF EXISTS (SELECT * FROM DBO.DANGNHAP WHERE Email = @TENDN AND MatKhau = @MATKHAU)
	BEGIN
		PRINT(N'Success');
		IF EXISTS (SELECT * FROM DBO.HOCVIEN WHERE EMAIL = @TENDN)
		BEGIN
			SET @TYPE = 0 --HocVien
		END
		ELSE
		BEGIN
			IF EXISTS (SELECT * FROM DBO.NHANVIEN WHERE EMAIL = @TENDN AND PHONGBAN = 'MPB001')
			BEGIN
				SET @TYPE = 1 --TroLy
			END
			ELSE IF EXISTS (SELECT * FROM DBO.NHANVIEN WHERE EMAIL = @TENDN AND PHONGBAN = 'MPB002')
			BEGIN
				SET @TYPE = 2 --ChuyenMon
			END
			ELSE IF EXISTS (SELECT * FROM DBO.NHANVIEN WHERE EMAIL = @TENDN AND PHONGBAN = 'MPB003')
			BEGIN
				SET @TYPE = 3 --PhongDaoTao
			END
			ELSE IF EXISTS (SELECT * FROM DBO.NHANVIEN WHERE EMAIL = @TENDN AND PHONGBAN = 'MPB004')
			BEGIN
				SET @TYPE = 4 --TaiVu
			END
		END
	END
	ELSE
	BEGIN
		RAISERROR('Failed',16,1);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DANHGIA_KHOAHOC]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DANHGIA_KHOAHOC] @MAHV NVARCHAR(20), @KH NVARCHAR(20) AS
BEGIN
	DECLARE @SOHPHOC INT;
	DECLARE @SOHPDAT INT;
	DECLARE @SOHP INT;
	DECLARE @DIEMTHI FLOAT;

	SELECT @SOHP = SoHocPhan FROM KHOAHOC WHERE MaKhoaHoc = @KH

	SELECT @SOHPHOC = SUM(D.SoHPDaHoc)
	FROM KHOAHOC K, NHOMHOCPHAN N, DANHGIANHP D
	WHERE K.MaKhoaHoc = N.KhoaHoc AND N.MaNhomHP = D.NhomHocPhan AND D.HocVien = @MAHV

	SELECT @SOHPDAT = SUM(D.SoHPDaDat)
	FROM KHOAHOC K, NHOMHOCPHAN N, DANHGIANHP D
	WHERE K.MaKhoaHoc = N.KhoaHoc AND N.MaNhomHP = D.NhomHocPhan AND D.HocVien =@MAHV

	UPDATE DANHGIAKHOAHOC
	SET SoHPDaHoc = @SOHPHOC, SoHPDaDat = @SOHPDAT
	WHERE KhoaHoc = @KH AND HocVien = @MAHV

	SELECT @DIEMTHI =  DiemTotNghiep
	FROM HOCVIEN_KDT H, KHOADAOTAO K, KHOAHOC KH
	WHERE H.HocVien = @MAHV AND H.LopDaoTao = k.MaLopDT AND K.KhoaHoc = KH.MaKhoaHoc
	AND KH.MaKhoaHoc = @KH

	IF(@SOHPDAT = @SOHP AND @DIEMTHI >= 5)
	BEGIN
		UPDATE DANHGIAKHOAHOC
		SET CapCCVB = N'Đạt'
		WHERE HocVien = @MAHV AND KhoaHoc = @KH
	END
	ELSE
	BEGIN
		UPDATE DANHGIAKHOAHOC
		SET CapCCVB = N'Không'
		WHERE HocVien = @MAHV AND KhoaHoc = @KH
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DANHGIA_NHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DANHGIA_NHP] @MAHV NVARCHAR(20), @NHP NVARCHAR(20) AS
BEGIN
	DECLARE @SOHPHOC INT;
	DECLARE @SOHPDAT INT;
	DECLARE @GPA FLOAT;
	DECLARE @SOHP_NHP INT;

	SELECT @SOHP_NHP = SoHocPhan FROM NHOMHOCPHAN WHERE MaNhomHP = @NHP

	SELECT @SOHPHOC = COUNT(*)
	FROM DANGKYHOCPHAN D, LOPHOC L, HOCPHAN H
	WHERE D.HocVien = @MAHV AND D.LopHoc = L.MalopHoc 
	AND L.HocPhan = H.MaHocPhan AND H.NhomHocPhan = @NHP 

	SELECT @SOHPDAT = COUNT(*)
	FROM DANGKYHOCPHAN D, LOPHOC L, HOCPHAN H, DIEMTHI T, LICHTHI LT
	WHERE D.HocVien = @MAHV AND D.LopHoc = L.MalopHoc 
	AND L.HocPhan = H.MaHocPhan AND H.NhomHocPhan = @NHP 
	AND D.HocVien = T.HocVien AND D.LopHoc = T.LopHoc AND T.DiemThiHP >= 5
	AND T.LichThi = LT.MaLichThi AND D.SoLanDaThi = LT.LanThi

	SELECT @GPA = AVG(T.DiemThiHP)
	FROM DANGKYHOCPHAN D, LOPHOC L, HOCPHAN H, DIEMTHI T, LICHTHI LT
	WHERE D.HocVien = @MAHV AND D.LopHoc = L.MalopHoc 
	AND L.HocPhan = H.MaHocPhan AND H.NhomHocPhan = @NHP 
	AND D.HocVien = T.HocVien AND D.LopHoc = T.LopHoc 
	AND T.LichThi = LT.MaLichThi AND D.SoLanDaThi = LT.LanThi

	UPDATE DANHGIANHP
	SET SoHPDaHoc = @SOHPHOC, SoHPDaDat = @SoHPDat, DiemTrungBinh = @GPA
	WHERE HocVien = @MAHV AND NhomHocPhan = @NHP

	IF(@SOHPHOC = @SOHP_NHP AND @GPA >= 5)
	BEGIN
		UPDATE DANHGIANHP
		SET CapCCVB = N'Đạt'
		WHERE HocVien = @MAHV AND NhomHocPhan = @NHP
	END
	ELSE
	BEGIN
		UPDATE DANHGIANHP
		SET CapCCVB = N'Không'
		WHERE HocVien = @MAHV AND NhomHocPhan = @NHP
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_danhsach_HV]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_danhsach_HV] @MaLopHoc nvarchar(20)
AS
BEGIN
	SELECT hv.MaHocVien, hv.HoTen, hv.GioiTinh, hv.Email, hv.SoDienThoai
	FROM HOCVIEN hv, DANGKYHOCPHAN dkhp
	WHERE hv.MaHocVien = dkhp.HocVien 
	AND dkhp.LopHoc = @MaLopHoc
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DANHSACH_HV_KH_CHUADAT]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DANHSACH_HV_KH_CHUADAT]
@namky NVARCHAR(20) 
AS
BEGIN
SELECT DISTINCT dgkh.HocVien,hv.HoTen,dgkh.KhoaHoc,kh.TenKhoaHoc, kh.SoHocPhan,hvkdt.DiemTotNghiep,dgkh.CapCCVB
FROM dbo.HOCVIEN_KDT hvkdt,dbo.HOCVIEN hv,dbo.KHOAHOC kh,dbo.KHOADAOTAO kdt,dbo.DANHGIAKHOAHOC dgkh
WHERE dgkh.HocVien = hv.MaHocVien
AND dgkh.KhoaHoc = kh.MaKhoaHoc
AND hvkdt.HocVien = hv.MaHocVien
AND hvkdt.LopDaoTao = kdt.MaLopDT
AND dgkh.CapCCVB != N'Đạt'
AND kdt.NamKy = @namky
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhsach_HV_NHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_danhsach_HV_NHP] AS
BEGIN
	SELECT D.HocVien, H.HoTen, N.MaNhomHP, N.TenNhomHP, D.SoHPDaHoc, D.SoHPDaDat, D.DiemTrungBinh, D.CapCCVB
	FROM DBO.DANHGIANHP D, DBO.HOCVIEN H, DBO.NHOMHOCPHAN N
	WHERE D.HocVien = H.MaHocVien AND D.NhomHocPhan = N.MaNhomHP
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DANHSACH_HV_NHP_CHUADAT]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DANHSACH_HV_NHP_CHUADAT]
@namky NVARCHAR(20) 
AS
BEGIN
SELECT DISTINCT dgnhp.HocVien,hv.HoTen,dgnhp.NhomHocPhan,nhp.TenNhomHP, nhp.SoHocPhan,dgnhp.DiemTrungBinh,dgnhp.CapCCVB
FROM dbo.HOCVIEN_KDT hvkdt,dbo.HOCVIEN hv,dbo.NHOMHOCPHAN nhp,dbo.KHOADAOTAO kdt,dbo.DANHGIANHP dgnhp
WHERE dgnhp.HocVien = hv.MaHocVien
AND dgnhp.NhomHocPhan = nhp.MaNhomHP
AND hvkdt.HocVien = hv.MaHocVien
AND hvkdt.LopDaoTao = kdt.MaLopDT
AND dgnhp.CapCCVB != N'Đạt'
AND kdt.NamKy = @namky
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhsach_HV_THP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_danhsach_HV_THP] @malt NVARCHAR(20)
AS
BEGIN
	SELECT lt.MaLichThi, lt.LopHoc, hv.MaHocVien, hv.HoTen, dt.DiemThiHP,dt.Dat
	FROM HOCVIEN hv, DIEMTHI dt, LICHTHI lt
	WHERE hv.MaHocVien = dt.HocVien
	AND dt.LichThi = lt.MaLichThi
	and lt.MaLichThi = @malt
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhsach_HV_TTN]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_danhsach_HV_TTN] @maldt NVARCHAR(20)
AS
BEGIN
	SELECT hvkdt.LopDaoTao, hvkdt.HocVien, hv.HoTen, dg.SoHPDaHoc, dg.SoHPDaDat, hvkdt.DiemTotNghiep 
	FROM HOCVIEN hv, HOCVIEN_KDT hvkdt, DANHGIAKHOAHOC dg, KHOAHOC kh, KHOADAOTAO kdt
	WHERE hv.MaHocVien = hvkdt.HocVien
	and hvkdt.LopDaoTao = kdt.MaLopDT
	and kdt.KhoaHoc = kh.MaKhoaHoc
	and kh.MaKhoaHoc = dg.KhoaHoc
	and hv.MaHocVien = dg.HocVien
	AND hvkdt.LopDaoTao = @maldt	
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhsach_LH]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_danhsach_LH] @nvchuyenmon NVARCHAR(20),@namky NVARCHAR(20)
AS
BEGIN
	SELECT lh.MaLopHoc, lh.NamKy, hp.TenHocPhan, lh.LichHoc, lh.SiSo, lh.DaDangKi
	FROM LOPHOC lh, HOCPHAN hp
	WHERE hp.MaHocPhan = lh.HocPhan AND 
	lh.NVChuyenMon = @nvchuyenmon AND lh.NamKy = @namky
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhsach_THP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_danhsach_THP] @nvchuyenmon NVARCHAR(20),@namky NVARCHAR(20)
AS
BEGIN
	SELECT lt.MaLichThi, lt.LopHoc, hp.TenHocPhan, lt.NgayThi, lt.LanThi
	FROM LICHTHI lt,LOPHOC lh, HOCPHAN hp
	WHERE lt.LopHoc = lh.MaLopHoc
	and lh.HocPhan = hp.MaHocPhan
	AND lh.NamKy = @namky
	AND lh.NVChuyenMon = @nvchuyenmon
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_danhsach_TTN]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_danhsach_TTN] @nvchuyenmon NVARCHAR(20),@namky NVARCHAR(20)
AS
BEGIN
	SELECT distinct  kdt.MaLopDT, kh.TenKhoaHoc, kdt.NgayKhaiGiang, kdt.NgayThiTN
	FROM KHOADAOTAO kdt, KHOAHOC kh,NHOMHOCPHAN nhp, HOCPHAN hp, LOPHOC lh
	WHERE kdt.KhoaHoc = kh.MaKhoaHoc
	AND kh.MaKhoaHoc = nhp.KhoaHoc
	AND nhp.MaNhomHP = hp.NhomHocPhan
	AND hp.MaHocPhan = lh.HocPhan
	AND lh.NamKy = @namky
	AND lh.NVChuyenMon = @nvchuyenmon
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DANHSACHKDT]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DANHSACHKDT]
@namky NVARCHAR(20) 
AS
BEGIN
SELECT MaLopDT,KH.TenKhoaHoc,NgayKhaiGiang
FROM dbo.KHOADAOTAO KDT, dbo.KHOAHOC KH
WHERE KDT.KhoaHoc = KH.MaKhoaHoc
AND KDT.NamKy = @namky 
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DANHSACHLOP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Chuc nang dang ky hoc phan
CREATE   PROCEDURE [dbo].[SP_DANHSACHLOP] @MAHV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN
	SELECT DISTINCT MaLopHoc, TenHocPhan, LichHoc, LOPHOC.SiSo, DaDangKi
	FROM DBO.LOPHOC, DBO.HOCPHAN, DBO.NHOMHOCPHAN, DBO.KHOADAOTAO, DBO.HOCVIEN_KDT
	WHERE LOPHOC.NamKy = @NAMKY AND LOPHOC.HocPhan = HOCPHAN.MaHocPhan
		AND HOCPHAN.NhomHocPhan = NHOMHOCPHAN.MaNhomHP
		AND NHOMHOCPHAN.KhoaHoc = KHOADAOTAO.KhoaHoc
		AND KHOADAOTAO.MaLopDT = HOCVIEN_KDT.LopDaoTao
		AND MaLopHoc NOT IN (SELECT LopHoc
				FROM DBO.DANGKYHOCPHAN
				WHERE DANGKYHOCPHAN.HocVien = @MAHV)
		AND HOCVIEN_KDT.LopDaoTao IN (SELECT LopDaoTao
				FROM DBO.HOCVIEN_KDT
				WHERE HOCVIEN_KDT.HocVien = @MAHV)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DEL_DGNHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_DEL_DGNHP] @MAHV NVARCHAR(20), @KHOAHOC NVARCHAR(20) AS
BEGIN
	DECLARE @MANHP NVARCHAR(20)

	DECLARE cursor_nhp CURSOR FOR 
	SELECT MaNhomHP
	FROM NHOMHOCPHAN
	WHERE KhoaHoc = @KHOAHOC

	OPEN cursor_nhp;

	FETCH NEXT FROM cursoR_nhp INTO @MANHP

	WHILE @@FETCH_STATUS = 0        
	BEGIN
		DELETE FROM DANHGIANHP
		WHERE HocVien = @MAHV AND NhomHocPhan = @MANHP
		FETCH NEXT FROM cursor_nhp INTO @MANHP
	END
	CLOSE cursor_nhp
	DEALLOCATE cursor_nhp      
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DEL_LDT]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DEL_LDT] 
	@MALDT NVARCHAR(20) AS
BEGIN
	DELETE FROM DBO.KHOADAOTAO
	WHERE MaLopDT = @MALDT
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DEL_LOPCD]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DEL_LOPCD] 
	@MALCD NVARCHAR(20) AS
BEGIN
	DELETE FROM LOPCHUYENDE
	WHERE MaLopCD = @MALCD
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DEL_LOPHOC]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DEL_LOPHOC] 
	@MALOPHOC NVARCHAR(20) AS
BEGIN
	DELETE FROM LOPHOC
	WHERE MaLopHoc = @MALOPHOC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DGKH]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DGKH] @MAHV NVARCHAR(20)
AS
BEGIN
	SELECT TenKhoaHoc, SoHocPhan, SoHPDaHoc, SoHPDaDat, CapCCVB, TenCCVN 
	FROM DBO.DANHGIAKHOAHOC, DBO.KHOAHOC, DBO.CHUNGCHIVANBANG
	WHERE HocVien = @MAHV AND DANHGIAKHOAHOC.KhoaHoc = KHOAHOC.MaKhoaHoc
		AND KHOAHOC.CCVB = CHUNGCHIVANBANG.MaCCVB
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DGNHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DGNHP] @MAHV NVARCHAR(20)
AS
BEGIN
	SELECT TenNhomHP, SoHocPhan, SoHPDaHoc, SoHPDaDat, DiemTrungBinh, CapCCVB, TenCCVN
	FROM DBO.DANHGIANHP, DBO.NHOMHOCPHAN, DBO.CHUNGCHIVANBANG
	WHERE DANHGIANHP.HocVien = @MAHV
		AND DANHGIANHP.NhomHocPhan = NHOMHOCPHAN.MaNhomHP
		AND NHOMHOCPHAN.CCVB = CHUNGCHIVANBANG.MaCCVB
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DIEMHOCPHAN_HV_KH]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DIEMHOCPHAN_HV_KH]
@mahocvien NVARCHAR(20),
@maKH NVARCHAR(20)
AS
BEGIN
SELECT DISTINCT hp.MaHocPhan,hp.TenHocPhan,lt.NgayThi,dt.DiemThiHP,dt.Dat
FROM dbo.DIEMTHI dt,dbo.LICHTHI lt,dbo.LOPHOC lh,dbo.HOCPHAN hp,dbo.NhomHocPhan nhp,dbo.KHOAHOC kh
WHERE 
dt.LichThi = lt.MaLichThi
AND dt.LopHoc = lt.LopHoc
AND dt.LopHoc =lh.MaLopHoc
AND hp.MaHocPhan = lh.HocPhan
AND nhp.MaNhomHP = hp.NhomHocPhan
AND nhp.KhoaHoc = kh.MaKhoaHoc
AND dt.HocVien = @mahocvien
AND kh.MaKhoaHoc = @maKH 
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DIEMHOCPHAN_HVNHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DIEMHOCPHAN_HVNHP]
@mahocvien NVARCHAR(20),
@maNHP NVARCHAR(20)
AS
BEGIN
SELECT DISTINCT hp.MaHocPhan,hp.TenHocPhan,lt.NgayThi,dt.DiemThiHP,dt.Dat
FROM dbo.HOCVIEN_KDT hvkdt,dbo.DANGKYHOCPHAN dkhp,dbo.DIEMTHI dt,dbo.LICHTHI lt,dbo.LOPHOC lh,dbo.HOCPHAN hp,dbo.NHOMHOCPHAN nhp
WHERE hvkdt.HocVien = dkhp.HocVien
AND dkhp.LopHoc = dt.LopHoc
AND dt.LichThi = lt.MaLichThi
AND hvkdt.HocVien = dt.HocVien
AND dt.LopHoc =lh.MaLopHoc
AND lh.HocPhan = hp.MaHocPhan
AND hp.NhomHocPhan = nhp.MaNhomHP
AND hvkdt.HocVien = @mahocvien
AND nhp.MaNhomHP = @maNHP
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DIEMTHI_NHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DIEMTHI_NHP] @MAHV NVARCHAR(20), @NHP NVARCHAR(20) AS
BEGIN
	SELECT H.TenHocPhan, D.DiemThiHP, T.LanThi
	FROM DBO.DIEMTHI D, DBO.LOPHOC L, DBO.HOCPHAN H, LICHTHI T
	WHERE D.HocVien = @MAHV AND D.LopHoc = L.MaLopHoc 
	AND L.HocPhan = H.MaHocPhan AND H.NhomHocPhan = @NHP AND D.LichThi = T.MaLichThi
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DKHOCVIEN]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_DKHOCVIEN] 
	@HOTEN NVARCHAR(100),
	@GIOITINH NVARCHAR(5), 
	@EMAIL NVARCHAR(100), 
	@SODIENTHOAI NVARCHAR(20),
	@MATKHAU NVARCHAR(20)
AS
BEGIN
	INSERT INTO DBO.HOCVIEN (MatKhau, HoTen, GioiTinh, Email, SoDienThoai)
	VALUES (@MATKHAU, @HOTEN, @GIOITINH, @EMAIL, @SODIENTHOAI)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DKHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_DKHP] @MAHV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN
	SELECT MaLopHoc, TenHocPhan, LichHoc, SiSo, DaDangKi
	FROM DBO.DANGKYHOCPHAN, DBO.LOPHOC, DBO.HOCPHAN, DBO.NHOMHOCPHAN, DBO.KHOAHOC
	WHERE LOPHOC.NamKy = @NAMKY AND LOPHOC.HocPhan = HOCPHAN.MaHocPhan
		AND HOCPHAN.NhomHocPhan = NHOMHOCPHAN.MaNhomHP 
		AND NHOMHOCPHAN.KhoaHoc = KHOAHOC.MaKhoaHoc
		AND DANGKYHOCPHAN.LopHoc = LOPHOC.MaLopHoc
		AND DANGKYHOCPHAN.HocVien = @MAHV		
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DKTHILAI]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DKTHILAI] @MAHV NVARCHAR(20), @MALT NVARCHAR(20)
AS
BEGIN
	DECLARE @MALH NVARCHAR(20)
	SET  @MALH = (SELECT LopHoc FROM DBO.LICHTHI WHERE MaLichThi = @MALT)
	INSERT INTO DBO.DIEMTHI
	VALUES (@MAHV, @MALH, @MALT, NULL, N'Không')
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DS_Danhgia_HV_NHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DS_Danhgia_HV_NHP]
@namky NVARCHAR(20) 
AS
BEGIN
SELECT DISTINCT dgnhp.HocVien,hv.HoTen,dgnhp.NhomHocPhan,nhp.TenNhomHP, nhp.SoHocPhan,dgnhp.DiemTrungBinh,dgnhp.CapCCVB
FROM dbo.HOCVIEN_KDT hvkdt,dbo.HOCVIEN hv,dbo.NHOMHOCPHAN nhp,dbo.KHOADAOTAO kdt,dbo.DANHGIANHP dgnhp
WHERE dgnhp.HocVien = hv.MaHocVien
AND dgnhp.NhomHocPhan = nhp.MaNhomHP
AND hvkdt.HocVien = hv.MaHocVien
AND hvkdt.LopDaoTao = kdt.MaLopDT
AND kdt.NamKy = @namky
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DS_Danhgia_HVKH]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_DS_Danhgia_HVKH]
AS
BEGIN
SELECT DISTINCT dgkh.HocVien,hv.HoTen,kh.MaKhoaHoc,kh.TenKhoaHoc, dgkh.SoHPDaHoc, dgkh.SoHPDaDat ,k.DiemTotNghiep, dgkh.CapCCVB
FROM dbo.HOCVIEN hv,dbo.KHOAHOC kh,dbo.DANHGIAKHOAHOC dgkh, dbo.HOCVIEN_KDT k, dbo.KHOADAOTAO d
WHERE dgkh.HocVien = hv.MaHocVien
AND dgkh.KhoaHoc = kh.MaKhoaHoc
and k.LopDaoTao =d.MaLopDT and d.KhoaHoc = kh.MaKhoaHoc
and hv.MaHocVien = k.HocVien 
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DS_LCD]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DS_LCD] @NAMKY NVARCHAR(20)AS
BEGIN
	SELECT D.NamKy, D.MaLopCD, K.TenChuyenDe, D.NgayHoc, D.SiSo, D.DaDangKy
	FROM LOPCHUYENDE D, CHUYENDE K
	WHERE D.ChuyenDe = K.MaChuyenDe AND D.NamKy = @NAMKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DS_LDT]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DS_LDT] @NAMKY NVARCHAR(20)AS
BEGIN
	SELECT D.NamKy, D.MaLopDT, K.TenKhoaHoc, D.NgayKhaiGiang, D.NgayThiTN, D.SiSo, D.DaDangKy
	FROM KHOADAOTAO D, KHOAHOC K
	WHERE D.KhoaHoc = K.MaKhoaHoc AND D.NamKy = @NAMKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DSCCVB_KH]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DSCCVB_KH]
AS
BEGIN
SELECT H.MaHocVien, H.HoTen, N.MaKhoaHoc, N.TenKhoaHoc, C.TenCCVN
FROM DANHGIAKHOAHOC D, HOCVIEN H, KHOAHOC N, CHUNGCHIVANBANG C
WHERE D.HocVien = H.MaHocVien AND D.KhoaHoc = N.MaKhoaHoc AND N.CCVB = C.MaCCVB AND D.CapCCVB = N'Đạt'
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DSCCVB_NHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DSCCVB_NHP]
AS
BEGIN
SELECT H.MaHocVien, H.HoTen, N.MaNhomHP, N.TenNhomHP, C.TenCCVN
FROM DANHGIANHP D, HOCVIEN H, NHOMHOCPHAN N, CHUNGCHIVANBANG C
WHERE D.HocVien = H.MaHocVien AND D.NhomHocPhan = N.MaNhomHP AND N.CCVB = C.MaCCVB AND D.CapCCVB = N'Đạt'
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DSDKCD]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DSDKCD] @MaHV NVARCHAR(20)
AS
BEGIN
	SELECT NamKy, MaLopCD, TenChuyenDe, MoTa, NgayGhiDanh
	FROM HOCVIEN_LCD, CHUYENDE, LOPCHUYENDE
	WHERE HOCVIEN_LCD.LopChuyenDe = LOPCHUYENDE.MaLopCD AND LOPCHUYENDE.ChuyenDe = CHUYENDE.MaChuyenDe
		AND HocVien = @MaHV;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DSDKKH]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DSDKKH] @MaHV NVARCHAR(20)
AS
BEGIN
	SELECT NamKy, LopDaoTao, TenKhoaHoc, NgayGhiDanh,  
		NgayKhaiGiang, NgayThiTN
	FROM HOCVIEN_KDT, KHOADAOTAO, KHOAHOC
	WHERE HOCVIEN_KDT.LopDaoTao = KHOADAOTAO.MaLopDT 
		AND KHOAHOC.MaKhoaHoc = KHOADAOTAO.KhoaHoc
		AND HocVien = @MaHV;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DSHOCVIEN]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DSHOCVIEN]
@lopDT NVARCHAR(20) 
AS
BEGIN
SELECT HV.MaHocVien, HV.HoTen, HV.GioiTinh,HV.SoDienThoai,HV.EMAIL
FROM dbo.HOCVIEN_KDT HVDT, dbo.HOCVIEN HV
WHERE HV.MaHocVien = HVDT.HocVien
AND LopDaoTao = @lopDT
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DSHP_TROLY]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DSHP_TROLY] @MANV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN
	SELECT LH.NamKy,  LH.MaLopHoc, HP.TenHocPhan
	FROM DBO.LOPHOC LH, DBO.HOCPHAN HP, DBO.NHOMHOCPHAN NH, DBO.KHOADAOTAO DT, DBO.NHANVIEN NV
	WHERE  LH.HocPhan = HP.MaHocPhan AND LH.NamKy = @NAMKY AND LH.NVChuyenMon = NV.MaNV
		AND HP.NhomHocPhan = NH.MaNhomHP AND NH.KhoaHoc = DT.KhoaHoc AND DT.NVTroLy = @MANV AND DT.NamKy = @NAMKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DSLICHHOC]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DSLICHHOC] @MANV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN
	SELECT L.NamKy, L.MaLopHoc, l.HocPhan, L.NVChuyenMon 'NVCM', L.LichHoc, l.SiSo, l.DaDangKi
	FROM DBO.LOPHOC L, DBO.HOCPHAN H, DBO.NHOMHOCPHAN N, DBO.KHOADAOTAO K
	WHERE L.HocPhan = H.MaHocPhan AND H.NhomHocPhan = N.MaNhomHP
		AND N.KhoaHoc = K.KhoaHoc AND K.NVTroLy = @MANV AND L.NamKy = @NAMKY AND L.NamKy = K.NamKy
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DSLOPCHUYENDE]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DSLOPCHUYENDE] @MANV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN
	SELECT NamKy, MaLopCD, MaChuyenDe 'MaCD', TenChuyenDe, NgayHoc, SiSo, DaDangKy
	FROM DBO.LOPCHUYENDE, DBO.CHUYENDE
	WHERE ChuyenDe = MaChuyenDe AND NVTroLy = @MANV AND NamKy = @NAMKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DSLOPDT]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_DSLOPDT] @MANV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN
	SELECT NamKy, MaLopDT, MaKhoaHoc, TenKhoaHoc, NgayKhaiGiang, SiSo, DaDangKy
	FROM DBO.KHOADAOTAO, DBO.KHOAHOC
	WHERE KhoaHoc = MaKhoaHoc AND NVTroLy = @MANV AND NamKy = @NAMKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HUYDKTHILAI]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_HUYDKTHILAI] @MAHV NVARCHAR(20), @MALT NVARCHAR(20)
AS
BEGIN
	DECLARE @MALH NVARCHAR(20)
	SET  @MALH = (SELECT LopHoc FROM DBO.LICHTHI WHERE MaLichThi = @MALT)
	DELETE DBO.DIEMTHI
	WHERE HocVien = @MAHV AND LopHoc = @MALH AND LichThi = @MALT
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HVDKHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_HVDKHP] @MAHV NVARCHAR(20), @MALH NVARCHAR(20)
AS
BEGIN
	INSERT INTO DBO.DANGKYHOCPHAN
	VALUES (@MAHV, @MALH, 0)
	DECLARE @DADK INT;
	SELECT @DADK = COUNT(*) FROM DBO.DANGKYHOCPHAN WHERE LopHoc = @MALH

	UPDATE DBO.LOPHOC
	SET DaDangKi = @DADK
	WHERE MaLopHoc = @MALH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HVHUYDKHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_HVHUYDKHP] @MAHV NVARCHAR(20), @MALH NVARCHAR(20)
AS
BEGIN

	DECLARE @MALT NVARCHAR(20)
	SELECT @MALT = MaLichThi FROM LICHTHI WHERE LopHoc = @MALH AND LanThi = 1
	DELETE DIEMTHI
	WHERE HocVien = @MAHV AND LopHoc = @MALH AND LichThi = @MALT

	DELETE DBO.DANGKYHOCPHAN
	WHERE HocVien = @MAHV AND LopHoc = @MALH

	DECLARE @DADK INT;
	SELECT @DADK = COUNT(*) FROM DBO.DANGKYHOCPHAN WHERE LopHoc = @MALH

	UPDATE DBO.LOPHOC
	SET DaDangKi = @DADK
	WHERE MaLopHoc = @MALH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_DGNHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_INS_DGNHP] @MAHV NVARCHAR(20), @KHOAHOC NVARCHAR(20) AS
BEGIN
	DECLARE @MANHP NVARCHAR(20)

	DECLARE cursor_nhp CURSOR FOR 
	SELECT MaNhomHP
	FROM NHOMHOCPHAN
	WHERE KhoaHoc = @KHOAHOC

	OPEN cursor_nhp;

	FETCH NEXT FROM cursoR_nhp INTO @MANHP

	WHILE @@FETCH_STATUS = 0        
	BEGIN
		INSERT INTO DANHGIANHP
		VALUES(@MAHV, @MANHP, NULL, NULL, NULL, NULL)
		FETCH NEXT FROM cursor_nhp INTO @MANHP
	END
	CLOSE cursor_nhp
	DEALLOCATE cursor_nhp 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_LDT]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_INS_LDT] 
	@MALDT NVARCHAR(20), @KHOAHOC NVARCHAR(20),
	@NAMKY NVARCHAR(20), @NVTROLY NVARCHAR(20),
	@NGAYKHAIGIANG DATE, @SISO INT AS
BEGIN
	INSERT INTO DBO.KHOADAOTAO 
	VALUES(@MALDT, @KHOAHOC, @NAMKY, @NVTROLY, @NGAYKHAIGIANG, null, @SISO, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_LOPCD]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_INS_LOPCD] 
	@MALCD NVARCHAR(20), @CHUYENDE NVARCHAR(20),
	@NAMKY NVARCHAR(20), @NVTL NVARCHAR(20),
	@NGAYHOC DATE, @SISO INT AS
BEGIN
	INSERT INTO LOPCHUYENDE
	VALUES(@MALCD, @CHUYENDE, @NAMKY, @NVTL, @NGAYHOC, @SISO, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_LOPHOC]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_INS_LOPHOC] 
	@MALOPHOC NVARCHAR(20), @NAMKY NVARCHAR(20),
	@HOCPHAN NVARCHAR(20), @NVCM NVARCHAR(20),
	@LICH NVARCHAR(100), @SISO INT AS
BEGIN
	INSERT INTO LOPHOC
	VALUES(@MALOPHOC, @NAMKY, @HOCPHAN, @NVCM, @LICH, @SISO, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_KTEMAIL]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_KTEMAIL] @EMAIL NVARCHAR(100)
AS
BEGIN
	IF EXISTS (SELECT * FROM DBO.HOCVIEN WHERE Email = @EMAIL)
	BEGIN
		RAISERROR(N'Email đã tồn tại.',16,1);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LICHTHIHP_TROLY]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_LICHTHIHP_TROLY] @MANV NVARCHAR(20), @NAMKY NVARCHAR(20), @MALH NVARCHAR(20)
AS
BEGIN
	IF (@MALH IS NOT NULL)
	BEGIN
		SELECT LH.NamKy, LT.MaLichThi, LT.LopHoc, HP.TenHocPhan, LT.NgayThi, LT.LanThi
		FROM DBO.LICHTHI LT, DBO.LOPHOC LH, DBO.HOCPHAN HP, DBO.NHOMHOCPHAN NH, DBO.KHOADAOTAO DT
		WHERE LT.LopHoc = LH.MaLopHoc AND LH.HocPhan = HP.MaHocPhan AND LH.NamKy = @NAMKY
			AND HP.NhomHocPhan = NH.MaNhomHP AND NH.KhoaHoc = DT.KhoaHoc AND DT.NVTroLy = @MANV 
			AND DT.NamKy = @NAMKY AND LH.MaLopHoc = @MALH
	END
	ELSE
	BEGIN
		SELECT LH.NamKy, LT.MaLichThi, LT.LopHoc, HP.TenHocPhan, LT.NgayThi, LT.LanThi
		FROM DBO.LICHTHI LT, DBO.LOPHOC LH, DBO.HOCPHAN HP, DBO.NHOMHOCPHAN NH, DBO.KHOADAOTAO DT
		WHERE LT.LopHoc = LH.MaLopHoc AND LH.HocPhan = HP.MaHocPhan AND LH.NamKy = @NAMKY
			AND HP.NhomHocPhan = NH.MaNhomHP AND NH.KhoaHoc = DT.KhoaHoc AND DT.NVTroLy = @MANV AND DT.NamKy = @NAMKY
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LICHTHILAI]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_LICHTHILAI] @MAHV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN
	SELECT MaLichThi, MaLopHoc, TenHocPhan, NgayThi
	FROM DBO.LICHTHI, DBO.LOPHOC, DBO.DANGKYHOCPHAN, DBO.HOCPHAN
	WHERE LOPHOC.NamKy = @NAMKY AND DANGKYHOCPHAN.HocVien = @MAHV
		AND DANGKYHOCPHAN.LopHoc = LOPHOC.MaLopHoc
		AND LOPHOC.MaLopHoc = LICHTHI.LopHoc
		AND LOPHOC.HocPhan = HOCPHAN.MaHocPhan
		AND MaLopHoc NOT IN (SELECT LopHoc
				FROM DBO.DIEMTHI
				WHERE DIEMTHI.HocVien = 'MHV001' 
					AND DIEMTHI.Dat = N'Đạt')
		AND MaLichThi NOT IN (SELECT LichThi
				FROM DBO.DIEMTHI
				WHERE DIEMTHI.HocVien = @MAHV AND DiemThiHP IS NOT NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LICHTHITN]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_LICHTHITN] @MANV NVARCHAR(20), @NAMKY NVARCHAR(20)
AS
BEGIN
	SELECT NamKy, MaLopDT, TenKhoaHoc, NgayThiTN
	FROM DBO.KHOADAOTAO, DBO.KHOAHOC
	WHERE NVTroLy = @MANV AND KhoaHoc = MaKhoaHoc AND NamKy = @NAMKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMDKCD]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_THEMDKCD] @MAHV NVARCHAR(20), @MALOPCD NVARCHAR(20)
AS
BEGIN
	INSERT INTO DBO.HOCVIEN_LCD
	VALUES (@MAHV, @MALOPCD, GETDATE());

	DECLARE @DADK INT;
	SELECT @DADK = COUNT(*) FROM DBO.HOCVIEN_LCD WHERE LopChuyenDe = @MALOPCD;

	DECLARE @SISO INT;
	SELECT @SISO = SISO FROM DBO.LOPCHUYENDE WHERE MaLopCD = @MALOPCD;

	IF(@DADK > @SISO)
	BEGIN
		RAISERROR(N'Khóa đào tạo đã đủ sỉ số. Không thể đăng ký khóa đào tạo.',16,1);
		DELETE DBO.HOCVIEN_KDT
		WHERE HocVien = @MAHV AND LopDaoTao = @MALOPCD;

		SELECT @DADK = COUNT(*) FROM DBO.HOCVIEN_LCD WHERE LopChuyenDe = @MALOPCD;
	END

	UPDATE DBO.LOPCHUYENDE
	SET DaDangKy = @DADK
	WHERE MaLopCD = @MALOPCD;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMDKKH]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_THEMDKKH] @MAHV NVARCHAR(20), @MALOPDT NVARCHAR(20)
AS
BEGIN
	INSERT INTO DBO.HOCVIEN_KDT
	VALUES (@MAHV, @MALOPDT, GETDATE(), 0, 0, 0, 0.0, N'Không');
	
	DECLARE @KH NVARCHAR(20)
	SET @KH = (SELECT KHOAHOC FROM DBO.KHOADAOTAO WHERE KHOADAOTAO.MaLopDT = @MALOPDT);

	INSERT INTO DBO.DANHGIAKHOAHOC
	VALUES (@MAHV, @KH, NULL, NULL, NULL)

	DECLARE @SQL NVARCHAR(MAX)
	SET @SQL = 'EXEC SP_INS_DGNHP ' + QUOTENAME(@MAHV)+ ', ' + QUOTENAME(@KH)
    EXEC (@SQL)

	DECLARE @DADK INT;
	SELECT @DADK = COUNT(*) FROM DBO.HOCVIEN_KDT WHERE LopDaoTao = @MALOPDT;

	DECLARE @SISO INT;
	SELECT @SISO = SISO FROM DBO.KHOADAOTAO WHERE MaLopDT = @MALOPDT;

	IF(@DADK > @SISO)
	BEGIN
		RAISERROR(N'Khóa đào tạo đã đủ sỉ số. Không thể đăng ký khóa đào tạo.',16,1);
		DELETE DBO.HOCVIEN_KDT
		WHERE HocVien = @MAHV AND LopDaoTao = @MALOPDT;

		DELETE DBO.DANHGIAKHOAHOC
		WHERE HocVien = @MAHV AND KhoaHoc = @KH;

		SELECT @DADK = COUNT(*) FROM DBO.HOCVIEN_KDT WHERE LopDaoTao = @MALOPDT;
	END

	UPDATE DBO.KHOADAOTAO
	SET DaDangKy = @DADK
	WHERE MaLopDT = @MALOPDT;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMLICHTHI]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_THEMLICHTHI] @MALH NVARCHAR(20), @NGAYTHI DATE
AS
BEGIN
	DECLARE @LANTHI INT;
	SELECT @LANTHI = COUNT(*) FROM DBO.LICHTHI WHERE LopHoc = @MALH;
	SET @LANTHI = @LANTHI + 1;
	IF (@LANTHI > 3)
	BEGIN
		RAISERROR(N'Không thể tổ chức thi học phần quá 3 lần',16,1);
	END
	ELSE
	BEGIN
		INSERT INTO DBO.LICHTHI (LopHoc, NgayThi, LanThi)
		VALUES (@MALH, @NGAYTHI, @LANTHI)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TINHTIENHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_TINHTIENHP] @MAHV NVARCHAR(20), @MALDT NVARCHAR(20)
AS
BEGIN
	DECLARE @MUCHP INT;
	SELECT @MUCHP = NAMKY.MucHocPhi FROM DBO.KHOADAOTAO, DBO.NAMKY WHERE MaLopDT = @MALDT AND KHOADAOTAO.NamKy = NAMKY.NamKy
	
	DECLARE @TONGHP INT;
	SELECT @TONGHP = TongSoHP FROM DBO.HOCVIEN_KDT WHERE HocVien = @MAHV AND LopDaoTao = @MALDT;
	
	DECLARE @HP INT;
	SET @HP = @MUCHP * @TONGHP;

	UPDATE DBO.HOCVIEN_KDT
	SET HocPhi = @HP
	WHERE HocVien = @MAHV AND LopDaoTao = @MALDT
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TINHTONGHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_TINHTONGHP] @MAHV NVARCHAR(20), @MALDT NVARCHAR(20)
AS
BEGIN
	DECLARE @TONGHP INT;
	SELECT @TONGHP = COUNT(*) FROM DBO.DANGKYHOCPHAN WHERE HocVien = @MAHV AND LopHoc IN (SELECT MaLopHoc FROM DBO.KHOADAOTAO D, DBO.KHOAHOC K, DBO.NHOMHOCPHAN N, DBO.HOCPHAN H, DBO.LOPHOC L
	WHERE D.KhoaHoc = K.MaKhoaHoc AND K.MaKhoaHoc = N.KhoaHoc AND N.MaNhomHP = H.NhomHocPhan 
	AND H.MaHocPhan = L.HocPhan AND MaLopDT = @MALDT);

	UPDATE DBO.HOCVIEN_KDT
	SET TongSoHP = @TONGHP
	WHERE HocVien = @MAHV AND LopDaoTao = @MALDT;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TTUSER]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_TTUSER] @EMAIL NVARCHAR(100), @HOTEN NVARCHAR(100) OUT, @ID NVARCHAR(20) OUT
AS
BEGIN
	IF EXISTS (SELECT * FROM DBO.DANGNHAP WHERE EMAIL = @EMAIL)
	BEGIN
		SET @HOTEN = (SELECT HOTEN FROM DBO.DANGNHAP WHERE EMAIL = @EMAIL)
		SET @ID = (SELECT ID FROM DBO.DANGNHAP WHERE EMAIL = @EMAIL)
	END
	ELSE
	BEGIN
		RAISERROR('Not Found',16,1);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPD_LDT]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_UPD_LDT] 
	@MALDT NVARCHAR(20), @KHOAHOC NVARCHAR(20),
	@NAMKY NVARCHAR(20), @NGAYKHAIGIANG DATE, @SISO INT AS
BEGIN
	UPDATE DBO.KHOADAOTAO 
	SET KhoaHoc = @KHOAHOC, NamKy = @NAMKY, NgayKhaiGiang = @NGAYKHAIGIANG, SiSo = @SISO
	WHERE MaLopDT = @MALDT
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPD_LOPCD]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_UPD_LOPCD] 
	@MALCD NVARCHAR(20), @CHUYENDE NVARCHAR(20),
	@NAMKY NVARCHAR(20), @NVTL NVARCHAR(20),
	@NGAYHOC DATE, @SISO INT AS
BEGIN
	UPDATE LOPCHUYENDE
	SET ChuyenDe = @CHUYENDE, NamKy = @NAMKY, NVTroLy = @NVTL, NgayHoc = @NGAYHOC, SiSo = @SISO
	WHERE MaLopCD =@MALCD
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPD_LOPHOC]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_UPD_LOPHOC] 
	@MALOPHOC NVARCHAR(20), @NAMKY NVARCHAR(20),
	@HOCPHAN NVARCHAR(20), @NVCM NVARCHAR(20),
	@LICH NVARCHAR(100), @SISO INT AS
BEGIN
	UPDATE LOPHOC
	SET  NamKy = @NAMKY, HocPhan = @HOCPHAN, NVChuyenMon = @NVCM, LichHoc = @LICH, SiSo = @SISO
	WHERE MaLopHoc = @MALOPHOC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_DAT_KH]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE  [dbo].[SP_UPDATE_DAT_KH]
@mahocvien NVARCHAR(20),
@maKH NVARCHAR(20)
AS 
BEGIN
DECLARE @sohocphandaDat INT;
DECLARE @sohocphan NVARCHAR(20);
DECLARE @DTN	FLOAT;
SET @sohocphan = (SELECT SoHocPhan FROM dbo.KHOAHOC WHERE MaKhoaHoc = @maKH)
SET @sohocphandaDat = (SELECT SoHPDaDat FROM dbo.DANHGIAKHOAHOC WHERE HocVien = @mahocvien AND KhoaHoc = @maKH)
SET @DTN = (SELECT DiemTotNghiep FROM dbo.HOCVIEN_KDT WHERE HocVien = @mahocvien)
	IF @sohocphandaDat =  @sohocphan and @DTN >= 5
		BEGIN
			UPDATE dbo.DANHGIAKHOAHOC
			SET CapCCVB = N'Đạt'
			WHERE HocVien = @mahocvien
			AND KhoaHoc = @maKH
		END;
	ELSE
		UPDATE dbo.DANHGIAKHOAHOC 
		SET CapCCVB = N'Không Đạt'
		WHERE HocVien = @mahocvien
		AND KhoaHoc = @maKH
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_DAT_NHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE  [dbo].[SP_UPDATE_DAT_NHP]
@mahocvien NVARCHAR(20),
@maNHP NVARCHAR(20)
AS 
BEGIN
DECLARE @sohocphandaHoc INT;
DECLARE @sohocphan NVARCHAR(20);
DECLARE @DTB	 FLOAT;
SET @sohocphan = (SELECT SoHocPhan FROM dbo.NHOMHOCPHAN WHERE MaNhomHP = @maNHP)
SET @sohocphandaHoc = (SELECT SoHPDaHoc FROM dbo.DANHGIANHP WHERE HocVien = @mahocvien and NhomHocPhan = @maNHP)
SET @DTB = (SELECT DiemTrungBinh FROM dbo.DANHGIANHP WHERE HocVien = @mahocvien and NhomHocPhan = @maNHP)
	IF @sohocphandaHoc =  @sohocphan and @DTB >= 5
		BEGIN
			UPDATE dbo.DANHGIANHP 
			SET CapCCVB = N'Đạt'
			WHERE HocVien = @mahocvien
			AND NhomHocPhan = @maNHP
		END;
	ELSE
		UPDATE dbo.DANHGIANHP 
		SET CapCCVB = N'Không Đạt'
		WHERE HocVien = @mahocvien
		AND NhomHocPhan = @maNHP
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_DGNHP]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_UPDATE_DGNHP]
@mahocvien NVARCHAR(20),
@maNHP NVARCHAR(20)
AS
BEGIN
DECLARE @sohocphandaHOC INT;
DECLARE @sohocphandaDAT INT;
DECLARE @DiemTB FLOAT;
SET @sohocphandaHOC = dbo.func_hocphandaHOC(@mahocvien,@maNHP)
SET @sohocphandaDAT = dbo.func_hocphandaDAT(@mahocvien,@maNHP)
SET @DiemTB = dbo.func_DiemTB(@mahocvien,@maNHP)
UPDATE dbo.DANHGIANHP
SET SoHPDaHoc = @sohocphandaHOC
WHERE HocVien = @mahocvien
AND  NhomHocPhan = @maNHP;
UPDATE dbo.DANHGIANHP
SET SoHPDaDat = @sohocphandaDAT
WHERE HocVien = @mahocvien
AND  NhomHocPhan = @maNHP;
UPDATE dbo.DANHGIANHP
SET DiemTrungBinh = @DiemTB
WHERE HocVien = @mahocvien
AND  NhomHocPhan = @maNHP;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_XOADKCD]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_XOADKCD] @MAHV NVARCHAR(20), @MALOPCD NVARCHAR(20)
AS
BEGIN
	DELETE DBO.HOCVIEN_LCD
	WHERE HocVien =  @MAHV AND LopChuyenDe = @MALOPCD;

	DECLARE @DADK INT;
	SELECT @DADK = COUNT(*) FROM DBO.HOCVIEN_LCD WHERE LopChuyenDe = @MALOPCD;

	UPDATE DBO.LOPCHUYENDE
	SET DaDangKy = @DADK
	WHERE MaLopCD = @MALOPCD;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOADKKH]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_XOADKKH] @MAHV NVARCHAR(20), @MALOPDT NVARCHAR(20)
AS
BEGIN
	DELETE DBO.HOCVIEN_KDT
	WHERE HocVien =  @MAHV AND LopDaoTao = @MALOPDT;

	DECLARE @KH NVARCHAR(20)
	SET @KH = (SELECT KHOAHOC FROM DBO.KHOADAOTAO WHERE KHOADAOTAO.MaLopDT = @MALOPDT);

	DELETE DBO.DANHGIAKHOAHOC
	WHERE HocVien = @MAHV AND KhoaHoc = @KH;

	DECLARE @SQL NVARCHAR(MAX)
	SET @SQL = 'EXEC SP_DEL_DGNHP ' + QUOTENAME(@MAHV)+ ', ' + QUOTENAME(@KH)
    EXEC (@SQL)

	DECLARE @DADK INT;
	SELECT @DADK = COUNT(*) FROM DBO.HOCVIEN_KDT WHERE LopDaoTao = @MALOPDT;

	UPDATE DBO.KHOADAOTAO
	SET DaDangKy = @DADK
	WHERE MaLopDT = @MALOPDT;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOALICHTHI]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SP_XOALICHTHI] @MALT NVARCHAR(20)
AS
BEGIN
	DELETE DBO.LICHTHI
	WHERE MaLichThi = @MALT;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DanhSachDangKy_NamHoc]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_DanhSachDangKy_NamHoc](@namhoc varchar(20))
as
begin
	select distinct hv.MaHocVien, hv.HoTen, kdt.MaLopDT, hp.TenHocPhan
	from DANGKYHOCPHAN dkhp, HOCVIEN hv, KHOADAOTAO kdt, LOPHOC lh, HOCPHAN hp, HOCVIEN_KDT hvkdt
	where hv.MaHocVien = dkhp.HocVien and dkhp.LopHoc = lh.MaLopHoc and lh.HocPhan = hp.MaHocPhan and hv.MaHocVien = hvkdt.HocVien and hvkdt.LopDaoTao = kdt.MaLopDT and kdt.NamKy =  @namhoc

end
GO
/****** Object:  StoredProcedure [dbo].[USP_DanhSachDangKyHocPhan_NamKy]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[USP_DanhSachDangKyHocPhan_NamKy](@namhoc varchar(20))
as
begin
	SELECT H.MaHocVien, H.HoTen, L.MaLopHoc, P.TenHocPhan, KH.TenKhoaHoc
	FROM DBO.DANGKYHOCPHAN D, DBO.HOCVIEN H, DBO.LOPHOC L, DBO.HOCPHAN P, NHOMHOCPHAN N, KHOADAOTAO DT, KHOAHOC KH
	WHERE D.HocVien = H.MaHocVien AND D.LopHoc = L.MaLopHoc 
	AND L.HocPhan = P.MaHocPhan AND L.NamKy = @namhoc AND DT.NamKy = @namhoc
	AND P.NhomHocPhan = N.MaNhomHP AND N.KhoaHoc = KH.MaKhoaHoc AND DT.KhoaHoc = KH.MaKhoaHoc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DS_ChuaNop_HocPhi]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[USP_DS_ChuaNop_HocPhi](@namky varchar(20))
as
begin
	select hvkdt.HocVien, hv.HoTen, hvkdt.LopDaoTao,KH.TenKhoaHoc, hvkdt.TongSoHP, hvkdt.HocPhi, hvkdt.NopHocPhi
	from HOCVIEN hv, HOCVIEN_KDT hvkdt, KHOADAOTAO kdt , KHOAHOC KH
	where hvkdt.LopDaoTao = kdt.MaLopDT and hv.MaHocVien = hvkdt.HocVien
	AND KH.MaKhoaHoc = KDT.KhoaHoc AND hvkdt.NopHocPhi IS NULL and kdt.NamKy = @namky

end
GO
/****** Object:  StoredProcedure [dbo].[USP_DSHocPhi]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[USP_DSHocPhi](@namky varchar(20))
as
begin
	select hvkdt.HocVien, hv.HoTen, hvkdt.LopDaoTao,KH.TenKhoaHoc, hvkdt.TongSoHP, hvkdt.HocPhi, hvkdt.NopHocPhi
	from HOCVIEN hv, HOCVIEN_KDT hvkdt, KHOADAOTAO kdt , KHOAHOC KH
	where hvkdt.LopDaoTao = kdt.MaLopDT and kdt.NamKy = @namky and hv.MaHocVien = hvkdt.HocVien
	AND KH.MaKhoaHoc = KDT.KhoaHoc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_HocPhi_MHV]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[USP_HocPhi_MHV] (@mahv nvarchar(20), @namky varchar(20))
as
declare @tongHocPhi int = 0
begin
declare @mucHocPhi int = 0
declare @tongHocPhan int = 0
	set @mucHocPhi = (select top 1 nk.MucHocPhi from hocvien hv, KHOADAOTAO kdt, HOCVIEN_KDT hvkdt, NAMKY nk where hv.MaHocVien = hvkdt.HocVien and kdt.NamKy = @namky) 
	exec @tongHocPhan =  USP_TongHocPhan_MHV @mahv
	set @tongHocPhi = @tongHocPhan * @mucHocPhi

	return  @tongHocPhi
end
GO
/****** Object:  StoredProcedure [dbo].[USP_HuyNopHocPhi]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[USP_HuyNopHocPhi] @MAHV NVARCHAR(20), @MALDT NVARCHAR(20)
as
begin
	update HOCVIEN_KDT
	set NopHocPhi = null
	where HocVien = @MAHV AND LopDaoTao = @MALDT
end
GO
/****** Object:  StoredProcedure [dbo].[USP_NopHocPhi]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[USP_NopHocPhi] @MAHV NVARCHAR(20), @MALDT NVARCHAR(20)
as
begin
	update HOCVIEN_KDT
	set NopHocPhi = N'Đã nộp'
	where HocVien = @MAHV AND LopDaoTao = @MALDT
end
GO
/****** Object:  StoredProcedure [dbo].[USP_TinhHocPhi]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[USP_TinhHocPhi](@namky varchar(20))
as
begin
	declare @mahv nvarchar(20)
	declare @hocphi int = 0
	declare @hocphan int = 0
	declare crs_mahv CURSOR for (select distinct MaHocVien from hocvien hv, KHOADAOTAO kdt, HOCVIEN_KDT hvkdt, NAMKY nk where hv.MaHocVien = hvkdt.HocVien and kdt.NamKy = nk.NamKy)
	
	open crs_mahv

	fetch next from crs_mahv into @mahv
	WHILE @@FETCH_STATUS = 0          
		BEGIN 
		    exec @hocphan =  USP_TongHocPhan_MHV @mahv
			update HOCVIEN_KDT
					set TongSoHP = @hocphan
					where HocVien = @mahv

			exec @hocphi = USP_HocPhi_MHV @mahv, @namky
			update HOCVIEN_KDT
					set HocPhi = @hocphi
					where HocVien = @mahv

			fetch next from crs_mahv into @mahv			 
		END
	close crs_mahv
	deallocate crs_mahv;
end
GO
/****** Object:  StoredProcedure [dbo].[USP_TongHocPhan_MHV]    Script Date: 7/12/2021 8:47:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   proc [dbo].[USP_TongHocPhan_MHV](@mahv nvarchar(20))
as
declare @hocphan int = 0
begin
	 select  distinct @hocphan =  count(*) 
	from DANGKYHOCPHAN dkhp, HOCVIEN hv, KHOADAOTAO kdt, LOPHOC lh, HOCPHAN hp, HOCVIEN_KDT hvkdt
	where hv.MaHocVien = dkhp.HocVien and dkhp.LopHoc = lh.MaLopHoc and lh.HocPhan = hp.MaHocPhan and hv.MaHocVien = hvkdt.HocVien and hvkdt.LopDaoTao = kdt.MaLopDT and  hv.MaHocVien = 'MHV001'
	group by hv.MaHocVien

	return @hocphan
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DANGNHAP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DANGNHAP'
GO
USE [master]
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET  READ_WRITE 
GO

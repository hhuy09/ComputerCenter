USE [master]
GO
/****** Object:  Database [TRUNGTAMTINHOC]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[HOCVIEN]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  View [dbo].[DANGNHAP]    Script Date: 6/21/2021 2:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[DANGNHAP] AS
SELECT EMAIL, MATKHAU
FROM DBO.HOCVIEN
UNION
SELECT EMAIL, MATKHAU
FROM DBO.NHANVIEN;
GO
/****** Object:  Table [dbo].[CHUNGCHIVANBANG]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[CHUYENDE]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[DANGKYHOCPHAN]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[DANHGIAKHOAHOC]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[DANHGIANHP]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[DIEMTHI]    Script Date: 6/21/2021 2:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIEMTHI](
	[HocVien] [nvarchar](20) NOT NULL,
	[LopHoc] [nvarchar](20) NOT NULL,
	[LichThi] [nvarchar](20) NOT NULL,
	[DiemThiHP] [float] NULL,
	[Dat] [int] NULL,
 CONSTRAINT [PK_DT] PRIMARY KEY CLUSTERED 
(
	[HocVien] ASC,
	[LopHoc] ASC,
	[LichThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCPHAN]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[HOCVIEN_KDT]    Script Date: 6/21/2021 2:31:31 PM ******/
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
	[NopHocPhi] [int] NULL,
	[DiemTotNghiep] [float] NULL,
	[CapCCVB] [nvarchar](20) NULL,
 CONSTRAINT [PK_HV_KDT] PRIMARY KEY CLUSTERED 
(
	[HocVien] ASC,
	[LopDaoTao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCVIEN_LCD]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[KHOADAOTAO]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[KHOAHOC]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[LICHTHI]    Script Date: 6/21/2021 2:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICHTHI](
	[MaLichThi] [nvarchar](20) NOT NULL,
	[LopHoc] [nvarchar](20) NOT NULL,
	[NgayThi] [date] NULL,
 CONSTRAINT [PK_LT] PRIMARY KEY CLUSTERED 
(
	[MaLichThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOPCHUYENDE]    Script Date: 6/21/2021 2:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPCHUYENDE](
	[MaLopCD] [nvarchar](20) NOT NULL,
	[ChuyenDe] [nvarchar](20) NULL,
	[Nam_KyHoc] [nvarchar](20) NULL,
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
/****** Object:  Table [dbo].[LOPHOC]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[NAMKY]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[NHOMHOCPHAN]    Script Date: 6/21/2021 2:31:31 PM ******/
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
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 6/21/2021 2:31:31 PM ******/
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
ALTER TABLE [dbo].[LOPCHUYENDE]  WITH CHECK ADD  CONSTRAINT [FK_LCD_NK] FOREIGN KEY([Nam_KyHoc])
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
/****** Object:  StoredProcedure [dbo].[SP_DANGNHAP]    Script Date: 6/21/2021 2:31:31 PM ******/
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
USE [master]
GO
ALTER DATABASE [TRUNGTAMTINHOC] SET  READ_WRITE 
GO

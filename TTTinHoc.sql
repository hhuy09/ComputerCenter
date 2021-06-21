USE [master]
GO
/****** Object:  Database [TRUNGTAMTINHOC]    Script Date: 6/21/2021 4:44:26 PM ******/
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
/****** Object:  Table [dbo].[HOCVIEN]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  View [dbo].[DANGNHAP]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[CHUNGCHIVANBANG]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[CHUYENDE]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[DANGKYHOCPHAN]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[DANHGIAKHOAHOC]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[DANHGIANHP]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[DIEMTHI]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[HOCPHAN]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[HOCVIEN_KDT]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[HOCVIEN_LCD]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[KHOADAOTAO]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[KHOAHOC]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[LICHTHI]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[LOPCHUYENDE]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[LOPHOC]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[NAMKY]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[NHOMHOCPHAN]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 6/21/2021 4:44:27 PM ******/
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
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV001', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV002', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV003', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV003', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV003', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV003', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV003', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV003', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV004', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV004', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV004', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV004', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV004', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV004', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV005', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV005', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV005', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV005', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV005', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV005', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV006', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV006', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV006', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV006', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV006', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV006', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV007', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV007', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV007', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV007', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV007', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV007', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV008', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV008', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV008', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV008', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV008', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV008', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV009', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV009', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV009', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV009', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV009', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV009', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV010', N'MLH001', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV010', N'MLH002', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV010', N'MLH003', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV010', N'MLH004', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV010', N'MLH005', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV010', N'MLH006', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV011', N'MLH007', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV011', N'MLH008', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV011', N'MLH009', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV012', N'MLH007', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV012', N'MLH008', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV012', N'MLH009', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV013', N'MLH007', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV013', N'MLH008', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV013', N'MLH009', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV014', N'MLH007', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV014', N'MLH008', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV014', N'MLH009', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV015', N'MLH007', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV015', N'MLH008', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV015', N'MLH009', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV016', N'MLH011', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV016', N'MLH012', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV017', N'MLH010', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV017', N'MLH012', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV018', N'MLH010', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV018', N'MLH011', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV019', N'MLH010', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV019', N'MLH012', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV020', N'MLH010', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV020', N'MLH011', 0)
INSERT [dbo].[DANGKYHOCPHAN] ([HocVien], [LopHoc], [SoLanDaThi]) VALUES (N'MHV020', N'MLH012', 0)
GO
INSERT [dbo].[DANHGIAKHOAHOC] ([HocVien], [KhoaHoc], [SoHPDaHoc], [SoHPDaDat], [CapCCVB]) VALUES (N'MHV001', N'MKH001', 6, 6, N'Đạt')
GO
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV001', N'NHP001', 2, 2, 7.5, N'Đạt')
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV001', N'NHP002', 2, 2, 8.5, N'Đạt')
INSERT [dbo].[DANHGIANHP] ([HocVien], [NhomHocPhan], [SoHPDaHoc], [SoHPDaDat], [DiemTrungBinh], [CapCCVB]) VALUES (N'MHV001', N'NHP003', 2, 2, 8.25, N'Đạt')
GO
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH001', N'MLT001', 8, 1)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH002', N'MLT002', 7, 1)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH003', N'MLT003', 9, 1)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH004', N'MLT004', 8, 1)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH005', N'MLT005', 8.5, 1)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV001', N'MLH006', N'MLT006', 8, 1)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH001', N'MLT001', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH002', N'MLT002', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH003', N'MLT003', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH004', N'MLT004', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH005', N'MLT005', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV002', N'MLH006', N'MLT006', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV003', N'MLH001', N'MLT001', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV003', N'MLH002', N'MLT002', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV003', N'MLH003', N'MLT003', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV003', N'MLH004', N'MLT004', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV003', N'MLH005', N'MLT005', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV003', N'MLH006', N'MLT006', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV004', N'MLH001', N'MLT001', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV004', N'MLH002', N'MLT002', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV004', N'MLH003', N'MLT003', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV004', N'MLH004', N'MLT004', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV004', N'MLH005', N'MLT005', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV004', N'MLH006', N'MLT006', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV005', N'MLH001', N'MLT001', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV005', N'MLH002', N'MLT002', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV005', N'MLH003', N'MLT003', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV005', N'MLH004', N'MLT004', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV005', N'MLH005', N'MLT005', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV005', N'MLH006', N'MLT006', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV006', N'MLH001', N'MLT001', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV006', N'MLH002', N'MLT002', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV006', N'MLH003', N'MLT003', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV006', N'MLH004', N'MLT004', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV006', N'MLH005', N'MLT005', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV006', N'MLH006', N'MLT006', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV007', N'MLH001', N'MLT001', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV007', N'MLH002', N'MLT002', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV007', N'MLH003', N'MLT003', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV007', N'MLH004', N'MLT004', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV007', N'MLH005', N'MLT005', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV007', N'MLH006', N'MLT006', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV008', N'MLH001', N'MLT001', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV008', N'MLH002', N'MLT002', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV008', N'MLH003', N'MLT003', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV008', N'MLH004', N'MLT004', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV008', N'MLH005', N'MLT005', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV008', N'MLH006', N'MLT006', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV009', N'MLH001', N'MLT001', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV009', N'MLH002', N'MLT002', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV009', N'MLH003', N'MLT003', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV009', N'MLH004', N'MLT004', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV009', N'MLH005', N'MLT005', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV009', N'MLH006', N'MLT006', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV010', N'MLH001', N'MLT001', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV010', N'MLH002', N'MLT002', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV010', N'MLH003', N'MLT003', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV010', N'MLH004', N'MLT004', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV010', N'MLH005', N'MLT005', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV010', N'MLH006', N'MLT006', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV011', N'MLH007', N'MLT007', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV011', N'MLH008', N'MLT008', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV011', N'MLH009', N'MLT009', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV012', N'MLH007', N'MLT007', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV012', N'MLH008', N'MLT008', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV012', N'MLH009', N'MLT009', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV013', N'MLH007', N'MLT007', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV013', N'MLH008', N'MLT008', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV013', N'MLH009', N'MLT009', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV014', N'MLH007', N'MLT007', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV014', N'MLH008', N'MLT008', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV014', N'MLH009', N'MLT009', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV015', N'MLH007', N'MLT007', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV015', N'MLH008', N'MLT008', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV015', N'MLH009', N'MLT009', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV016', N'MLH011', N'MLT011', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV016', N'MLH012', N'MLT012', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV017', N'MLH010', N'MLT010', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV017', N'MLH012', N'MLT012', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV018', N'MLH010', N'MLT010', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV018', N'MLH011', N'MLT011', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV019', N'MLH010', N'MLT010', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV019', N'MLH012', N'MLT012', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV020', N'MLH010', N'MLT010', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV020', N'MLH011', N'MLT011', 0, 0)
INSERT [dbo].[DIEMTHI] ([HocVien], [LopHoc], [LichThi], [DiemThiHP], [Dat]) VALUES (N'MHV020', N'MLH012', N'MLT012', 0, 0)
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
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV001', N'123456', N'Phạm Minh Anh	Hữu', N'Nam', N'pmahuu@gmail.com', N'0879564567')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV002', N'123456', N'Phạm Đức Huy', N'Nam', N'pdhuy@gmail.com', N'0879135656')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV003', N'123456', N'La Nhật Hy', N'Nam', N'lnhy@gmail.com', N'0879564432')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV004', N'123456', N'Ngô Nhân Khả', N'Nam', N'nhk@gmail.com', N'0879345678')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV005', N'123456', N'Trần Hữu Khải', N'Nam', N'thkhai@gmail.com', N'0879980098')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV006', N'123456', N'Nguyễn Tấn Khang', N'Nam', N'ntkhang@gmail.com', N'0879876765')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV007', N'123456', N'Trần Ngọc Lan	Khanh', N'Nữ', N'tnlkhanh@gmail.com', N'0879678898')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV008', N'123456', N'Phạm Quốc	Khánh', N'Nam', N'pqkhanh@gmail.com', N'0879433421')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV009', N'123456', N'Nguyễn Anh Khiêm', N'Nam', N'nakhiem@gmail.com', N'0871049829')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV010', N'123456', N'Đỗ Liên Khoa', N'Nam', N'dlkhoa@gmail.com', N'0879222642')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV011', N'123456', N'Phạm Minh	Thi', N'Nữ', N'pmthi@gmail.com', N'0879398457')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV012', N'123456', N'Trịnh Tấn	Khoa', N'Nam', N'ttkhoa@gmail.com', N'0950792749')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV013', N'123456', N'Lê Anh Khương', N'Nam', N'lakhuong@gmail.com', N'0473850796')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV014', N'123456', N'Nguyễn Hà Anh	Kiểm', N'Nam', N'nhakiem@gmail.com', N'0794715409')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV015', N'123456', N'Võ Thị Hiếu', N'Nữ', N'vthieu@gmail.com', N'0705933858')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV016', N'123456', N'Nguyễn Văn Hoài', N'Nam', N'nvhoai@gmail.com', N'0891232433')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV017', N'123456', N'Trần Thanh Hiền', N'Nam', N'tthien@gmail.com', N'0850709089')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV018', N'123456', N'Huỳnh Văn	Hiền', N'Nam', N'hvhien@gmail.com', N'0873571221')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV019', N'123456', N'Bùi Hoàn Hảo', N'Nam', N'bhhao@gmail.com', N'0876795784')
INSERT [dbo].[HOCVIEN] ([MaHocVien], [MatKhau], [HoTen], [GioiTinh], [Email], [SoDienThoai]) VALUES (N'MHV020', N'123456', N'Phạm Mỹ Hoa', N'Nữ', N'pmhoa@gmail.com', N'0879567890')
GO
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV001', N'LDT001', CAST(N'2021-01-01' AS Date), 6, 1500000, 1, 8, N'1')
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV002', N'LDT001', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV003', N'LDT001', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV004', N'LDT001', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV005', N'LDT001', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV006', N'LDT001', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV007', N'LDT001', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV008', N'LDT001', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV009', N'LDT001', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV010', N'LDT001', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV011', N'LDT002', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV012', N'LDT002', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV013', N'LDT002', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV014', N'LDT002', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV015', N'LDT002', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV016', N'LDT003', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV017', N'LDT003', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV018', N'LDT003', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV019', N'LDT003', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
INSERT [dbo].[HOCVIEN_KDT] ([HocVien], [LopDaoTao], [NgayGhiDanh], [TongSoHP], [HocPhi], [NopHocPhi], [DiemTotNghiep], [CapCCVB]) VALUES (N'MHV020', N'LDT003', CAST(N'2021-01-01' AS Date), 0, 0, 0, 0, NULL)
GO
INSERT [dbo].[KHOADAOTAO] ([MaLopDT], [KhoaHoc], [NamKy], [NVTroLy], [NgayKhaiGiang], [NgayThiTN], [SiSo], [DaDangKy]) VALUES (N'LDT001', N'MKH001', N'2021-1', N'MNV001', CAST(N'2021-01-15' AS Date), CAST(N'2021-06-15' AS Date), 10, 10)
INSERT [dbo].[KHOADAOTAO] ([MaLopDT], [KhoaHoc], [NamKy], [NVTroLy], [NgayKhaiGiang], [NgayThiTN], [SiSo], [DaDangKy]) VALUES (N'LDT002', N'MKH002', N'2021-1', N'MNV001', CAST(N'2021-01-15' AS Date), CAST(N'2021-05-15' AS Date), 10, 5)
INSERT [dbo].[KHOADAOTAO] ([MaLopDT], [KhoaHoc], [NamKy], [NVTroLy], [NgayKhaiGiang], [NgayThiTN], [SiSo], [DaDangKy]) VALUES (N'LDT003', N'MKH003', N'2021-1', N'MNV002', CAST(N'2021-01-15' AS Date), CAST(N'2021-05-15' AS Date), 10, 5)
GO
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [CCVB], [TenKhoaHoc], [MoTa], [SoNHP], [SoHocPhan]) VALUES (N'MKH001', N'CCVB001', N'Khóa đào tạo Kỹ thuật viên', N'Nhiều nhóm học phần đào tạo các loại kỹ thuật viên khác nhau (lập trình, phân tích, thiết kế...), hoàn thành nhóm học phần được cấp chứng chỉ tương ứng. Sau khi hoàn thành khóa học được cấp một văn bằng Kỹ thuật viên.', 3, 6)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [CCVB], [TenKhoaHoc], [MoTa], [SoNHP], [SoHocPhan]) VALUES (N'MKH002', N'CCVB001', N'Khóa đào tạo Chứng chỉ tin học A', N'Nhóm học phần Chứng chỉ A gồm 3 môn học phần, hoàn thành khóa học được cấp Chứng chỉ tin học A.', 1, 3)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [CCVB], [TenKhoaHoc], [MoTa], [SoNHP], [SoHocPhan]) VALUES (N'MKH003', N'CCVB001', N'Khóa đào tạo Chứng chỉ tin học B', N'Nhóm học phần Chứng chỉ B gồm 3 môn học phần như Chứng chỉ A, hoàn thành 2/3 học phần trong khóa học được cấp Chứng chỉ tin học A.', 1, 3)
GO
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT001', N'MLH001', CAST(N'2021-03-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT002', N'MLH002', CAST(N'2021-05-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT003', N'MLH003', CAST(N'2021-03-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT004', N'MLH004', CAST(N'2021-05-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT005', N'MLH005', CAST(N'2021-03-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT006', N'MLH006', CAST(N'2021-05-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT007', N'MLH007', CAST(N'2021-04-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT008', N'MLH008', CAST(N'2021-04-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT009', N'MLH009', CAST(N'2021-04-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT010', N'MLH010', CAST(N'2021-05-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT011', N'MLH011', CAST(N'2021-05-01' AS Date))
INSERT [dbo].[LICHTHI] ([MaLichThi], [LopHoc], [NgayThi]) VALUES (N'MLT012', N'MLH012', CAST(N'2021-05-01' AS Date))
GO
INSERT [dbo].[LOPCHUYENDE] ([MaLopCD], [ChuyenDe], [Nam_KyHoc], [NVTroLy], [NgayHoc], [SiSo], [DaDangKy]) VALUES (N'LCD001', N'MCD001', N'2021-1', N'MNV001', CAST(N'2021-03-01' AS Date), 10, 2)
INSERT [dbo].[LOPCHUYENDE] ([MaLopCD], [ChuyenDe], [Nam_KyHoc], [NVTroLy], [NgayHoc], [SiSo], [DaDangKy]) VALUES (N'LCD002', N'MCD002', N'2021-1', N'MNV002', CAST(N'2021-04-01' AS Date), 10, 2)
INSERT [dbo].[LOPCHUYENDE] ([MaLopCD], [ChuyenDe], [Nam_KyHoc], [NVTroLy], [NgayHoc], [SiSo], [DaDangKy]) VALUES (N'LCD003', N'MCD003', N'2021-1', N'MNV002', CAST(N'2021-05-01' AS Date), 10, 2)
GO
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH001', N'2021-1', N'MHP001', N'MNV003', N'20g00 thứ 2 từ ngày 15/01/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH002', N'2021-1', N'MHP002', N'MNV004', N'20g00 thứ 2 từ ngày 15/03/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH003', N'2021-1', N'MHP003', N'MNV005', N'20g00 thứ 4 từ ngày 15/01/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH004', N'2021-1', N'MHP004', N'MNV006', N'20g00 thứ 4 từ ngày 15/03/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH005', N'2021-1', N'MHP005', N'MNV003', N'20g00 thứ 6 từ ngày 15/01/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH006', N'2021-1', N'MHP006', N'MNV005', N'20g00 thứ 6 từ ngày 15/03/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH007', N'2021-1', N'MHP007', N'MNV005', N'20g00 thứ 3 từ ngày 15/01/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH008', N'2021-1', N'MHP008', N'MNV006', N'20g00 thứ 5 từ ngày 15/01/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH009', N'2021-1', N'MHP009', N'MNV003', N'20g00 thứ 7 từ ngày 15/01/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH010', N'2021-1', N'MHP010', N'MNV005', N'20g00 thứ 3 từ ngày 01/03/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH011', N'2021-1', N'MHP011', N'MNV006', N'20g00 thứ 5 từ ngày 01/03/2021', 10, 2)
INSERT [dbo].[LOPHOC] ([MaLopHoc], [NamKy], [HocPhan], [NVChuyenMon], [LichHoc], [SiSo], [DaDangKi]) VALUES (N'MLH012', N'2021-1', N'MHP012', N'MNV006', N'20g00 thứ 7 từ ngày 01/03/2021', 10, 2)
GO
INSERT [dbo].[NAMKY] ([NamKy], [BatDau], [KetThuc], [MucHocPhi]) VALUES (N'2021-1', CAST(N'2021-01-01' AS Date), CAST(N'2021-06-30' AS Date), 250000)
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
INSERT [dbo].[NHOMHOCPHAN] ([MaNhomHP], [KhoaHoc], [CCVB], [TenNhomHP], [SoHocPhan]) VALUES (N'NHP004', N'MKH002', NULL, N'Tin học văn phòng A', 3)
INSERT [dbo].[NHOMHOCPHAN] ([MaNhomHP], [KhoaHoc], [CCVB], [TenNhomHP], [SoHocPhan]) VALUES (N'NHP005', N'MKH002', NULL, N'Tin học văn phòng B', 3)
GO
INSERT [dbo].[PHONGBAN] ([MaPhongBan], [TenPhongBan], [GhiChu]) VALUES (N'MPB001', N'Phòng trợ lý khóa học', N'Phụ trách lên lịch học lịch thi cho các lớp đào tạo của các khóa học.')
INSERT [dbo].[PHONGBAN] ([MaPhongBan], [TenPhongBan], [GhiChu]) VALUES (N'MPB002', N'Phòng chuyên môn', N'Phụ trách giảng dạy và đào tạo cho học viên.')
INSERT [dbo].[PHONGBAN] ([MaPhongBan], [TenPhongBan], [GhiChu]) VALUES (N'MPB003', N'Phòng đào tạo', N'Phụ trách đánh giá và cấp chứng chỉ văn bằng cho học viên.')
INSERT [dbo].[PHONGBAN] ([MaPhongBan], [TenPhongBan], [GhiChu]) VALUES (N'MPB004', N'Phòng tài vụ', N'Phụ trách tính học phí và thu học phí học viên.')
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
/****** Object:  StoredProcedure [dbo].[SP_DANGNHAP]    Script Date: 6/21/2021 4:44:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_TTUSER]    Script Date: 6/21/2021 4:44:27 PM ******/
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

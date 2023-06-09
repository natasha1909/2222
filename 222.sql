USE [master]
GO
/****** Object:  Database [2905]    Script Date: 29.05.2023 10:13:40 ******/
CREATE DATABASE [2905]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'2905', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\2905.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'2905_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\2905_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [2905] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [2905].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [2905] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [2905] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [2905] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [2905] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [2905] SET ARITHABORT OFF 
GO
ALTER DATABASE [2905] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [2905] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [2905] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [2905] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [2905] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [2905] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [2905] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [2905] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [2905] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [2905] SET  DISABLE_BROKER 
GO
ALTER DATABASE [2905] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [2905] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [2905] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [2905] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [2905] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [2905] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [2905] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [2905] SET RECOVERY FULL 
GO
ALTER DATABASE [2905] SET  MULTI_USER 
GO
ALTER DATABASE [2905] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [2905] SET DB_CHAINING OFF 
GO
ALTER DATABASE [2905] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [2905] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [2905] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [2905] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'2905', N'ON'
GO
ALTER DATABASE [2905] SET QUERY_STORE = OFF
GO
USE [2905]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 29.05.2023 10:13:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (1, N'Голубев', N' Иосиф', N' Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'2018-08-18T00:00:00.000' AS DateTime), N' smcnabb@att.net', N' 7(78)972-73-11 ', N'1', N' Клиенты\m18.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Селиверстов', N'Глеб ', N'Максимович ', CAST(N'1999-06-20' AS Date), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N' jigsaw@sbcglobal.net', N' 7(20)554-28-68 ', N'1', N' Клиенты\m37.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Агафонов', N' Юстиниан', N' Олегович', CAST(N'1997-02-02' AS Date), CAST(N'2016-06-08T00:00:00.000' AS DateTime), N' staffelb@sbcglobal.net', N' 7(303)810-28-78 ', N'1', N' Клиенты\m1.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Некрасов', N'Варлам ', N'Михайлович ', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N' dogdude@verizon.net', N' 7(019)258-06-35 ', N'1', N' Клиенты\m42.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Крюков', N' Наум', N' Ильяович', CAST(N'1993-11-17' AS Date), CAST(N'2017-02-01T00:00:00.000' AS DateTime), N' floxy@hotmail.com', N' 7(81)657-88-92 ', N'1', N' Клиенты\m30.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Новиков', N'Адриан ', N'Аркадьевич ', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N' multiplx@verizon.net', N' 7(70)572-33-62 ', N'1', N' Клиенты\m40.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Шестаков', N'Геннадий ', N'Рубенович ', CAST(N'2001-07-01' AS Date), CAST(N'2018-12-08T00:00:00.000' AS DateTime), N' tokuhirom@live.com', N' 7(2066)037-11-60 ', N'1', N' Клиенты\m41.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (14, N'Зуев', N'Матвей ', N'Иванович ', CAST(N'1981-03-28' AS Date), CAST(N'2018-12-18T00:00:00.000' AS DateTime), N' brickbat@verizon.net', N' 7(5383)893-04-66 ', N'1', N' Клиенты\m38.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Анисимов', N'Валентин ', N'Пантелеймонович ', CAST(N'2000-12-10' AS Date), CAST(N'2018-01-20T00:00:00.000' AS DateTime), N' aaribaud@hotmail.com', N' 7(700)326-70-24 ', N'1', N' Клиенты\m99.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Колобов', N' Орест', N' Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01T00:00:00.000' AS DateTime), N' parkes@verizon.net', N' 7(1680)508-58-26 ', N'1', N' Клиенты\m27.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Филатов', N'Аристарх ', N'Дмитриевич ', CAST(N'1989-05-29' AS Date), CAST(N'2017-01-11T00:00:00.000' AS DateTime), N' hampton@att.net', N' 7(696)235-29-24 ', N'1', N' Клиенты\m43.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Бобров', N'Агафон ', N'Лаврентьевич ', CAST(N'1995-07-29' AS Date), CAST(N'2017-05-09T00:00:00.000' AS DateTime), N' petersen@comcast.net', N' 7(2159)507-39-57 ', N'1', N' Клиенты\m35.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (24, N'Панфилов', N'Марк ', N'Рудольфович ', CAST(N'1991-04-13' AS Date), CAST(N'2016-02-23T00:00:00.000' AS DateTime), N' cremonini@optonline.net', N' 7(764)282-55-22 ', N'1', N' Клиенты\m45.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'Морозов', N'Наум ', N'Валерьянович ', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N' salesgeek@mac.com', N' 7(636)050-96-13 ', N'1', N' Клиенты\m49.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Горбачёв', N'Давид ', N'Тимурович ', CAST(N'1983-05-22' AS Date), CAST(N'2018-12-17T00:00:00.000' AS DateTime), N' hedwig@att.net', N' 7(53)602-85-41 ', N'1', N' Клиенты\m36.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Васильев', N' Оскар', N' Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N' miturria@verizon.net', N' 7(585)801-94-29 ', N'1', N' Клиенты\m15.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'Медведев', N' Святослав', N' Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13T00:00:00.000' AS DateTime), N' hllam@comcast.net', N' 7(3520)435-21-20 ', N'1', N' Клиенты\m13.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Кудряшов', N'Аверкий ', N'Константинович ', CAST(N'1991-07-26' AS Date), CAST(N'2018-03-08T00:00:00.000' AS DateTime), N' nanop@msn.com', N' 7(88)732-96-30 ', N'1', N' Клиенты\m33.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Кудрявцев', N' Богдан', N' Христофорович', CAST(N'1988-02-27' AS Date), CAST(N'2016-10-07T00:00:00.000' AS DateTime), N' lukka@hotmail.com', N' 7(20)131-84-09 ', N'1', N' Клиенты\m31.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Гусев', N' Яков', N' Авксентьевич', CAST(N'1995-12-10' AS Date), CAST(N'2017-11-20T00:00:00.000' AS DateTime), N' jdhedden@icloud.com', N' 7(0972)781-11-37 ', N'1', N' Клиенты\m20.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (40, N'Борисов', N' Аввакум', N' Артемович', CAST(N'1974-04-25' AS Date), CAST(N'2017-03-11T00:00:00.000' AS DateTime), N' chlim@live.com', N' 7(2296)930-08-88 ', N'1', N' Клиенты\m12.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Бобылёв', N' Георгий', N' Витальевич', CAST(N'1983-12-19' AS Date), CAST(N'2018-04-06T00:00:00.000' AS DateTime), N' csilvers@mac.com', N' 7(88)685-13-51 ', N'1', N' Клиенты\m11.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Дроздов', N' Вольдемар', N' Артемович', CAST(N'1976-02-07' AS Date), CAST(N'2017-07-18T00:00:00.000' AS DateTime), N' smpeters@me.com', N' 7(307)456-99-05 ', N'1', N' Клиенты\m21.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (44, N'Блохин', N' Пантелеймон', N' Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14T00:00:00.000' AS DateTime), N' balchen@comcast.net', N' 7(9524)556-48-98 ', N'1', N' Клиенты\m8.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (46, N'Калашников', N' Артур', N' Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20T00:00:00.000' AS DateTime), N' oevans@aol.com', N' 7(147)947-47-21 ', N'1', N' Клиенты\m10.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Волков', N'Людвиг ', N'Витальевич ', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27T00:00:00.000' AS DateTime), N' jrkorson@msn.com', N' 7(8459)592-05-58 ', N'1', N' Клиенты\m50.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Князев', N' Терентий', N' Валерьевич', CAST(N'1991-06-19' AS Date), CAST(N'2018-06-25T00:00:00.000' AS DateTime), N' rjones@aol.com', N' 7(98)397-23-23 ', N'1', N' Клиенты\m26.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (51, N'Силин', N'Гаянэ ', N'Анатольевич ', CAST(N'1976-05-27' AS Date), CAST(N'2017-05-05T00:00:00.000' AS DateTime), N' multiplx@comcast.net', N' 7(4547)615-22-69 ', N'1', N' Клиенты\m46.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (52, N'Казаков', N'Дмитрий ', N'Русланович ', CAST(N'1978-12-15' AS Date), CAST(N'2016-05-21T00:00:00.000' AS DateTime), N' ozawa@verizon.net', N' 7(51)682-19-40 ', N'1', N' Клиенты\m44.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (55, N'Галкин', N' Эрик', N' Онисимович', CAST(N'1975-01-18' AS Date), CAST(N'2016-07-19T00:00:00.000' AS DateTime), N' snunez@verizon.net', N' 7(759)873-77-39 ', N'1', N' Клиенты\m16.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (59, N'Авдеев', N'Самуил ', N'Улебович ', CAST(N'1996-07-04' AS Date), CAST(N'2016-02-11T00:00:00.000' AS DateTime), N' cliffordj@mac.com', N' 7(3168)043-63-31 ', N'1', N' Клиенты\m96.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (61, N'Ершов', N' Глеб', N' Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14T00:00:00.000' AS DateTime), N' sjava@aol.com', N' 7(2608)298-40-82 ', N'1', N' Клиенты\m23.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (62, N'Игнатов', N'Захар ', N'Павлович ', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10T00:00:00.000' AS DateTime), N' dieman@icloud.com', N' 7(578)574-73-36 ', N'1', N' Клиенты\m98.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (64, N'Быков', N' Трофим', N' Константинович', CAST(N'1994-12-20' AS Date), CAST(N'2016-04-17T00:00:00.000' AS DateTime), N' jguyer@aol.com', N' 7(3414)460-12-05 ', N'1', N' Клиенты\m14.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (65, N'Кузьмин', N' Леонтий', N' Валерьянович', CAST(N'2000-05-05' AS Date), CAST(N'2017-10-12T00:00:00.000' AS DateTime), N' msloan@hotmail.com', N' 7(1340)148-90-68 ', N'1', N' Клиенты\m17.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (67, N'Блинов', N' Евгений', N' Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07T00:00:00.000' AS DateTime), N' moxfulder@outlook.com', N' 7(0852)321-82-64 ', N'1', N' Клиенты\m7.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (68, N'Лазарев', N'Алексей ', N'Богданович ', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N' claesjac@me.com', N' 7(0055)737-37-48 ', N'1', N' Клиенты\m48.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (71, N'Калинин', N'Петр ', N'Иванович ', CAST(N'1993-09-08' AS Date), CAST(N'2016-05-26T00:00:00.000' AS DateTime), N' aschmitz@hotmail.com', N' 7(90)316-07-17 ', N'1', N' Клиенты\m47.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (72, N'Андреев', N' Станислав', N' Максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26T00:00:00.000' AS DateTime), N' budinger@mac.com', N' 7(02)993-91-28 ', N'1', N' Клиенты\m3.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (73, N'Киселёв', N' Устин', N' Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N' dalamb@verizon.net', N' 7(83)334-52-76 ', N'1', N' Клиенты\m25.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (74, N'Гордеев', N' Павел', N' Семенович', CAST(N'1984-09-06' AS Date), CAST(N'2016-07-19T00:00:00.000' AS DateTime), N' dawnsong@verizon.net', N' 7(5243)599-66-72 ', N'1', N' Клиенты\m19.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (76, N'Копылов', N' Касьян', N' Робертович', CAST(N'1983-08-04' AS Date), CAST(N'2018-03-18T00:00:00.000' AS DateTime), N' crobles@sbcglobal.net', N' 7(5774)679-82-06 ', N'1', N' Клиенты\m29.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (77, N'Ефремов', N' Витольд', N' Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N' kwilliams@yahoo.ca', N' 7(93)922-14-03 ', N'1', N' Клиенты\m28.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (78, N'Баранов', N' Михаил', N' Романович', CAST(N'1997-07-12' AS Date), CAST(N'2018-10-07T00:00:00.000' AS DateTime), N' bigmauler@outlook.com', N' 7(750)985-94-13 ', N'1', N' Клиенты\m5.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (80, N'Федотов', N' Осип', N' Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N' breegster@hotmail.com', N' 7(590)702-33-06 ', N'1', N' Клиенты\m9.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (82, N'Дементьев', N'Вадим ', N'Ростиславович ', CAST(N'1993-07-10' AS Date), CAST(N'2018-03-05T00:00:00.000' AS DateTime), N' jacks@aol.com', N' 7(79)330-46-15 ', N'1', N' Клиенты\m39.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (83, N'Евсеев', N' Макар', N' Васильевич', CAST(N'1977-09-13' AS Date), CAST(N'2018-12-05T00:00:00.000' AS DateTime), N' parsimony@sbcglobal.net', N' 7(2141)077-85-70 ', N'1', N' Клиенты\m22.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (84, N'Абрамов', N'Станислав ', N'Филатович ', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08T00:00:00.000' AS DateTime), N' solomon@att.net', N' 7(6545)478-87-79 ', N'1', N' Клиенты\m32.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (88, N'Ефимов', N' Альберт', N' Проклович', CAST(N'1997-10-29' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N' houle@live.com', N' 7(416)375-97-19 ', N'1', N' Клиенты\m6.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (93, N'Александров', N' Станислав', N' Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08T00:00:00.000' AS DateTime), N' bigmauler@aol.com', N' 7(18)164-05-12 ', N'1', N' Клиенты\m2.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (94, N'Цветков', N' Демьян', N' Львович', CAST(N'1996-03-29' AS Date), CAST(N'2016-02-12T00:00:00.000' AS DateTime), N' hauma@icloud.com', N' 7(93)546-43-73 ', N'1', N' Клиенты\m4.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (97, N'Смирнов', N'Мартын ', N'Арсеньевич ', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N' haddawy@live.com', N' 7(6251)589-02-43 ', N'1', N' Клиенты\m34.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (99, N'Журавлёв', N' Леонтий', N' Яковлевич', CAST(N'2000-03-02' AS Date), CAST(N'2018-01-15T00:00:00.000' AS DateTime), N' cmdrgravy@me.com', N' 7(4403)308-56-96 ', N'1', N' Клиенты\m24.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (100, N'Большаков', N'Вадим ', N'Данилович ', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04T00:00:00.000' AS DateTime), N' uncle@gmail.com', N' 7(386)641-13-37 ', N'1', N' Клиенты\m97.jpg')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 11, 44, CAST(N'2019-06-10T16:40:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 16, 14, CAST(N'2019-02-16T09:40:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 27, 49, CAST(N'2019-06-21T14:50:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 62, 8, CAST(N'2019-10-14T12:00:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 46, 17, CAST(N'2019-04-22T11:30:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 88, 22, CAST(N'2019-06-22T13:00:00.000' AS DateTime), N'Диагностика рулевого редуктора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 11, 48, CAST(N'2019-04-21T12:40:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 78, 27, CAST(N'2019-10-05T18:30:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 49, 45, CAST(N'2019-12-05T18:10:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 24, 45, CAST(N'2019-09-17T11:30:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 30, 2, CAST(N'2019-07-07T09:30:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 24, 48, CAST(N'2019-05-28T11:10:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 65, 21, CAST(N'2019-05-01T10:20:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 65, 13, CAST(N'2019-04-15T13:30:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 11, 43, CAST(N'2019-10-16T18:20:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 74, 8, CAST(N'2019-07-09T18:50:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 78, 27, CAST(N'2019-03-23T16:40:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 33, 4, CAST(N'2019-05-23T11:40:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 97, 23, CAST(N'2019-07-30T12:10:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 65, 3, CAST(N'2019-08-24T11:20:00.000' AS DateTime), N'Замена тормозной жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 76, 18, CAST(N'2019-12-23T15:30:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 30, 18, CAST(N'2019-08-02T18:50:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 16, 39, CAST(N'2019-02-15T17:30:00.000' AS DateTime), N'Ремонт сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 27, 32, CAST(N'2019-12-28T17:10:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 18, 11, CAST(N'2019-04-14T15:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 11, 9, CAST(N'2019-12-18T10:30:00.000' AS DateTime), N'Замена подшипника задней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 61, 12, CAST(N'2019-07-30T10:10:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 19, 32, CAST(N'2019-06-15T09:30:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 100, 14, CAST(N'2019-07-28T12:50:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 16, 28, CAST(N'2019-07-12T19:30:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 44, 4, CAST(N'2019-07-02T15:30:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 36, 48, CAST(N'2019-09-09T17:40:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 55, 13, CAST(N'2019-01-29T16:10:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 11, 33, CAST(N'2019-01-19T11:50:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 72, 35, CAST(N'2019-07-05T13:40:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 100, 26, CAST(N'2019-10-10T13:40:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 67, 40, CAST(N'2019-12-07T17:00:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 19, 31, CAST(N'2019-06-05T10:50:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 84, 44, CAST(N'2019-04-05T10:10:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 73, 13, CAST(N'2019-06-24T14:10:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 18, 32, CAST(N'2019-09-05T19:30:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 33, 7, CAST(N'2019-11-27T09:00:00.000' AS DateTime), N'Замена лямбда зонда')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 16, 30, CAST(N'2019-02-21T08:20:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 27, 46, CAST(N'2019-11-26T10:30:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 65, 47, CAST(N'2019-04-26T10:20:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 7, 47, CAST(N'2019-11-23T14:30:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 16, 33, CAST(N'2019-08-25T08:50:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 46, 37, CAST(N'2019-05-09T10:00:00.000' AS DateTime), N'Замена тормозных колодок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 18, 29, CAST(N'2019-08-08T17:20:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 68, 17, CAST(N'2019-12-30T08:10:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 76, 47, CAST(N'2019-09-05T14:10:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 62, 26, CAST(N'2019-12-24T09:30:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 68, 24, CAST(N'2019-04-06T11:50:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 30, 35, CAST(N'2019-08-12T11:50:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 78, 21, CAST(N'2019-08-12T15:40:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 55, 26, CAST(N'2019-07-29T10:30:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 26, 38, CAST(N'2019-04-14T14:20:00.000' AS DateTime), N'Покраска')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 36, 34, CAST(N'2019-03-19T09:40:00.000' AS DateTime), N'Замена трубки кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 62, 23, CAST(N'2019-12-15T19:50:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 27, 41, CAST(N'2019-11-30T18:00:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 46, 1, CAST(N'2019-11-14T15:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 61, 5, CAST(N'2019-06-14T18:30:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 30, 32, CAST(N'2019-03-22T15:20:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 42, 40, CAST(N'2019-10-09T18:30:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 33, 14, CAST(N'2019-03-16T10:20:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 72, 28, CAST(N'2019-12-16T19:40:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 16, 12, CAST(N'2019-08-15T18:30:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 30, 42, CAST(N'2019-09-20T08:20:00.000' AS DateTime), N'Диагностика инжектора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 16, 27, CAST(N'2019-04-15T11:50:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 8, 17, CAST(N'2019-08-12T08:50:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 8, 13, CAST(N'2019-03-04T11:30:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 16, 30, CAST(N'2019-02-24T13:50:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 88, 41, CAST(N'2019-12-06T09:40:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 11, 47, CAST(N'2019-08-05T10:10:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 8, 25, CAST(N'2019-05-19T16:50:00.000' AS DateTime), N'Чистка форсунок ультразвуком')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 74, 5, CAST(N'2019-12-30T14:30:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 73, 17, CAST(N'2019-06-28T10:10:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 26, 29, CAST(N'2019-11-05T12:10:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 16, 24, CAST(N'2019-09-19T16:10:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 30, 11, CAST(N'2019-02-26T17:40:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 74, 49, CAST(N'2019-09-13T10:10:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 11, 48, CAST(N'2019-10-14T19:40:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 72, 35, CAST(N'2019-04-11T16:20:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 72, 49, CAST(N'2019-03-06T12:10:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 42, 12, CAST(N'2019-08-21T17:20:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 49, 48, CAST(N'2019-06-29T17:20:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 97, 46, CAST(N'2019-02-04T19:50:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 74, 12, CAST(N'2019-07-09T16:50:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 61, 48, CAST(N'2019-06-16T12:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 84, 5, CAST(N'2019-11-27T13:30:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 7, 21, CAST(N'2019-05-27T08:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 84, 48, CAST(N'2019-12-15T14:30:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 11, 1, CAST(N'2019-10-17T19:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 33, 43, CAST(N'2019-11-15T15:40:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 100, 2, CAST(N'2019-08-24T17:00:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 72, 31, CAST(N'2019-05-27T14:20:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 55, 11, CAST(N'2019-08-19T17:50:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 88, 50, CAST(N'2019-08-08T19:00:00.000' AS DateTime), N'Замена рулевой тяги')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 67, 4, CAST(N'2019-02-24T13:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 18, 39, CAST(N'2019-12-19T15:00:00.000' AS DateTime), N'Ремонт сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (101, 11, 44, CAST(N'2019-06-10T00:00:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (102, 16, 14, CAST(N'2019-02-16T00:00:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (103, 27, 49, CAST(N'2019-06-21T00:00:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (104, 62, 8, CAST(N'2019-10-14T00:00:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (105, 46, 17, CAST(N'2019-04-22T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (106, 88, 22, CAST(N'2019-06-22T00:00:00.000' AS DateTime), N'Диагностика рулевого редуктора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (107, 11, 48, CAST(N'2019-04-21T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (108, 78, 27, CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (109, 49, 45, CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (110, 24, 45, CAST(N'2019-09-17T00:00:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (111, 30, 2, CAST(N'2019-07-07T00:00:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (112, 24, 48, CAST(N'2019-05-28T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (113, 65, 21, CAST(N'2019-05-01T00:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (114, 65, 13, CAST(N'2019-04-15T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (115, 11, 43, CAST(N'2019-10-16T00:00:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (116, 74, 8, CAST(N'2019-07-09T00:00:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (117, 78, 27, CAST(N'2019-03-23T00:00:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (118, 33, 4, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (119, 97, 23, CAST(N'2019-07-30T00:00:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (120, 65, 3, CAST(N'2019-08-24T00:00:00.000' AS DateTime), N'Замена тормозной жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (121, 76, 18, CAST(N'2019-12-23T00:00:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (122, 30, 18, CAST(N'2019-08-02T00:00:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (123, 16, 39, CAST(N'2019-02-15T00:00:00.000' AS DateTime), N'Ремонт сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (124, 27, 32, CAST(N'2019-12-28T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (125, 18, 11, CAST(N'2019-04-14T00:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (126, 11, 9, CAST(N'2019-12-18T00:00:00.000' AS DateTime), N'Замена подшипника задней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (127, 61, 12, CAST(N'2019-07-30T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (128, 19, 32, CAST(N'2019-06-15T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (129, 100, 14, CAST(N'2019-07-28T00:00:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (130, 16, 28, CAST(N'2019-07-12T00:00:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (131, 44, 4, CAST(N'2019-07-02T00:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (132, 36, 48, CAST(N'2019-09-09T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (133, 55, 13, CAST(N'2019-01-29T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (134, 11, 33, CAST(N'2019-01-19T00:00:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (135, 72, 35, CAST(N'2019-07-05T00:00:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (136, 100, 26, CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (137, 67, 40, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (138, 19, 31, CAST(N'2019-06-05T00:00:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (139, 84, 44, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (140, 73, 13, CAST(N'2019-06-24T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (141, 18, 32, CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (142, 33, 7, CAST(N'2019-11-27T00:00:00.000' AS DateTime), N'Замена лямбда зонда')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (143, 16, 30, CAST(N'2019-02-21T00:00:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (144, 27, 46, CAST(N'2019-11-26T00:00:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (145, 65, 47, CAST(N'2019-04-26T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (146, 7, 47, CAST(N'2019-11-23T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (147, 16, 33, CAST(N'2019-08-25T00:00:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (148, 46, 37, CAST(N'2019-05-09T00:00:00.000' AS DateTime), N'Замена тормозных колодок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (149, 18, 29, CAST(N'2019-08-08T00:00:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (150, 68, 17, CAST(N'2019-12-30T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (151, 76, 47, CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (152, 62, 26, CAST(N'2019-12-24T00:00:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (153, 68, 24, CAST(N'2019-04-06T00:00:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (154, 30, 35, CAST(N'2019-08-12T00:00:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (155, 78, 21, CAST(N'2019-08-12T00:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (156, 55, 26, CAST(N'2019-07-29T00:00:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (157, 26, 38, CAST(N'2019-04-14T00:00:00.000' AS DateTime), N'Покраска')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (158, 36, 34, CAST(N'2019-03-19T00:00:00.000' AS DateTime), N'Замена трубки кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (159, 62, 23, CAST(N'2019-12-15T00:00:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (160, 27, 41, CAST(N'2019-11-30T00:00:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (161, 46, 1, CAST(N'2019-11-14T00:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (162, 61, 5, CAST(N'2019-06-14T00:00:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (163, 30, 32, CAST(N'2019-03-22T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (164, 42, 40, CAST(N'2019-10-09T00:00:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (165, 33, 14, CAST(N'2019-03-16T00:00:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (166, 72, 28, CAST(N'2019-12-16T00:00:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (167, 16, 12, CAST(N'2019-08-15T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (168, 30, 42, CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'Диагностика инжектора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (169, 16, 27, CAST(N'2019-04-15T00:00:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (170, 8, 17, CAST(N'2019-08-12T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (171, 8, 13, CAST(N'2019-03-04T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (172, 16, 30, CAST(N'2019-02-24T00:00:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (173, 88, 41, CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (174, 11, 47, CAST(N'2019-08-05T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (175, 8, 25, CAST(N'2019-05-19T00:00:00.000' AS DateTime), N'Чистка форсунок ультразвуком')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (176, 74, 5, CAST(N'2019-12-30T00:00:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (177, 73, 17, CAST(N'2019-06-28T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (178, 26, 29, CAST(N'2019-11-05T00:00:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (179, 16, 24, CAST(N'2019-09-19T00:00:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (180, 30, 11, CAST(N'2019-02-26T00:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (181, 74, 49, CAST(N'2019-09-13T00:00:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (182, 11, 48, CAST(N'2019-10-14T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (183, 72, 35, CAST(N'2019-04-11T00:00:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (184, 72, 49, CAST(N'2019-03-06T00:00:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (185, 42, 12, CAST(N'2019-08-21T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (186, 49, 48, CAST(N'2019-06-29T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (187, 97, 46, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (188, 74, 12, CAST(N'2019-07-09T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (189, 61, 48, CAST(N'2019-06-16T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (190, 84, 5, CAST(N'2019-11-27T00:00:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (191, 7, 21, CAST(N'2019-05-27T00:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (192, 84, 48, CAST(N'2019-12-15T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (193, 11, 1, CAST(N'2019-10-17T00:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (194, 33, 43, CAST(N'2019-11-15T00:00:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (195, 100, 2, CAST(N'2019-08-24T00:00:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (196, 72, 31, CAST(N'2019-05-27T00:00:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (197, 55, 11, CAST(N'2019-08-19T00:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (198, 88, 50, CAST(N'2019-08-08T00:00:00.000' AS DateTime), N'Замена рулевой тяги')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (199, 67, 4, CAST(N'2019-02-24T00:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (200, 18, 39, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'Ремонт сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (201, 11, 44, CAST(N'2019-06-10T00:00:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (202, 16, 14, CAST(N'2019-02-16T00:00:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (203, 27, 49, CAST(N'2019-06-21T00:00:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (204, 62, 8, CAST(N'2019-10-14T00:00:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (205, 46, 17, CAST(N'2019-04-22T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (206, 88, 22, CAST(N'2019-06-22T00:00:00.000' AS DateTime), N'Диагностика рулевого редуктора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (207, 11, 48, CAST(N'2019-04-21T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (208, 78, 27, CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (209, 49, 45, CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (210, 24, 45, CAST(N'2019-09-17T00:00:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (211, 30, 2, CAST(N'2019-07-07T00:00:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (212, 24, 48, CAST(N'2019-05-28T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (213, 65, 21, CAST(N'2019-05-01T00:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (214, 65, 13, CAST(N'2019-04-15T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (215, 11, 43, CAST(N'2019-10-16T00:00:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (216, 74, 8, CAST(N'2019-07-09T00:00:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (217, 78, 27, CAST(N'2019-03-23T00:00:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (218, 33, 4, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (219, 97, 23, CAST(N'2019-07-30T00:00:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (220, 65, 3, CAST(N'2019-08-24T00:00:00.000' AS DateTime), N'Замена тормозной жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (221, 76, 18, CAST(N'2019-12-23T00:00:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (222, 30, 18, CAST(N'2019-08-02T00:00:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (223, 16, 39, CAST(N'2019-02-15T00:00:00.000' AS DateTime), N'Ремонт сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (224, 27, 32, CAST(N'2019-12-28T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (225, 18, 11, CAST(N'2019-04-14T00:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (226, 11, 9, CAST(N'2019-12-18T00:00:00.000' AS DateTime), N'Замена подшипника задней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (227, 61, 12, CAST(N'2019-07-30T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (228, 19, 32, CAST(N'2019-06-15T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (229, 100, 14, CAST(N'2019-07-28T00:00:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (230, 16, 28, CAST(N'2019-07-12T00:00:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (231, 44, 4, CAST(N'2019-07-02T00:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (232, 36, 48, CAST(N'2019-09-09T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (233, 55, 13, CAST(N'2019-01-29T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (234, 11, 33, CAST(N'2019-01-19T00:00:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (235, 72, 35, CAST(N'2019-07-05T00:00:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (236, 100, 26, CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (237, 67, 40, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (238, 19, 31, CAST(N'2019-06-05T00:00:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (239, 84, 44, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (240, 73, 13, CAST(N'2019-06-24T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (241, 18, 32, CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (242, 33, 7, CAST(N'2019-11-27T00:00:00.000' AS DateTime), N'Замена лямбда зонда')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (243, 16, 30, CAST(N'2019-02-21T00:00:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (244, 27, 46, CAST(N'2019-11-26T00:00:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (245, 65, 47, CAST(N'2019-04-26T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (246, 7, 47, CAST(N'2019-11-23T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (247, 16, 33, CAST(N'2019-08-25T00:00:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (248, 46, 37, CAST(N'2019-05-09T00:00:00.000' AS DateTime), N'Замена тормозных колодок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (249, 18, 29, CAST(N'2019-08-08T00:00:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (250, 68, 17, CAST(N'2019-12-30T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (251, 76, 47, CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (252, 62, 26, CAST(N'2019-12-24T00:00:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (253, 68, 24, CAST(N'2019-04-06T00:00:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (254, 30, 35, CAST(N'2019-08-12T00:00:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (255, 78, 21, CAST(N'2019-08-12T00:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (256, 55, 26, CAST(N'2019-07-29T00:00:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (257, 26, 38, CAST(N'2019-04-14T00:00:00.000' AS DateTime), N'Покраска')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (258, 36, 34, CAST(N'2019-03-19T00:00:00.000' AS DateTime), N'Замена трубки кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (259, 62, 23, CAST(N'2019-12-15T00:00:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (260, 27, 41, CAST(N'2019-11-30T00:00:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (261, 46, 1, CAST(N'2019-11-14T00:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (262, 61, 5, CAST(N'2019-06-14T00:00:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (263, 30, 32, CAST(N'2019-03-22T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (264, 42, 40, CAST(N'2019-10-09T00:00:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (265, 33, 14, CAST(N'2019-03-16T00:00:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (266, 72, 28, CAST(N'2019-12-16T00:00:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (267, 16, 12, CAST(N'2019-08-15T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (268, 30, 42, CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'Диагностика инжектора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (269, 16, 27, CAST(N'2019-04-15T00:00:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (270, 8, 17, CAST(N'2019-08-12T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (271, 8, 13, CAST(N'2019-03-04T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (272, 16, 30, CAST(N'2019-02-24T00:00:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (273, 88, 41, CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (274, 11, 47, CAST(N'2019-08-05T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (275, 8, 25, CAST(N'2019-05-19T00:00:00.000' AS DateTime), N'Чистка форсунок ультразвуком')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (276, 74, 5, CAST(N'2019-12-30T00:00:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (277, 73, 17, CAST(N'2019-06-28T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (278, 26, 29, CAST(N'2019-11-05T00:00:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (279, 16, 24, CAST(N'2019-09-19T00:00:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (280, 30, 11, CAST(N'2019-02-26T00:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (281, 74, 49, CAST(N'2019-09-13T00:00:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (282, 11, 48, CAST(N'2019-10-14T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (283, 72, 35, CAST(N'2019-04-11T00:00:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (284, 72, 49, CAST(N'2019-03-06T00:00:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (285, 42, 12, CAST(N'2019-08-21T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (286, 49, 48, CAST(N'2019-06-29T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (287, 97, 46, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (288, 74, 12, CAST(N'2019-07-09T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (289, 61, 48, CAST(N'2019-06-16T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (290, 84, 5, CAST(N'2019-11-27T00:00:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (291, 7, 21, CAST(N'2019-05-27T00:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (292, 84, 48, CAST(N'2019-12-15T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (293, 11, 1, CAST(N'2019-10-17T00:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (294, 33, 43, CAST(N'2019-11-15T00:00:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (295, 100, 2, CAST(N'2019-08-24T00:00:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (296, 72, 31, CAST(N'2019-05-27T00:00:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (297, 55, 11, CAST(N'2019-08-19T00:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (298, 88, 50, CAST(N'2019-08-08T00:00:00.000' AS DateTime), N'Замена рулевой тяги')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (299, 67, 4, CAST(N'2019-02-24T00:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (300, 18, 39, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'Ремонт сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (301, 11, 44, CAST(N'2019-06-10T00:00:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (302, 16, 14, CAST(N'2019-02-16T00:00:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (303, 27, 49, CAST(N'2019-06-21T00:00:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (304, 62, 8, CAST(N'2019-10-14T00:00:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (305, 46, 17, CAST(N'2019-04-22T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (306, 88, 22, CAST(N'2019-06-22T00:00:00.000' AS DateTime), N'Диагностика рулевого редуктора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (307, 11, 48, CAST(N'2019-04-21T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (308, 78, 27, CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (309, 49, 45, CAST(N'2019-12-05T00:00:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (310, 24, 45, CAST(N'2019-09-17T00:00:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (311, 30, 2, CAST(N'2019-07-07T00:00:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (312, 24, 48, CAST(N'2019-05-28T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (313, 65, 21, CAST(N'2019-05-01T00:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (314, 65, 13, CAST(N'2019-04-15T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (315, 11, 43, CAST(N'2019-10-16T00:00:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (316, 74, 8, CAST(N'2019-07-09T00:00:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (317, 78, 27, CAST(N'2019-03-23T00:00:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (318, 33, 4, CAST(N'2019-05-23T00:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (319, 97, 23, CAST(N'2019-07-30T00:00:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (320, 65, 3, CAST(N'2019-08-24T00:00:00.000' AS DateTime), N'Замена тормозной жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (321, 76, 18, CAST(N'2019-12-23T00:00:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (322, 30, 18, CAST(N'2019-08-02T00:00:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (323, 16, 39, CAST(N'2019-02-15T00:00:00.000' AS DateTime), N'Ремонт сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (324, 27, 32, CAST(N'2019-12-28T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (325, 18, 11, CAST(N'2019-04-14T00:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (326, 11, 9, CAST(N'2019-12-18T00:00:00.000' AS DateTime), N'Замена подшипника задней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (327, 61, 12, CAST(N'2019-07-30T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (328, 19, 32, CAST(N'2019-06-15T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (329, 100, 14, CAST(N'2019-07-28T00:00:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (330, 16, 28, CAST(N'2019-07-12T00:00:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (331, 44, 4, CAST(N'2019-07-02T00:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (332, 36, 48, CAST(N'2019-09-09T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (333, 55, 13, CAST(N'2019-01-29T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (334, 11, 33, CAST(N'2019-01-19T00:00:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (335, 72, 35, CAST(N'2019-07-05T00:00:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (336, 100, 26, CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (337, 67, 40, CAST(N'2019-12-07T00:00:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (338, 19, 31, CAST(N'2019-06-05T00:00:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (339, 84, 44, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (340, 73, 13, CAST(N'2019-06-24T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (341, 18, 32, CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (342, 33, 7, CAST(N'2019-11-27T00:00:00.000' AS DateTime), N'Замена лямбда зонда')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (343, 16, 30, CAST(N'2019-02-21T00:00:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (344, 27, 46, CAST(N'2019-11-26T00:00:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (345, 65, 47, CAST(N'2019-04-26T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (346, 7, 47, CAST(N'2019-11-23T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (347, 16, 33, CAST(N'2019-08-25T00:00:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (348, 46, 37, CAST(N'2019-05-09T00:00:00.000' AS DateTime), N'Замена тормозных колодок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (349, 18, 29, CAST(N'2019-08-08T00:00:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (350, 68, 17, CAST(N'2019-12-30T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (351, 76, 47, CAST(N'2019-09-05T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (352, 62, 26, CAST(N'2019-12-24T00:00:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (353, 68, 24, CAST(N'2019-04-06T00:00:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (354, 30, 35, CAST(N'2019-08-12T00:00:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (355, 78, 21, CAST(N'2019-08-12T00:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (356, 55, 26, CAST(N'2019-07-29T00:00:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (357, 26, 38, CAST(N'2019-04-14T00:00:00.000' AS DateTime), N'Покраска')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (358, 36, 34, CAST(N'2019-03-19T00:00:00.000' AS DateTime), N'Замена трубки кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (359, 62, 23, CAST(N'2019-12-15T00:00:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (360, 27, 41, CAST(N'2019-11-30T00:00:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (361, 46, 1, CAST(N'2019-11-14T00:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (362, 61, 5, CAST(N'2019-06-14T00:00:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (363, 30, 32, CAST(N'2019-03-22T00:00:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (364, 42, 40, CAST(N'2019-10-09T00:00:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (365, 33, 14, CAST(N'2019-03-16T00:00:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (366, 72, 28, CAST(N'2019-12-16T00:00:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (367, 16, 12, CAST(N'2019-08-15T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (368, 30, 42, CAST(N'2019-09-20T00:00:00.000' AS DateTime), N'Диагностика инжектора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (369, 16, 27, CAST(N'2019-04-15T00:00:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (370, 8, 17, CAST(N'2019-08-12T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (371, 8, 13, CAST(N'2019-03-04T00:00:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (372, 16, 30, CAST(N'2019-02-24T00:00:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (373, 88, 41, CAST(N'2019-12-06T00:00:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (374, 11, 47, CAST(N'2019-08-05T00:00:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (375, 8, 25, CAST(N'2019-05-19T00:00:00.000' AS DateTime), N'Чистка форсунок ультразвуком')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (376, 74, 5, CAST(N'2019-12-30T00:00:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (377, 73, 17, CAST(N'2019-06-28T00:00:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (378, 26, 29, CAST(N'2019-11-05T00:00:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (379, 16, 24, CAST(N'2019-09-19T00:00:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (380, 30, 11, CAST(N'2019-02-26T00:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (381, 74, 49, CAST(N'2019-09-13T00:00:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (382, 11, 48, CAST(N'2019-10-14T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (383, 72, 35, CAST(N'2019-04-11T00:00:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (384, 72, 49, CAST(N'2019-03-06T00:00:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (385, 42, 12, CAST(N'2019-08-21T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (386, 49, 48, CAST(N'2019-06-29T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (387, 97, 46, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (388, 74, 12, CAST(N'2019-07-09T00:00:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (389, 61, 48, CAST(N'2019-06-16T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (390, 84, 5, CAST(N'2019-11-27T00:00:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (391, 7, 21, CAST(N'2019-05-27T00:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (392, 84, 48, CAST(N'2019-12-15T00:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (393, 11, 1, CAST(N'2019-10-17T00:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (394, 33, 43, CAST(N'2019-11-15T00:00:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (395, 100, 2, CAST(N'2019-08-24T00:00:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (396, 72, 31, CAST(N'2019-05-27T00:00:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (397, 55, 11, CAST(N'2019-08-19T00:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (398, 88, 50, CAST(N'2019-08-08T00:00:00.000' AS DateTime), N'Замена рулевой тяги')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (399, 67, 4, CAST(N'2019-02-24T00:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (400, 18, 39, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'Ремонт сцепления')
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'мужкой')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'женский')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Замена сальника привода', 3820.0000, 34200, N'', 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Замена кулисы АКПП', 3250.0000, 21600, N'', 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Замена тормозной жидкости', 2200.0000, 21600, N'', 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Ремонт компрессора кондиционера', 4760.0000, 9000, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Ремонт автоэлектрики', 4230.0000, 27000, N'', 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Наращивание ресниц', 1430.0000, 2400, N'', 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Замена лямбда зонда', 770.0000, 16200, N'', 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Кузовной ремонт', 2750.0000, 9000, N'', 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Замена подшипника задней ступицы', 1860.0000, 16200, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Замена масла в МКПП', 4490.0000, 32400, N'', 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Замена заднего сальника АКПП', 1510.0000, 23400, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Замена охлаждающей жидкости', 1590.0000, 12600, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Замена масла АКПП', 2430.0000, 27000, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Замена жидкости ГУР', 2380.0000, 32400, N'', 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Испанский массаж', 2190.0000, 8640000, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Балансировка колес', 4690.0000, 23400, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Замена подшипника передней ступицы', 4020.0000, 19800, N'', 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Ремонт двигателя', 2470.0000, 14400, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Замена сцепления', 4320.0000, 19800, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 1580.0000, 1800, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Замена подшипника компрессора кондиционера', 1110.0000, 19800, N'', 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Диагностика рулевого редуктора', 2930.0000, 10800, N'', 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Замена фильтров', 530.0000, 12600, N'', 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Ремонт глушителя', 2100.0000, 9000, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Чистка форсунок ультразвуком', 3920.0000, 14400, N'', 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Замена масла заднего редуктора (моста)', 840.0000, 25200, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Ремонт бензонасоса', 500.0000, 12600, N'', 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Антибактериальная обработка кондиционера', 4580.0000, 27000, N'', 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Замена ремня кондиционера', 4650.0000, 28800, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Ремонт и замена катализатора', 500.0000, 16200, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Ремонт карданного вала', 780.0000, 12600, N'', 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Установка сигнализации', 1760.0000, 14400, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Ремонт кронштейна глушителя', 1410.0000, 34200, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Замена трубки кондиционера', 2810.0000, 10800, N'', 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Диагностика подвески', 1460.0000, 19800, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Замена масла в вариаторе', 4720.0000, 7200, N'', 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Замена тормозных колодок', 4260.0000, 28800, N'', 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Покраска', 2370.0000, 7200, N'', 15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Ремонт сцепления', 3290.0000, 36000, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Диагностика трансмиссии', 2790.0000, 7200, N'', 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Диагностика выхлопной системы автомобиля', 2550.0000, 10800, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Диагностика инжектора', 3390.0000, 19800, N'', 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Замена троса сцепления', 4460.0000, 28800, N'', 5, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Замена маховика', 2400.0000, 36000, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Ремонт стартера', 2680.0000, 28800, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Снятие/установка форсунок', 1470.0000, 18000, N'', 25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Замена ремня привода ГУР', 3350.0000, 36000, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Замена свечей', 2240.0000, 7200, N'', 10, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Развал-схождение', 3890.0000, 10800, N'', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Замена рулевой тяги', 570.0000, 10800, N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [2905] SET  READ_WRITE 
GO

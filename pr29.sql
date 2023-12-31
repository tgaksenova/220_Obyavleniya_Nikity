USE [master]
GO
/****** Object:  Database [Pr_29]    Script Date: 07.11.2023 12:58:09 ******/
CREATE DATABASE [Pr_29]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pr_29', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLNIKITA\MSSQL\DATA\Pr_29.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pr_29_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLNIKITA\MSSQL\DATA\Pr_29_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Pr_29] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pr_29].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pr_29] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pr_29] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pr_29] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pr_29] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pr_29] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pr_29] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pr_29] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pr_29] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pr_29] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pr_29] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pr_29] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pr_29] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pr_29] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pr_29] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pr_29] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pr_29] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pr_29] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pr_29] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pr_29] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pr_29] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pr_29] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pr_29] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pr_29] SET RECOVERY FULL 
GO
ALTER DATABASE [Pr_29] SET  MULTI_USER 
GO
ALTER DATABASE [Pr_29] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pr_29] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pr_29] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pr_29] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pr_29] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pr_29] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pr_29', N'ON'
GO
ALTER DATABASE [Pr_29] SET QUERY_STORE = ON
GO
ALTER DATABASE [Pr_29] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Pr_29]
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 07.11.2023 12:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[AnnouncementId] [int] IDENTITY(1,1) NOT NULL,
	[PublicationDate] [date] NULL,
	[SellerId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PublicationName] [varchar](max) NULL,
	[ProductCost] [decimal](18, 0) NULL,
	[ProductCondition] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[PaymentMethod] [varchar](max) NULL,
	[DeliveryMethod] [varchar](max) NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[AnnouncementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 07.11.2023 12:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](max) NULL,
	[Subcategory] [varchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 07.11.2023 12:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[SellerId] [int] IDENTITY(1,1) NOT NULL,
	[Region] [varchar](max) NULL,
	[FIO] [varchar](max) NULL,
	[PhoneNumber] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[Login] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[SellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Announcement] ON 

INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (1, CAST(N'2023-12-03' AS Date), 1, 1, N'Машина', CAST(150000 AS Decimal(18, 0)), N'Отличное', N'В отличном состоянии', N'Наличными', N'Самовызов')
INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (2, CAST(N'2023-12-04' AS Date), 2, 1, N'Продам машину', CAST(230000 AS Decimal(18, 0)), N'Отличное', N'В отличном состоянии', N'Наличными', N'Самовызов')
INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (3, CAST(N'2023-12-05' AS Date), 1, 1, N'Куплю машину', CAST(2340000 AS Decimal(18, 0)), N'Отличное', N'В отличном состоянии', N'Наличными', N'Доставка')
INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (4, CAST(N'2023-12-05' AS Date), 3, 7, N'Продам кота', CAST(100 AS Decimal(18, 0)), N'Живой', N'В отличном состоянии', N'Безналичные', N'Самовызов')
INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (5, CAST(N'2023-12-06' AS Date), 4, 7, N'Продам кота', CAST(290 AS Decimal(18, 0)), N'Живой', N'В отличном состоянии', N'Наличными', N'Доставка')
INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (6, CAST(N'2023-12-07' AS Date), 6, 9, N'Продам недвижимость', CAST(1243412 AS Decimal(18, 0)), N'Отличное', N'В отличном состоянии', N'Наличными', N'Самовызов')
INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (7, CAST(N'2023-12-08' AS Date), 8, 1, N'Продам машину', CAST(2345642 AS Decimal(18, 0)), N'Отличное', N'В отличном состоянии', N'Наличными', N'Доставка')
INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (8, CAST(N'2023-12-08' AS Date), 2, 1, N'Куплю машину', CAST(6213456 AS Decimal(18, 0)), N'Отличное', N'В отличном состоянии', N'Наличными', N'Доставка')
INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (9, CAST(N'2023-12-09' AS Date), 1, 7, N'Продам кота', CAST(234 AS Decimal(18, 0)), N'Живой', N'В отличном состоянии', N'Безналичные', N'Самовызов')
INSERT [dbo].[Announcement] ([AnnouncementId], [PublicationDate], [SellerId], [CategoryId], [PublicationName], [ProductCost], [ProductCondition], [Description], [PaymentMethod], [DeliveryMethod]) VALUES (10, CAST(N'2023-12-09' AS Date), 2, 7, N'Куплю кота', CAST(123 AS Decimal(18, 0)), N'Живой', N'В отличном состоянии', N'Безналичные', N'Самовызов')
SET IDENTITY_INSERT [dbo].[Announcement] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (1, N'Машины', N'Nissan')
INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (2, N'Личные вещи', N'Духи')
INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (3, N'Одежда', N'Gucci')
INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (4, N'Красота и здоровье', N'Тональники')
INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (5, N'Услуги', N'Ремонт')
INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (6, N'Работа', N'Повар')
INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (7, N'Животные', N'Кошки')
INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (8, N'Электроника', N'Телефоны')
INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (9, N'Недвижимость', N'Вторичка')
INSERT [dbo].[Categories] ([CategoryId], [Category], [Subcategory]) VALUES (10, N'Для дома и дачи', N'Инструменты')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Sellers] ON 

INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (1, N'Москва', N'Назарян Артур Павлович', N'89019098978', N'hellomir@gmail.com', N'ул. Тверская, д. 7', N'sdfg', N'wergh')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (2, N'Москва', N'Абубачир Рахит Наджирбаевич', N'89009897890', N'manerakrutitmir@gmail.com', N'ул. Московская, д. 21', N'gsdfb', N'dfghbsfdh')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (3, N'Москва', N'Лукумов Рахат Виноградович', N'89659897890', N'dboublecape@gmail.com', N'ул. Серая, д. 31', N'xcvbfdgh', N'sdfghnbfgb')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (4, N'Москва', N'Манера Бабиджон Крутитмирович', N'89659897890', N'moemzany@gmail.com', N'ул. Синяя, д. 31', N'adfg', N'fdghn')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (5, N'Москва', N'Абубашвил Назим Кусимирович', N'89439897890', N'avrykederzhysvoybin@gmail.com', N'ул. Главная, д. 31', N'gsdf', N'cvbn')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (6, N'Москва', N'Головач Лена Разумовна', N'89652397890', N'heyyapogodi@gmail.com', N'ул. Важная, д. 31', N'bxcvb', N'vcbn44r5te')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (7, N'Москва', N'Наср Али Викторович', N'89852397890', N'imswervinshitodin@gmail.com', N'ул. Телефона, д. 31', N'cvb', N'trerhtf')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (8, N'Москва', N'Чурбанов Иван Васильевич', N'89772397890', N'imnetakpofig@gmail.com', N'ул. Компьютерная, д. 31', N'err', N'34rg')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (9, N'Москва', N'Отчимус Артур Праймович', N'88900397890', N'yazastryalsredetihpaytin@gmail.com', N'ул. Крыжовна, д. 31', N'ergh', N'3q4rge')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (10, N'Москва', N'Чуркмамбетов Хач Витальевич', N'87600397890', N'onigovoryatmne4toyzvnorme@gmail.com', N'ул. Радикулитовна, д. 31', N'bcvbx', N'56htr')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (1002, NULL, NULL, NULL, NULL, NULL, N'System.Windows.Controls.TextBox: апчихба', N'System.Windows.Controls.TextBox: 12345')
INSERT [dbo].[Sellers] ([SellerId], [Region], [FIO], [PhoneNumber], [Email], [Address], [Login], [Password]) VALUES (1003, NULL, NULL, NULL, NULL, NULL, N'апчихба', N'12345')
SET IDENTITY_INSERT [dbo].[Sellers] OFF
GO
ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD  CONSTRAINT [FK_Announcement_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Announcement] CHECK CONSTRAINT [FK_Announcement_Categories]
GO
ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD  CONSTRAINT [FK_Announcement_Sellers] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Sellers] ([SellerId])
GO
ALTER TABLE [dbo].[Announcement] CHECK CONSTRAINT [FK_Announcement_Sellers]
GO
USE [master]
GO
ALTER DATABASE [Pr_29] SET  READ_WRITE 
GO

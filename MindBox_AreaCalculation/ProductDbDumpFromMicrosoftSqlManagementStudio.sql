USE [master]
GO
/****** Object:  Database [testDb]    Script Date: 05.05.2023 11:44:56 ******/
CREATE DATABASE [testDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testDb', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\testDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testDb_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\testDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [testDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [testDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [testDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testDb] SET RECOVERY FULL 
GO
ALTER DATABASE [testDb] SET  MULTI_USER 
GO
ALTER DATABASE [testDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [testDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [testDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'testDb', N'ON'
GO
ALTER DATABASE [testDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [testDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [testDb]
GO
/****** Object:  Table [dbo].[category]    Script Date: 05.05.2023 11:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [varchar](100) NULL,
 CONSTRAINT [category_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 05.05.2023 11:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [varchar](100) NULL,
 CONSTRAINT [product_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productCategories]    Script Date: 05.05.2023 11:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productCategories](
	[product_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [productCategories_UN] UNIQUE NONCLUSTERED 
(
	[product_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[productCategories]  WITH CHECK ADD  CONSTRAINT [productCategories_FK] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[productCategories] CHECK CONSTRAINT [productCategories_FK]
GO
ALTER TABLE [dbo].[productCategories]  WITH CHECK ADD  CONSTRAINT [productCategories_FK_1] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[productCategories] CHECK CONSTRAINT [productCategories_FK_1]
GO
USE [master]
GO
ALTER DATABASE [testDb] SET  READ_WRITE 
GO

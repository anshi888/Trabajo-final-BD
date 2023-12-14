USE [master]
GO
/****** Object:  Database [Legos]    Script Date: 14/12/2023 15:13:05 ******/
CREATE DATABASE [Legos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Legos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Legos.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Legos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Legos_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Legos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Legos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Legos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Legos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Legos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Legos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Legos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Legos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Legos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Legos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Legos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Legos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Legos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Legos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Legos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Legos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Legos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Legos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Legos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Legos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Legos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Legos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Legos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Legos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Legos] SET RECOVERY FULL 
GO
ALTER DATABASE [Legos] SET  MULTI_USER 
GO
ALTER DATABASE [Legos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Legos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Legos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Legos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Legos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Legos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Legos', N'ON'
GO
ALTER DATABASE [Legos] SET QUERY_STORE = ON
GO
ALTER DATABASE [Legos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Legos]
GO
/****** Object:  Table [dbo].[colors]    Script Date: 14/12/2023 15:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colors](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[rgb] [nvarchar](6) NULL,
	[is_trans] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventories]    Script Date: 14/12/2023 15:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventories](
	[id] [int] NOT NULL,
	[version] [int] NULL,
	[set_num] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory_parts]    Script Date: 14/12/2023 15:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory_parts](
	[inventory_id] [int] NULL,
	[part_num] [nvarchar](255) NULL,
	[color_id] [int] NULL,
	[quantity] [int] NULL,
	[is_spare] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory_sets]    Script Date: 14/12/2023 15:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory_sets](
	[inventory_id] [int] NULL,
	[set_num] [nvarchar](255) NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[part_categories]    Script Date: 14/12/2023 15:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[part_categories](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parts]    Script Date: 14/12/2023 15:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parts](
	[part_num] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[part_cat_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[part_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sets]    Script Date: 14/12/2023 15:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sets](
	[set_num] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[year] [int] NULL,
	[theme_id] [int] NULL,
	[num_parts] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[set_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[themes]    Script Date: 14/12/2023 15:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[themes](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[parent_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[inventories]  WITH CHECK ADD  CONSTRAINT [FK_inventories_sets] FOREIGN KEY([set_num])
REFERENCES [dbo].[sets] ([set_num])
GO
ALTER TABLE [dbo].[inventories] CHECK CONSTRAINT [FK_inventories_sets]
GO
ALTER TABLE [dbo].[inventory_parts]  WITH CHECK ADD  CONSTRAINT [FK_inventory_parts_COLORS] FOREIGN KEY([color_id])
REFERENCES [dbo].[colors] ([id])
GO
ALTER TABLE [dbo].[inventory_parts] CHECK CONSTRAINT [FK_inventory_parts_COLORS]
GO
ALTER TABLE [dbo].[inventory_parts]  WITH CHECK ADD  CONSTRAINT [FK_inventory_parts_inventories] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[inventories] ([id])
GO
ALTER TABLE [dbo].[inventory_parts] CHECK CONSTRAINT [FK_inventory_parts_inventories]
GO
ALTER TABLE [dbo].[inventory_sets]  WITH CHECK ADD  CONSTRAINT [FK_inventory_sets_inventories] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[inventories] ([id])
GO
ALTER TABLE [dbo].[inventory_sets] CHECK CONSTRAINT [FK_inventory_sets_inventories]
GO
ALTER TABLE [dbo].[inventory_sets]  WITH CHECK ADD  CONSTRAINT [FK_inventory_sets_sets] FOREIGN KEY([set_num])
REFERENCES [dbo].[sets] ([set_num])
GO
ALTER TABLE [dbo].[inventory_sets] CHECK CONSTRAINT [FK_inventory_sets_sets]
GO
ALTER TABLE [dbo].[parts]  WITH CHECK ADD FOREIGN KEY([part_cat_id])
REFERENCES [dbo].[part_categories] ([id])
GO
ALTER TABLE [dbo].[sets]  WITH CHECK ADD  CONSTRAINT [FK_sets_themes] FOREIGN KEY([theme_id])
REFERENCES [dbo].[themes] ([id])
GO
ALTER TABLE [dbo].[sets] CHECK CONSTRAINT [FK_sets_themes]
GO
USE [master]
GO
ALTER DATABASE [Legos] SET  READ_WRITE 
GO
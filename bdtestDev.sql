USE [master]
GO
/****** Object:  Database [employeesdb]    Script Date: 08/02/2024 10:43:49 p. m. ******/
CREATE DATABASE [employeesdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'employeesdb', FILENAME = N'C:\SQLData\MSSQL16.SQLEXPRESS\MSSQL\DATA\employeesdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'employeesdb_log', FILENAME = N'C:\SQLData\Log\employeesdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [employeesdb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [employeesdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [employeesdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [employeesdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [employeesdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [employeesdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [employeesdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [employeesdb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [employeesdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [employeesdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [employeesdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [employeesdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [employeesdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [employeesdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [employeesdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [employeesdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [employeesdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [employeesdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [employeesdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [employeesdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [employeesdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [employeesdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [employeesdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [employeesdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [employeesdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [employeesdb] SET  MULTI_USER 
GO
ALTER DATABASE [employeesdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [employeesdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [employeesdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [employeesdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [employeesdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [employeesdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [employeesdb] SET QUERY_STORE = ON
GO
ALTER DATABASE [employeesdb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [employeesdb]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 08/02/2024 10:43:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameEmployee] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[RFC] [varchar](13) NOT NULL,
	[BornDate] [date] NOT NULL,
	[EmployeeStatus] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (3, N'Diego', N'Luciano', N'LUPD011231HMC', CAST(N'2001-12-31' AS Date), N'Active')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (4, N'Alitzel', N'Cruz', N'AACA060201ATL', CAST(N'2001-02-06' AS Date), N'Inactive')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (5, N'Lucia', N'Rodiguez', N'LUBR110801XDP', CAST(N'2001-08-11' AS Date), N'Inactive')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (6, N'Ivonne', N'Monroy', N'IMOR280501APX', CAST(N'2001-05-28' AS Date), N'Active')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (9, N'Yuri', N'Martinez', N'YUMM654789ASS', CAST(N'2000-06-06' AS Date), N'Active')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (10, N'Liam', N'Luciano', N'LILA221221CUT', CAST(N'2021-12-22' AS Date), N'Inactive')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (11, N'Juan', N'Martinez', N'ABCD123456XYZ', CAST(N'2006-06-05' AS Date), N'Inactive')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (12, N'Porter', N'Robinson', N'YUMM654789XXX', CAST(N'1998-02-23' AS Date), N'Inactive')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (13, N'Stocker', N'Robinson', N'YUMM654789PSP', CAST(N'1950-05-12' AS Date), N'Inactive')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (15, N'Alex', N'Lora', N'YUMM654789ABC', CAST(N'2008-03-12' AS Date), N'NotSet')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (16, N'Robert', N'Cruz', N'LUPD011231POA', CAST(N'1982-03-12' AS Date), N'Active')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (17, N'Lara', N'Croft', N'LARP520156ASD', CAST(N'1907-06-12' AS Date), N'NotSet')
INSERT [dbo].[Employees] ([ID], [NameEmployee], [LastName], [RFC], [BornDate], [EmployeeStatus]) VALUES (18, N'Kim', N'Robetr', N'KMRP145698MXC', CAST(N'1998-05-14' AS Date), N'NotSet')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
/****** Object:  StoredProcedure [dbo].[alta_empleado]    Script Date: 08/02/2024 10:43:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[alta_empleado](@NameEmployee varchar(50), @LastName varchar(50), @RFC varchar(13), @BornDate date, 
	@EmployeeStatus varchar(20))
as
begin
	insert into Employees (NameEmployee, LastName, RFC, BornDate, EmployeeStatus) values(@NameEmployee, @LastName, @RFC, @BornDate, 
	@EmployeeStatus)
end
GO
/****** Object:  StoredProcedure [dbo].[baja_empleado]    Script Date: 08/02/2024 10:43:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[baja_empleado](@ID int)
as
begin
	delete from Employees where ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[empleado_rfc]    Script Date: 08/02/2024 10:43:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[empleado_rfc]
    @RFC NVARCHAR(13)
AS
BEGIN
    SELECT * FROM Employees WHERE RFC = @RFC;
END;
GO
/****** Object:  StoredProcedure [dbo].[get_employee]    Script Date: 08/02/2024 10:43:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_employee]
@NameEmployee VARCHAR(50)
as
begin
	select * from Employees where NameEmployee = @NameEmployee
end
GO
/****** Object:  StoredProcedure [dbo].[listar_empleados]    Script Date: 08/02/2024 10:43:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_empleados]
as
begin
	select * from Employees
end
GO
/****** Object:  StoredProcedure [dbo].[modificar_empleado]    Script Date: 08/02/2024 10:43:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[modificar_empleado](@ID int, @NameEmployee varchar(50), @LastName varchar(50), @RFC varchar(13), @BornDate date, 
	@EmployeeStatus varchar(20))
as
begin
	update Employees set NameEmployee = @NameEmployee, LastName = @LastName, RFC = @RFC, BornDate = @BornDate, EmployeeStatus= @EmployeeStatus where ID = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[RetrieveEmployees]    Script Date: 08/02/2024 10:43:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetrieveEmployees]
    @nameFilter NVARCHAR(100) = NULL
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE (@nameFilter IS NULL OR NameEmployee LIKE '%' + @nameFilter + '%')
    ORDER BY BornDate;
END
GO
USE [master]
GO
ALTER DATABASE [employeesdb] SET  READ_WRITE 
GO

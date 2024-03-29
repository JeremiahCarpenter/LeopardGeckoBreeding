USE [master]
GO
/****** Object:  Database [LeopardGeckoBreeding]    Script Date: 7/10/2019 12:41:19 PM ******/
CREATE DATABASE [LeopardGeckoBreeding]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LustyLeopardGeckoMaid', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LustyLeopardGeckoMaid.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LustyLeopardGeckoMaid_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LustyLeopardGeckoMaid_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LeopardGeckoBreeding] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LeopardGeckoBreeding].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LeopardGeckoBreeding] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET ARITHABORT OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET  MULTI_USER 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LeopardGeckoBreeding] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LeopardGeckoBreeding] SET QUERY_STORE = OFF
GO
USE [LeopardGeckoBreeding]
GO
/****** Object:  Table [dbo].[Geckos]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geckos](
	[GeckoID] [int] IDENTITY(1,1) NOT NULL,
	[Sex] [nvarchar](50) NULL,
	[Weight] [decimal](18, 2) NULL,
	[BreedEligability] [bit] NULL,
	[Age] [int] NULL,
	[OwnerID] [int] NULL,
 CONSTRAINT [PK_Gecko] PRIMARY KEY CLUSTERED 
(
	[GeckoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterTable]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterTable](
	[GeckoID] [int] NOT NULL,
	[MorphID] [int] NOT NULL,
 CONSTRAINT [PK_Geckos&Morphs] PRIMARY KEY CLUSTERED 
(
	[GeckoID] ASC,
	[MorphID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTrace]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTrace](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](250) NULL,
	[Trace] [nvarchar](max) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_LogTrace] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Morphs]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Morphs](
	[MorphID] [int] IDENTITY(1,1) NOT NULL,
	[MorphName] [nvarchar](150) NULL,
	[Description] [nvarchar](max) NULL,
	[Het] [bit] NULL,
 CONSTRAINT [PK_Morphs] PRIMARY KEY CLUSTERED 
(
	[MorphID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](150) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NULL,
	[EmailAddress] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
	[Password] [nvarchar](150) NULL,
	[Hash] [nvarchar](150) NULL,
	[Salt] [nvarchar](150) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Geckos] ON 

INSERT [dbo].[Geckos] ([GeckoID], [Sex], [Weight], [BreedEligability], [Age], [OwnerID]) VALUES (1, N'm', CAST(45.00 AS Decimal(18, 2)), 1, 12, 1)
INSERT [dbo].[Geckos] ([GeckoID], [Sex], [Weight], [BreedEligability], [Age], [OwnerID]) VALUES (2, N'f', CAST(55.00 AS Decimal(18, 2)), 1, 15, 1)
INSERT [dbo].[Geckos] ([GeckoID], [Sex], [Weight], [BreedEligability], [Age], [OwnerID]) VALUES (3, N'f', CAST(60.00 AS Decimal(18, 2)), 1, 14, 1)
INSERT [dbo].[Geckos] ([GeckoID], [Sex], [Weight], [BreedEligability], [Age], [OwnerID]) VALUES (4, N'm', CAST(75.00 AS Decimal(18, 2)), 1, 17, 1)
INSERT [dbo].[Geckos] ([GeckoID], [Sex], [Weight], [BreedEligability], [Age], [OwnerID]) VALUES (5, N'm', CAST(45.00 AS Decimal(18, 2)), 0, 13, 2)
INSERT [dbo].[Geckos] ([GeckoID], [Sex], [Weight], [BreedEligability], [Age], [OwnerID]) VALUES (6, N'f', CAST(50.00 AS Decimal(18, 2)), 1, 16, 2)
INSERT [dbo].[Geckos] ([GeckoID], [Sex], [Weight], [BreedEligability], [Age], [OwnerID]) VALUES (7, N'f', CAST(60.00 AS Decimal(18, 2)), 1, 18, 2)
INSERT [dbo].[Geckos] ([GeckoID], [Sex], [Weight], [BreedEligability], [Age], [OwnerID]) VALUES (8, N'm', CAST(45.00 AS Decimal(18, 2)), 1, 12, 2)
SET IDENTITY_INSERT [dbo].[Geckos] OFF
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (1, 1)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (1, 3)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (1, 4)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (1, 6)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (2, 2)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (2, 4)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (3, 5)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (3, 8)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (3, 12)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (4, 2)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (4, 9)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (4, 15)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (5, 3)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (5, 8)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (5, 11)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (5, 13)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (6, 12)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (6, 14)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (7, 5)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (7, 9)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (7, 11)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (8, 1)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (8, 3)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (8, 5)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (8, 7)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (8, 9)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (8, 11)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (8, 13)
INSERT [dbo].[InterTable] ([GeckoID], [MorphID]) VALUES (8, 15)
SET IDENTITY_INSERT [dbo].[LogTrace] ON 

INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (1, N'Procedure or function ''JustUpdateUser'' expects parameter ''@Hash'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.JustUpdateUser(Int32 UserID, String UserName, String EmailAddress, Int32 RoleID, String Password, String Hash, String Salt) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 929', CAST(N'2019-07-03T13:13:23.847' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (2, N'Procedure or function ''JustUpdateUser'' expects parameter ''@Hash'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.JustUpdateUser(Int32 UserID, String UserName, String EmailAddress, Int32 RoleID, String Password, String Hash, String Salt) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 929', CAST(N'2019-07-03T13:14:12.827' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (3, N'Procedure or function ''JustUpdateUser'' expects parameter ''@Hash'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.JustUpdateUser(Int32 UserID, String UserName, String EmailAddress, Int32 RoleID, String Password, String Hash, String Salt) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 929', CAST(N'2019-07-03T13:20:03.457' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (4, N'Procedure or function ''JustUpdateUser'' expects parameter ''@Hash'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.JustUpdateUser(Int32 UserID, String UserName, String EmailAddress, Int32 RoleID, String Password, String Hash, String Salt) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 929', CAST(N'2019-07-03T13:30:29.177' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (5, N'Procedure or function ''JustUpdateUser'' expects parameter ''@Hash'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.JustUpdateUser(Int32 UserID, String UserName, String EmailAddress, Int32 RoleID, String Password, String Hash, String Salt) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 929', CAST(N'2019-07-03T13:33:13.400' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (6, N'Procedure or function ''JustUpdateUser'' expects parameter ''@Hash'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.JustUpdateUser(Int32 UserID, String UserName, String EmailAddress, Int32 RoleID, String Password, String Hash, String Salt) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 929', CAST(N'2019-07-03T13:38:36.360' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (7, N'Procedure or function ''JustUpdateUser'' expects parameter ''@Hash'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.JustUpdateUser(Int32 UserID, String UserName, String EmailAddress, Int32 RoleID, String Password, String Hash, String Salt) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 929', CAST(N'2019-07-03T13:39:26.420' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (8, N'Procedure or function ''JustUpdateUser'' expects parameter ''@Hash'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.JustUpdateUser(Int32 UserID, String UserName, String EmailAddress, Int32 RoleID, String Password, String Hash, String Salt) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 929', CAST(N'2019-07-03T13:40:13.283' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (9, N'Procedure or function ''JustUpdateUser'' expects parameter ''@Hash'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.JustUpdateUser(Int32 UserID, String UserName, String EmailAddress, Int32 RoleID, String Password, String Hash, String Salt) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 929', CAST(N'2019-07-03T13:41:56.573' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (10, N'Violation of PRIMARY KEY constraint ''PK_Morphs''. Cannot insert duplicate key in object ''dbo.Morphs''. The duplicate key value is (2).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateMorph(String MorphName, String Description, Boolean Het) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 532', CAST(N'2019-07-08T13:33:15.670' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (11, N'Violation of PRIMARY KEY constraint ''PK_Morphs''. Cannot insert duplicate key in object ''dbo.Morphs''. The duplicate key value is (2).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateMorph(String MorphName, String Description, Boolean Het) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 540
   at BusinessLogicLayer.ContextBLL.CreateMorph(String MorphName, String Description, Boolean Het) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\BusinessLogicLayer\ContextBLL.cs:line 116
   at GeckoWebsite.Controllers.MorphsController.Create(MorphBLL collection) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\MorphsController.cs:line 70', CAST(N'2019-07-08T13:33:15.853' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (12, N'Error converting data type numeric to decimal.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateGecko(String Sex, Decimal Weight, Boolean BreedEligability, Int32 Age, Int32 OwnerID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 268', CAST(N'2019-07-08T13:53:31.860' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (13, N'Error converting data type numeric to decimal.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateGecko(String Sex, Decimal Weight, Boolean BreedEligability, Int32 Age, Int32 OwnerID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 275
   at BusinessLogicLayer.ContextBLL.CreateGecko(String Sex, Decimal Weight, Boolean BreedEligability, Int32 Age, Int32 OwnerID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\BusinessLogicLayer\ContextBLL.cs:line 26
   at GeckoWebsite.Controllers.HomeController.RegisterAsBreederWithGecko(TwoLevelsModel newuser) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\HomeController.cs:line 199', CAST(N'2019-07-08T13:53:31.963' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (14, N'Object reference not set to an instance of an object.', N'   at GeckoWebsite.Controllers.GeckosController.Index() in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\GeckosController.cs:line 22', CAST(N'2019-07-08T14:03:49.880' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (15, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Geckos_Users". The conflict occurred in database "LeopardGeckoBreeding", table "dbo.Users", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateGecko(String Sex, Decimal Weight, Boolean BreedEligability, Int32 Age, Int32 OwnerID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 268', CAST(N'2019-07-08T14:19:24.960' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (16, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Geckos_Users". The conflict occurred in database "LeopardGeckoBreeding", table "dbo.Users", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateGecko(String Sex, Decimal Weight, Boolean BreedEligability, Int32 Age, Int32 OwnerID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 275
   at BusinessLogicLayer.ContextBLL.CreateGecko(String Sex, Decimal Weight, Boolean BreedEligability, Int32 Age, Int32 OwnerID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\BusinessLogicLayer\ContextBLL.cs:line 26
   at GeckoWebsite.Controllers.HomeController.RegisterAsBreederWithGecko(TwoLevelsModel newuser) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\HomeController.cs:line 199', CAST(N'2019-07-08T14:19:25.097' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (17, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Geckos_Users". The conflict occurred in database "LeopardGeckoBreeding", table "dbo.Users", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateGecko(String Sex, Decimal Weight, Boolean BreedEligability, Int32 Age, Int32 OwnerID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 268', CAST(N'2019-07-08T14:24:19.590' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (18, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Geckos_Users". The conflict occurred in database "LeopardGeckoBreeding", table "dbo.Users", column ''UserID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateGecko(String Sex, Decimal Weight, Boolean BreedEligability, Int32 Age, Int32 OwnerID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 275
   at BusinessLogicLayer.ContextBLL.CreateGecko(String Sex, Decimal Weight, Boolean BreedEligability, Int32 Age, Int32 OwnerID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\BusinessLogicLayer\ContextBLL.cs:line 26
   at GeckoWebsite.Controllers.HomeController.RegisterAsBreederWithGecko(TwoLevelsModel newuser) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\HomeController.cs:line 199', CAST(N'2019-07-08T14:24:19.637' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (19, N'Object reference not set to an instance of an object.', N'   at GeckoWebsite.Controllers.GeckosController.Index() in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\GeckosController.cs:line 22', CAST(N'2019-07-08T14:26:30.577' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (20, N'Could not find stored procedure ''GetInterTables''.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.GetIntertables(Int32 skip, Int32 take) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 526', CAST(N'2019-07-09T09:10:36.040' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (21, N'Could not find stored procedure ''GetInterTables''.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.GetIntertables(Int32 skip, Int32 take) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 540
   at BusinessLogicLayer.ContextBLL.GetInterTables(Int32 skip, Int32 take) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\BusinessLogicLayer\ContextBLL.cs:line 115
   at GeckoWebsite.Controllers.InterTableController.Index() in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\InterTableController.cs:line 19', CAST(N'2019-07-09T09:10:36.317' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (22, N'Could not find stored procedure ''GetInterTable''.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.GetIntertables(Int32 skip, Int32 take) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 526', CAST(N'2019-07-09T09:12:24.180' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (23, N'Could not find stored procedure ''GetInterTable''.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.GetIntertables(Int32 skip, Int32 take) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 540
   at BusinessLogicLayer.ContextBLL.GetInterTables(Int32 skip, Int32 take) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\BusinessLogicLayer\ContextBLL.cs:line 115
   at GeckoWebsite.Controllers.InterTableController.Index() in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\InterTableController.cs:line 19', CAST(N'2019-07-09T09:12:24.280' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (24, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (1, 1).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T09:19:16.887' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (25, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (1, 1).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T09:19:20.260' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (26, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (1, 1).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T09:19:21.207' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (27, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (1, 1).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T09:19:21.440' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (28, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (1, 1).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T09:19:22.007' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (29, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (1, 1).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T09:19:22.110' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (30, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (1, 1).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T09:19:22.383' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (31, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (1, 1).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T09:30:34.943' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (32, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Geckos&Morphs_Morphs". The conflict occurred in database "LeopardGeckoBreeding", table "dbo.Morphs", column ''MorphID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T09:47:40.257' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (33, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Geckos&Morphs_Morphs". The conflict occurred in database "LeopardGeckoBreeding", table "dbo.Morphs", column ''MorphID''.
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 492
   at BusinessLogicLayer.ContextBLL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\BusinessLogicLayer\ContextBLL.cs:line 106
   at GeckoWebsite.Controllers.InterTableController.Create(InterTableBLL i) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\InterTableController.cs:line 48', CAST(N'2019-07-09T09:47:40.313' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (34, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (2, 7).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 485', CAST(N'2019-07-09T13:32:04.740' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (35, N'Violation of PRIMARY KEY constraint ''PK_Geckos&Morphs''. Cannot insert duplicate key in object ''dbo.InterTable''. The duplicate key value is (2, 7).
The statement has been terminated.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at DataAccessLayer.ContextDAL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 492
   at BusinessLogicLayer.ContextBLL.CreateInterTable(Int32 GeckoID, Int32 MorphID) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\BusinessLogicLayer\ContextBLL.cs:line 106
   at GeckoWebsite.Controllers.InterTableController.Create(InterTableBLL i) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\InterTableController.cs:line 48', CAST(N'2019-07-09T13:32:04.887' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (36, N'Procedure or function ''FindUserByEmailAddress'' expects parameter ''@EmailAddress'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.FindUserByEmail(String EmailAddress) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 1045', CAST(N'2019-07-10T11:18:55.987' AS DateTime))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Trace], [Time]) VALUES (37, N'Procedure or function ''FindUserByEmailAddress'' expects parameter ''@EmailAddress'', which was not supplied.', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader()
   at DataAccessLayer.ContextDAL.FindUserByEmail(String EmailAddress) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\DataAccessLayer\DalContext.cs:line 1058
   at BusinessLogicLayer.ContextBLL.FindUserByEmail(String EmailAddress) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\BusinessLogicLayer\ContextBLL.cs:line 218
   at GeckoWebsite.Controllers.HomeController.RegisterAsGuestWithGecko(TwoLevelsModel newuser) in C:\Users\Onshore\source\repos\LeopardGeckoBreeding\GeckoWebsite\Controllers\HomeController.cs:line 157', CAST(N'2019-07-10T11:18:56.550' AS DateTime))
SET IDENTITY_INSERT [dbo].[LogTrace] OFF
SET IDENTITY_INSERT [dbo].[Morphs] ON 

INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (1, N'Tangerine', N'more orange', 0)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (2, N'Tangerine', N'more orange', 1)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (3, N'Emerine', N'Greenish hue', 0)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (4, N'Emerine', N'Greenish hue', 1)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (5, N'Snow', N'More black spots', 0)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (6, N'Snow', N'More black spots', 1)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (7, N'Melanistic', N'Darker overall', 0)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (8, N'Melanistic', N'Darker overall', 1)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (9, N'Albino', N'Lacks melanin', 0)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (10, N'Albino', N'Lacks melanin', 1)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (11, N'Fire', N'More red', 0)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (12, N'Fire', N'More red', 1)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (13, N'Eclipse', N'Black Eyes', 0)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (14, N'Eclipse', N'Black Eyes', 1)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (15, N'Rubick', N'Just odd', 0)
INSERT [dbo].[Morphs] ([MorphID], [MorphName], [Description], [Het]) VALUES (16, N'Rubick', N'Just odd', 1)
SET IDENTITY_INSERT [dbo].[Morphs] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (2, N'Breeder')
INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (3, N'Guest')
INSERT [dbo].[Roles] ([RoleID], [Role]) VALUES (5, N'otherbreeder')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [EmailAddress], [RoleID], [Password], [Hash], [Salt]) VALUES (1, N'L Stone', N'lstone@mail.com', 1, N'12345', N'12345', N'12345')
INSERT [dbo].[Users] ([UserID], [UserName], [EmailAddress], [RoleID], [Password], [Hash], [Salt]) VALUES (2, N'M Pat', N'mpat@mail.com', 2, N'12345', N'12345', N'12345')
INSERT [dbo].[Users] ([UserID], [UserName], [EmailAddress], [RoleID], [Password], [Hash], [Salt]) VALUES (4, N'M Esc', N'mesc@mail.com', 3, N'12345', N'12345', N'12345')
INSERT [dbo].[Users] ([UserID], [UserName], [EmailAddress], [RoleID], [Password], [Hash], [Salt]) VALUES (5, N'J Mig', N'jmig@mail.com', 3, N'12345', N'12345', N'12345')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Geckos]  WITH CHECK ADD  CONSTRAINT [FK_Geckos_Users] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Geckos] CHECK CONSTRAINT [FK_Geckos_Users]
GO
ALTER TABLE [dbo].[InterTable]  WITH CHECK ADD  CONSTRAINT [FK_Geckos&Morphs_Geckos] FOREIGN KEY([GeckoID])
REFERENCES [dbo].[Geckos] ([GeckoID])
GO
ALTER TABLE [dbo].[InterTable] CHECK CONSTRAINT [FK_Geckos&Morphs_Geckos]
GO
ALTER TABLE [dbo].[InterTable]  WITH CHECK ADD  CONSTRAINT [FK_Geckos&Morphs_Morphs] FOREIGN KEY([MorphID])
REFERENCES [dbo].[Morphs] ([MorphID])
GO
ALTER TABLE [dbo].[InterTable] CHECK CONSTRAINT [FK_Geckos&Morphs_Morphs]
GO
ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[CreateGecko]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE PROCEDURE [dbo].[CreateGecko] 
	-- Add the parameters for the stored procedure here
	@GeckoID int output, 
	@Sex nvarchar(50),
	@Weight decimal(18,2),
	@BreedEligability bit,
	@Age int,
	@OwnerID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Geckos]
           (Sex,Weight,BreedEligability,Age,OwnerID)
     VALUES
           (@Sex,@Weight,@BreedEligability,@Age,@OwnerID);

select @GeckoID = @@IDENTITY;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateInterTable]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Walters
-- Create date: 5/15/2019
-- Description:	Create a New Role
-- =============================================
Create PROCEDURE [dbo].[CreateInterTable] 
	-- Add the parameters for the stored procedure here 
	@GeckoID int,
	@MorphID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO InterTable
     VALUES
           (@GeckoID,@MorphID);

END
GO
/****** Object:  StoredProcedure [dbo].[CreateMorph]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Walters
-- Create date: 5/15/2019
-- Description:	Create a New Role
-- =============================================
CREATE PROCEDURE [dbo].[CreateMorph] 
	-- Add the parameters for the stored procedure here 
	@MorphID int output,
	@MorphName nvarchar(150),
	@Description text,
	@Het bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Morphs]
           (MorphName,Description,Het)
     VALUES
           (@MorphName, @Description,@Het);

select @MorphID = @@IDENTITY;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRole]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Walters
-- Create date: 5/15/2019
-- Description:	Create a New Role
-- =============================================
CREATE PROCEDURE [dbo].[CreateRole] 
	-- Add the parameters for the stored procedure here 
	@RoleID int output,
	@Role nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Roles]
           (Role)
     VALUES
           (@Role);

select @RoleID = @@IDENTITY;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Walters
-- Create date: 5/15/2019
-- Description:	Create a New Role
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser] 
	-- Add the parameters for the stored procedure here 
	@UserId int output,
	@UserName nvarchar(150),
	@EmailAddress nvarchar(150),
	@RoleID int,
	@Password nvarchar(150),
	@Hash nvarchar(150),
	@Salt nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Users]
           (UserName,EmailAddress,RoleID,Password,Hash,Salt)
     VALUES
           (@UserName,@EmailAddress,@RoleID,@Password,@Hash,@Salt);

select @UserId = @@IDENTITY;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteGecko]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteGecko]
	-- Add the parameters for the stored procedure here
	@GeckoID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Geckos where @GeckoID = GeckoID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInterTable]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[DeleteInterTable]
	-- Add the parameters for the stored procedure here
	@GeckoID int,
	@MorphID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from InterTable where @GeckoID = GeckoID and @MorphID = MorphID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMorph]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteMorph]
	-- Add the parameters for the stored procedure here
	@MorphID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Morphs where @MorphID = MorphID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteRole]
	-- Add the parameters for the stored procedure here
	@RoleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Roles where RoleID = @RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser]
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Users where @UserID = UserID
END
GO
/****** Object:  StoredProcedure [dbo].[FindGeckoByID]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindGeckoByID]
	-- Add the parameters for the stored procedure here
	@GeckoID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select GeckoID,Sex,Weight,BreedEligability,Age,OwnerID, UserName, EmailAddress from Geckos
	inner join users on Geckos.OwnerID = Users.UserID
	where GeckoID = @GeckoID
END
GO
/****** Object:  StoredProcedure [dbo].[FindInterTable]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[FindInterTable]
	-- Add the parameters for the stored procedure here
	@GeckoID int,
	@MorphID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select GeckoID, MorphID from InterTable
	where @GeckoID = GeckoID and @MorphID = MorphID
END
GO
/****** Object:  StoredProcedure [dbo].[FindMorphByID]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindMorphByID]
	-- Add the parameters for the stored procedure here
	@MorphID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select MorphID,MorphName,Description,Het from Morphs where MorphID = @MorphID
END
GO
/****** Object:  StoredProcedure [dbo].[FindRoleByID]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindRoleByID]
	-- Add the parameters for the stored procedure here
	@RoleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select RoleID,Role from Roles where RoleID = @RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[FindUserByEmailAddress]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindUserByEmailAddress]
	-- Add the parameters for the stored procedure here
	@EmailAddress nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select UserID,UserName,EmailAddress,Users.RoleID,Password,Hash,Salt,Role from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	where EmailAddress = @EmailAddress
END
GO
/****** Object:  StoredProcedure [dbo].[FindUserByID]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindUserByID]
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select UserID,UserName,EmailAddress,Users.RoleID,Password,Hash,Salt,Role from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	where UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[GetGeckos]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGeckos]

   @skip int,
   @take int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	Select GeckoID,Sex,Weight,BreedEligability,Age,OwnerID, UserName, EmailAddress from Geckos
	inner join users on Geckos.OwnerID = Users.UserID
	order by GeckoID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetGeckosRelatedtoMorph]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGeckosRelatedtoMorph]

   @skip int,
   @take int,
   @MorphID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	Select Geckos.GeckoID,Sex,Weight,BreedEligability,Age,OwnerID, UserName, EmailAddress from Geckos
	inner join users on Geckos.OwnerID = Users.UserID
	inner join InterTable on InterTable.GeckoID = Geckos.GeckoID
	where MorphID = @MorphID
	order by Geckos.GeckoID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetGeckosRelatedtoUser]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetGeckosRelatedtoUser]

   @skip int,
   @take int,
   @UserID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	Select Geckos.GeckoID,Sex,Weight,BreedEligability,Age,OwnerID, UserName, EmailAddress from Geckos
	inner join users on Geckos.OwnerID = Users.UserID
	
	where UserID = @UserID
	order by Geckos.GeckoID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetInterTable]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetInterTable]

   @skip int,
   @take int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	Select InterTable.GeckoID , InterTable.MorphID
	     from InterTable
	order by GeckoID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetMorphs]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMorphs]

   @skip int,
   @take int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	Select Morphs.MorphID, Morphs.MorphName,Description,Het
	     from Morphs
	order by MorphID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetMorphsRelatedtoGecko]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetMorphsRelatedtoGecko]

   @skip int,
   @take int,
   @GeckoID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	Select Morphs.MorphID, Morphs.MorphName,Description,Het
	     from Morphs inner join intertable on InterTable.MorphID = Morphs.MorphID
		 where GeckoID = @GeckoID
	order by MorphID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoles]

   @skip int,
   @take int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	Select RoleID,Role
	     from Roles
	order by RoleID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsers]

   @skip int,
   @take int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	Select UserID,UserName,EmailAddress,Users.RoleID,Password,Hash,Salt,Role from Users
	inner join Roles on Users.RoleID = Roles.RoleID
	order by UserID OFFSET @skip rows fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[InsertLogItem]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
create PROCEDURE [dbo].[InsertLogItem] 
	-- Add the parameters for the stored procedure here
	@Message nvarchar(250),
	@StackTrace nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LogTrace
           (Message,Trace,Time)
     VALUES
           (@Message,@StackTrace,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateGecko]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateGecko]
	-- Add the parameters for the stored procedure here
	@GeckoID int,
	@Sex nvarchar(50),
	@Weight decimal(18,2),
	@BreedEligability bit,
	@Age int,
	@OwnerID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Geckos set Sex = @Sex,Weight = @Weight, BreedEligability = @BreedEligability,Age = @Age,OwnerID = @OwnerID 
		   where GeckoID = @GeckoID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateMorph]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateMorph]
	-- Add the parameters for the stored procedure here
	@MorphID int,
	@MorphName nvarchar(150),
	@Description text,
	@Het bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Morphs set MorphName = @MorphName,Description = @Description,Het = @Het 
		   where MorphID = @MorphID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateRole]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateRole]
	-- Add the parameters for the stored procedure here
	@RoleID int,
	@Role nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Roles set Role = @Role
		   where RoleID = @RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateUser]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateUser]
	-- Add the parameters for the stored procedure here
	@UserID int,
	@UserName nvarchar(150),
	@EmailAddress nvarchar(150),
	@RoleID int,
	@Password nvarchar(150),
	@Hash nvarchar(150),
	@Salt nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Users set UserName = @UserName,EmailAddress=@EmailAddress,RoleID=@RoleID,Password=@Password,Hash=@Hash, Salt=@Salt 
		   where UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[ResetDataBase]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ResetDataBase]
AS
BEGIN
	delete from Geckos;
	delete from Morphs;
	delete from InterTable;
	delete from Users;
	delete from Roles;
	

	DBCC CHECKIDENT ('Geckos',RESEED, 0)
	DBCC CHECKIDENT ('Morphs',RESEED, 0)
	DBCC CHECKIDENT ('Users',RESEED, 0)
	DBCC CHECKIDENT ('Roles',RESEED, 0)
END

GO
/****** Object:  StoredProcedure [dbo].[SafeUpdateGecko]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SafeUpdateGecko]
	-- Add the parameters for the stored procedure here
	@GeckoID int,
	@OldSex nvarchar(50),
	@NewSex nvarchar(50),
	@OldWeight decimal(18,2),
	@NewWeight decimal(18,2),
	@OldBreedEligability bit,
	@NewBreedEligability bit,
	@OldAge int,
	@NewAge int,
	@OldOwnerID int,
	@NewOwnerID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @rv int
	SET NOCOUNT ON;
	 select @rv =  count(*) from Geckos where @GeckoID = GeckoID and 
	 Sex = @OldSex and Weight = @OldWeight and BreedEligability = @OldBreedEligability and Age = @OldAge and OwnerID = @OldOwnerID
    -- Insert statements for procedure here
	update Geckos set Sex = @NewSex,Weight=@NewWeight,BreedEligability=@NewBreedEligability, Age = @NewAge,OwnerID = @NewOwnerID
	where @GeckoID = GeckoID AND Sex = @OldSex and Weight = @OldWeight and BreedEligability = @OldBreedEligability and Age = @OldAge and OwnerID = @OldOwnerID
    return @rv
END
GO
/****** Object:  StoredProcedure [dbo].[SafeUpdateMorph]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SafeUpdateMorph]
	-- Add the parameters for the stored procedure here
	@MorphID int,
	@OldMorphName nvarchar(150),
	@NewMorphName nvarchar(150),
	@OldDescription nvarchar(MAX),
	@NewDescription nvarchar(MAX),
	@OldHet bit,
	@NewHet bit

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @rv int
	SET NOCOUNT ON;
	 select @rv =  count(*) from Morphs where @MorphID = MorphID AND MorphName=@OldMorphName and Description = @OldDescription and Het = @OldDescription
    -- Insert statements for procedure here
	update Morphs set MorphName=@NewMorphName,Description=@NewDescription,Het = @NewHet
	where @MorphID = MorphID AND MorphName=@OldMorphName and Description = @OldDescription and Het = @OldHet
    return @rv
END
GO
/****** Object:  StoredProcedure [dbo].[SafeUpdateRole]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[SafeUpdateRole]
	-- Add the parameters for the stored procedure here
	@RoleID int,
	@OldRole nvarchar(150),
	@NewRole nvarchar(150)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @rv int
	SET NOCOUNT ON;
	 select @rv =  count(*) from Roles where @RoleID = RoleID AND Role=@OldRole
    -- Insert statements for procedure here
	update Roles set Role=@NewRole
	where @RoleID = RoleID AND Role=@OldRole
    return @rv
END
GO
/****** Object:  StoredProcedure [dbo].[SafeUpdateUser]    Script Date: 7/10/2019 12:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SafeUpdateUser]
	-- Add the parameters for the stored procedure here
	@UserID int,
	@OldUserName nvarchar(150),
	@NewUserName nvarchar(150),
	@OldEmailAddress nvarchar(150),
	@NewEmailAddress nvarchar(150),
	@OldRoleID int,
	@NewRoleID int,
	@OldPassword nvarchar(150),
	@NewPassword nvarchar(150),
	@OldHash nvarchar(150),
	@NewHash nvarchar(150)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @rv int
	SET NOCOUNT ON;
	 select @rv =  count(*) from Users where @UserID = UserID AND UserName=@OldUserName and EmailAddress = @OldEmailAddress and 
	 RoleID = @OldRoleID and Password = @OldPassword and Hash = @OldHash
    -- Insert statements for procedure here
	update Users set UserName=@NewUserName,EmailAddress=@NewEmailAddress,RoleID=@NewRoleID,Password=@NewPassword,Hash=@NewHash
	where @UserID = UserID AND UserName=@OldUserName and EmailAddress = @OldEmailAddress and 
	 RoleID = @OldRoleID and Password = @OldPassword and Hash = @OldHash
    return @rv
END
GO
USE [master]
GO
ALTER DATABASE [LeopardGeckoBreeding] SET  READ_WRITE 
GO

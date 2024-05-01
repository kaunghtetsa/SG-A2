/****** Object:  Database [STPL_Health]    Script Date: 3/11/2024 10:23:14 AM ******/
CREATE DATABASE [STPL_Health]
USE [STPL_Health]
GO
/****** Object:  Table [dbo].[tb_company]    Script Date: 3/11/2024 10:23:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) UNIQUE NOT NULL,
	[Description] [varchar](250) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tb_company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_personalinfo]    Script Date: 3/11/2024 10:23:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_personalinfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[BusinessEmail] [varchar](150) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Designation] [nvarchar](150) NULL,
	[BusinessPhNo] [varchar](15) NULL,
	[LicensePlate] [varchar](10) NULL,
	[NRICNo] [varchar](5) NULL,
	[IsUnderQuarantineOrder] [bit] NOT NULL,
	[HasAContactWithCovid] [bit] NOT NULL,
	[HasCovidSymptoms] [bit] NOT NULL,
 CONSTRAINT [PK_tb_PersonalInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_company] ADD  CONSTRAINT [DF_tb_company_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[tb_personalinfo]  WITH CHECK ADD  CONSTRAINT [FK_tb_PersonalInfo_tb_company] FOREIGN KEY([ID])
REFERENCES [dbo].[tb_company] ([ID])
GO
ALTER TABLE [dbo].[tb_personalinfo] CHECK CONSTRAINT [FK_tb_PersonalInfo_tb_company]
GO
USE [master]
GO
ALTER DATABASE [STPL_Health] SET  READ_WRITE 
GO

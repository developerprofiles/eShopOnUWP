DROP DATABASE IF EXISTS [DATABASE_NAME]
GO

CREATE DATABASE [DATABASE_NAME]
GO

USE [DATABASE_NAME]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CatalogTypes](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CatalogTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CatalogBrands](
	[Id] [int] NOT NULL,
	[Brand] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CatalogBrands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CatalogItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[CatalogTypeId] [int] NOT NULL,
	[CatalogBrandId] [int] NOT NULL,
	[PictureFileName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CatalogItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CatalogImages](
	[Id] [int] NOT NULL,
	[ImageType] [varchar](32) NULL,
	[ImageBytes] [varbinary](max) NULL,
 CONSTRAINT [PK_dbo.CatalogImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[CatalogItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CatalogItems_dbo.CatalogBrands_CatalogBrandId] FOREIGN KEY([CatalogBrandId])
REFERENCES [dbo].[CatalogBrands] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CatalogItems] CHECK CONSTRAINT [FK_dbo.CatalogItems_dbo.CatalogBrands_CatalogBrandId]
GO

ALTER TABLE [dbo].[CatalogItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CatalogItems_dbo.CatalogTypes_CatalogTypeId] FOREIGN KEY([CatalogTypeId])
REFERENCES [dbo].[CatalogTypes] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CatalogItems] CHECK CONSTRAINT [FK_dbo.CatalogItems_dbo.CatalogTypes_CatalogTypeId]
GO

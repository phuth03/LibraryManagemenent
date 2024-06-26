USE [LibraryManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 08/04/2024 7:46:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[StaffID] [nchar](10) NOT NULL,
	[Password] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 08/04/2024 7:46:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [nchar](10) NOT NULL,
	[BookName] [nvarchar](50) NULL,
	[PublishCompany] [nvarchar](50) NULL,
	[PublishYear] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[WriterID] [nchar](10) NULL,
	[TypeID] [nchar](10) NULL,
	[StorageID] [nchar](10) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookType]    Script Date: 08/04/2024 7:46:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookType](
	[TypeID] [nchar](10) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
	[Status] [nchar](10) NULL,
 CONSTRAINT [PK_BookType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowReturnSlip]    Script Date: 08/04/2024 7:46:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowReturnSlip](
	[BorrowID] [nchar](10) NOT NULL,
	[BorrowDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[StaffID] [nchar](10) NULL,
 CONSTRAINT [PK_BorrowReturnSlip_1] PRIMARY KEY CLUSTERED 
(
	[BorrowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowSlip]    Script Date: 08/04/2024 7:46:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowSlip](
	[BorrowID] [nchar](10) NOT NULL,
	[BookID] [nchar](10) NULL,
	[ReaderID] [nchar](10) NULL,
 CONSTRAINT [PK_BorrowSlip] PRIMARY KEY CLUSTERED 
(
	[BorrowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 08/04/2024 7:46:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[ReaderID] [nchar](10) NOT NULL,
	[ReaderName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Email] [varchar](50) NULL,
	[CardCreattionDate] [date] NULL,
	[PhoneNumber] [char](10) NULL,
	[Gender] [nvarchar](50) NULL,
 CONSTRAINT [PK_Reader] PRIMARY KEY CLUSTERED 
(
	[ReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 08/04/2024 7:46:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [nchar](10) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[IDD] [nchar](10) NULL,
	[CICard] [nchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[PhoneNumber] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Staff_1] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 08/04/2024 7:46:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[StorageID] [nchar](10) NOT NULL,
	[StorageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[StorageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_BookType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[BookType] ([TypeID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_BookType]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Storage] FOREIGN KEY([StorageID])
REFERENCES [dbo].[Storage] ([StorageID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Storage]
GO
ALTER TABLE [dbo].[BorrowSlip]  WITH CHECK ADD  CONSTRAINT [FK_BorrowSlip_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[BorrowSlip] CHECK CONSTRAINT [FK_BorrowSlip_Book]
GO
ALTER TABLE [dbo].[BorrowSlip]  WITH CHECK ADD  CONSTRAINT [FK_BorrowSlip_BorrowReturnSlip1] FOREIGN KEY([BorrowID])
REFERENCES [dbo].[BorrowReturnSlip] ([BorrowID])
GO
ALTER TABLE [dbo].[BorrowSlip] CHECK CONSTRAINT [FK_BorrowSlip_BorrowReturnSlip1]
GO
ALTER TABLE [dbo].[BorrowSlip]  WITH CHECK ADD  CONSTRAINT [FK_BorrowSlip_Reader] FOREIGN KEY([ReaderID])
REFERENCES [dbo].[Reader] ([ReaderID])
GO
ALTER TABLE [dbo].[BorrowSlip] CHECK CONSTRAINT [FK_BorrowSlip_Reader]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Account] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Account] ([StaffID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Account]
GO

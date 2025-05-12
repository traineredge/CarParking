USE [CarParking]
GO
CREATE TABLE [dbo].[CarCategory](
	[CarCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[LatestPrice] [float] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK__CarCateg__01659AE0A76F6CEA] PRIMARY KEY CLUSTERED 
(
	[CarCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 4/26/2025 8:49:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CarCategoryId] [int] NOT NULL,
	[IsBooked] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[SlotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SlotListView]    Script Date: 4/26/2025 8:49:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SlotListView]
AS
SELECT        dbo.CarCategory.Name AS CarCategoryName, dbo.Slot.*, dbo.CarCategory.LatestPrice
FROM            dbo.Slot INNER JOIN
                         dbo.CarCategory ON dbo.Slot.CarCategoryId = dbo.CarCategory.CarCategoryId
GO
/****** Object:  Table [dbo].[ClientCar]    Script Date: 4/26/2025 8:49:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCar](
	[ClientCarId] [int] IDENTITY(1,1) NOT NULL,
	[CarRegistrationNo] [nvarchar](64) NOT NULL,
	[CarName] [nvarchar](128) NULL,
	[UserInfoId] [nvarchar](128) NOT NULL,
	[CarCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ClientCar] PRIMARY KEY CLUSTERED 
(
	[ClientCarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/26/2025 8:49:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [nvarchar](128) NOT NULL,
	[SlotBookId] [nvarchar](128) NULL,
	[Amount] [float] NOT NULL,
	[PaymentMethodId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 4/26/2025 8:49:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[PaymentMethodId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/26/2025 8:49:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotBook]    Script Date: 4/26/2025 8:49:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotBook](
	[SlotBookId] [nvarchar](128) NOT NULL,
	[SlotId] [int] NOT NULL,
	[BookingTime] [datetime] NOT NULL,
	[BookingDuration] [int] NOT NULL,
	[RegNo] [nvarchar](64) NOT NULL,
	[IsExitRequested] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK__SlotBook__8BFAA452D887DB99] PRIMARY KEY CLUSTERED 
(
	[SlotBookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 4/26/2025 8:49:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserInfoId] [nvarchar](128) NOT NULL,
	[FullName] [nvarchar](40) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK__UserInfo__D07EF2E4155F5460] PRIMARY KEY CLUSTERED 
(
	[UserInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CarCategory] ON 
GO
INSERT [dbo].[CarCategory] ([CarCategoryId], [Name], [LatestPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Sedan', 200, CAST(N'2025-04-22T20:02:08.650' AS DateTime), N'4e29dfa4-1a09-4dca-aacf-4928b62edaa9', NULL, NULL)
GO
INSERT [dbo].[CarCategory] ([CarCategoryId], [Name], [LatestPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Truck', 400, CAST(N'2025-04-22T20:02:13.260' AS DateTime), N'4e29dfa4-1a09-4dca-aacf-4928b62edaa9', NULL, NULL)
GO
INSERT [dbo].[CarCategory] ([CarCategoryId], [Name], [LatestPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Mini Bus', 300, CAST(N'2025-04-22T20:02:17.473' AS DateTime), N'4e29dfa4-1a09-4dca-aacf-4928b62edaa9', NULL, NULL)
GO
INSERT [dbo].[CarCategory] ([CarCategoryId], [Name], [LatestPrice], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Bike', 100, CAST(N'2025-04-22T20:02:21.057' AS DateTime), N'4e29dfa4-1a09-4dca-aacf-4928b62edaa9', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[CarCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientCar] ON 
GO
INSERT [dbo].[ClientCar] ([ClientCarId], [CarRegistrationNo], [CarName], [UserInfoId], [CarCategoryId]) VALUES (2, N'DHAKA-GA 202525', N'16 siter bus', N'cf47c24d-e5a1-474a-b8ce-151abfa1ee5a', 1)
GO
SET IDENTITY_INSERT [dbo].[ClientCar] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleId], [Name], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Admin', 1, CAST(N'2024-12-14T18:20:45.200' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Role] ([RoleId], [Name], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Manager', 1, CAST(N'2024-12-14T18:20:45.740' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Role] ([RoleId], [Name], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Client', 1, CAST(N'2024-12-14T18:20:45.740' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 
GO
INSERT [dbo].[Slot] ([SlotId], [Name], [CarCategoryId], [IsBooked], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Slot S1', 1, 1, CAST(N'2025-04-22T18:57:02.673' AS DateTime), N'4e29dfa4-1a09-4dca-aacf-4928b62edaa9', NULL, NULL)
GO
INSERT [dbo].[Slot] ([SlotId], [Name], [CarCategoryId], [IsBooked], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Slot S2', 1, 1, CAST(N'2025-04-22T18:59:34.087' AS DateTime), N'4e29dfa4-1a09-4dca-aacf-4928b62edaa9', NULL, NULL)
GO
INSERT [dbo].[Slot] ([SlotId], [Name], [CarCategoryId], [IsBooked], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Slot S3', 1, 1, CAST(N'2025-04-22T20:06:49.563' AS DateTime), N'4e29dfa4-1a09-4dca-aacf-4928b62edaa9', NULL, NULL)
GO
INSERT [dbo].[Slot] ([SlotId], [Name], [CarCategoryId], [IsBooked], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Slot T1', 2, 0, CAST(N'2025-04-22T20:07:58.047' AS DateTime), N'4e29dfa4-1a09-4dca-aacf-4928b62edaa9', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
INSERT [dbo].[SlotBook] ([SlotBookId], [SlotId], [BookingTime], [BookingDuration], [RegNo], [IsExitRequested], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (N'385e448d-5f6c-416a-aa16-dd0f07b0e8e8', 1, CAST(N'2025-04-26T20:44:00.000' AS DateTime), 60, N'DHAKA-GA 202525', 0, CAST(N'2025-04-26T20:44:32.830' AS DateTime), N'cf47c24d-e5a1-474a-b8ce-151abfa1ee5a', NULL, NULL)
GO
INSERT [dbo].[SlotBook] ([SlotBookId], [SlotId], [BookingTime], [BookingDuration], [RegNo], [IsExitRequested], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (N'8310038b-5052-4afd-96aa-221c17da351c', 3, CAST(N'2025-04-26T20:45:00.000' AS DateTime), 60, N'DHAKA-GA 202525', 0, CAST(N'2025-04-26T20:45:15.930' AS DateTime), N'cf47c24d-e5a1-474a-b8ce-151abfa1ee5a', NULL, NULL)
GO
INSERT [dbo].[SlotBook] ([SlotBookId], [SlotId], [BookingTime], [BookingDuration], [RegNo], [IsExitRequested], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (N'ed085b95-a9c9-4aea-9654-00a68afa2d20', 2, CAST(N'2025-04-26T20:44:00.000' AS DateTime), 60, N'DHAKA-GA 202525', 0, CAST(N'2025-04-26T20:44:52.717' AS DateTime), N'cf47c24d-e5a1-474a-b8ce-151abfa1ee5a', NULL, NULL)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'001dca1d-a5b4-47b4-a20a-df920fe0beac', N'Client-333', N'client333@client.client', N'Hash333', 0, CAST(N'2024-12-14T18:31:21.813' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'00261d61-b394-4375-95d3-f686b3474e48', N'Client-24', N'client24@client.client', N'Hash24', 1, CAST(N'2024-12-14T18:31:21.523' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'004f1442-1cd9-4da6-bb5e-57243315b8db', N'Client-904', N'client904@client.client', N'Hash904', 1, CAST(N'2024-12-14T18:31:22.440' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'00bde6c6-e3a2-4655-a1f7-aa228ee82f71', N'Client-836', N'client836@client.client', N'Hash836', 1, CAST(N'2024-12-14T18:31:22.380' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'00e4f284-efc8-48d4-b42c-72ad0cd55da2', N'Client-587', N'client587@client.client', N'Hash587', 0, CAST(N'2024-12-14T18:31:22.177' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'00e823d7-39e6-4910-b61a-45fc9ad17399', N'Client-907', N'client907@client.client', N'Hash907', 0, CAST(N'2024-12-14T18:31:22.443' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0107b5eb-d950-4ff7-9e0e-2ca14a952e9d', N'Client-707', N'client707@client.client', N'Hash707', 0, CAST(N'2024-12-14T18:31:22.270' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'01101195-3d89-4104-b4ef-2488e1f7cbb7', N'Client-208', N'client208@client.client', N'Hash208', 1, CAST(N'2024-12-14T18:31:21.667' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'011778e2-5304-4e7d-9fe1-c4c8999db4d3', N'Client-217', N'client217@client.client', N'Hash217', 0, CAST(N'2024-12-14T18:31:21.673' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'01228fa4-b689-413d-92c7-02243be86c95', N'Manager-1', N'manager1@manager.manager', N'Hash1', 0, CAST(N'2024-12-14T18:31:21.507' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'01649eb0-ce1b-40f4-910a-2039172250ab', N'Client-200', N'client200@client.client', N'Hash200', 1, CAST(N'2024-12-14T18:31:21.657' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'01d688ca-3899-492b-831f-06988e74bc39', N'Client-294', N'client294@client.client', N'Hash294', 1, CAST(N'2024-12-14T18:31:21.763' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'01e1f0d9-5f1d-472a-ab66-f34935b24354', N'Client-973', N'client973@client.client', N'Hash973', 0, CAST(N'2024-12-14T18:31:22.507' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'01e5d796-24c7-4cc5-9767-217319924e92', N'Client-596', N'client596@client.client', N'Hash596', 1, CAST(N'2024-12-14T18:31:22.187' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0206e379-7244-4712-9652-197097243c68', N'Client-833', N'client833@client.client', N'Hash833', 0, CAST(N'2024-12-14T18:31:22.377' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'023d2d81-9119-4ea5-abc1-2f6ddff9cd3a', N'Client-621', N'client621@client.client', N'Hash621', 0, CAST(N'2024-12-14T18:31:22.203' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'023f0033-9c03-490d-a6a1-b9b5dbc4c2a4', N'Client-193', N'client193@client.client', N'Hash193', 0, CAST(N'2024-12-14T18:31:21.650' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'025aec24-a9e8-49cd-b07c-1051c0ffbb0d', N'Client-228', N'client228@client.client', N'Hash228', 1, CAST(N'2024-12-14T18:31:21.687' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'02645769-5ee7-49fb-bf75-91186d739c70', N'Client-595', N'client595@client.client', N'Hash595', 0, CAST(N'2024-12-14T18:31:22.187' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'03347844-4467-43e4-beab-29c6e8571d17', N'Client-940', N'client940@client.client', N'Hash940', 1, CAST(N'2024-12-14T18:31:22.473' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'038f4706-7fbf-421b-8cef-459c5e9e6966', N'Client-820', N'client820@client.client', N'Hash820', 1, CAST(N'2024-12-14T18:31:22.367' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'03ad2587-0369-4171-ac20-7ae4991ef553', N'Client-982', N'client982@client.client', N'Hash982', 1, CAST(N'2024-12-14T18:31:22.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'03addda9-d1a0-4da4-97ed-f37f51b2c58a', N'Client-608', N'client608@client.client', N'Hash608', 1, CAST(N'2024-12-14T18:31:22.197' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'04674fc8-386d-446f-944e-d55545c874a3', N'Client-514', N'client514@client.client', N'Hash514', 1, CAST(N'2024-12-14T18:31:22.100' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'04f16050-f1ed-43a8-9d52-45397829377c', N'Client-827', N'client827@client.client', N'Hash827', 0, CAST(N'2024-12-14T18:31:22.373' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'04fbb4aa-e9c0-49a7-8443-62da728d60c1', N'Client-700', N'client700@client.client', N'Hash700', 1, CAST(N'2024-12-14T18:31:22.263' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'050f77e4-0606-46fd-a89b-d5ba9b56983a', N'Client-400', N'client400@client.client', N'Hash400', 1, CAST(N'2024-12-14T18:31:21.983' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'05134328-2bb9-40b6-84f7-d7e751b0276d', N'Client-138', N'client138@client.client', N'Hash138', 1, CAST(N'2024-12-14T18:31:21.600' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'051596a9-999d-41f2-87b3-54dcb8dd4076', N'Client-190', N'client190@client.client', N'Hash190', 1, CAST(N'2024-12-14T18:31:21.647' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'054c5155-b207-4e38-a6aa-84031084f3a2', N'Client-302', N'client302@client.client', N'Hash302', 1, CAST(N'2024-12-14T18:31:21.773' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'05599439-b2ef-465f-9f62-03ea9bdc1e4e', N'Client-179', N'client179@client.client', N'Hash179', 0, CAST(N'2024-12-14T18:31:21.637' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'056a4dd3-fd00-492d-a493-b9c5684f0371', N'Client-336', N'client336@client.client', N'Hash336', 1, CAST(N'2024-12-14T18:31:21.817' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'05ea787b-3634-4ddd-a95b-654aa60d8834', N'Client-541', N'client541@client.client', N'Hash541', 0, CAST(N'2024-12-14T18:31:22.147' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'06011603-2d51-4caa-bdd2-341f286627b5', N'Client-798', N'client798@client.client', N'Hash798', 1, CAST(N'2024-12-14T18:31:22.347' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'060774b2-707c-49f8-9332-aa6fc29522ca', N'Client-665', N'client665@client.client', N'Hash665', 0, CAST(N'2024-12-14T18:31:22.237' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'06170aea-21dd-43cf-a869-baf656e5b76b', N'Client-483', N'client483@client.client', N'Hash483', 0, CAST(N'2024-12-14T18:31:22.060' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'063f2af8-839b-4ae7-8704-4db3fa1fddae', N'Client-383', N'client383@client.client', N'Hash383', 0, CAST(N'2024-12-14T18:31:21.950' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'06c36c07-5483-49a8-9abc-e020f26887a6', N'Client-906', N'client906@client.client', N'Hash906', 1, CAST(N'2024-12-14T18:31:22.443' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'06f35dc6-7276-4e7a-b53d-5a88f7f9dfbe', N'Client-613', N'client613@client.client', N'Hash613', 0, CAST(N'2024-12-14T18:31:22.200' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0730c3b6-7f3d-40aa-8565-f05e5a3be591', N'Client-222', N'client222@client.client', N'Hash222', 1, CAST(N'2024-12-14T18:31:21.680' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'075ce002-9774-4b19-b07f-e5c018250341', N'Client-624', N'client624@client.client', N'Hash624', 1, CAST(N'2024-12-14T18:31:22.207' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0773852f-a012-4f2b-bcf4-95230ef4c8f4', N'Client-758', N'client758@client.client', N'Hash758', 1, CAST(N'2024-12-14T18:31:22.310' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'07a41756-4523-40ca-828b-9e69e5c99c1b', N'Client-270', N'client270@client.client', N'Hash270', 1, CAST(N'2024-12-14T18:31:21.733' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'07e33af2-c923-426e-8e87-dd48d9ee58b8', N'Client-947', N'client947@client.client', N'Hash947', 0, CAST(N'2024-12-14T18:31:22.480' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'085f21ff-4699-4a97-af0e-62626c491321', N'Client-821', N'client821@client.client', N'Hash821', 0, CAST(N'2024-12-14T18:31:22.367' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'08a93eee-5035-4477-be6c-640fe936ac62', N'Client-229', N'client229@client.client', N'Hash229', 0, CAST(N'2024-12-14T18:31:21.687' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'08f9fa6c-5540-407e-a667-605cddc1b31a', N'Client-3', N'client3@client.client', N'Hash3', 0, CAST(N'2024-12-14T18:31:21.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0919b2d1-db1e-457b-8bd7-e28219960ba9', N'Client-657', N'client657@client.client', N'Hash657', 0, CAST(N'2024-12-14T18:31:22.230' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0967df1a-7963-4a23-b34d-3fea65f472f5', N'Client-320', N'client320@client.client', N'Hash320', 1, CAST(N'2024-12-14T18:31:21.797' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'09ebdac7-1a3d-4bfb-bb94-9c37246659f7', N'Client-271', N'client271@client.client', N'Hash271', 0, CAST(N'2024-12-14T18:31:21.733' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0a021660-afe2-48f2-a732-b9c8e9966a12', N'Client-321', N'client321@client.client', N'Hash321', 0, CAST(N'2024-12-14T18:31:21.797' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0a64562b-af52-40d7-9ac4-14a4d4aee3f1', N'Client-534', N'client534@client.client', N'Hash534', 1, CAST(N'2024-12-14T18:31:22.140' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0aa85d67-f66d-42cf-8946-261556d06642', N'Client-404', N'client404@client.client', N'Hash404', 1, CAST(N'2024-12-14T18:31:21.990' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0acb3098-ae5a-47cf-a95c-16162e16bfd3', N'Client-792', N'client792@client.client', N'Hash792', 1, CAST(N'2024-12-14T18:31:22.343' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0ad28e05-9948-4584-9176-2d901df5205e', N'Client-874', N'client874@client.client', N'Hash874', 1, CAST(N'2024-12-14T18:31:22.413' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0b711fd3-d20d-4901-ba94-4db86afd20e2', N'Client-949', N'client949@client.client', N'Hash949', 0, CAST(N'2024-12-14T18:31:22.483' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0b7ae858-3572-4f2d-b4fd-b83aa683caf8', N'Client-695', N'client695@client.client', N'Hash695', 0, CAST(N'2024-12-14T18:31:22.260' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0b846a4a-e18b-4ded-a4f2-5df94ca8e3ad', N'Client-339', N'client339@client.client', N'Hash339', 0, CAST(N'2024-12-14T18:31:21.820' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0baf6edb-82d2-443c-941d-934858e6960c', N'Client-926', N'client926@client.client', N'Hash926', 1, CAST(N'2024-12-14T18:31:22.460' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0bb17723-f925-4ad5-bb56-a69832e96a2f', N'Client-859', N'client859@client.client', N'Hash859', 0, CAST(N'2024-12-14T18:31:22.400' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0c3f1ef2-80fa-4a58-be52-6aeb38b6bd21', N'Client-606', N'client606@client.client', N'Hash606', 1, CAST(N'2024-12-14T18:31:22.193' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0c42ef0c-63ca-4a47-bc1d-d01a89c61fc5', N'Client-419', N'client419@client.client', N'Hash419', 0, CAST(N'2024-12-14T18:31:22.003' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0d0e7a1f-205e-4173-b165-4df50204eab2', N'Client-51', N'client51@client.client', N'Hash51', 0, CAST(N'2024-12-14T18:31:21.547' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0d2f20eb-daef-48a2-99e3-23b414368c40', N'Client-803', N'client803@client.client', N'Hash803', 0, CAST(N'2024-12-14T18:31:22.353' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0db3691e-2fd6-43d7-aa46-15d9ec61f9b8', N'Client-11', N'client11@client.client', N'Hash11', 0, CAST(N'2024-12-14T18:31:21.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0e59fd05-8a84-4c93-a888-2fdc8a43d161', N'Client-487', N'client487@client.client', N'Hash487', 0, CAST(N'2024-12-14T18:31:22.063' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0f1181a6-1817-44d7-9471-d829ca0dd08c', N'Client-616', N'client616@client.client', N'Hash616', 1, CAST(N'2024-12-14T18:31:22.200' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0f1e4def-1c1d-4e74-b1ce-7475115a167b', N'Client-469', N'client469@client.client', N'Hash469', 0, CAST(N'2024-12-14T18:31:22.047' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0fb0a7c7-0f37-4271-8e5e-3f511af04185', N'Client-515', N'client515@client.client', N'Hash515', 0, CAST(N'2024-12-14T18:31:22.103' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'0ff2a786-7449-4036-b9fa-17c379eeff63', N'Client-350', N'client350@client.client', N'Hash350', 1, CAST(N'2024-12-14T18:31:21.840' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'108b1818-c822-4f80-b0af-a1cbfc6b032f', N'Client-971', N'client971@client.client', N'Hash971', 0, CAST(N'2024-12-14T18:31:22.507' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'11107656-ba6e-4807-bb46-e3c0e7e19e49', N'Client-1', N'client1@client.client', N'Hash1', 0, CAST(N'2024-12-14T18:31:21.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1112dd62-0576-40e0-841d-8751e901e7d6', N'Client-185', N'client185@client.client', N'Hash185', 0, CAST(N'2024-12-14T18:31:21.643' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'117d0b00-0521-4304-8368-8af575b798b7', N'Client-880', N'client880@client.client', N'Hash880', 1, CAST(N'2024-12-14T18:31:22.420' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'11c33fe7-8381-4820-a4f6-c8db13d6d674', N'Client-56', N'client56@client.client', N'Hash56', 1, CAST(N'2024-12-14T18:31:21.547' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'121b2bdd-a80a-4fec-b66c-9e6a9ed3c8fb', N'Client-293', N'client293@client.client', N'Hash293', 0, CAST(N'2024-12-14T18:31:21.763' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'13086fc8-6684-47c4-a516-3b838ed66eba', N'Client-456', N'client456@client.client', N'Hash456', 1, CAST(N'2024-12-14T18:31:22.037' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'132089fd-98d2-4bbb-b18c-8fc1a1dc993a', N'Client-588', N'client588@client.client', N'Hash588', 1, CAST(N'2024-12-14T18:31:22.180' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'136c5b7b-7175-4120-b460-796a99481273', N'Client-936', N'client936@client.client', N'Hash936', 1, CAST(N'2024-12-14T18:31:22.470' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1371e28b-9495-4a55-b891-0f3e049a661c', N'Client-170', N'client170@client.client', N'Hash170', 1, CAST(N'2024-12-14T18:31:21.630' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'13784f9b-dcdc-4d8b-91d4-841ea9c2cf45', N'Client-31', N'client31@client.client', N'Hash31', 0, CAST(N'2024-12-14T18:31:21.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'13c063ab-5f04-430b-8df2-dea73cc1a461', N'Client-91', N'client91@client.client', N'Hash91', 0, CAST(N'2024-12-14T18:31:21.570' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'13cba732-4754-4649-bdc9-6e2ea0ce9df6', N'Client-570', N'client570@client.client', N'Hash570', 1, CAST(N'2024-12-14T18:31:22.167' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'13d60c4a-446e-4d4a-b451-277a1a5972c6', N'Client-825', N'client825@client.client', N'Hash825', 0, CAST(N'2024-12-14T18:31:22.370' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'13f41020-ca97-4710-9c55-992267e3ed44', N'Client-699', N'client699@client.client', N'Hash699', 0, CAST(N'2024-12-14T18:31:22.263' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'143082a7-73cd-4a90-9f94-aad61f882290', N'Client-204', N'client204@client.client', N'Hash204', 1, CAST(N'2024-12-14T18:31:21.660' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'144b9e16-515d-465f-b654-94619a4446c3', N'Client-889', N'client889@client.client', N'Hash889', 0, CAST(N'2024-12-14T18:31:22.427' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1481336a-1b7e-4010-9cff-e63e10f262fd', N'Client-954', N'client954@client.client', N'Hash954', 1, CAST(N'2024-12-14T18:31:22.490' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'14821d66-e337-41b8-a1e2-194b2c39cd53', N'Client-951', N'client951@client.client', N'Hash951', 0, CAST(N'2024-12-14T18:31:22.483' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'148ac8a5-b051-476b-a76e-65028e19f49a', N'Client-76', N'client76@client.client', N'Hash76', 1, CAST(N'2024-12-14T18:31:21.560' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'151fbb76-3cfa-44e3-8000-250a9a4d9969', N'Client-987', N'client987@client.client', N'Hash987', 0, CAST(N'2024-12-14T18:31:22.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'15264476-f714-433e-92d9-ee2123a06837', N'Client-862', N'client862@client.client', N'Hash862', 1, CAST(N'2024-12-14T18:31:22.403' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1551afd9-8e11-46fc-bf3e-759955c3ddb0', N'Client-520', N'client520@client.client', N'Hash520', 1, CAST(N'2024-12-14T18:31:22.120' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'164dcdad-6abd-4ada-8ed7-e57a77d79c80', N'Client-749', N'client749@client.client', N'Hash749', 0, CAST(N'2024-12-14T18:31:22.303' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'16713720-0617-4f2e-a2d8-bcde3cc3d891', N'Client-586', N'client586@client.client', N'Hash586', 1, CAST(N'2024-12-14T18:31:22.177' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'16c51665-dbef-4b29-9887-9370921f774a', N'Client-311', N'client311@client.client', N'Hash311', 0, CAST(N'2024-12-14T18:31:21.783' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'16f3a64a-be8d-42d1-b3bb-1be686575b74', N'Client-361', N'client361@client.client', N'Hash361', 0, CAST(N'2024-12-14T18:31:21.877' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'178c447f-993d-49df-abb2-c95ae25319e7', N'Client-841', N'client841@client.client', N'Hash841', 0, CAST(N'2024-12-14T18:31:22.383' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'183c4fee-b40f-4a66-8643-c6ff58c55f75', N'Client-95', N'client95@client.client', N'Hash95', 0, CAST(N'2024-12-14T18:31:21.570' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'186b9148-94b1-4acc-a951-1c076bd4ac1a', N'Client-259', N'client259@client.client', N'Hash259', 0, CAST(N'2024-12-14T18:31:21.723' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'18c3b856-d140-4302-9ae6-a1e3e31209c0', N'Client-873', N'client873@client.client', N'Hash873', 0, CAST(N'2024-12-14T18:31:22.413' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'197b7aff-ee74-4320-81a3-55d622351b13', N'Client-671', N'client671@client.client', N'Hash671', 0, CAST(N'2024-12-14T18:31:22.243' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1992106f-91ee-4f5f-ba5a-e4522b1e8e04', N'Client-358', N'client358@client.client', N'Hash358', 1, CAST(N'2024-12-14T18:31:21.867' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'199a2c3b-7861-427d-9009-f6ecba0f0ae8', N'Client-622', N'client622@client.client', N'Hash622', 1, CAST(N'2024-12-14T18:31:22.207' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'19b07030-05f2-4810-a615-3cc1fe802f77', N'Client-0', N'client0@client.client', N'Hash0', 1, CAST(N'2024-12-14T18:31:21.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'19d79e68-0c97-4cd2-99c7-c9b7136436c5', N'Client-966', N'client966@client.client', N'Hash966', 1, CAST(N'2024-12-14T18:31:22.500' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'19f693f5-9058-4790-b4ce-00805583d617', N'Client-280', N'client280@client.client', N'Hash280', 1, CAST(N'2024-12-14T18:31:21.747' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1a029825-e7c6-4706-bfe9-39f3087749c7', N'Client-406', N'client406@client.client', N'Hash406', 1, CAST(N'2024-12-14T18:31:21.990' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1a1c1527-286f-4214-a9e5-c070602fdf00', N'Client-319', N'client319@client.client', N'Hash319', 0, CAST(N'2024-12-14T18:31:21.793' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1a665a5e-c6c7-405c-b4c7-99d6dd00d03d', N'Client-490', N'client490@client.client', N'Hash490', 1, CAST(N'2024-12-14T18:31:22.067' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1a6e7b40-48c4-4330-9676-768cdec7c0e5', N'Client-403', N'client403@client.client', N'Hash403', 0, CAST(N'2024-12-14T18:31:21.987' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1a8d9359-a045-4778-b8e6-c8922c0c9011', N'Client-566', N'client566@client.client', N'Hash566', 1, CAST(N'2024-12-14T18:31:22.163' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1b06635a-ce3e-4445-a6b4-ac7dd0cc87f0', N'Client-106', N'client106@client.client', N'Hash106', 1, CAST(N'2024-12-14T18:31:21.577' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1b29f904-e161-4e3c-97f1-c7a370182c10', N'Client-578', N'client578@client.client', N'Hash578', 1, CAST(N'2024-12-14T18:31:22.170' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1b3ddf1c-9bae-4e7c-9e21-76edfff5970e', N'Client-421', N'client421@client.client', N'Hash421', 0, CAST(N'2024-12-14T18:31:22.003' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1b665592-39b5-4792-b919-8234981a9e7e', N'Client-241', N'client241@client.client', N'Hash241', 0, CAST(N'2024-12-14T18:31:21.700' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1b70bd71-e1e6-4e59-97df-cb530b283655', N'Client-54', N'client54@client.client', N'Hash54', 1, CAST(N'2024-12-14T18:31:21.547' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1b85b372-9163-4322-b867-fdae36f87af2', N'Client-512', N'client512@client.client', N'Hash512', 1, CAST(N'2024-12-14T18:31:22.097' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1b8f238a-9920-4685-b73f-1886e48f9c58', N'Client-852', N'client852@client.client', N'Hash852', 1, CAST(N'2024-12-14T18:31:22.393' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1bd4e5bc-7dd9-4276-a8d6-e029bc34628d', N'Client-122', N'client122@client.client', N'Hash122', 1, CAST(N'2024-12-14T18:31:21.590' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1be353b1-d5b6-4113-89aa-59cde51e884e', N'Client-283', N'client283@client.client', N'Hash283', 0, CAST(N'2024-12-14T18:31:21.750' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1bfa5909-49f0-4d3d-8467-83c4dfd40908', N'Client-156', N'client156@client.client', N'Hash156', 1, CAST(N'2024-12-14T18:31:21.613' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1bfef591-9638-44e1-a026-cd3906573009', N'Client-956', N'client956@client.client', N'Hash956', 1, CAST(N'2024-12-14T18:31:22.490' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1c537019-fdec-4bba-8006-f82123a52378', N'Client-787', N'client787@client.client', N'Hash787', 0, CAST(N'2024-12-14T18:31:22.337' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1c6b1a00-5dca-4a0e-ab78-55289084fd90', N'Client-465', N'client465@client.client', N'Hash465', 0, CAST(N'2024-12-14T18:31:22.043' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1cbcdd14-b7d8-49b7-bbcf-050f07e75c03', N'Client-980', N'client980@client.client', N'Hash980', 1, CAST(N'2024-12-14T18:31:22.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1cc1b295-b813-46f2-bf8b-5313d8132d3d', N'Client-130', N'client130@client.client', N'Hash130', 1, CAST(N'2024-12-14T18:31:21.593' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1cf42946-22f9-40ba-80f7-a2c1ec1273bf', N'Client-719', N'client719@client.client', N'Hash719', 0, CAST(N'2024-12-14T18:31:22.280' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1d2ddbc3-7073-4e9b-8e67-e57e49ebd3b5', N'Client-500', N'client500@client.client', N'Hash500', 1, CAST(N'2024-12-14T18:31:22.080' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1d3f19e7-cb19-4ed3-898c-3652098c23de', N'Client-704', N'client704@client.client', N'Hash704', 1, CAST(N'2024-12-14T18:31:22.267' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1da5ce2e-9509-45c1-8ede-3d72107e4d71', N'Client-304', N'client304@client.client', N'Hash304', 1, CAST(N'2024-12-14T18:31:21.777' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1e4dd8ae-14b4-42ce-8977-40bb673f324e', N'Client-291', N'client291@client.client', N'Hash291', 0, CAST(N'2024-12-14T18:31:21.760' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1e910e56-8ecd-481f-a489-c0aee5b94cb5', N'Client-689', N'client689@client.client', N'Hash689', 0, CAST(N'2024-12-14T18:31:22.257' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1ea3954a-460f-4d85-82ff-d90724075401', N'Client-673', N'client673@client.client', N'Hash673', 0, CAST(N'2024-12-14T18:31:22.243' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1f57bb0e-5d55-430d-8568-e60d0ddc5efd', N'Client-761', N'client761@client.client', N'Hash761', 0, CAST(N'2024-12-14T18:31:22.313' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1f7cfacf-df3a-4d2b-878c-7e757b0174bb', N'Client-909', N'client909@client.client', N'Hash909', 0, CAST(N'2024-12-14T18:31:22.447' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'1fc40ac8-1e80-46df-ab9a-71f3a1f0ecc3', N'Client-552', N'client552@client.client', N'Hash552', 1, CAST(N'2024-12-14T18:31:22.153' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'20643587-cb1d-4dfa-98f8-4a5ae92bfbb7', N'Client-265', N'client265@client.client', N'Hash265', 0, CAST(N'2024-12-14T18:31:21.730' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'208d1bfe-ae6f-41a8-8fdf-434a36dec06e', N'Client-428', N'client428@client.client', N'Hash428', 1, CAST(N'2024-12-14T18:31:22.010' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'20cc56ae-340f-4b91-8222-0444eb2b9645', N'Client-151', N'client151@client.client', N'Hash151', 0, CAST(N'2024-12-14T18:31:21.610' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'212412c0-494f-45a4-93c2-cc27f08fa349', N'Client-824', N'client824@client.client', N'Hash824', 1, CAST(N'2024-12-14T18:31:22.370' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'215319da-0e1e-4b70-912b-ac0c700fa0b1', N'Client-409', N'client409@client.client', N'Hash409', 0, CAST(N'2024-12-14T18:31:21.993' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2199f39d-1e95-4f5c-abd4-4c9c5bd198fb', N'Client-975', N'client975@client.client', N'Hash975', 0, CAST(N'2024-12-14T18:31:22.510' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'223018cf-7437-4c5b-8c27-bd9ae68270af', N'Client-545', N'client545@client.client', N'Hash545', 0, CAST(N'2024-12-14T18:31:22.147' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'22657b2b-1040-444c-b247-825f40a4ef6e', N'Client-782', N'client782@client.client', N'Hash782', 1, CAST(N'2024-12-14T18:31:22.333' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'22e08c23-5afb-4f1d-9e88-5a519247bffe', N'string', N'string', N'AQAAAAIAAYagAAAAEC+k6OdkvqF9fxKAZ2blJB5VqpW6RMyaZBSmFTuXfaY1Pozb+bsHVKP0la7gjKJIQg==', 1, CAST(N'2025-03-04T16:46:35.867' AS DateTime), N'string', CAST(N'2025-03-04T10:42:53.037' AS DateTime), N'string', 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2324aa4a-f5aa-4960-9615-1b09e06e9592', N'Client-611', N'client611@client.client', N'Hash611', 0, CAST(N'2024-12-14T18:31:22.197' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'237fb0b1-5d1e-40bc-ac4d-6f7fe3358bb0', N'Client-723', N'client723@client.client', N'Hash723', 0, CAST(N'2024-12-14T18:31:22.283' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'23c379f4-3b1a-49ce-8357-5b991268b735', N'Client-653', N'client653@client.client', N'Hash653', 0, CAST(N'2024-12-14T18:31:22.230' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'23c967b1-a17d-412a-a52a-16fc9f9b45de', N'Client-498', N'client498@client.client', N'Hash498', 1, CAST(N'2024-12-14T18:31:22.077' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'23f73258-5d33-41f8-a7f4-a28ad70293ab', N'Client-631', N'client631@client.client', N'Hash631', 0, CAST(N'2024-12-14T18:31:22.213' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'241853ab-f1b7-4b57-812a-efdb7bb7584f', N'Client-314', N'client314@client.client', N'Hash314', 1, CAST(N'2024-12-14T18:31:21.790' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'24af1c4b-7930-492b-ab37-03b95fb99630', N'Client-19', N'client19@client.client', N'Hash19', 0, CAST(N'2024-12-14T18:31:21.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'24dab8ea-ad83-4a3a-9e42-06fe675cd280', N'Client-934', N'client934@client.client', N'Hash934', 1, CAST(N'2024-12-14T18:31:22.470' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'24fee7f2-7451-4a4d-9e8e-e4ce1ea807c0', N'Client-323', N'client323@client.client', N'Hash323', 0, CAST(N'2024-12-14T18:31:21.800' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'25598b4a-71f8-4003-9520-2a61560dd219', N'Client-641', N'client641@client.client', N'Hash641', 0, CAST(N'2024-12-14T18:31:22.220' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'255d59d3-9d40-4f5b-b810-b4cc5949e916', N'Client-279', N'client279@client.client', N'Hash279', 0, CAST(N'2024-12-14T18:31:21.743' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'25a1322b-4575-49f8-8419-193a27485716', N'Client-212', N'client212@client.client', N'Hash212', 1, CAST(N'2024-12-14T18:31:21.670' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'25c37327-66c4-4b59-b607-8143b385559d', N'Client-297', N'client297@client.client', N'Hash297', 0, CAST(N'2024-12-14T18:31:21.767' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2625c08d-a102-4912-a1c7-2815b15fddb1', N'Client-219', N'client219@client.client', N'Hash219', 0, CAST(N'2024-12-14T18:31:21.677' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'26461e4b-ba98-4823-97a9-7ad1ab60a27b', N'Client-435', N'client435@client.client', N'Hash435', 0, CAST(N'2024-12-14T18:31:22.017' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'264f6e99-d9f2-4a19-bb79-24bbb4787d96', N'Client-21', N'client21@client.client', N'Hash21', 0, CAST(N'2024-12-14T18:31:21.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'26686ed5-cfcb-4248-8a35-b861e73f8a16', N'Client-846', N'client846@client.client', N'Hash846', 1, CAST(N'2024-12-14T18:31:22.387' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2695e9f8-fa37-44ad-b009-c0c740d95515', N'Client-215', N'client215@client.client', N'Hash215', 0, CAST(N'2024-12-14T18:31:21.673' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'26b2d35e-ca30-4300-a65d-27f4b7e56a06', N'Client-68', N'client68@client.client', N'Hash68', 1, CAST(N'2024-12-14T18:31:21.553' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'26c274c9-99dd-4884-882b-84eb80a42b3e', N'Manager-9', N'manager9@manager.manager', N'Hash9', 0, CAST(N'2024-12-14T18:31:21.510' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'26db41ad-a8b6-4986-9e92-ae7113812163', N'Client-379', N'client379@client.client', N'Hash379', 0, CAST(N'2024-12-14T18:31:21.937' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'272f3600-26bf-4d07-b7ed-ff1c2cd33f78', N'Client-789', N'client789@client.client', N'Hash789', 0, CAST(N'2024-12-14T18:31:22.340' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'27f31e26-86a5-482b-927d-bfbf78a91e51', N'Client-669', N'client669@client.client', N'Hash669', 0, CAST(N'2024-12-14T18:31:22.240' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'27f4f859-d542-4c16-bdd5-eb311d51ada9', N'Client-226', N'client226@client.client', N'Hash226', 1, CAST(N'2024-12-14T18:31:21.683' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'28077fe0-97fc-48ae-b507-5fd4a7f31be3', N'Client-405', N'client405@client.client', N'Hash405', 0, CAST(N'2024-12-14T18:31:21.990' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'280ac04c-3dca-49ba-bff1-06ab0bf4d132', N'Client-542', N'client542@client.client', N'Hash542', 1, CAST(N'2024-12-14T18:31:22.147' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'281eb049-d01c-410c-97ec-7ec9262110a1', N'Client-257', N'client257@client.client', N'Hash257', 0, CAST(N'2024-12-14T18:31:21.720' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'283b7ce8-e1b6-4147-aaec-b25e8163442b', N'Client-526', N'client526@client.client', N'Hash526', 1, CAST(N'2024-12-14T18:31:22.127' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'28705ba1-247b-4f6d-946e-6b07b5bbd85f', N'Client-476', N'client476@client.client', N'Hash476', 1, CAST(N'2024-12-14T18:31:22.053' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'28cb09a3-b0a8-4a9a-b620-24e0ba04926d', N'Client-802', N'client802@client.client', N'Hash802', 1, CAST(N'2024-12-14T18:31:22.350' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'294be71f-f0ba-46c3-b2e5-1935b56a5565', N'Client-751', N'client751@client.client', N'Hash751', 0, CAST(N'2024-12-14T18:31:22.307' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'294dcdb4-c383-4fe3-8d73-63af1458e265', N'Client-290', N'client290@client.client', N'Hash290', 1, CAST(N'2024-12-14T18:31:21.757' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2a131627-924d-4a97-9871-70ae3421c784', N'Client-994', N'client994@client.client', N'Hash994', 1, CAST(N'2024-12-14T18:31:22.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2a1bb808-6a29-4baf-9ca7-1e1d8defd9b8', N'Client-935', N'client935@client.client', N'Hash935', 0, CAST(N'2024-12-14T18:31:22.470' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2a755105-8783-4422-ae93-afb6042d7d3b', N'Client-254', N'client254@client.client', N'Hash254', 1, CAST(N'2024-12-14T18:31:21.717' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2ab52e65-95b2-4520-a96d-4c9ca9ae0b01', N'Client-458', N'client458@client.client', N'Hash458', 1, CAST(N'2024-12-14T18:31:22.037' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2ab7994b-9c72-4860-bc0e-3d39cb082a83', N'Client-191', N'client191@client.client', N'Hash191', 0, CAST(N'2024-12-14T18:31:21.650' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2ad4c7e2-4be9-48cd-9961-63afd4331c0a', N'Client-901', N'client901@client.client', N'Hash901', 0, CAST(N'2024-12-14T18:31:22.437' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2b1d0aea-9dc6-492f-9d82-6ed1296d6909', N'Client-767', N'client767@client.client', N'Hash767', 0, CAST(N'2024-12-14T18:31:22.320' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2b727a05-6fbc-420f-9646-6bdd455d03a6', N'Client-972', N'client972@client.client', N'Hash972', 1, CAST(N'2024-12-14T18:31:22.507' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2b9d0353-4b2d-401a-acf2-c8eda7b4591d', N'Client-462', N'client462@client.client', N'Hash462', 1, CAST(N'2024-12-14T18:31:22.040' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2cecb384-c023-4f86-ab05-f01f543e3674', N'Client-22', N'client22@client.client', N'Hash22', 1, CAST(N'2024-12-14T18:31:21.523' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2cfebfad-60da-4a2f-9c9a-dae83a4eeb2c', N'Client-266', N'client266@client.client', N'Hash266', 1, CAST(N'2024-12-14T18:31:21.730' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2d148669-25bd-4509-9d42-b16c1b266996', N'Client-410', N'client410@client.client', N'Hash410', 1, CAST(N'2024-12-14T18:31:21.993' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2da2809b-90bb-4ec1-8016-7cd004ca1e63', N'Client-329', N'client329@client.client', N'Hash329', 0, CAST(N'2024-12-14T18:31:21.807' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2db106f4-2fe5-4a7d-8ac2-d7f43dfe66b6', N'Client-389', N'client389@client.client', N'Hash389', 0, CAST(N'2024-12-14T18:31:21.970' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2dd330c3-98e7-4fb0-9816-71d8c6c52065', N'Client-129', N'client129@client.client', N'Hash129', 0, CAST(N'2024-12-14T18:31:21.593' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2e56d323-da2c-4a2a-8604-eab63859afe4', N'Client-365', N'client365@client.client', N'Hash365', 0, CAST(N'2024-12-14T18:31:21.890' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2eae5943-057e-4b29-ab49-4b65a8bd4340', N'Client-327', N'client327@client.client', N'Hash327', 0, CAST(N'2024-12-14T18:31:21.803' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2eb041bd-3f00-4506-aaa3-885efc9d98c6', N'Client-543', N'client543@client.client', N'Hash543', 0, CAST(N'2024-12-14T18:31:22.147' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2ec45425-dc2b-4b35-a016-af9151496764', N'Client-227', N'client227@client.client', N'Hash227', 0, CAST(N'2024-12-14T18:31:21.683' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2ed5231a-1ec0-4803-b4ea-7515a494b618', N'Client-960', N'client960@client.client', N'Hash960', 1, CAST(N'2024-12-14T18:31:22.493' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2ed70b8a-f944-4092-8da6-1819abddab7b', N'Client-474', N'client474@client.client', N'Hash474', 1, CAST(N'2024-12-14T18:31:22.053' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2ee657d9-60f0-4c13-9372-fab1ed90841a', N'Client-7', N'client7@client.client', N'Hash7', 0, CAST(N'2024-12-14T18:31:21.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2faaedca-f483-4a54-b9a5-5ecba4d6ae80', N'Client-424', N'client424@client.client', N'Hash424', 1, CAST(N'2024-12-14T18:31:22.007' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2fc6e976-fff5-447c-bfa0-11fb6eba7af7', N'Client-477', N'client477@client.client', N'Hash477', 0, CAST(N'2024-12-14T18:31:22.057' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2fd925cc-ec60-4b45-a100-3ce88f824271', N'Client-181', N'client181@client.client', N'Hash181', 0, CAST(N'2024-12-14T18:31:21.640' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2ff54e60-8642-40e2-a2e5-7ff3e626dea8', N'Client-670', N'client670@client.client', N'Hash670', 1, CAST(N'2024-12-14T18:31:22.240' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'2ffeeb2a-721f-4579-982d-3079648a5eb2', N'Client-274', N'client274@client.client', N'Hash274', 1, CAST(N'2024-12-14T18:31:21.737' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3024ea96-1d1b-4a91-ac41-0c5e8c2770d4', N'Client-496', N'client496@client.client', N'Hash496', 1, CAST(N'2024-12-14T18:31:22.073' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'302f068d-5854-455a-af6a-4570f957dce8', N'Client-46', N'client46@client.client', N'Hash46', 1, CAST(N'2024-12-14T18:31:21.537' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'303612e0-f4c7-4abd-80bb-67912033debf', N'Client-610', N'client610@client.client', N'Hash610', 1, CAST(N'2024-12-14T18:31:22.197' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'303c6abe-b0fd-4a60-abc7-b802781b55c6', N'Client-59', N'client59@client.client', N'Hash59', 0, CAST(N'2024-12-14T18:31:21.550' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'305ec15d-015a-40b9-94be-a335705313c5', N'Client-677', N'client677@client.client', N'Hash677', 0, CAST(N'2024-12-14T18:31:22.247' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'30ab72c9-e44a-4369-9d06-3739c88a5efd', N'Client-517', N'client517@client.client', N'Hash517', 0, CAST(N'2024-12-14T18:31:22.110' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'30e15c66-aa98-48b5-b870-f80de24aa3b3', N'Client-948', N'client948@client.client', N'Hash948', 1, CAST(N'2024-12-14T18:31:22.483' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3171a002-198e-4def-b5e1-2e1a3c4c3970', N'Client-626', N'client626@client.client', N'Hash626', 1, CAST(N'2024-12-14T18:31:22.210' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'318633b0-9fcc-49cd-8092-01df0aa8b3ad', N'Client-619', N'client619@client.client', N'Hash619', 0, CAST(N'2024-12-14T18:31:22.203' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3186c63c-6563-4a71-b381-6591b33e5477', N'Client-159', N'client159@client.client', N'Hash159', 0, CAST(N'2024-12-14T18:31:21.617' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'31c9c4fb-1ba9-4571-bbf8-d237ae678005', N'Client-399', N'client399@client.client', N'Hash399', 0, CAST(N'2024-12-14T18:31:21.983' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'31df8dcb-f1f4-4b6d-a9ce-07871db2cc18', N'Client-187', N'client187@client.client', N'Hash187', 0, CAST(N'2024-12-14T18:31:21.647' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'31ed4a55-df65-46e4-89c3-087ee6ebcc51', N'Client-434', N'client434@client.client', N'Hash434', 1, CAST(N'2024-12-14T18:31:22.017' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'325bc1ce-a93f-43ed-a36b-276ace116ddc', N'Client-309', N'client309@client.client', N'Hash309', 0, CAST(N'2024-12-14T18:31:21.783' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'326d4ae9-d733-4626-85c5-ab20cb5744e9', N'Client-196', N'client196@client.client', N'Hash196', 1, CAST(N'2024-12-14T18:31:21.653' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'328e3378-43b5-4d70-bb5d-e106f84f8fe5', N'Client-305', N'client305@client.client', N'Hash305', 0, CAST(N'2024-12-14T18:31:21.777' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'32c1c073-7305-41bd-937b-e8ae2626f84d', N'Client-90', N'client90@client.client', N'Hash90', 1, CAST(N'2024-12-14T18:31:21.567' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'33452a3c-0f84-41fd-9b32-c78bbbe01e2e', N'Client-679', N'client679@client.client', N'Hash679', 0, CAST(N'2024-12-14T18:31:22.247' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'336d0b52-1f30-4651-b6de-783660b6584f', N'Client-503', N'client503@client.client', N'Hash503', 0, CAST(N'2024-12-14T18:31:22.083' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'33bfd364-c1a6-4923-abcb-37d6595a068f', N'Client-341', N'client341@client.client', N'Hash341', 0, CAST(N'2024-12-14T18:31:21.823' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'340e2794-e25e-4dfc-a0d5-a2e3d01c7834', N'Client-464', N'client464@client.client', N'Hash464', 1, CAST(N'2024-12-14T18:31:22.043' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'343477de-ae8b-4c3d-b2f7-8c6d3311f601', N'Client-255', N'client255@client.client', N'Hash255', 0, CAST(N'2024-12-14T18:31:21.717' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'34908f08-18a7-4a14-9b4f-9308bf55d901', N'Client-592', N'client592@client.client', N'Hash592', 1, CAST(N'2024-12-14T18:31:22.183' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'34afbed9-b3a1-48fe-a28e-54ddbbeed277', N'Client-842', N'client842@client.client', N'Hash842', 1, CAST(N'2024-12-14T18:31:22.383' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'34c0dd78-a70b-44dc-92dd-3bc882055f2f', N'Client-377', N'client377@client.client', N'Hash377', 0, CAST(N'2024-12-14T18:31:21.930' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'34f8c334-918a-436b-b8ad-710d3fa88b82', N'Client-202', N'client202@client.client', N'Hash202', 1, CAST(N'2024-12-14T18:31:21.660' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'356cf4f1-891a-46a3-92ae-e74fd30c4247', N'Client-141', N'client141@client.client', N'Hash141', 0, CAST(N'2024-12-14T18:31:21.603' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'35974f38-e7ab-4514-9bab-3060bfe9c698', N'Client-538', N'client538@client.client', N'Hash538', 1, CAST(N'2024-12-14T18:31:22.143' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'35979231-ae18-4443-b7d4-ac8e859fd22a', N'Client-778', N'client778@client.client', N'Hash778', 1, CAST(N'2024-12-14T18:31:22.330' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'35bd8d85-fd94-4f3a-bd01-61d1e612894d', N'Client-197', N'client197@client.client', N'Hash197', 0, CAST(N'2024-12-14T18:31:21.653' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'35f8678e-c549-468b-89ee-2a33aa6bea00', N'Client-43', N'client43@client.client', N'Hash43', 0, CAST(N'2024-12-14T18:31:21.533' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'367e9123-da8d-46fe-b530-4ce0ff4e0e92', N'Client-878', N'client878@client.client', N'Hash878', 1, CAST(N'2024-12-14T18:31:22.417' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'36d2d4ae-6ac2-4ba7-bb0d-2bcbcc6eec4d', N'Client-262', N'client262@client.client', N'Hash262', 1, CAST(N'2024-12-14T18:31:21.727' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'372ece4d-42a1-4246-bb16-ac360bd870cb', N'Client-958', N'client958@client.client', N'Hash958', 1, CAST(N'2024-12-14T18:31:22.493' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'37cb5ece-68dd-4c2f-8b2f-355093fb9e42', N'Client-417', N'client417@client.client', N'Hash417', 0, CAST(N'2024-12-14T18:31:22.000' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'37e619fc-fb57-4b81-a142-5d26dcb91161', N'Client-396', N'client396@client.client', N'Hash396', 1, CAST(N'2024-12-14T18:31:21.980' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'383c0ff5-dc21-4e00-90d6-4a585baff179', N'Client-893', N'client893@client.client', N'Hash893', 0, CAST(N'2024-12-14T18:31:22.430' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3891d49d-71a3-4e5b-919d-a2cd0a204685', N'Client-146', N'client146@client.client', N'Hash146', 1, CAST(N'2024-12-14T18:31:21.607' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'38ab4c9b-09a1-4833-879b-6602a0d9f880', N'Client-887', N'client887@client.client', N'Hash887', 0, CAST(N'2024-12-14T18:31:22.427' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'38d884ff-a631-4621-a2f0-11cfcaa0ad05', N'Client-645', N'client645@client.client', N'Hash645', 0, CAST(N'2024-12-14T18:31:22.223' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'38f0379a-fdbf-41dc-be0b-8d63deafa814', N'Client-600', N'client600@client.client', N'Hash600', 1, CAST(N'2024-12-14T18:31:22.190' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'390fec2d-c0d1-4ab7-a8d8-c4daf5b11512', N'Client-475', N'client475@client.client', N'Hash475', 0, CAST(N'2024-12-14T18:31:22.053' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'396cbf2b-cbc4-4465-952a-09731a775a28', N'Client-154', N'client154@client.client', N'Hash154', 1, CAST(N'2024-12-14T18:31:21.613' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'39ad9919-0e90-4124-a684-40156d4a0a6a', N'Client-388', N'client388@client.client', N'Hash388', 1, CAST(N'2024-12-14T18:31:21.967' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3a8dcb83-a401-4a16-be0d-557ea7095e01', N'Manager-0', N'manager0@manager.manager', N'Hash0', 1, CAST(N'2024-12-14T18:31:21.503' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3b014cb8-1f0d-4f9f-a4b3-eb64e70e6c57', N'Client-201', N'client201@client.client', N'Hash201', 0, CAST(N'2024-12-14T18:31:21.657' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3b7d80c3-1045-409c-9f28-464d4de544e4', N'Client-996', N'client996@client.client', N'Hash996', 1, CAST(N'2024-12-14T18:31:22.530' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3b86e31f-1126-4d71-aa27-8c7bf6f1f868', N'Client-727', N'client727@client.client', N'Hash727', 0, CAST(N'2024-12-14T18:31:22.287' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3ba18e4b-d6d9-4784-ada6-d471ed03958f', N'Client-650', N'client650@client.client', N'Hash650', 1, CAST(N'2024-12-14T18:31:22.227' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3c0ca77e-7edc-47c1-9992-bd5213639a6c', N'Client-885', N'client885@client.client', N'Hash885', 0, CAST(N'2024-12-14T18:31:22.423' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3c5718d7-eb9b-4ff7-a934-9ec594c23a38', N'Client-997', N'client997@client.client', N'Hash997', 0, CAST(N'2024-12-14T18:31:22.533' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3c91aedb-3eb3-472c-884e-4d43db7c86b6', N'Client-504', N'client504@client.client', N'Hash504', 1, CAST(N'2024-12-14T18:31:22.083' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3d3966c4-10e0-479f-a7f1-a0e75072821b', N'Client-643', N'client643@client.client', N'Hash643', 0, CAST(N'2024-12-14T18:31:22.220' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3d7c9506-4947-4adc-99c6-6cce7ff92a51', N'Client-560', N'client560@client.client', N'Hash560', 1, CAST(N'2024-12-14T18:31:22.160' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3d975d1c-f9af-41ca-84f6-47322031e675', N'Client-762', N'client762@client.client', N'Hash762', 1, CAST(N'2024-12-14T18:31:22.313' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3e3ad33d-5327-4faa-9ef2-c83beacf6a69', N'Client-615', N'client615@client.client', N'Hash615', 0, CAST(N'2024-12-14T18:31:22.200' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3e6549c2-2a6d-4d26-b541-a8ea1a7ca683', N'Client-471', N'client471@client.client', N'Hash471', 0, CAST(N'2024-12-14T18:31:22.050' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3edc0dca-f83c-433b-9215-e5188581d1cb', N'Client-127', N'client127@client.client', N'Hash127', 0, CAST(N'2024-12-14T18:31:21.593' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3efcfd08-cc54-439f-84e1-23bc4fc39af0', N'Client-99', N'client99@client.client', N'Hash99', 0, CAST(N'2024-12-14T18:31:21.573' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3f104955-2416-464c-a6a3-333c0ded5c19', N'Client-768', N'client768@client.client', N'Hash768', 1, CAST(N'2024-12-14T18:31:22.320' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3f21b92b-35da-4c18-a004-778b1a445ff0', N'Client-30', N'client30@client.client', N'Hash30', 1, CAST(N'2024-12-14T18:31:21.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3f5484c8-16d3-4551-be2c-7402abc99ce0', N'Client-162', N'client162@client.client', N'Hash162', 1, CAST(N'2024-12-14T18:31:21.620' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3f97d3ab-da1e-4d68-aea7-819348da3285', N'Client-195', N'client195@client.client', N'Hash195', 0, CAST(N'2024-12-14T18:31:21.653' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'3facfbbc-136c-44e5-a362-4ccc18328903', N'Client-765', N'client765@client.client', N'Hash765', 0, CAST(N'2024-12-14T18:31:22.317' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4005b298-fe1b-47dd-ad13-1a27152aceb9', N'Client-386', N'client386@client.client', N'Hash386', 1, CAST(N'2024-12-14T18:31:21.957' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'40755a89-4908-4c36-ae4b-838d2aabbc48', N'Client-964', N'client964@client.client', N'Hash964', 1, CAST(N'2024-12-14T18:31:22.500' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'40fe55ce-68e2-4035-9607-042e90272262', N'Client-868', N'client868@client.client', N'Hash868', 1, CAST(N'2024-12-14T18:31:22.407' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'41099156-1056-49fa-9758-24a48f96ca66', N'Client-416', N'client416@client.client', N'Hash416', 1, CAST(N'2024-12-14T18:31:22.000' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'41ace3cd-be1c-4230-9802-648977bcb340', N'Client-519', N'client519@client.client', N'Hash519', 0, CAST(N'2024-12-14T18:31:22.117' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'41c1c03b-84f7-4130-b1d6-268cdd3ae001', N'Client-39', N'client39@client.client', N'Hash39', 0, CAST(N'2024-12-14T18:31:21.530' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'42107121-9c14-4bc8-b57c-cc06c4ae9755', N'Client-192', N'client192@client.client', N'Hash192', 1, CAST(N'2024-12-14T18:31:21.650' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4217eca0-30bf-4d6b-9035-c2403a1396d9', N'Client-962', N'client962@client.client', N'Hash962', 1, CAST(N'2024-12-14T18:31:22.497' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'42d55291-3fb8-4395-8cac-c592ec434a0c', N'Client-40', N'client40@client.client', N'Hash40', 1, CAST(N'2024-12-14T18:31:21.530' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4303de7f-ccaf-423d-9cb0-7a0e22ebcf5a', N'Client-549', N'client549@client.client', N'Hash549', 0, CAST(N'2024-12-14T18:31:22.150' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'435d463b-e26a-42be-bb64-de9869290e2f', N'Client-308', N'client308@client.client', N'Hash308', 1, CAST(N'2024-12-14T18:31:21.780' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'43c038d0-8d7b-448f-9f66-ac9da234a187', N'Client-989', N'client989@client.client', N'Hash989', 0, CAST(N'2024-12-14T18:31:22.523' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'43d92693-8e0a-4809-b8e3-061108a64c77', N'Client-639', N'client639@client.client', N'Hash639', 0, CAST(N'2024-12-14T18:31:22.217' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'449150f7-0868-4775-ac89-e6c126315b3d', N'Client-563', N'client563@client.client', N'Hash563', 0, CAST(N'2024-12-14T18:31:22.160' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'44df51c4-7d00-4c8c-af8e-d2065406448a', N'Client-521', N'client521@client.client', N'Hash521', 0, CAST(N'2024-12-14T18:31:22.123' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'45b674e9-d656-43a3-be05-8d7a2735eab5', N'Client-998', N'client998@client.client', N'Hash998', 1, CAST(N'2024-12-14T18:31:22.533' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'45e8acb3-716f-4a8d-8c12-2e272a38bbf4', N'Client-342', N'client342@client.client', N'Hash342', 1, CAST(N'2024-12-14T18:31:21.823' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'45ed20a4-b6c7-4801-9497-2c5c2dbb1a20', N'Client-945', N'client945@client.client', N'Hash945', 0, CAST(N'2024-12-14T18:31:22.480' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4620e410-3512-4289-95dc-07c97a606128', N'Client-235', N'client235@client.client', N'Hash235', 0, CAST(N'2024-12-14T18:31:21.693' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4667741e-059a-49ce-af53-90b14d2e9140', N'Client-356', N'client356@client.client', N'Hash356', 1, CAST(N'2024-12-14T18:31:21.860' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'46c99e78-6690-4992-b04d-4ed41a9dc3f1', N'Client-913', N'client913@client.client', N'Hash913', 0, CAST(N'2024-12-14T18:31:22.450' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'473437a0-7985-4f07-804c-963acc64c695', N'Client-182', N'client182@client.client', N'Hash182', 1, CAST(N'2024-12-14T18:31:21.640' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'473f37e2-ac01-4566-8e7d-4b080e458f03', N'Client-652', N'client652@client.client', N'Hash652', 1, CAST(N'2024-12-14T18:31:22.227' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'47a88c19-8a88-4ecb-bfdb-dacc69e393a6', N'Client-73', N'client73@client.client', N'Hash73', 0, CAST(N'2024-12-14T18:31:21.557' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'47f166f5-c665-485f-a707-3554ec5a2d71', N'Client-896', N'client896@client.client', N'Hash896', 1, CAST(N'2024-12-14T18:31:22.433' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4802a9e3-7f6a-4bc0-9d8d-c33e49b8fe1c', N'Client-532', N'client532@client.client', N'Hash532', 1, CAST(N'2024-12-14T18:31:22.137' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'48e39f50-816c-45a3-b9d7-5aa8cbe78ed4', N'Client-393', N'client393@client.client', N'Hash393', 0, CAST(N'2024-12-14T18:31:21.977' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'48efc7f5-d413-40d3-8cca-1d6e8b5e92fe', N'Client-140', N'client140@client.client', N'Hash140', 1, CAST(N'2024-12-14T18:31:21.603' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4901dc2f-336b-4b53-ae71-c93a1970037c', N'Client-932', N'client932@client.client', N'Hash932', 1, CAST(N'2024-12-14T18:31:22.467' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4904fb2f-0776-472a-b18d-3dbb6ecb03cf', N'Client-493', N'client493@client.client', N'Hash493', 0, CAST(N'2024-12-14T18:31:22.070' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'49164920-38a0-4850-bc88-1738e6f24322', N'Client-853', N'client853@client.client', N'Hash853', 0, CAST(N'2024-12-14T18:31:22.393' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4961446c-765a-4a68-87f5-7bd75a6fd414', N'Client-957', N'client957@client.client', N'Hash957', 0, CAST(N'2024-12-14T18:31:22.493' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'49675adc-6e80-4c47-94a1-341cd76b892a', N'Client-944', N'client944@client.client', N'Hash944', 1, CAST(N'2024-12-14T18:31:22.480' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'49c71446-a51e-4c51-84f6-92bae1a6c86e', N'Client-637', N'client637@client.client', N'Hash637', 0, CAST(N'2024-12-14T18:31:22.217' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'49ce4cec-538e-47ca-92e9-2f75522d5e60', N'Client-612', N'client612@client.client', N'Hash612', 1, CAST(N'2024-12-14T18:31:22.200' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'49f82845-7104-489d-be84-72cb5959e05b', N'Client-819', N'client819@client.client', N'Hash819', 0, CAST(N'2024-12-14T18:31:22.367' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4a038258-2559-4e00-9f53-0b825e70c561', N'Client-547', N'client547@client.client', N'Hash547', 0, CAST(N'2024-12-14T18:31:22.150' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4aab92e7-a7f8-4ca2-9797-14ec8b87e204', N'Client-199', N'client199@client.client', N'Hash199', 0, CAST(N'2024-12-14T18:31:21.657' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4b06a43e-fa61-4e0c-a69b-eceda1e3f5eb', N'Client-851', N'client851@client.client', N'Hash851', 0, CAST(N'2024-12-14T18:31:22.393' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4b3b2aa1-82a8-4529-8d70-1f9e90074cb0', N'Client-617', N'client617@client.client', N'Hash617', 0, CAST(N'2024-12-14T18:31:22.203' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4ba8b4a9-f651-4fbf-ad69-343830606f56', N'Client-702', N'client702@client.client', N'Hash702', 1, CAST(N'2024-12-14T18:31:22.267' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4bbb82a5-633b-4337-a3b2-d15f8aebd48c', N'Client-710', N'client710@client.client', N'Hash710', 1, CAST(N'2024-12-14T18:31:22.273' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4bc18a43-10fe-49ba-874e-040ac3807a18', N'Client-817', N'client817@client.client', N'Hash817', 0, CAST(N'2024-12-14T18:31:22.363' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4c2ffc9d-442e-4b34-aabc-bf8b5262c3d6', N'Client-807', N'client807@client.client', N'Hash807', 0, CAST(N'2024-12-14T18:31:22.357' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4c744087-e202-4a37-9f06-fb8f751d3d4b', N'Client-331', N'client331@client.client', N'Hash331', 0, CAST(N'2024-12-14T18:31:21.810' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4cb17cad-bc8b-4cea-b955-068164039094', N'Client-603', N'client603@client.client', N'Hash603', 0, CAST(N'2024-12-14T18:31:22.193' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4cbe742b-f12e-4b5d-b2cd-7f3ec1d161fd', N'Manager-4', N'manager4@manager.manager', N'Hash4', 1, CAST(N'2024-12-14T18:31:21.510' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4ce77b25-25f8-4cb4-be1d-909e0491d43e', N'Client-432', N'client432@client.client', N'Hash432', 1, CAST(N'2024-12-14T18:31:22.013' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4d09d6f9-4e1e-4268-be33-34c0eba56d7c', N'Client-85', N'client85@client.client', N'Hash85', 0, CAST(N'2024-12-14T18:31:21.567' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4d80c752-a22b-4242-9ba9-5d5c51769f6f', N'Client-272', N'client272@client.client', N'Hash272', 1, CAST(N'2024-12-14T18:31:21.737' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4e21162a-2206-427e-8e39-000c027d1049', N'Client-263', N'client263@client.client', N'Hash263', 0, CAST(N'2024-12-14T18:31:21.727' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4e29dfa4-1a09-4dca-aacf-4928b62edaa9', N'Admin1', N'admin1@gmail.com', N'AQAAAAIAAYagAAAAEHIk7GZz+Z2fazl265RJeJhX82AferjZ4kKPkSSNFp1SE19niDM2fslQtpodS8ZCdA==', 1, CAST(N'2025-04-22T18:03:16.710' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4e36164c-4338-424e-883d-66d12dc81e16', N'Client-137', N'client137@client.client', N'Hash137', 0, CAST(N'2024-12-14T18:31:21.600' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4e70bbd0-fca3-4780-8cc1-7525a87f490d', N'Client-450', N'client450@client.client', N'Hash450', 1, CAST(N'2024-12-14T18:31:22.030' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4e72f2b7-7da9-4d79-b7c5-97bbfc2b9829', N'Client-318', N'client318@client.client', N'Hash318', 1, CAST(N'2024-12-14T18:31:21.793' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4f21992d-c25f-46e6-a6f6-adab4d2aa588', N'Client-134', N'client134@client.client', N'Hash134', 1, CAST(N'2024-12-14T18:31:21.597' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4f2c428e-fa3d-4da6-8bb9-f3c37ac7d6f2', N'Client-892', N'client892@client.client', N'Hash892', 1, CAST(N'2024-12-14T18:31:22.430' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4f451dd4-e5f9-4c6e-b57d-e1a7abe1e98e', N'Client-794', N'client794@client.client', N'Hash794', 1, CAST(N'2024-12-14T18:31:22.343' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4f83c4ae-95d5-415e-939c-81bc2d46bbc0', N'Client-285', N'client285@client.client', N'Hash285', 0, CAST(N'2024-12-14T18:31:21.750' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4f84ec6a-1d67-498c-82e6-fa583aaa349c', N'Client-324', N'client324@client.client', N'Hash324', 1, CAST(N'2024-12-14T18:31:21.800' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'4ff1a07b-8957-45c4-8c28-6ab31ed2f580', N'Client-953', N'client953@client.client', N'Hash953', 0, CAST(N'2024-12-14T18:31:22.487' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'504bafe9-f3f3-4c38-9126-cb7b1e99d47a', N'Client-661', N'client661@client.client', N'Hash661', 0, CAST(N'2024-12-14T18:31:22.233' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'504f1ea7-16ca-44ec-9332-c72244175a59', N'Client-144', N'client144@client.client', N'Hash144', 1, CAST(N'2024-12-14T18:31:21.607' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'505b3b90-c856-43e7-ba36-6a16055fb6b1', N'Client-79', N'client79@client.client', N'Hash79', 0, CAST(N'2024-12-14T18:31:21.560' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5065ed5f-0fdf-4dc7-924b-e3b73fdbee32', N'Client-145', N'client145@client.client', N'Hash145', 0, CAST(N'2024-12-14T18:31:21.607' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'50a87a24-e95a-496b-9867-0b655eab7c26', N'Client-491', N'client491@client.client', N'Hash491', 0, CAST(N'2024-12-14T18:31:22.067' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'50ade164-b85d-4498-8ce6-ab17029f0dbc', N'Client-916', N'client916@client.client', N'Hash916', 1, CAST(N'2024-12-14T18:31:22.453' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'50fc1f78-139b-4226-9e4b-705c119aac60', N'Client-826', N'client826@client.client', N'Hash826', 1, CAST(N'2024-12-14T18:31:22.370' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'51072475-705c-4a19-9f8d-3262e1774df0', N'Client-278', N'client278@client.client', N'Hash278', 1, CAST(N'2024-12-14T18:31:21.743' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'510858e5-eb67-4133-83f3-1b8f902197e2', N'Client-766', N'client766@client.client', N'Hash766', 1, CAST(N'2024-12-14T18:31:22.317' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'51183504-3972-4e97-86e4-bdbd05d40db0', N'Client-664', N'client664@client.client', N'Hash664', 1, CAST(N'2024-12-14T18:31:22.237' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'51c0acbe-9e80-40b9-bfe0-7391ebed57e6', N'Client-13', N'client13@client.client', N'Hash13', 0, CAST(N'2024-12-14T18:31:21.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'51e9c5e8-296a-419e-8492-43d0d1c7ebd9', N'Client-233', N'client233@client.client', N'Hash233', 0, CAST(N'2024-12-14T18:31:21.690' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5204b82c-215e-4121-9bff-e309aaf70a41', N'Client-326', N'client326@client.client', N'Hash326', 1, CAST(N'2024-12-14T18:31:21.803' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'520a942a-e3f7-4ef9-b5bd-4b0094fbbf78', N'Client-660', N'client660@client.client', N'Hash660', 1, CAST(N'2024-12-14T18:31:22.233' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'52accf0f-abc0-40ce-b6a7-d576de686290', N'Client-594', N'client594@client.client', N'Hash594', 1, CAST(N'2024-12-14T18:31:22.183' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'52f4e36c-c67a-4854-a64e-86c78a3d5ab9', N'Client-602', N'client602@client.client', N'Hash602', 1, CAST(N'2024-12-14T18:31:22.190' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'53242f8f-0b46-4f3f-8b00-82a9e89dd242', N'Client-178', N'client178@client.client', N'Hash178', 1, CAST(N'2024-12-14T18:31:21.637' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'533671d7-48fb-4440-baae-28b3cf98fb9a', N'Client-153', N'client153@client.client', N'Hash153', 0, CAST(N'2024-12-14T18:31:21.613' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'536c41d9-009c-4c83-80b5-6934265fc2da', N'Client-849', N'client849@client.client', N'Hash849', 0, CAST(N'2024-12-14T18:31:22.390' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'53962811-d274-48b8-85e5-01cd195f3e23', N'Client-567', N'client567@client.client', N'Hash567', 0, CAST(N'2024-12-14T18:31:22.163' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'53ad2646-26e1-4372-a9f4-7dfe4cc7f132', N'Client-36', N'client36@client.client', N'Hash36', 1, CAST(N'2024-12-14T18:31:21.530' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5425fdd6-dcef-4ea6-961a-02cacf8fd5fb', N'Client-360', N'client360@client.client', N'Hash360', 1, CAST(N'2024-12-14T18:31:21.873' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'544dfa7a-9112-4899-8c07-e08df9f5a893', N'Client-48', N'client48@client.client', N'Hash48', 1, CAST(N'2024-12-14T18:31:21.537' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'544ef914-d9c9-4c72-9056-7c5e5538cc07', N'Client-459', N'client459@client.client', N'Hash459', 0, CAST(N'2024-12-14T18:31:22.040' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'546c6d9b-aab8-42c6-9020-777356588c96', N'Client-155', N'client155@client.client', N'Hash155', 0, CAST(N'2024-12-14T18:31:21.613' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5490216f-6206-4a04-acca-c65d22b8953e', N'Client-35', N'client35@client.client', N'Hash35', 0, CAST(N'2024-12-14T18:31:21.530' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'552dd2f9-3795-4224-84a2-e282c71ea594', N'Client-781', N'client781@client.client', N'Hash781', 0, CAST(N'2024-12-14T18:31:22.333' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5641d0fd-ccbe-4a85-a738-337b79cdf4e0', N'Client-402', N'client402@client.client', N'Hash402', 1, CAST(N'2024-12-14T18:31:21.987' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'565e5edd-5f0b-480f-8b1b-4ea953c8e637', N'Client-463', N'client463@client.client', N'Hash463', 0, CAST(N'2024-12-14T18:31:22.043' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'56d9e523-4e3a-4c7c-8dd0-32a71327cbed', N'Client-965', N'client965@client.client', N'Hash965', 0, CAST(N'2024-12-14T18:31:22.500' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'56e14051-5391-44e3-8367-57937ac00147', N'Client-531', N'client531@client.client', N'Hash531', 0, CAST(N'2024-12-14T18:31:22.133' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'575d945d-a205-499e-9b24-8fc38abfbf65', N'Client-915', N'client915@client.client', N'Hash915', 0, CAST(N'2024-12-14T18:31:22.450' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'57c89d7d-25d3-4ae0-b222-32ba9dcfa4b4', N'Client-250', N'client250@client.client', N'Hash250', 1, CAST(N'2024-12-14T18:31:21.710' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'58225039-7d68-4675-b956-1d842bf4f71c', N'Client-347', N'client347@client.client', N'Hash347', 0, CAST(N'2024-12-14T18:31:21.830' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'583003f9-3f12-49b0-bc62-6ca41b782320', N'Client-625', N'client625@client.client', N'Hash625', 0, CAST(N'2024-12-14T18:31:22.207' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'583147cd-be27-4d84-a3af-c363fb8b985e', N'Client-26', N'client26@client.client', N'Hash26', 1, CAST(N'2024-12-14T18:31:21.523' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'585f69dc-2f0f-4720-be2f-328d8138fd9a', N'Client-12', N'client12@client.client', N'Hash12', 1, CAST(N'2024-12-14T18:31:21.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'585fa278-caad-416b-be58-6282f1587211', N'Client-722', N'client722@client.client', N'Hash722', 1, CAST(N'2024-12-14T18:31:22.283' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'58bdb8a1-5404-4ecd-9671-eff24d3b90b0', N'Client-729', N'client729@client.client', N'Hash729', 0, CAST(N'2024-12-14T18:31:22.287' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'591ed513-b786-4953-a80b-bddc5606490b', N'Client-445', N'client445@client.client', N'Hash445', 0, CAST(N'2024-12-14T18:31:22.027' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'59466083-993a-446f-a22d-56624cad1ce2', N'Client-726', N'client726@client.client', N'Hash726', 1, CAST(N'2024-12-14T18:31:22.283' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'594ba18f-a289-499b-9b46-800fae3d2ff7', N'Client-430', N'client430@client.client', N'Hash430', 1, CAST(N'2024-12-14T18:31:22.013' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'596c9f6b-a70d-41ff-9293-f1d181fff8e3', N'Client-748', N'client748@client.client', N'Hash748', 1, CAST(N'2024-12-14T18:31:22.303' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5971c5c2-5138-49bf-859f-41cc82d8c6a1', N'Client-539', N'client539@client.client', N'Hash539', 0, CAST(N'2024-12-14T18:31:22.143' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'59771fe3-287c-4041-b644-dad2b796760e', N'Client-348', N'client348@client.client', N'Hash348', 1, CAST(N'2024-12-14T18:31:21.833' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5a7f235f-23cf-4483-88b8-c10b2ace29a4', N'Client-553', N'client553@client.client', N'Hash553', 0, CAST(N'2024-12-14T18:31:22.153' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5aa67af3-67a6-4fe6-bd88-cdb4553e8146', N'Client-380', N'client380@client.client', N'Hash380', 1, CAST(N'2024-12-14T18:31:21.940' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5abc9665-c75f-47dc-a168-23d8b78dbc8e', N'Client-15', N'client15@client.client', N'Hash15', 0, CAST(N'2024-12-14T18:31:21.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5abd4ea4-e600-4257-b2c1-8614e2c9c9e5', N'Client-221', N'client221@client.client', N'Hash221', 0, CAST(N'2024-12-14T18:31:21.677' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5abe9958-c863-4390-9b87-18ea7857292d', N'Client-544', N'client544@client.client', N'Hash544', 1, CAST(N'2024-12-14T18:31:22.147' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5afcdd33-5d84-42a7-a944-3c045a6604ce', N'Client-691', N'client691@client.client', N'Hash691', 0, CAST(N'2024-12-14T18:31:22.257' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5b491313-f61b-4a26-9c69-9d2d113cab57', N'Client-736', N'client736@client.client', N'Hash736', 1, CAST(N'2024-12-14T18:31:22.293' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5b4b0052-7748-4e5c-952b-710c05295e6d', N'Client-100', N'client100@client.client', N'Hash100', 1, CAST(N'2024-12-14T18:31:21.573' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5bf5f8d3-128d-4054-95c8-a5c584304e5b', N'Client-143', N'client143@client.client', N'Hash143', 0, CAST(N'2024-12-14T18:31:21.603' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5c01b618-f041-4c1d-8c1e-e062f6db82ce', N'Client-426', N'client426@client.client', N'Hash426', 1, CAST(N'2024-12-14T18:31:22.007' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5c22eca0-6194-4c33-b538-dd24dd3ddfbc', N'Client-461', N'client461@client.client', N'Hash461', 0, CAST(N'2024-12-14T18:31:22.040' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5c57f48e-cf2a-456c-a050-2b4804a57439', N'Client-452', N'client452@client.client', N'Hash452', 1, CAST(N'2024-12-14T18:31:22.033' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5cad104a-73d5-45da-a634-78ba0d0602e8', N'Client-917', N'client917@client.client', N'Hash917', 0, CAST(N'2024-12-14T18:31:22.453' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5cf01d81-b39c-47a3-bdbd-05140b11235d', N'Client-238', N'client238@client.client', N'Hash238', 1, CAST(N'2024-12-14T18:31:21.697' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5d031ecd-5027-4e3d-a6b6-f6ce3b5f3ecc', N'Client-298', N'client298@client.client', N'Hash298', 1, CAST(N'2024-12-14T18:31:21.767' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5e3818ed-ca72-4554-886f-19817530e5a1', N'Client-28', N'client28@client.client', N'Hash28', 1, CAST(N'2024-12-14T18:31:21.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5e480202-27bf-426d-90f4-9e07842a9d15', N'Client-925', N'client925@client.client', N'Hash925', 0, CAST(N'2024-12-14T18:31:22.460' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5e80f7f6-2ed7-436e-ba63-3db504346598', N'Client-837', N'client837@client.client', N'Hash837', 0, CAST(N'2024-12-14T18:31:22.380' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5ecdaf29-e5b9-4cff-a0cc-36c6c50b8726', N'Client-340', N'client340@client.client', N'Hash340', 1, CAST(N'2024-12-14T18:31:21.823' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5ef0aa7d-43c9-4405-83c6-889df9c00c94', N'Client-436', N'client436@client.client', N'Hash436', 1, CAST(N'2024-12-14T18:31:22.017' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5f2b183b-e5e0-4d64-8055-6f5ea2f4201e', N'Client-796', N'client796@client.client', N'Hash796', 1, CAST(N'2024-12-14T18:31:22.347' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5f53f0e4-c885-47f2-b359-6e9ac2942e19', N'Client-582', N'client582@client.client', N'Hash582', 1, CAST(N'2024-12-14T18:31:22.173' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5f935d53-15a2-4ab4-b241-c0a5cb57b463', N'Client-121', N'client121@client.client', N'Hash121', 0, CAST(N'2024-12-14T18:31:21.587' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'5fc73594-3a43-4c74-9b08-204d17dbecdb', N'Client-267', N'client267@client.client', N'Hash267', 0, CAST(N'2024-12-14T18:31:21.730' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'60b3c878-d6a9-46fd-92e2-8a9a90f35ed9', N'Client-175', N'client175@client.client', N'Hash175', 0, CAST(N'2024-12-14T18:31:21.633' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'60d70fdb-f33f-4d9a-92e8-c79694462010', N'Client-63', N'client63@client.client', N'Hash63', 0, CAST(N'2024-12-14T18:31:21.553' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'616073c3-65bd-401c-9805-5631f5fdbeef', N'Client-349', N'client349@client.client', N'Hash349', 0, CAST(N'2024-12-14T18:31:21.833' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'61ab98ed-fec7-4586-838c-bb7316caf62f', N'Client-908', N'client908@client.client', N'Hash908', 1, CAST(N'2024-12-14T18:31:22.443' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'61ced0cd-59d6-476a-82f4-850700cf60c1', N'Client-25', N'client25@client.client', N'Hash25', 0, CAST(N'2024-12-14T18:31:21.523' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6247d09a-189f-4de3-8646-c62af90fc832', N'Client-530', N'client530@client.client', N'Hash530', 1, CAST(N'2024-12-14T18:31:22.133' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6264bb7e-e0b9-4cb6-8823-9c22f163affd', N'Client-351', N'client351@client.client', N'Hash351', 0, CAST(N'2024-12-14T18:31:21.843' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'62743962-ab66-4ede-a6a0-29162ce1cbba', N'Client-101', N'client101@client.client', N'Hash101', 0, CAST(N'2024-12-14T18:31:21.573' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'62d2cb9a-c8e6-40ed-8111-e1694a915fca', N'Client-599', N'client599@client.client', N'Hash599', 0, CAST(N'2024-12-14T18:31:22.190' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6352c2de-6ad5-4e23-ae64-ce7bf1ffb87d', N'Client-879', N'client879@client.client', N'Hash879', 0, CAST(N'2024-12-14T18:31:22.417' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'635ac483-1f14-4cce-a72d-fb046494bd48', N'Client-898', N'client898@client.client', N'Hash898', 1, CAST(N'2024-12-14T18:31:22.437' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'63825b78-d648-4cd1-b389-2b0b38ad483c', N'Manager-8', N'manager8@manager.manager', N'Hash8', 1, CAST(N'2024-12-14T18:31:21.510' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'63bdadf9-2973-4631-bbb3-71abf0eac492', N'Client-69', N'client69@client.client', N'Hash69', 0, CAST(N'2024-12-14T18:31:21.553' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'63c6a8fd-65ad-4adb-9541-f404a5df1163', N'Client-480', N'client480@client.client', N'Hash480', 1, CAST(N'2024-12-14T18:31:22.057' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'63dafa1d-e6da-4f7a-b05e-3ac31066ba4e', N'Client-959', N'client959@client.client', N'Hash959', 0, CAST(N'2024-12-14T18:31:22.493' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'64160b38-9018-4312-8d95-388e0dd5d7b9', N'Client-942', N'client942@client.client', N'Hash942', 1, CAST(N'2024-12-14T18:31:22.477' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'64252600-f9a8-4971-8ca2-d950ddd1d368', N'Client-562', N'client562@client.client', N'Hash562', 1, CAST(N'2024-12-14T18:31:22.160' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'646a6007-667c-4d91-b090-93350361849a', N'Client-207', N'client207@client.client', N'Hash207', 0, CAST(N'2024-12-14T18:31:21.663' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'647b9949-caf4-47e0-964a-14af410519f2', N'Client-301', N'client301@client.client', N'Hash301', 0, CAST(N'2024-12-14T18:31:21.773' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'64c5889e-c2ea-441f-afb2-2bf69dfaeb5d', N'Client-687', N'client687@client.client', N'Hash687', 0, CAST(N'2024-12-14T18:31:22.253' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'64e8fe1f-91a2-41c8-8a36-240bc6eaf2ff', N'Client-692', N'client692@client.client', N'Hash692', 1, CAST(N'2024-12-14T18:31:22.257' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'654b4136-eda7-42e5-9552-2d439e235508', N'Client-57', N'client57@client.client', N'Hash57', 0, CAST(N'2024-12-14T18:31:21.550' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'655e715d-9ac1-4c4a-b4aa-4d5c4228f3c9', N'Client-911', N'client911@client.client', N'Hash911', 0, CAST(N'2024-12-14T18:31:22.447' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'659e7934-b288-4edb-8632-9f7ea3b93fad', N'Client-148', N'client148@client.client', N'Hash148', 1, CAST(N'2024-12-14T18:31:21.607' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'65b3808c-cc54-473b-9450-7429e9fb30d9', N'Client-659', N'client659@client.client', N'Hash659', 0, CAST(N'2024-12-14T18:31:22.233' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'65c3d85d-94f7-4202-926b-28bdbfb11112', N'Client-236', N'client236@client.client', N'Hash236', 1, CAST(N'2024-12-14T18:31:21.693' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'65c5a00e-58d5-4e55-b4ce-fded4dc398a9', N'Client-506', N'client506@client.client', N'Hash506', 1, CAST(N'2024-12-14T18:31:22.087' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'65cc1868-eb5d-434e-825b-7f3b1c14afea', N'Client-912', N'client912@client.client', N'Hash912', 1, CAST(N'2024-12-14T18:31:22.447' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'65daebce-14e1-4663-8e49-801c7f97ff12', N'Client-732', N'client732@client.client', N'Hash732', 1, CAST(N'2024-12-14T18:31:22.290' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'66192ddd-a06d-475d-ae9e-40b54a94461e', N'Client-131', N'client131@client.client', N'Hash131', 0, CAST(N'2024-12-14T18:31:21.597' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'661bbb79-9b78-4bbe-ac63-56774db049b2', N'Client-316', N'client316@client.client', N'Hash316', 1, CAST(N'2024-12-14T18:31:21.790' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'662d0c27-b627-41b9-8727-785b1273ffd9', N'Client-978', N'client978@client.client', N'Hash978', 1, CAST(N'2024-12-14T18:31:22.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'66629cb5-909c-4cb1-b849-9f97c938d853', N'Client-423', N'client423@client.client', N'Hash423', 0, CAST(N'2024-12-14T18:31:22.007' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'669c60d6-163f-43a0-a2f2-0ea8732c7d10', N'Client-431', N'client431@client.client', N'Hash431', 0, CAST(N'2024-12-14T18:31:22.013' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'66ffb215-0573-4c3a-a748-5a3ed4da5ffd', N'Client-831', N'client831@client.client', N'Hash831', 0, CAST(N'2024-12-14T18:31:22.377' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6711e89c-cd6c-4f37-9333-6c2c5eda35ef', N'Client-711', N'client711@client.client', N'Hash711', 0, CAST(N'2024-12-14T18:31:22.273' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'675b97a4-6fc8-4a3b-b973-4f4a0e6c1025', N'Client-516', N'client516@client.client', N'Hash516', 1, CAST(N'2024-12-14T18:31:22.107' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'67aa37bb-5a81-49b8-a91e-ab3c6a0e879f', N'Client-883', N'client883@client.client', N'Hash883', 0, CAST(N'2024-12-14T18:31:22.423' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'68537ba5-28d1-4c3f-a31e-f7792af96beb', N'Client-334', N'client334@client.client', N'Hash334', 1, CAST(N'2024-12-14T18:31:21.813' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'689c96b8-b488-40af-9056-fbba5aec03db', N'Client-366', N'client366@client.client', N'Hash366', 1, CAST(N'2024-12-14T18:31:21.893' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'693dd9ea-66f1-419a-971b-f118a049a33a', N'Client-2', N'client2@client.client', N'Hash2', 1, CAST(N'2024-12-14T18:31:21.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6992aee7-dd94-4723-bfc0-61530c27c32b', N'Client-747', N'client747@client.client', N'Hash747', 0, CAST(N'2024-12-14T18:31:22.303' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6a427018-0179-4e2c-b29c-748950bd120a', N'Client-933', N'client933@client.client', N'Hash933', 0, CAST(N'2024-12-14T18:31:22.467' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6a52c904-3f3b-4795-a48b-561f861c3cad', N'Client-359', N'client359@client.client', N'Hash359', 0, CAST(N'2024-12-14T18:31:21.870' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6a7cb741-64f0-40d1-a117-c02983f7894f', N'Client-457', N'client457@client.client', N'Hash457', 0, CAST(N'2024-12-14T18:31:22.037' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6a7d4523-68c8-4020-84ab-8a76a9b8d7a7', N'Client-694', N'client694@client.client', N'Hash694', 1, CAST(N'2024-12-14T18:31:22.260' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6a933104-a6f2-4e66-9425-0e185a38f67c', N'Client-646', N'client646@client.client', N'Hash646', 1, CAST(N'2024-12-14T18:31:22.223' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6b032701-a87d-46c0-b8c9-d07c1871d1f9', N'Client-378', N'client378@client.client', N'Hash378', 1, CAST(N'2024-12-14T18:31:21.933' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6b27904b-79ee-46a8-8989-be86c2e13bbb', N'Client-678', N'client678@client.client', N'Hash678', 1, CAST(N'2024-12-14T18:31:22.247' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6b499486-8d01-4512-ae8f-e1d109bb9416', N'Client-397', N'client397@client.client', N'Hash397', 0, CAST(N'2024-12-14T18:31:21.980' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6b5b62ca-2bc8-432a-9d13-fd8cc1017529', N'Client-800', N'client800@client.client', N'Hash800', 1, CAST(N'2024-12-14T18:31:22.350' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6b9935e1-5750-4a11-af36-71a3a0c2f5b0', N'Client-886', N'client886@client.client', N'Hash886', 1, CAST(N'2024-12-14T18:31:22.423' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6bd63111-023f-4449-ac4a-eb3e08b3476f', N'Client-414', N'client414@client.client', N'Hash414', 1, CAST(N'2024-12-14T18:31:21.997' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6c0b3e94-3208-4083-b08d-c46d03abca91', N'Client-448', N'client448@client.client', N'Hash448', 1, CAST(N'2024-12-14T18:31:22.030' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6c371e3b-be96-4aed-bb0c-06403d77951a', N'Client-425', N'client425@client.client', N'Hash425', 0, CAST(N'2024-12-14T18:31:22.007' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6c4d6c25-7001-4375-af0e-d137c18021ff', N'Client-581', N'client581@client.client', N'Hash581', 0, CAST(N'2024-12-14T18:31:22.173' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6c5d9e70-8bf9-438e-b891-80ae8c271854', N'Client-86', N'client86@client.client', N'Hash86', 1, CAST(N'2024-12-14T18:31:21.567' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6c916ce1-7e2f-4c3b-b537-6376292eafa5', N'Client-584', N'client584@client.client', N'Hash584', 1, CAST(N'2024-12-14T18:31:22.177' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6d19e7c3-0cff-4a30-9998-bbc8f604ffee', N'Client-618', N'client618@client.client', N'Hash618', 1, CAST(N'2024-12-14T18:31:22.203' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6d20eddb-793a-4e5a-bde2-f9da8f4f0550', N'Client-675', N'client675@client.client', N'Hash675', 0, CAST(N'2024-12-14T18:31:22.243' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6d6ba2fd-cbf3-49e7-b667-d058fee513ad', N'Client-372', N'client372@client.client', N'Hash372', 1, CAST(N'2024-12-14T18:31:21.910' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6d924557-eea4-4849-830f-ff8e99dc4c5c', N'Client-168', N'client168@client.client', N'Hash168', 1, CAST(N'2024-12-14T18:31:21.623' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6dd67983-1028-4b12-b58c-07ebfd474045', N'Client-537', N'client537@client.client', N'Hash537', 0, CAST(N'2024-12-14T18:31:22.143' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6e205931-ddec-4801-88c5-1522202a90ed', N'Client-950', N'client950@client.client', N'Hash950', 1, CAST(N'2024-12-14T18:31:22.483' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6e679706-515e-449c-ab61-44191ce57750', N'Client-133', N'client133@client.client', N'Hash133', 0, CAST(N'2024-12-14T18:31:21.597' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6eea7a1b-c54e-40fe-8de1-65e80439675c', N'Client-50', N'client50@client.client', N'Hash50', 1, CAST(N'2024-12-14T18:31:21.543' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6f33e606-a839-42e6-83ae-404c91acc417', N'Client-352', N'client352@client.client', N'Hash352', 1, CAST(N'2024-12-14T18:31:21.847' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6f96b8f4-a73c-42dc-8816-5b936ba13a06', N'Client-362', N'client362@client.client', N'Hash362', 1, CAST(N'2024-12-14T18:31:21.880' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6fae181e-7704-4072-841c-3601638401a5', N'Client-468', N'client468@client.client', N'Hash468', 1, CAST(N'2024-12-14T18:31:22.047' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'6fed7534-85cb-40bb-9955-45774c763198', N'Client-927', N'client927@client.client', N'Hash927', 0, CAST(N'2024-12-14T18:31:22.463' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7047347d-b635-4a8b-abd9-0052787ca6a1', N'Client-717', N'client717@client.client', N'Hash717', 0, CAST(N'2024-12-14T18:31:22.277' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'70e2f0db-98f7-4ca5-ab16-24f057c029cb', N'Client-756', N'client756@client.client', N'Hash756', 1, CAST(N'2024-12-14T18:31:22.310' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'710a3b95-2b3d-4181-91d6-efa6aefdfeec', N'Client-688', N'client688@client.client', N'Hash688', 1, CAST(N'2024-12-14T18:31:22.253' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7112acf1-8151-4f24-b600-adc1470453ce', N'Client-224', N'client224@client.client', N'Hash224', 1, CAST(N'2024-12-14T18:31:21.680' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7125671d-c267-488a-91cb-254a510e7434', N'Client-716', N'client716@client.client', N'Hash716', 1, CAST(N'2024-12-14T18:31:22.277' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'713dcfa5-ff49-48f9-96f3-a2b0ed3fe8e5', N'Client-126', N'client126@client.client', N'Hash126', 1, CAST(N'2024-12-14T18:31:21.593' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'714413c4-a79c-4c95-887d-c9e219f3df56', N'Client-248', N'client248@client.client', N'Hash248', 1, CAST(N'2024-12-14T18:31:21.707' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'71485aa1-fd69-4ab0-ac9e-5b73180077e3', N'Client-775', N'client775@client.client', N'Hash775', 0, CAST(N'2024-12-14T18:31:22.327' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7179801b-c32d-44b1-bf28-e60822f8cc26', N'Client-335', N'client335@client.client', N'Hash335', 0, CAST(N'2024-12-14T18:31:21.817' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'71886777-94c1-435e-ade7-3f462b934a16', N'Client-609', N'client609@client.client', N'Hash609', 0, CAST(N'2024-12-14T18:31:22.197' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'71950c87-16ef-426a-b0d9-147e3ad17770', N'Client-764', N'client764@client.client', N'Hash764', 1, CAST(N'2024-12-14T18:31:22.317' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'71a499b7-7355-4276-a5a0-1c4ef8984aa2', N'Client-123', N'client123@client.client', N'Hash123', 0, CAST(N'2024-12-14T18:31:21.590' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'71a6996f-2280-4d5c-8749-4add76f5bc7b', N'Client-770', N'client770@client.client', N'Hash770', 1, CAST(N'2024-12-14T18:31:22.323' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'71afc251-963c-495f-962a-761f9bc31ca6', N'Client-94', N'client94@client.client', N'Hash94', 1, CAST(N'2024-12-14T18:31:21.570' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'72092a63-1ba8-47c3-9b01-b4b06a99cbc2', N'Client-53', N'client53@client.client', N'Hash53', 0, CAST(N'2024-12-14T18:31:21.547' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'721233d3-110d-49a2-a151-fbb1696c89f0', N'Client-292', N'client292@client.client', N'Hash292', 1, CAST(N'2024-12-14T18:31:21.760' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'72a43169-9962-4bbf-a310-f73878bba7f5', N'Client-284', N'client284@client.client', N'Hash284', 1, CAST(N'2024-12-14T18:31:21.750' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'72ae2835-a74b-454e-9992-dedc375830c2', N'Client-715', N'client715@client.client', N'Hash715', 0, CAST(N'2024-12-14T18:31:22.277' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'72b3dfa9-7a0b-4237-a2ff-93e13b73d414', N'Client-47', N'client47@client.client', N'Hash47', 0, CAST(N'2024-12-14T18:31:21.537' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'73195140-7341-46c2-aecc-c4c70ff8bbc2', N'Client-124', N'client124@client.client', N'Hash124', 1, CAST(N'2024-12-14T18:31:21.590' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'734002eb-f382-408c-9c74-4f5f978fdd75', N'Client-634', N'client634@client.client', N'Hash634', 1, CAST(N'2024-12-14T18:31:22.213' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7358133e-c31f-4b38-8fa6-c608b3705f46', N'Client-686', N'client686@client.client', N'Hash686', 1, CAST(N'2024-12-14T18:31:22.253' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'73dacb71-460e-4ea3-ba31-1e358a0d6d59', N'Client-394', N'client394@client.client', N'Hash394', 1, CAST(N'2024-12-14T18:31:21.977' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7446c7b8-5713-43ef-8923-7290b33b4c72', N'Client-808', N'client808@client.client', N'Hash808', 1, CAST(N'2024-12-14T18:31:22.357' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'745ba4cd-b011-4955-b691-bdc12a9dfbe1', N'Client-682', N'client682@client.client', N'Hash682', 1, CAST(N'2024-12-14T18:31:22.250' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7474a6af-53bc-4134-8774-378bba9a95d5', N'Client-597', N'client597@client.client', N'Hash597', 0, CAST(N'2024-12-14T18:31:22.187' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'75420ee3-e520-4423-9d79-b6dd771d55c9', N'Client-42', N'client42@client.client', N'Hash42', 1, CAST(N'2024-12-14T18:31:21.533' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'75c7122b-7a92-44f9-bcfb-77e41d5b97a4', N'Client-169', N'client169@client.client', N'Hash169', 0, CAST(N'2024-12-14T18:31:21.630' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'75da0b01-62b7-4972-a603-3d61c6a1bda0', N'Client-565', N'client565@client.client', N'Hash565', 0, CAST(N'2024-12-14T18:31:22.163' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7690e9a6-8058-4609-831f-e65d7715929e', N'Client-118', N'client118@client.client', N'Hash118', 1, CAST(N'2024-12-14T18:31:21.587' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'76e86ac7-7b2d-413f-911a-532ba56dfc28', N'Client-390', N'client390@client.client', N'Hash390', 1, CAST(N'2024-12-14T18:31:21.970' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'76fe3217-6d22-43c6-a3b3-5ff7fa552bcf', N'Client-78', N'client78@client.client', N'Hash78', 1, CAST(N'2024-12-14T18:31:21.560' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'773a7daf-ed48-4b65-8c45-e89611ff3ff0', N'Client-494', N'client494@client.client', N'Hash494', 1, CAST(N'2024-12-14T18:31:22.070' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7779d85d-0ae7-4131-a802-e29402af48db', N'Client-663', N'client663@client.client', N'Hash663', 0, CAST(N'2024-12-14T18:31:22.237' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'779a0b05-8741-4bfb-bf83-d8289d7f3a6e', N'Client-759', N'client759@client.client', N'Hash759', 0, CAST(N'2024-12-14T18:31:22.313' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'77d0ce7e-a49e-4f91-bfe3-34f2d8755550', N'Client-992', N'client992@client.client', N'Hash992', 1, CAST(N'2024-12-14T18:31:22.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'789e64a7-e85e-4956-9ab0-63d570fbf264', N'Client-437', N'client437@client.client', N'Hash437', 0, CAST(N'2024-12-14T18:31:22.020' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'78d6afb6-4fd3-4f5a-9163-67ff92e01f83', N'Client-110', N'client110@client.client', N'Hash110', 1, CAST(N'2024-12-14T18:31:21.580' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'798f684c-4c57-460b-847b-48f165db716e', N'Client-983', N'client983@client.client', N'Hash983', 0, CAST(N'2024-12-14T18:31:22.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'799ec89c-fcc5-4617-9f06-571b40a2fd4e', N'Client-167', N'client167@client.client', N'Hash167', 0, CAST(N'2024-12-14T18:31:21.623' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'79db98d0-7d5a-48b1-a3fb-59a059ff91f2', N'Client-658', N'client658@client.client', N'Hash658', 1, CAST(N'2024-12-14T18:31:22.233' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'79e268a7-2822-416c-8663-dcea983b1516', N'Client-968', N'client968@client.client', N'Hash968', 1, CAST(N'2024-12-14T18:31:22.503' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7a0e5adc-4363-482d-b821-430d71d76a4d', N'Client-67', N'client67@client.client', N'Hash67', 0, CAST(N'2024-12-14T18:31:21.553' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7a6a1f35-90e7-4050-b306-30b12e4c86dc', N'Client-161', N'client161@client.client', N'Hash161', 0, CAST(N'2024-12-14T18:31:21.617' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7a7be614-9582-4670-9dd0-84f629692bf4', N'Client-27', N'client27@client.client', N'Hash27', 0, CAST(N'2024-12-14T18:31:21.523' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7a8640ad-7577-4a1b-8137-d04b3cc73929', N'Client-967', N'client967@client.client', N'Hash967', 0, CAST(N'2024-12-14T18:31:22.503' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7a8fd7ad-cc04-44f5-8b8d-14e3b8c0e29e', N'Client-555', N'client555@client.client', N'Hash555', 0, CAST(N'2024-12-14T18:31:22.157' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7aea2cc6-092d-4faf-9c02-2e7213ab3956', N'Client-607', N'client607@client.client', N'Hash607', 0, CAST(N'2024-12-14T18:31:22.193' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7b3d96fd-45ac-40e0-96fb-ae1e502b3c33', N'Client-244', N'client244@client.client', N'Hash244', 1, CAST(N'2024-12-14T18:31:21.703' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7b437d27-f93c-4720-bd04-7f8687a073db', N'Client-551', N'client551@client.client', N'Hash551', 0, CAST(N'2024-12-14T18:31:22.153' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7b58cb16-b7a8-45f9-ab7b-14365aa258eb', N'Client-780', N'client780@client.client', N'Hash780', 1, CAST(N'2024-12-14T18:31:22.333' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7b74278c-6710-4bfb-af59-ae132918814e', N'Client-295', N'client295@client.client', N'Hash295', 0, CAST(N'2024-12-14T18:31:21.763' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7b74ddc0-e262-45e3-9c0a-ba44c59e320c', N'Client-638', N'client638@client.client', N'Hash638', 1, CAST(N'2024-12-14T18:31:22.217' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7b8fcd58-2c79-439e-a2b4-0afa3648781e', N'Client-605', N'client605@client.client', N'Hash605', 0, CAST(N'2024-12-14T18:31:22.193' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7c0733cc-e356-4e50-96d4-13d716462eb2', N'Client-315', N'client315@client.client', N'Hash315', 0, CAST(N'2024-12-14T18:31:21.790' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7cf0508e-ecbd-45a4-9f6a-33845988976f', N'Client-23', N'client23@client.client', N'Hash23', 0, CAST(N'2024-12-14T18:31:21.523' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7cf7ade1-ca89-4358-836c-1767fd7d5f99', N'Client-810', N'client810@client.client', N'Hash810', 1, CAST(N'2024-12-14T18:31:22.357' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7d4e0b42-d221-4a22-a668-c3902d6e4046', N'Client-740', N'client740@client.client', N'Hash740', 1, CAST(N'2024-12-14T18:31:22.297' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7d5eb794-ec46-40de-b08d-01beab2a6539', N'Client-273', N'client273@client.client', N'Hash273', 0, CAST(N'2024-12-14T18:31:21.737' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7d62ca7a-d90c-4947-8a47-8814f902bd7b', N'Client-441', N'client441@client.client', N'Hash441', 0, CAST(N'2024-12-14T18:31:22.023' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7d93c83c-485a-447a-bbc0-0bcf997b9d19', N'Client-401', N'client401@client.client', N'Hash401', 0, CAST(N'2024-12-14T18:31:21.987' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7dcb0f50-f9ff-4578-9769-484a19f7e4f4', N'Client-730', N'client730@client.client', N'Hash730', 1, CAST(N'2024-12-14T18:31:22.287' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7e34d9e5-fd45-44e3-96d6-0acc6089d594', N'Client-865', N'client865@client.client', N'Hash865', 0, CAST(N'2024-12-14T18:31:22.403' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7e3decc9-a9bb-4bc1-8403-178950964a9d', N'Client-863', N'client863@client.client', N'Hash863', 0, CAST(N'2024-12-14T18:31:22.403' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7ea401c0-1734-485e-9766-1727fc59ce2c', N'Client-429', N'client429@client.client', N'Hash429', 0, CAST(N'2024-12-14T18:31:22.010' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7eba8ce2-3726-4267-96ca-cecc81d63c12', N'Client-433', N'client433@client.client', N'Hash433', 0, CAST(N'2024-12-14T18:31:22.017' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7fa75fe8-370e-4471-86f8-53ff73e48016', N'Client-303', N'client303@client.client', N'Hash303', 0, CAST(N'2024-12-14T18:31:21.773' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7fba485d-f8a3-4d2c-aa8a-7067f3d54346', N'Client-910', N'client910@client.client', N'Hash910', 1, CAST(N'2024-12-14T18:31:22.447' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'7fd4538a-b194-4f67-be2c-e05c6a14ff76', N'Client-919', N'client919@client.client', N'Hash919', 0, CAST(N'2024-12-14T18:31:22.453' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'80d99a8a-311e-4945-b289-2a461a2669b7', N'Client-988', N'client988@client.client', N'Hash988', 1, CAST(N'2024-12-14T18:31:22.523' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'812da3ba-b70e-48f1-ac83-2f2fab525ff9', N'Client-261', N'client261@client.client', N'Hash261', 0, CAST(N'2024-12-14T18:31:21.723' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'816e0411-f279-467b-a350-810d8eda2817', N'Client-74', N'client74@client.client', N'Hash74', 1, CAST(N'2024-12-14T18:31:21.557' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'81c58d4a-fe5c-42da-a1c0-1771c3eb2d78', N'Client-376', N'client376@client.client', N'Hash376', 1, CAST(N'2024-12-14T18:31:21.927' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'81e089c7-fd9a-438e-86af-8de2899758d3', N'Client-237', N'client237@client.client', N'Hash237', 0, CAST(N'2024-12-14T18:31:21.693' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'82120509-77a5-4d7e-b482-2f058da7aa68', N'Client-524', N'client524@client.client', N'Hash524', 1, CAST(N'2024-12-14T18:31:22.127' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8237e769-1d5a-4759-be21-39865dc1c7cf', N'Client-62', N'client62@client.client', N'Hash62', 1, CAST(N'2024-12-14T18:31:21.550' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'82535ff2-cc25-48bd-ab81-a80ed3ab86c2', N'Client-902', N'client902@client.client', N'Hash902', 1, CAST(N'2024-12-14T18:31:22.440' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'82693b0f-b2da-4fcd-a371-33a536d6794c', N'Client-525', N'client525@client.client', N'Hash525', 0, CAST(N'2024-12-14T18:31:22.127' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'82a21ecc-2265-466e-b62b-0c24f945ad49', N'Client-481', N'client481@client.client', N'Hash481', 0, CAST(N'2024-12-14T18:31:22.060' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'82a2f7d3-639b-492b-874a-91c76ef9f550', N'Client-275', N'client275@client.client', N'Hash275', 0, CAST(N'2024-12-14T18:31:21.740' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'82aa127d-45b0-4594-bc9f-5b663fdef47a', N'Client-536', N'client536@client.client', N'Hash536', 1, CAST(N'2024-12-14T18:31:22.140' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8339a106-aa3e-4a4f-b2a0-cb237f56c815', N'Client-55', N'client55@client.client', N'Hash55', 0, CAST(N'2024-12-14T18:31:21.547' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'838e66b3-1fce-4a63-a891-59fd7d8acc4a', N'Client-701', N'client701@client.client', N'Hash701', 0, CAST(N'2024-12-14T18:31:22.263' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'83c17a41-647a-46ad-a15e-6b9e86c196dc', N'Client-71', N'client71@client.client', N'Hash71', 0, CAST(N'2024-12-14T18:31:21.557' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8425e3d8-8f4a-4356-b547-006b7b325832', N'Client-848', N'client848@client.client', N'Hash848', 1, CAST(N'2024-12-14T18:31:22.390' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'847667dd-28ff-43e1-9142-e4122a51e1f8', N'Client-743', N'client743@client.client', N'Hash743', 0, CAST(N'2024-12-14T18:31:22.300' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'84ab2ba3-a7b5-4bc1-b245-6a00f231e3e0', N'Client-894', N'client894@client.client', N'Hash894', 1, CAST(N'2024-12-14T18:31:22.430' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'84fbe9bb-151f-4cbd-b155-c10158291de0', N'Client-446', N'client446@client.client', N'Hash446', 1, CAST(N'2024-12-14T18:31:22.027' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'85467839-d0c2-4f09-a3f7-9ac955ee172c', N'Manager-5', N'manager5@manager.manager', N'Hash5', 0, CAST(N'2024-12-14T18:31:21.510' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8552c7ab-205f-421b-a3bc-bf0b2e3a09b8', N'Client-839', N'client839@client.client', N'Hash839', 0, CAST(N'2024-12-14T18:31:22.383' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8566add2-f022-4410-b009-d7086bea45d8', N'Client-111', N'client111@client.client', N'Hash111', 0, CAST(N'2024-12-14T18:31:21.580' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'85aa978c-16fa-4d3f-a34c-193a6d9ab261', N'Client-843', N'client843@client.client', N'Hash843', 0, CAST(N'2024-12-14T18:31:22.387' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'85d9656e-0f79-4b09-a6e8-1886bf3143df', N'Client-136', N'client136@client.client', N'Hash136', 1, CAST(N'2024-12-14T18:31:21.600' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'85ededf1-6439-4fb6-ad52-97fdda0aa90b', N'Client-579', N'client579@client.client', N'Hash579', 0, CAST(N'2024-12-14T18:31:22.173' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'86401280-6492-40f0-bd7b-0580e75cd543', N'Client-87', N'client87@client.client', N'Hash87', 0, CAST(N'2024-12-14T18:31:21.567' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'86453bac-e636-4038-8787-faf3e2a62600', N'Client-93', N'client93@client.client', N'Hash93', 0, CAST(N'2024-12-14T18:31:21.570' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'87139704-96e0-4487-a269-cf0a8d22d1eb', N'Client-647', N'client647@client.client', N'Hash647', 0, CAST(N'2024-12-14T18:31:22.223' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8720d391-36d9-4180-8a4a-e3e9ba03b963', N'Client-920', N'client920@client.client', N'Hash920', 1, CAST(N'2024-12-14T18:31:22.457' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'872dcd9d-fc49-4efa-b568-534563418eef', N'Client-420', N'client420@client.client', N'Hash420', 1, CAST(N'2024-12-14T18:31:22.003' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'87d912b4-c35d-4347-815d-fd69e34f0152', N'Client-105', N'client105@client.client', N'Hash105', 0, CAST(N'2024-12-14T18:31:21.577' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8824c7f3-752d-4c7b-b9ab-18c9849dfa79', N'Client-354', N'client354@client.client', N'Hash354', 1, CAST(N'2024-12-14T18:31:21.853' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'883589f4-8184-4ae8-9e51-3747a809dc11', N'Client-871', N'client871@client.client', N'Hash871', 0, CAST(N'2024-12-14T18:31:22.410' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'88548807-2407-4874-bdd9-32e593e86fe2', N'Client-52', N'client52@client.client', N'Hash52', 1, CAST(N'2024-12-14T18:31:21.547' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'888b47a0-bf61-4bc6-9dca-6e9b694f7155', N'Client-88', N'client88@client.client', N'Hash88', 1, CAST(N'2024-12-14T18:31:21.567' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'89dfb288-bb83-4e25-bed2-b9c37fea99d8', N'Client-703', N'client703@client.client', N'Hash703', 0, CAST(N'2024-12-14T18:31:22.267' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8a198ff3-df1e-41e7-9bbd-463397fc4604', N'Client-741', N'client741@client.client', N'Hash741', 0, CAST(N'2024-12-14T18:31:22.297' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8a4028c0-498b-4cfe-be12-1bdbeef5b7ea', N'Rakin2', N'rakin2@r.r', N'AQAAAAEAACcQAAAAEAAkv/ZLIPJVtxtFsNfVvJiayWp/v0IIsBzy+Edxw7hPq1Hs6YYCYDCyUgHhq7l+Yw==', 1, CAST(N'2025-01-07T20:24:20.957' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8b4f4d34-5cfa-48d2-8271-e444cceae3a5', N'Client-861', N'client861@client.client', N'Hash861', 0, CAST(N'2024-12-14T18:31:22.400' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8c4d0486-692d-4c17-8eb7-1acbde8ee97d', N'Client-369', N'client369@client.client', N'Hash369', 0, CAST(N'2024-12-14T18:31:21.903' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8c5fc8a7-e7c8-49ee-8cab-78723be17006', N'Client-139', N'client139@client.client', N'Hash139', 0, CAST(N'2024-12-14T18:31:21.600' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8c848ce8-3a7f-4e78-98a5-bf0d80143d28', N'Client-338', N'client338@client.client', N'Hash338', 1, CAST(N'2024-12-14T18:31:21.820' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8d051c82-28b0-49d6-af38-df993de7a1ba', N'Client-470', N'client470@client.client', N'Hash470', 1, CAST(N'2024-12-14T18:31:22.050' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8d3a386a-48b7-4737-8643-529c2624ae06', N'Client-832', N'client832@client.client', N'Hash832', 1, CAST(N'2024-12-14T18:31:22.377' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8d3fce57-e4e8-433d-b280-bda64cbe0f11', N'Client-753', N'client753@client.client', N'Hash753', 0, CAST(N'2024-12-14T18:31:22.307' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8d62052a-c7bf-4ebb-a57d-ff93726a68ce', N'Client-407', N'client407@client.client', N'Hash407', 0, CAST(N'2024-12-14T18:31:21.990' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8d67772a-95f4-4123-a1c2-482ff719ad66', N'Client-850', N'client850@client.client', N'Hash850', 1, CAST(N'2024-12-14T18:31:22.390' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8d6ad608-7b4c-47dd-8879-026495b28a06', N'Client-976', N'client976@client.client', N'Hash976', 1, CAST(N'2024-12-14T18:31:22.510' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8d89a4f7-756f-4b5d-9124-6b9b0aa9f7f4', N'Client-16', N'client16@client.client', N'Hash16', 1, CAST(N'2024-12-14T18:31:21.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8da98492-fb40-4839-ab74-aaddb64bae50', N'Client-604', N'client604@client.client', N'Hash604', 1, CAST(N'2024-12-14T18:31:22.193' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8dc86aac-ce97-409c-8012-38145acc3f0e', N'Client-398', N'client398@client.client', N'Hash398', 1, CAST(N'2024-12-14T18:31:21.983' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8de55fc9-db5a-469e-aec5-04ed97ea29e3', N'Client-705', N'client705@client.client', N'Hash705', 0, CAST(N'2024-12-14T18:31:22.267' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8dfeed1c-c8f0-4e57-9c3b-7868cb19fc48', N'Client-509', N'client509@client.client', N'Hash509', 0, CAST(N'2024-12-14T18:31:22.093' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8e6c66b2-de9a-40a1-bf0a-c2b0e6de34f8', N'Client-58', N'client58@client.client', N'Hash58', 1, CAST(N'2024-12-14T18:31:21.550' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8e753211-16d1-430d-80f4-cc20441ccd0b', N'Client-128', N'client128@client.client', N'Hash128', 1, CAST(N'2024-12-14T18:31:21.593' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8eb86971-40d2-4ece-987d-b1933bc65d95', N'Client-890', N'client890@client.client', N'Hash890', 1, CAST(N'2024-12-14T18:31:22.427' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8eb8afef-8a45-4680-92c5-ac0195bd3bcc', N'Client-572', N'client572@client.client', N'Hash572', 1, CAST(N'2024-12-14T18:31:22.167' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8f012aef-49f6-4b05-aaf9-442e83b626ad', N'Client-583', N'client583@client.client', N'Hash583', 0, CAST(N'2024-12-14T18:31:22.177' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8f5dedd0-7dec-4ccb-bb93-5dab17a53d57', N'Client-627', N'client627@client.client', N'Hash627', 0, CAST(N'2024-12-14T18:31:22.210' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8fdd6371-9dff-47c6-bd1e-586f121d59c3', N'Client-249', N'client249@client.client', N'Hash249', 0, CAST(N'2024-12-14T18:31:21.710' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'8fe18e8e-c287-47ec-ad08-0424e6f92152', N'Client-838', N'client838@client.client', N'Hash838', 1, CAST(N'2024-12-14T18:31:22.380' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9037f6c4-ddea-4722-b409-db47a7716bb5', N'Client-382', N'client382@client.client', N'Hash382', 1, CAST(N'2024-12-14T18:31:21.947' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'90601333-9b91-492f-ab13-b1271bfd4f32', N'Client-14', N'client14@client.client', N'Hash14', 1, CAST(N'2024-12-14T18:31:21.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'90626aa1-8770-4956-a47a-6328655fba93', N'Client-113', N'client113@client.client', N'Hash113', 0, CAST(N'2024-12-14T18:31:21.583' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'911a9d21-8dd0-4e54-b037-f97cc0f11282', N'Client-449', N'client449@client.client', N'Hash449', 0, CAST(N'2024-12-14T18:31:22.030' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'911ed53d-f4b6-445e-9dec-27e3aa4bdf7f', N'Client-466', N'client466@client.client', N'Hash466', 1, CAST(N'2024-12-14T18:31:22.047' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'921cf2e6-fd03-4efb-86b7-7e6c66d350aa', N'Client-147', N'client147@client.client', N'Hash147', 0, CAST(N'2024-12-14T18:31:21.607' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9256dbca-3bc6-457d-8fb3-d2351c4c286d', N'Client-363', N'client363@client.client', N'Hash363', 0, CAST(N'2024-12-14T18:31:21.883' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'926af251-b1f1-4493-b36c-0243c1315da6', N'Client-17', N'client17@client.client', N'Hash17', 0, CAST(N'2024-12-14T18:31:21.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'927d0b1e-c233-4d61-b52d-56996ea8b5a6', N'Client-357', N'client357@client.client', N'Hash357', 0, CAST(N'2024-12-14T18:31:21.863' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'92c18fb5-c2d3-478c-ada9-b97386156981', N'Client-628', N'client628@client.client', N'Hash628', 1, CAST(N'2024-12-14T18:31:22.210' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'92f6f8ae-2f62-4f3f-988b-586aae967be6', N'Client-370', N'client370@client.client', N'Hash370', 1, CAST(N'2024-12-14T18:31:21.907' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'930fc40d-75b9-4733-b640-b865b50eab11', N'Client-103', N'client103@client.client', N'Hash103', 0, CAST(N'2024-12-14T18:31:21.577' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'93335f35-3eb7-4657-87d2-e883c54911d8', N'Client-184', N'client184@client.client', N'Hash184', 1, CAST(N'2024-12-14T18:31:21.643' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9348a82a-1820-4ebd-a465-bf5b6ce9b4c2', N'Client-829', N'client829@client.client', N'Hash829', 0, CAST(N'2024-12-14T18:31:22.373' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9348f5bd-7105-4998-aacd-df3409af3011', N'Client-867', N'client867@client.client', N'Hash867', 0, CAST(N'2024-12-14T18:31:22.407' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'937bb5e6-a5ad-43a4-b9ed-f635b447c9b3', N'Client-875', N'client875@client.client', N'Hash875', 0, CAST(N'2024-12-14T18:31:22.413' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'938621c0-72d2-4e4f-89b5-2056f188c9f4', N'Client-225', N'client225@client.client', N'Hash225', 0, CAST(N'2024-12-14T18:31:21.683' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'942d3c0f-482f-4127-89d5-bbbc69166b7f', N'Client-974', N'client974@client.client', N'Hash974', 1, CAST(N'2024-12-14T18:31:22.510' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9481c471-8367-425f-9922-018d898da68b', N'Client-89', N'client89@client.client', N'Hash89', 0, CAST(N'2024-12-14T18:31:21.567' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'94831939-58b2-40b5-ad44-eeabae0952c3', N'Manager-7', N'manager7@manager.manager', N'Hash7', 0, CAST(N'2024-12-14T18:31:21.510' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'94985f58-31b0-4957-838f-9e84574d1683', N'Client-223', N'client223@client.client', N'Hash223', 0, CAST(N'2024-12-14T18:31:21.680' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'951ec229-9146-45c1-95dd-7abf4ebfe171', N'Client-253', N'client253@client.client', N'Hash253', 0, CAST(N'2024-12-14T18:31:21.713' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9554e777-86e4-4ecb-a9e5-3132a7db20fb', N'Client-690', N'client690@client.client', N'Hash690', 1, CAST(N'2024-12-14T18:31:22.257' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9565feb7-8ac9-4057-90f4-37a404c3c276', N'Client-328', N'client328@client.client', N'Hash328', 1, CAST(N'2024-12-14T18:31:21.807' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'95a5b487-9d81-4733-abe1-326d6354b09e', N'Client-107', N'client107@client.client', N'Hash107', 0, CAST(N'2024-12-14T18:31:21.580' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'95af55a7-c026-4226-9a3b-bf090bf921e5', N'Client-157', N'client157@client.client', N'Hash157', 0, CAST(N'2024-12-14T18:31:21.617' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'95b03479-55d9-4a54-9007-7bcf6ef7a066', N'Client-763', N'client763@client.client', N'Hash763', 0, CAST(N'2024-12-14T18:31:22.317' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'95e0667e-b8e8-47cc-814a-d2d7dee02d75', N'Client-239', N'client239@client.client', N'Hash239', 0, CAST(N'2024-12-14T18:31:21.697' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'95e5ea8e-2513-4640-8409-ee45d245de49', N'Client-345', N'client345@client.client', N'Hash345', 0, CAST(N'2024-12-14T18:31:21.830' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'961a06ea-ad1e-4fdd-b89c-151e9587f575', N'Client-999', N'client999@client.client', N'Hash999', 0, CAST(N'2024-12-14T18:31:22.533' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'970416fc-e912-420c-b4ee-bc8323ffbfee', N'Client-869', N'client869@client.client', N'Hash869', 0, CAST(N'2024-12-14T18:31:22.407' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'97145b90-e78d-44da-896e-aa541135b286', N'Client-813', N'client813@client.client', N'Hash813', 0, CAST(N'2024-12-14T18:31:22.360' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'971f9bad-39cb-400f-8f33-58cabd35684a', N'Client-282', N'client282@client.client', N'Hash282', 1, CAST(N'2024-12-14T18:31:21.747' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'972b1a54-cfb6-4cd5-a930-d349b61fddda', N'Client-97', N'client97@client.client', N'Hash97', 0, CAST(N'2024-12-14T18:31:21.573' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'972fe25f-c577-4a15-a689-fd7a6cb6e699', N'Client-714', N'client714@client.client', N'Hash714', 1, CAST(N'2024-12-14T18:31:22.277' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'975826fd-5765-4eb6-8805-819fa561ef92', N'Client-418', N'client418@client.client', N'Hash418', 1, CAST(N'2024-12-14T18:31:22.000' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'97db8e3a-ed93-4af9-bc16-7e12c51abd1d', N'Client-29', N'client29@client.client', N'Hash29', 0, CAST(N'2024-12-14T18:31:21.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'97ea908c-9d24-4d01-b307-a35f89270dd3', N'Client-260', N'client260@client.client', N'Hash260', 1, CAST(N'2024-12-14T18:31:21.723' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'98784082-3ebf-4ed9-9886-bcc3de968a2a', N'Client-713', N'client713@client.client', N'Hash713', 0, CAST(N'2024-12-14T18:31:22.273' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'98c60059-f9b3-47bf-b4ff-1601775c5c6f', N'Client-735', N'client735@client.client', N'Hash735', 0, CAST(N'2024-12-14T18:31:22.293' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'98c9f304-2142-4223-a065-97a382411d84', N'Client-163', N'client163@client.client', N'Hash163', 0, CAST(N'2024-12-14T18:31:21.620' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9954d6e7-a249-4599-bb9d-fe13a3d22f45', N'Client-322', N'client322@client.client', N'Hash322', 1, CAST(N'2024-12-14T18:31:21.800' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'99761bbb-c509-4156-bade-d44b5fec7c0f', N'Client-373', N'client373@client.client', N'Hash373', 0, CAST(N'2024-12-14T18:31:21.913' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9a18e972-3c28-4ebd-b21d-0b0c6eec7a45', N'Client-881', N'client881@client.client', N'Hash881', 0, CAST(N'2024-12-14T18:31:22.420' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9a1b7883-7348-4718-99b5-0e78cec30640', N'Client-844', N'client844@client.client', N'Hash844', 1, CAST(N'2024-12-14T18:31:22.387' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9a1f1ab0-f8ce-4e65-8651-eb4d91ccd222', N'Client-206', N'client206@client.client', N'Hash206', 1, CAST(N'2024-12-14T18:31:21.663' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9a209d1c-1f4e-41df-9907-efeb66243314', N'Client-937', N'client937@client.client', N'Hash937', 0, CAST(N'2024-12-14T18:31:22.473' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9a47cf16-cc02-4b74-a45a-74ae87ef59cc', N'Client-674', N'client674@client.client', N'Hash674', 1, CAST(N'2024-12-14T18:31:22.243' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9b9eb583-3d0c-4304-90a2-619151b2d9ee', N'Client-214', N'client214@client.client', N'Hash214', 1, CAST(N'2024-12-14T18:31:21.670' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9c356d13-96dc-4c22-90c0-8b8e446568b5', N'Client-65', N'client65@client.client', N'Hash65', 0, CAST(N'2024-12-14T18:31:21.553' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9c5b7d21-8be1-4ee0-9f72-6d07b39ae582', N'Client-744', N'client744@client.client', N'Hash744', 1, CAST(N'2024-12-14T18:31:22.300' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9c7ef2c5-e6b7-43ed-ae75-a9f7991ec3f2', N'Client-812', N'client812@client.client', N'Hash812', 1, CAST(N'2024-12-14T18:31:22.360' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9d34d88f-f179-4ad0-8c6c-272124b5c299', N'Client-776', N'client776@client.client', N'Hash776', 1, CAST(N'2024-12-14T18:31:22.327' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9d9ac9e9-cde6-4828-bc83-c7a4f04615dd', N'Client-636', N'client636@client.client', N'Hash636', 1, CAST(N'2024-12-14T18:31:22.217' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9da88860-98ed-4f23-9fab-e5ae4ec1e83d', N'Client-961', N'client961@client.client', N'Hash961', 0, CAST(N'2024-12-14T18:31:22.497' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9dcaaf4b-8f55-411a-af46-98cf5d0ec173', N'Client-651', N'client651@client.client', N'Hash651', 0, CAST(N'2024-12-14T18:31:22.227' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9de19980-81cc-40dd-aa30-74ac55115ffb', N'Client-847', N'client847@client.client', N'Hash847', 0, CAST(N'2024-12-14T18:31:22.390' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9deaf8a5-bbc1-4f86-8947-dd2b4fb34a01', N'Client-554', N'client554@client.client', N'Hash554', 1, CAST(N'2024-12-14T18:31:22.153' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9e2273d0-e02a-4350-ac3b-354046b1c4be', N'Client-188', N'client188@client.client', N'Hash188', 1, CAST(N'2024-12-14T18:31:21.647' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9e9c1865-1c1c-4db6-8cd8-3a48a5998175', N'Client-158', N'client158@client.client', N'Hash158', 1, CAST(N'2024-12-14T18:31:21.617' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9eb7f89d-22c2-46a5-98a7-e26fdf9ab9f2', N'Client-288', N'client288@client.client', N'Hash288', 1, CAST(N'2024-12-14T18:31:21.757' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9ece4f66-1694-496e-8a36-34c245cd5e6d', N'Client-264', N'client264@client.client', N'Hash264', 1, CAST(N'2024-12-14T18:31:21.727' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9ed7968c-415f-4cc0-864e-084fac0b3d1a', N'Client-523', N'client523@client.client', N'Hash523', 0, CAST(N'2024-12-14T18:31:22.123' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9f072829-1a52-4dad-943f-3a5dd029cec6', N'Client-752', N'client752@client.client', N'Hash752', 1, CAST(N'2024-12-14T18:31:22.307' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9f1c8eb6-b706-410a-8d5a-cf26e7034169', N'Client-840', N'client840@client.client', N'Hash840', 1, CAST(N'2024-12-14T18:31:22.383' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'9fc92a57-b9c5-494f-ac6e-1273226e8186', N'Client-569', N'client569@client.client', N'Hash569', 0, CAST(N'2024-12-14T18:31:22.167' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a030187f-cd12-493f-b870-c58d329b1ca6', N'Client-8', N'client8@client.client', N'Hash8', 1, CAST(N'2024-12-14T18:31:21.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a055daa5-a416-4db1-b731-4937255d5314', N'Client-938', N'client938@client.client', N'Hash938', 1, CAST(N'2024-12-14T18:31:22.473' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a0f17e92-79fe-443b-9622-cf463cdeefdd', N'Client-109', N'client109@client.client', N'Hash109', 0, CAST(N'2024-12-14T18:31:21.580' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a119883a-66b9-45c0-8937-9ea4682a3e5a', N'Client-721', N'client721@client.client', N'Hash721', 0, CAST(N'2024-12-14T18:31:22.280' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a132b05a-004f-4fd3-81a3-f66d2bba7522', N'Client-395', N'client395@client.client', N'Hash395', 0, CAST(N'2024-12-14T18:31:21.980' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a2665d4c-b7f1-45d4-be59-222e4641aae0', N'Client-955', N'client955@client.client', N'Hash955', 0, CAST(N'2024-12-14T18:31:22.490' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a2d042f1-713a-4cfa-afa4-0169095cde35', N'Client-171', N'client171@client.client', N'Hash171', 0, CAST(N'2024-12-14T18:31:21.630' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a36eb68a-00a1-41ae-b19b-ff6185b7afac', N'Client-816', N'client816@client.client', N'Hash816', 1, CAST(N'2024-12-14T18:31:22.363' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a3999888-c678-48bd-b817-dbeebdda11ad', N'Client-44', N'client44@client.client', N'Hash44', 1, CAST(N'2024-12-14T18:31:21.533' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a40ff43a-9248-4538-82e2-e27112f803bb', N'Client-629', N'client629@client.client', N'Hash629', 0, CAST(N'2024-12-14T18:31:22.210' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a4aa7062-6385-43cd-b637-66dc063659c7', N'Client-903', N'client903@client.client', N'Hash903', 0, CAST(N'2024-12-14T18:31:22.440' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a4bcfe0f-a155-459b-bb9b-edfe7884567e', N'Client-979', N'client979@client.client', N'Hash979', 0, CAST(N'2024-12-14T18:31:22.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a4d48933-cb07-49fc-ac64-06bd98749c4d', N'Client-371', N'client371@client.client', N'Hash371', 0, CAST(N'2024-12-14T18:31:21.907' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a4e42f23-5315-4ade-819c-852ec7d2af33', N'Client-211', N'client211@client.client', N'Hash211', 0, CAST(N'2024-12-14T18:31:21.667' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a4fd00eb-98e6-4bbf-8ae1-6772aa83e4dc', N'Manager-6', N'manager6@manager.manager', N'Hash6', 1, CAST(N'2024-12-14T18:31:21.510' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a516477e-6c68-4f09-91b7-8fdfcb4d7efa', N'Client-601', N'client601@client.client', N'Hash601', 0, CAST(N'2024-12-14T18:31:22.190' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a51e9bd5-f0cc-41df-8e05-a8c07f99eef0', N'Client-330', N'client330@client.client', N'Hash330', 1, CAST(N'2024-12-14T18:31:21.810' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a5b5eab2-7e16-4c15-8aaa-a209c5a1087e', N'Client-656', N'client656@client.client', N'Hash656', 1, CAST(N'2024-12-14T18:31:22.230' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a5d64044-be0e-4e88-a082-b9399eedd117', N'Client-939', N'client939@client.client', N'Hash939', 0, CAST(N'2024-12-14T18:31:22.473' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a61bef2b-c01a-442a-a714-25bf77ff64dc', N'Client-518', N'client518@client.client', N'Hash518', 1, CAST(N'2024-12-14T18:31:22.113' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a6578b86-6da4-4620-a650-4cd0e28e2461', N'Client-877', N'client877@client.client', N'Hash877', 0, CAST(N'2024-12-14T18:31:22.417' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a6a423fc-f37e-4738-aaaf-047b7bb86d28', N'Client-442', N'client442@client.client', N'Hash442', 1, CAST(N'2024-12-14T18:31:22.023' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a6e2032a-e771-49b2-957d-a8233449c3e2', N'Client-444', N'client444@client.client', N'Hash444', 1, CAST(N'2024-12-14T18:31:22.027' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a71bba12-e365-4ed2-87ed-239490c7b9e2', N'Rakin', N'rakin@r.r', N'AQAAAAEAACcQAAAAELTEmbkzsOLSf5rAOncCkjcrp9E/0M9cU7OpfyTvb5tRns8swOBfEaHLKRozR3FRQw==', 1, CAST(N'2024-12-31T20:09:42.037' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a7213f4a-3dfd-4299-9ea7-55cd10e7aa13', N'Client-258', N'client258@client.client', N'Hash258', 1, CAST(N'2024-12-14T18:31:21.720' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a7a13170-37a4-401d-a4bd-2fcde83d6115', N'Client-183', N'client183@client.client', N'Hash183', 0, CAST(N'2024-12-14T18:31:21.640' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a7cfb887-8c36-4a1e-ba12-46b19fa83769', N'Client-815', N'client815@client.client', N'Hash815', 0, CAST(N'2024-12-14T18:31:22.363' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a7fe4099-e7ca-4e95-b8f0-4829c56fb466', N'Client-632', N'client632@client.client', N'Hash632', 1, CAST(N'2024-12-14T18:31:22.213' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a80f7d6f-235b-41f8-9d4e-39e1eae67efc', N'Client-708', N'client708@client.client', N'Hash708', 1, CAST(N'2024-12-14T18:31:22.270' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a8248d9b-cb7a-4405-85f5-7afca428422c', N'Client-454', N'client454@client.client', N'Hash454', 1, CAST(N'2024-12-14T18:31:22.033' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a903aec1-0c23-4215-8199-9ee77a4c152d', N'Client-173', N'client173@client.client', N'Hash173', 0, CAST(N'2024-12-14T18:31:21.633' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a92b8c46-6e98-4623-a34e-89fb4aac3d32', N'Client-580', N'client580@client.client', N'Hash580', 1, CAST(N'2024-12-14T18:31:22.173' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a96d7456-29da-43b2-a1ce-613c9b547d69', N'Client-243', N'client243@client.client', N'Hash243', 0, CAST(N'2024-12-14T18:31:21.700' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'a98f2277-b612-4992-b397-44c758d2506d', N'Client-681', N'client681@client.client', N'Hash681', 0, CAST(N'2024-12-14T18:31:22.250' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'aa8b9521-4377-4d73-9e6e-27b74275656b', N'Client-119', N'client119@client.client', N'Hash119', 0, CAST(N'2024-12-14T18:31:21.587' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'aaabfc80-55e0-4a79-8fda-b613cae87f7b', N'Client-60', N'client60@client.client', N'Hash60', 1, CAST(N'2024-12-14T18:31:21.550' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'aacfba5b-6d74-49cc-808a-497e4a4b044f', N'Client-511', N'client511@client.client', N'Hash511', 0, CAST(N'2024-12-14T18:31:22.097' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ab55df3d-a5bd-48d6-afff-e5adf0a9e6d3', N'Client-930', N'client930@client.client', N'Hash930', 1, CAST(N'2024-12-14T18:31:22.463' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ab56a86b-7b04-43b5-aed2-abb61539a383', N'Client-98', N'client98@client.client', N'Hash98', 1, CAST(N'2024-12-14T18:31:21.573' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ac1ef183-48c2-4bfc-916d-3d33c5967743', N'Client-251', N'client251@client.client', N'Hash251', 0, CAST(N'2024-12-14T18:31:21.713' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'aca7654e-42aa-47d2-a923-a65905dd1de4', N'Client-952', N'client952@client.client', N'Hash952', 1, CAST(N'2024-12-14T18:31:22.487' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'acd6d082-b8ac-49c8-962f-0100ae700418', N'Client-946', N'client946@client.client', N'Hash946', 1, CAST(N'2024-12-14T18:31:22.480' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ace2f940-a076-4277-91b4-eff5a8092b39', N'Client-623', N'client623@client.client', N'Hash623', 0, CAST(N'2024-12-14T18:31:22.207' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ad172bfa-d27d-4912-af9a-0d31fd561825', N'Client-891', N'client891@client.client', N'Hash891', 0, CAST(N'2024-12-14T18:31:22.430' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ad8ce825-1431-4511-99dd-140239888d10', N'Client-866', N'client866@client.client', N'Hash866', 1, CAST(N'2024-12-14T18:31:22.407' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ad9bce8d-28a8-46bc-88d0-4cd5102cfa7b', N'Client-172', N'client172@client.client', N'Hash172', 1, CAST(N'2024-12-14T18:31:21.630' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ada5dac6-8a8a-49f3-a2e5-04f2cd5ebf9e', N'Client-355', N'client355@client.client', N'Hash355', 0, CAST(N'2024-12-14T18:31:21.857' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'adc2ac6d-e383-4b40-bb86-17d713823384', N'Client-755', N'client755@client.client', N'Hash755', 0, CAST(N'2024-12-14T18:31:22.310' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ae05c58e-2a94-4f4a-a05c-c261f7452b63', N'Client-858', N'client858@client.client', N'Hash858', 1, CAST(N'2024-12-14T18:31:22.397' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ae26fdd2-3d9e-4d9e-beea-d399b102f019', N'Client-568', N'client568@client.client', N'Hash568', 1, CAST(N'2024-12-14T18:31:22.163' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ae4f30d8-1af7-41d5-89fa-f6275205caf2', N'Client-61', N'client61@client.client', N'Hash61', 0, CAST(N'2024-12-14T18:31:21.550' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ae4f3e00-aafd-4a87-ad78-a7f4cc64ab77', N'Client-256', N'client256@client.client', N'Hash256', 1, CAST(N'2024-12-14T18:31:21.717' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ae6d1ad5-dbd7-4fe5-82a5-6095d6ce3df3', N'Client-774', N'client774@client.client', N'Hash774', 1, CAST(N'2024-12-14T18:31:22.327' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ae78d5e7-35d8-4874-a3c5-3414eb8a4e8c', N'Client-6', N'client6@client.client', N'Hash6', 1, CAST(N'2024-12-14T18:31:21.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'aeacbc66-b926-4fc1-9532-3d4a85fe0988', N'Client-230', N'client230@client.client', N'Hash230', 1, CAST(N'2024-12-14T18:31:21.687' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'af13bf72-e51e-422a-af5e-7b8abc2ea560', N'Client-548', N'client548@client.client', N'Hash548', 1, CAST(N'2024-12-14T18:31:22.150' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'af28b533-724a-4088-87f9-54e5995a2c83', N'Client-895', N'client895@client.client', N'Hash895', 0, CAST(N'2024-12-14T18:31:22.433' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'af7cb190-e9f1-4af2-ae7b-b29ab0f87106', N'Client-614', N'client614@client.client', N'Hash614', 1, CAST(N'2024-12-14T18:31:22.200' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'af934302-3ce5-4ecc-9d7c-2fe8610c1287', N'Client-970', N'client970@client.client', N'Hash970', 1, CAST(N'2024-12-14T18:31:22.503' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'af9dd418-db75-4f42-b036-7ef1e98d0cc1', N'Client-922', N'client922@client.client', N'Hash922', 1, CAST(N'2024-12-14T18:31:22.457' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b01b6469-c39d-4914-927e-ff38fccb5d30', N'Client-750', N'client750@client.client', N'Hash750', 1, CAST(N'2024-12-14T18:31:22.303' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b079108a-1f68-41e8-b002-c03adafd28f0', N'Client-104', N'client104@client.client', N'Hash104', 1, CAST(N'2024-12-14T18:31:21.577' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b08f75d2-11ec-4708-8cf3-fb3380a8f711', N'Client-731', N'client731@client.client', N'Hash731', 0, CAST(N'2024-12-14T18:31:22.290' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b09a9155-f9b7-446c-9602-71434f7ee0a8', N'Client-346', N'client346@client.client', N'Hash346', 1, CAST(N'2024-12-14T18:31:21.830' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b0f04a9c-037c-41c5-b439-5d38e1d359b4', N'Client-286', N'client286@client.client', N'Hash286', 1, CAST(N'2024-12-14T18:31:21.753' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b0f5a1e5-36ce-423f-856a-125f8fe9048f', N'Client-96', N'client96@client.client', N'Hash96', 1, CAST(N'2024-12-14T18:31:21.570' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b20e9718-43cf-4806-8cfa-9126884d5aa1', N'Client-473', N'client473@client.client', N'Hash473', 0, CAST(N'2024-12-14T18:31:22.050' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b255b43d-915d-484d-bbfa-50572a49e098', N'Client-706', N'client706@client.client', N'Hash706', 1, CAST(N'2024-12-14T18:31:22.270' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b293350c-8162-4802-b8a3-02715376c6a2', N'Client-533', N'client533@client.client', N'Hash533', 0, CAST(N'2024-12-14T18:31:22.137' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b2941010-e0d3-45bc-a0e4-6567f9b89ad1', N'Client-242', N'client242@client.client', N'Hash242', 1, CAST(N'2024-12-14T18:31:21.700' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b2a88b0f-9d8d-4762-9cd5-1212bafcb686', N'Client-114', N'client114@client.client', N'Hash114', 1, CAST(N'2024-12-14T18:31:21.583' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b2b15533-b2c9-448d-a3c8-bd0a6cf581d0', N'Client-529', N'client529@client.client', N'Hash529', 0, CAST(N'2024-12-14T18:31:22.130' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b2efbb84-e154-4226-adee-4c6a9238777f', N'Client-822', N'client822@client.client', N'Hash822', 1, CAST(N'2024-12-14T18:31:22.367' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b300166a-0426-4d0c-bf73-4f8402025481', N'Client-642', N'client642@client.client', N'Hash642', 1, CAST(N'2024-12-14T18:31:22.220' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b35ad062-e54f-460b-921b-360750be8852', N'Client-734', N'client734@client.client', N'Hash734', 1, CAST(N'2024-12-14T18:31:22.293' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b3ca5a23-388e-4cda-87f0-fd7c78d06c6e', N'Client-630', N'client630@client.client', N'Hash630', 1, CAST(N'2024-12-14T18:31:22.210' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b3de5232-417a-4627-9725-cb936d1967b4', N'Client-738', N'client738@client.client', N'Hash738', 1, CAST(N'2024-12-14T18:31:22.297' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b42b9668-0e46-4a12-a772-3f148800123c', N'Client-773', N'client773@client.client', N'Hash773', 0, CAST(N'2024-12-14T18:31:22.323' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b432512e-91d2-4c82-83f8-9844cc8d72f4', N'Client-447', N'client447@client.client', N'Hash447', 0, CAST(N'2024-12-14T18:31:22.027' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b4a0519f-645b-4979-bd89-ae6790bd9047', N'Client-924', N'client924@client.client', N'Hash924', 1, CAST(N'2024-12-14T18:31:22.460' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b4a53930-c9e5-4c10-8e9c-e2022e5fce8c', N'Client-742', N'client742@client.client', N'Hash742', 1, CAST(N'2024-12-14T18:31:22.297' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b4eb35d8-469f-4a47-ac21-330ba5495e38', N'Client-575', N'client575@client.client', N'Hash575', 0, CAST(N'2024-12-14T18:31:22.170' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b4f44685-8b26-4821-ad23-b5aeffacdfce', N'Client-5', N'client5@client.client', N'Hash5', 0, CAST(N'2024-12-14T18:31:21.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b577fe31-1981-4f8a-b30d-0dc500754c53', N'Client-312', N'client312@client.client', N'Hash312', 1, CAST(N'2024-12-14T18:31:21.787' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b585ad07-5a70-462c-9c65-21ca72de5697', N'Client-252', N'client252@client.client', N'Hash252', 1, CAST(N'2024-12-14T18:31:21.713' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b62adeed-5c21-4ca7-8498-9099ca29d307', N'Client-117', N'client117@client.client', N'Hash117', 0, CAST(N'2024-12-14T18:31:21.587' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b62c1a06-363e-4c18-8c6b-bf89c50d45b5', N'Client-995', N'client995@client.client', N'Hash995', 0, CAST(N'2024-12-14T18:31:22.530' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b726acd3-e94a-45af-94ea-919ec28ab5c2', N'Client-281', N'client281@client.client', N'Hash281', 0, CAST(N'2024-12-14T18:31:21.747' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b74ab021-524e-45bc-8477-e0b0ad84cfa0', N'Client-805', N'client805@client.client', N'Hash805', 0, CAST(N'2024-12-14T18:31:22.353' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b7597e6f-6177-4ff3-a681-bdb323d7aad7', N'Client-20', N'client20@client.client', N'Hash20', 1, CAST(N'2024-12-14T18:31:21.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b75bbf6a-4158-4108-8fd8-33ae37d06f08', N'Client-165', N'client165@client.client', N'Hash165', 0, CAST(N'2024-12-14T18:31:21.620' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b7901364-8790-4223-82af-07c40419c548', N'Client-620', N'client620@client.client', N'Hash620', 1, CAST(N'2024-12-14T18:31:22.203' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b7a75555-a1d4-4d9b-ba8a-db1ce933a823', N'Client-640', N'client640@client.client', N'Hash640', 1, CAST(N'2024-12-14T18:31:22.220' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b836b0bd-580f-4f47-b71e-3d6b15e0a2b0', N'Client-667', N'client667@client.client', N'Hash667', 0, CAST(N'2024-12-14T18:31:22.240' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b85bd8e9-5c68-435f-bf61-0e7b4c34d63b', N'Client-986', N'client986@client.client', N'Hash986', 1, CAST(N'2024-12-14T18:31:22.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b8e3edf8-9413-4d04-b869-0bac585a3155', N'Client-921', N'client921@client.client', N'Hash921', 0, CAST(N'2024-12-14T18:31:22.457' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b8f61bba-e5c9-4084-98b8-33be3bd0cda8', N'Client-801', N'client801@client.client', N'Hash801', 0, CAST(N'2024-12-14T18:31:22.350' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b8feee2d-ee7c-4201-9141-b0fe06502ab0', N'Client-306', N'client306@client.client', N'Hash306', 1, CAST(N'2024-12-14T18:31:21.780' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b94b444e-3461-4ed6-bd76-d5204cd86fa3', N'Client-408', N'client408@client.client', N'Hash408', 1, CAST(N'2024-12-14T18:31:21.993' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'b99977e4-8ff1-4361-8cdb-22dab1f450b3', N'Client-854', N'client854@client.client', N'Hash854', 1, CAST(N'2024-12-14T18:31:22.393' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ba2da707-00a4-486b-8d46-7d9b2d451fc9', N'Client-897', N'client897@client.client', N'Hash897', 0, CAST(N'2024-12-14T18:31:22.433' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ba5e091b-387d-4277-98eb-679100b612e9', N'Client-977', N'client977@client.client', N'Hash977', 0, CAST(N'2024-12-14T18:31:22.510' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ba8c1d8c-cdac-43ce-b32c-8c332e27a9e8', N'Client-205', N'client205@client.client', N'Hash205', 0, CAST(N'2024-12-14T18:31:21.663' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bb068c4d-02d9-4f2d-91d2-f85f775adb85', N'Client-125', N'client125@client.client', N'Hash125', 0, CAST(N'2024-12-14T18:31:21.590' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bb08a43b-ca12-48e5-99d1-9e25ee06da7f', N'Manager-3', N'manager3@manager.manager', N'Hash3', 0, CAST(N'2024-12-14T18:31:21.510' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bb21d643-fe3e-44b4-9d8f-c6e49043fe36', N'Client-186', N'client186@client.client', N'Hash186', 1, CAST(N'2024-12-14T18:31:21.643' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bb2f6cca-c69f-4f9a-9109-5fcbca0e470e', N'Client-150', N'client150@client.client', N'Hash150', 1, CAST(N'2024-12-14T18:31:21.610' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bb3859bc-3f1e-46a3-bee1-09a6c187bda1', N'Client-77', N'client77@client.client', N'Hash77', 0, CAST(N'2024-12-14T18:31:21.560' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bb3c68d3-6bc0-40bf-9319-d797692228de', N'Client-115', N'client115@client.client', N'Hash115', 0, CAST(N'2024-12-14T18:31:21.583' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bb50ec3f-9366-4f6a-876e-55dc5641c2ca', N'Client-75', N'client75@client.client', N'Hash75', 0, CAST(N'2024-12-14T18:31:21.560' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bb5d8f58-0b28-403e-b43b-b7a0f75cdc9f', N'Client-240', N'client240@client.client', N'Hash240', 1, CAST(N'2024-12-14T18:31:21.697' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bba6bc6d-5ae5-4bf0-87a2-73dfc5a078b9', N'Client-522', N'client522@client.client', N'Hash522', 1, CAST(N'2024-12-14T18:31:22.123' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bc215a5e-d301-44f8-a1be-16fdd2ff9886', N'Client-176', N'client176@client.client', N'Hash176', 1, CAST(N'2024-12-14T18:31:21.633' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bc2452e4-e576-4fc1-8640-583dc6fcc29f', N'Client-649', N'client649@client.client', N'Hash649', 0, CAST(N'2024-12-14T18:31:22.227' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bcd652f2-05de-45f1-b540-56c8a3f00f57', N'Client-724', N'client724@client.client', N'Hash724', 1, CAST(N'2024-12-14T18:31:22.283' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bcf23c59-2abc-4bb1-80db-4b0d3ddcd07b', N'Client-108', N'client108@client.client', N'Hash108', 1, CAST(N'2024-12-14T18:31:21.580' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'be1581be-5934-43fd-b857-9ef6c18b9de0', N'Client-793', N'client793@client.client', N'Hash793', 0, CAST(N'2024-12-14T18:31:22.343' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'be220c84-458c-4b6e-a9cc-adfd91b6dc45', N'Client-754', N'client754@client.client', N'Hash754', 1, CAST(N'2024-12-14T18:31:22.307' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'be26cbd3-5189-4f36-8226-84435229114d', N'Client-693', N'client693@client.client', N'Hash693', 0, CAST(N'2024-12-14T18:31:22.260' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'be433e4f-a59c-4cca-81d9-6621b8dd45a4', N'Client-102', N'client102@client.client', N'Hash102', 1, CAST(N'2024-12-14T18:31:21.577' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'be8d7de6-a796-4b2b-a772-616b156d591f', N'Client-313', N'client313@client.client', N'Hash313', 0, CAST(N'2024-12-14T18:31:21.787' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bed206f7-012a-49ee-9a83-29aa53b150c0', N'Client-899', N'client899@client.client', N'Hash899', 0, CAST(N'2024-12-14T18:31:22.437' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'bf4e0572-5f63-451b-b86a-ac3bdafdf8d8', N'Client-82', N'client82@client.client', N'Hash82', 1, CAST(N'2024-12-14T18:31:21.563' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c0097cd0-bd45-405d-9dba-abf7533cc7c1', N'Client-384', N'client384@client.client', N'Hash384', 1, CAST(N'2024-12-14T18:31:21.950' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c0dc0eb7-645c-4e7a-8bf5-91d783cb44b4', N'Client-680', N'client680@client.client', N'Hash680', 1, CAST(N'2024-12-14T18:31:22.250' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c154ad6b-a2a6-4799-b982-f6f8179b92ab', N'Client-830', N'client830@client.client', N'Hash830', 1, CAST(N'2024-12-14T18:31:22.373' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c1fb65ce-011f-4955-8f9a-3d5c5c611aa7', N'Client-332', N'client332@client.client', N'Hash332', 1, CAST(N'2024-12-14T18:31:21.810' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c2168256-ec11-42e6-9319-eaa4bc78b930', N'Client-834', N'client834@client.client', N'Hash834', 1, CAST(N'2024-12-14T18:31:22.377' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c269a5b9-83fe-470d-a5e2-7837223e181f', N'Client-337', N'client337@client.client', N'Hash337', 0, CAST(N'2024-12-14T18:31:21.817' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c36fb4e0-bee8-498c-9468-8a0bf53961ce', N'Client-415', N'client415@client.client', N'Hash415', 0, CAST(N'2024-12-14T18:31:22.000' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c379172a-dffc-4543-9acc-3e26321d701e', N'Client-374', N'client374@client.client', N'Hash374', 1, CAST(N'2024-12-14T18:31:21.917' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c3aad58f-e53e-44f1-8521-03d2c1547e8e', N'Client-325', N'client325@client.client', N'Hash325', 0, CAST(N'2024-12-14T18:31:21.803' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c40aeb31-0152-48f8-a24b-952d3390dc9d', N'Client-497', N'client497@client.client', N'Hash497', 0, CAST(N'2024-12-14T18:31:22.073' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c50b5596-c53e-4292-bfc3-cf2da40e5d58', N'Client-495', N'client495@client.client', N'Hash495', 0, CAST(N'2024-12-14T18:31:22.073' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c5211a48-6c4e-4ccb-833d-3ee4d474195f', N'Client-648', N'client648@client.client', N'Hash648', 1, CAST(N'2024-12-14T18:31:22.223' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c5838775-4d96-4425-b410-badcdc1b49da', N'Client-307', N'client307@client.client', N'Hash307', 0, CAST(N'2024-12-14T18:31:21.780' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c58e1465-9eb1-40e5-a0f1-d8ec89e38544', N'Client-864', N'client864@client.client', N'Hash864', 1, CAST(N'2024-12-14T18:31:22.403' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c5a2afa7-35f6-4b8b-a813-19253992dc0b', N'Client-41', N'client41@client.client', N'Hash41', 0, CAST(N'2024-12-14T18:31:21.533' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c5fa34d0-ed6f-4672-9ecc-e9951af015b3', N'Client-746', N'client746@client.client', N'Hash746', 1, CAST(N'2024-12-14T18:31:22.303' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c6322a83-7c9f-45d4-8cdc-e2339ce8d497', N'Client-189', N'client189@client.client', N'Hash189', 0, CAST(N'2024-12-14T18:31:21.647' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c6629f0b-739e-46c0-9642-f316894f7d0e', N'Client-455', N'client455@client.client', N'Hash455', 0, CAST(N'2024-12-14T18:31:22.037' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c68b1867-d40e-4b28-b0d9-2f5a371f092f', N'Client-845', N'client845@client.client', N'Hash845', 0, CAST(N'2024-12-14T18:31:22.387' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c6a19424-160e-4107-8ba8-f31cedfb220a', N'Client-135', N'client135@client.client', N'Hash135', 0, CAST(N'2024-12-14T18:31:21.600' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c78ef2d0-a9b9-4071-8fc7-0894251c9726', N'Client-797', N'client797@client.client', N'Hash797', 0, CAST(N'2024-12-14T18:31:22.347' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c86dfd99-1baf-416e-ada0-687e9934047b', N'Client-84', N'client84@client.client', N'Hash84', 1, CAST(N'2024-12-14T18:31:21.563' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c8b4d47a-6b93-4cc3-b129-db88c5002581', N'Client-981', N'client981@client.client', N'Hash981', 0, CAST(N'2024-12-14T18:31:22.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c8cf8141-0f60-4202-8eba-25903b719596', N'Client-655', N'client655@client.client', N'Hash655', 0, CAST(N'2024-12-14T18:31:22.230' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c917c63a-a1de-4861-b9b3-f54da6ad2a99', N'Client-149', N'client149@client.client', N'Hash149', 0, CAST(N'2024-12-14T18:31:21.610' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c92ed96b-0c79-4472-8e9f-3ccf4e1c0df4', N'Client-733', N'client733@client.client', N'Hash733', 0, CAST(N'2024-12-14T18:31:22.290' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'c9aac187-caa0-463e-95fc-4580a3f58b3a', N'Client-823', N'client823@client.client', N'Hash823', 0, CAST(N'2024-12-14T18:31:22.370' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ca0a2121-222d-45a1-97c0-64e055a6a5bf', N'Client-510', N'client510@client.client', N'Hash510', 1, CAST(N'2024-12-14T18:31:22.093' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ca189c47-2d12-4a8a-bc8a-2de812890ce2', N'Client-785', N'client785@client.client', N'Hash785', 0, CAST(N'2024-12-14T18:31:22.337' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ca510552-b9b1-4447-89aa-fdf5b8288f22', N'Client-488', N'client488@client.client', N'Hash488', 1, CAST(N'2024-12-14T18:31:22.067' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cb876fd2-8532-42c3-99eb-d4c284308826', N'Client-991', N'client991@client.client', N'Hash991', 0, CAST(N'2024-12-14T18:31:22.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cb92a128-1a9e-42b2-8bb9-bfefaad184b9', N'Client-573', N'client573@client.client', N'Hash573', 0, CAST(N'2024-12-14T18:31:22.167' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cbfcef7d-799e-4c77-84ed-ffa3180c5ef7', N'Client-438', N'client438@client.client', N'Hash438', 1, CAST(N'2024-12-14T18:31:22.020' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cc474756-f691-4a77-b0c5-66175f05d9be', N'Client-745', N'client745@client.client', N'Hash745', 0, CAST(N'2024-12-14T18:31:22.300' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cc6a0923-1b05-4bbf-ba50-9aa8bc0209a6', N'Client-505', N'client505@client.client', N'Hash505', 0, CAST(N'2024-12-14T18:31:22.083' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ccd70d3b-c194-468f-8dda-6fa6adf7d897', N'Client-220', N'client220@client.client', N'Hash220', 1, CAST(N'2024-12-14T18:31:21.677' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cda218ac-4e0a-49ca-a40d-e828d7d74a69', N'Client-277', N'client277@client.client', N'Hash277', 0, CAST(N'2024-12-14T18:31:21.743' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cdac3b92-20da-4746-bb9f-9a069e18cf9b', N'Client-929', N'client929@client.client', N'Hash929', 0, CAST(N'2024-12-14T18:31:22.463' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cdfd7165-c08a-44b5-a04d-408acf47e0ef', N'Client-247', N'client247@client.client', N'Hash247', 0, CAST(N'2024-12-14T18:31:21.707' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ce39980b-b258-4815-a040-43e682263f8b', N'Client-666', N'client666@client.client', N'Hash666', 1, CAST(N'2024-12-14T18:31:22.237' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ce5dd8d4-28a5-4efa-96f4-8e55a275f3ce', N'Client-484', N'client484@client.client', N'Hash484', 1, CAST(N'2024-12-14T18:31:22.063' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cea27005-82cd-4ec8-8d7a-945fe7876e70', N'Client-33', N'client33@client.client', N'Hash33', 0, CAST(N'2024-12-14T18:31:21.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ced9d05d-b4e0-4141-8abb-50ebe6f194f4', N'Client-593', N'client593@client.client', N'Hash593', 0, CAST(N'2024-12-14T18:31:22.183' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cee0b120-1005-4033-b366-366f3c8dd393', N'Client-194', N'client194@client.client', N'Hash194', 1, CAST(N'2024-12-14T18:31:21.650' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cf0c6cd1-366e-4ae7-aa84-e7dcabf750a4', N'Client-4', N'client4@client.client', N'Hash4', 1, CAST(N'2024-12-14T18:31:21.513' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cf47c24d-e5a1-474a-b8ce-151abfa1ee5a', N'Customer 1', N'customer@gmail.com', N'AQAAAAIAAYagAAAAEG7pUt+vzzTPMIVG4V8J7mMBQ1LHPc/yZyua7neZukgwz5YyQYgXPMq21jxziqvv5A==', 1, CAST(N'2025-04-22T18:02:31.320' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'cfea937d-0564-453f-a39e-8b989b607fb2', N'Client-231', N'client231@client.client', N'Hash231', 0, CAST(N'2024-12-14T18:31:21.690' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd0812e0d-15d9-4e19-82d1-e24097b9e353', N'Client-777', N'client777@client.client', N'Hash777', 0, CAST(N'2024-12-14T18:31:22.330' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd0c51bcb-5757-4eb8-bdca-caa64f6bda9e', N'Client-381', N'client381@client.client', N'Hash381', 0, CAST(N'2024-12-14T18:31:21.943' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd11278b2-08b6-4b69-8b68-5471c1e0efef', N'Client-92', N'client92@client.client', N'Hash92', 1, CAST(N'2024-12-14T18:31:21.570' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd13670b1-a71a-4495-8a42-2bfb2b1dfdea', N'Client-422', N'client422@client.client', N'Hash422', 1, CAST(N'2024-12-14T18:31:22.003' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd19c1add-ab44-4e18-a0b9-d63f1b79af31', N'Client-856', N'client856@client.client', N'Hash856', 1, CAST(N'2024-12-14T18:31:22.397' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd1d0c5ce-3eb1-48bf-984f-c6539124743d', N'Client-387', N'client387@client.client', N'Hash387', 0, CAST(N'2024-12-14T18:31:21.960' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd1e70a71-4aa7-4b16-ba2d-56a40868a714', N'Client-811', N'client811@client.client', N'Hash811', 0, CAST(N'2024-12-14T18:31:22.360' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd1ef3af9-c975-4936-b489-dbb07e7f68a4', N'Client-218', N'client218@client.client', N'Hash218', 1, CAST(N'2024-12-14T18:31:21.673' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd27dc879-f7e1-4265-9ce6-29dbaa21b7f5', N'Client-10', N'client10@client.client', N'Hash10', 1, CAST(N'2024-12-14T18:31:21.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd3b8ffe5-4025-482a-96c8-e86151938dd6', N'Manager-2', N'manager2@manager.manager', N'Hash2', 1, CAST(N'2024-12-14T18:31:21.507' AS DateTime), NULL, NULL, NULL, 2)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd3cf68b7-b77e-443a-9f1b-b938bdb4809b', N'Client-160', N'client160@client.client', N'Hash160', 1, CAST(N'2024-12-14T18:31:21.617' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd41bf2ae-82a2-4c8c-8f54-09e03d4ffe76', N'Client-963', N'client963@client.client', N'Hash963', 0, CAST(N'2024-12-14T18:31:22.497' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd50e1584-a84d-4976-a0bf-56af5483abdc', N'Client-737', N'client737@client.client', N'Hash737', 0, CAST(N'2024-12-14T18:31:22.293' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd52d9c9e-2fc4-4268-8fdd-20ffe3dd9503', N'Client-66', N'client66@client.client', N'Hash66', 1, CAST(N'2024-12-14T18:31:21.553' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd55ef597-2fa4-41c4-96f0-38fa2fd8d9de', N'Admin', N'admin@admin.admin', N'Hash', 1, CAST(N'2024-12-14T18:31:20.457' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd5814011-fcaf-4f03-bf2a-217bca8e81fb', N'Client-598', N'client598@client.client', N'Hash598', 1, CAST(N'2024-12-14T18:31:22.187' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd59eb442-1b60-465a-b915-3f2d4757f0cd', N'Client-453', N'client453@client.client', N'Hash453', 0, CAST(N'2024-12-14T18:31:22.033' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd5ca5bde-e2cd-419f-84e1-8e6af9046ffe', N'Client-662', N'client662@client.client', N'Hash662', 1, CAST(N'2024-12-14T18:31:22.233' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd5e1e7b1-bf66-41b5-9d92-729c38ecf1c7', N'Client-561', N'client561@client.client', N'Hash561', 0, CAST(N'2024-12-14T18:31:22.160' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd5fc80cf-7d6a-4bb8-a702-5c8c2867f883', N'Client-502', N'client502@client.client', N'Hash502', 1, CAST(N'2024-12-14T18:31:22.083' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd64804e7-2682-4532-a04d-83b4244ce170', N'Client-64', N'client64@client.client', N'Hash64', 1, CAST(N'2024-12-14T18:31:21.553' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd681956d-2cd3-48bd-98de-0c81dc0fca1a', N'Client-818', N'client818@client.client', N'Hash818', 1, CAST(N'2024-12-14T18:31:22.363' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd713d4c0-0278-4626-9479-973263a3126b', N'Client-985', N'client985@client.client', N'Hash985', 0, CAST(N'2024-12-14T18:31:22.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd7505470-36ed-40d2-8d44-03eea0e5f9ee', N'Client-527', N'client527@client.client', N'Hash527', 0, CAST(N'2024-12-14T18:31:22.130' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd7c32fa6-9f45-4f55-8f70-080f4de3b800', N'Client-559', N'client559@client.client', N'Hash559', 0, CAST(N'2024-12-14T18:31:22.157' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd7d309e2-be26-4c7e-93e6-a45f9a0d92a8', N'Client-209', N'client209@client.client', N'Hash209', 0, CAST(N'2024-12-14T18:31:21.667' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd815ec8a-ae09-48ce-8692-38801a648212', N'Client-391', N'client391@client.client', N'Hash391', 0, CAST(N'2024-12-14T18:31:21.973' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd8306a11-c6c0-4e09-95f9-a0f74d63a0c0', N'Client-443', N'client443@client.client', N'Hash443', 0, CAST(N'2024-12-14T18:31:22.023' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd83551db-6293-4730-a13b-a013bbd4803f', N'Client-779', N'client779@client.client', N'Hash779', 0, CAST(N'2024-12-14T18:31:22.330' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd883c80e-11e7-415b-a083-0b1ad26f1ef1', N'Client-791', N'client791@client.client', N'Hash791', 0, CAST(N'2024-12-14T18:31:22.340' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd8b6062b-2fd4-42e2-bacd-2c32bffa1d43', N'Client-589', N'client589@client.client', N'Hash589', 0, CAST(N'2024-12-14T18:31:22.180' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd8e0b406-da26-43d4-904d-9c11caff692d', N'Client-709', N'client709@client.client', N'Hash709', 0, CAST(N'2024-12-14T18:31:22.270' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd8ebd417-a093-44bf-931d-f18c7cd920d0', N'Client-72', N'client72@client.client', N'Hash72', 1, CAST(N'2024-12-14T18:31:21.557' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd916c91c-8b94-452a-850e-d09c7a3c231a', N'Client-571', N'client571@client.client', N'Hash571', 0, CAST(N'2024-12-14T18:31:22.167' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd921ad33-a24f-4279-84a8-7f8c4d060011', N'Client-931', N'client931@client.client', N'Hash931', 0, CAST(N'2024-12-14T18:31:22.467' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd9391bc8-d5cc-49a3-96e7-b4fc1ebce1a7', N'Client-771', N'client771@client.client', N'Hash771', 0, CAST(N'2024-12-14T18:31:22.323' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd9485869-c988-4f01-93bc-315bc3a54340', N'Client-472', N'client472@client.client', N'Hash472', 1, CAST(N'2024-12-14T18:31:22.050' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd9558ef4-8e62-4776-adf2-23e06d3c71e8', N'Client-507', N'client507@client.client', N'Hash507', 0, CAST(N'2024-12-14T18:31:22.090' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'd9b20881-aca3-49d5-9dd3-eeaa1f8d9d41', N'Client-164', N'client164@client.client', N'Hash164', 1, CAST(N'2024-12-14T18:31:21.620' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'da509552-da95-4847-ad7f-5e8ab019204f', N'Client-508', N'client508@client.client', N'Hash508', 1, CAST(N'2024-12-14T18:31:22.090' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'db3990ea-f07d-4db3-8170-1f69ab89a9c6', N'Client-203', N'client203@client.client', N'Hash203', 0, CAST(N'2024-12-14T18:31:21.660' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'db68fde2-6b67-4fea-87e1-290165f34358', N'Client-872', N'client872@client.client', N'Hash872', 1, CAST(N'2024-12-14T18:31:22.410' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'dbee8ae6-2fd2-4309-9e90-4a25dce65c9b', N'Client-489', N'client489@client.client', N'Hash489', 0, CAST(N'2024-12-14T18:31:22.067' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'dc312a97-0d74-4dad-b95a-fa9edd60a0af', N'Client-289', N'client289@client.client', N'Hash289', 0, CAST(N'2024-12-14T18:31:21.757' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'dceb1271-b723-48cb-9700-3e9ecfd2bf0f', N'Client-287', N'client287@client.client', N'Hash287', 0, CAST(N'2024-12-14T18:31:21.753' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'dd0cfe17-586b-4fe7-9301-53f3e95c9801', N'Client-993', N'client993@client.client', N'Hash993', 0, CAST(N'2024-12-14T18:31:22.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'de001dab-f8a9-4de5-a93b-794c9b21a8cb', N'Client-116', N'client116@client.client', N'Hash116', 1, CAST(N'2024-12-14T18:31:21.583' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'de081128-682f-4156-a213-ca5a0a863093', N'Client-439', N'client439@client.client', N'Hash439', 0, CAST(N'2024-12-14T18:31:22.020' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'de129587-9156-41ec-9645-70c0ffb14a77', N'Client-828', N'client828@client.client', N'Hash828', 1, CAST(N'2024-12-14T18:31:22.373' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'de4ae5ff-e72e-4842-bbe0-3f0c83d12444', N'Client-364', N'client364@client.client', N'Hash364', 1, CAST(N'2024-12-14T18:31:21.887' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'debc49fd-50cb-449a-92d7-3d7e01624880', N'Client-905', N'client905@client.client', N'Hash905', 0, CAST(N'2024-12-14T18:31:22.443' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'dee76a5d-f79b-4019-a7a0-8e11be2c7622', N'Client-668', N'client668@client.client', N'Hash668', 1, CAST(N'2024-12-14T18:31:22.240' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'def69427-067a-40a6-a1ba-db95a40aa37d', N'Client-876', N'client876@client.client', N'Hash876', 1, CAST(N'2024-12-14T18:31:22.417' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'df3a910e-e4f6-4f6e-9aa3-98d7144f660b', N'Client-884', N'client884@client.client', N'Hash884', 1, CAST(N'2024-12-14T18:31:22.423' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e0436353-a6c1-46d2-a499-2af1ba690d0c', N'Client-180', N'client180@client.client', N'Hash180', 1, CAST(N'2024-12-14T18:31:21.640' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e08088ba-c07a-4bd1-8781-c8c11358bedc', N'Client-427', N'client427@client.client', N'Hash427', 0, CAST(N'2024-12-14T18:31:22.010' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e081036c-bab7-4b93-a199-f9432483dafb', N'Client-344', N'client344@client.client', N'Hash344', 1, CAST(N'2024-12-14T18:31:21.827' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e0bc946f-46bc-4991-af7b-f1ab54385615', N'Client-814', N'client814@client.client', N'Hash814', 1, CAST(N'2024-12-14T18:31:22.360' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e0d2223a-2171-4327-83d9-5d39a0d0b899', N'Client-969', N'client969@client.client', N'Hash969', 0, CAST(N'2024-12-14T18:31:22.503' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e117221d-d320-4f4c-b813-a85acae8129f', N'Client-310', N'client310@client.client', N'Hash310', 1, CAST(N'2024-12-14T18:31:21.783' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e175cdc7-ebb9-49b6-be76-8eb14cd66285', N'Client-142', N'client142@client.client', N'Hash142', 1, CAST(N'2024-12-14T18:31:21.603' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e180b084-ede1-4e61-abba-f4283eab4a46', N'Client-900', N'client900@client.client', N'Hash900', 1, CAST(N'2024-12-14T18:31:22.437' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e1fe62e0-fe93-4d11-a84d-f10bf35b3a0c', N'Client-296', N'client296@client.client', N'Hash296', 1, CAST(N'2024-12-14T18:31:21.767' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e2477754-f2e8-4f54-9245-4c14e7216b18', N'Client-585', N'client585@client.client', N'Hash585', 0, CAST(N'2024-12-14T18:31:22.177' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e295ce88-7907-4890-b620-2d573233e4f2', N'Client-367', N'client367@client.client', N'Hash367', 0, CAST(N'2024-12-14T18:31:21.897' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e3225b05-35ef-4c58-bb8a-c367b144e41e', N'Client-697', N'client697@client.client', N'Hash697', 0, CAST(N'2024-12-14T18:31:22.263' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e34ef6d6-f3fd-47eb-9f0d-2999b7e91a5a', N'Client-112', N'client112@client.client', N'Hash112', 1, CAST(N'2024-12-14T18:31:21.583' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e39f72ef-f7ea-4532-b0d9-fff94e377817', N'Client-784', N'client784@client.client', N'Hash784', 1, CAST(N'2024-12-14T18:31:22.337' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e3b298ff-3249-49cb-9fa2-ea16aaa5d784', N'Client-644', N'client644@client.client', N'Hash644', 1, CAST(N'2024-12-14T18:31:22.223' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e3ed1249-bb35-44bf-a7e5-d8ae8d7a8e43', N'Client-368', N'client368@client.client', N'Hash368', 1, CAST(N'2024-12-14T18:31:21.900' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e43e4486-d35c-4f62-95ce-c88f5a6e1bb6', N'Client-882', N'client882@client.client', N'Hash882', 1, CAST(N'2024-12-14T18:31:22.420' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e44bd0d9-3a4d-45c9-ae53-d5628c87cc8d', N'Client-635', N'client635@client.client', N'Hash635', 0, CAST(N'2024-12-14T18:31:22.213' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e460bfb2-9cc9-46c9-88d6-314641e33cc9', N'Client-70', N'client70@client.client', N'Hash70', 1, CAST(N'2024-12-14T18:31:21.557' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e467a44d-f09b-4024-83d3-3ae354d2faeb', N'Client-413', N'client413@client.client', N'Hash413', 0, CAST(N'2024-12-14T18:31:21.997' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e4880636-c146-4988-910b-22fedb988e54', N'Client-198', N'client198@client.client', N'Hash198', 1, CAST(N'2024-12-14T18:31:21.657' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e496f00b-b6a2-418e-b9cc-34d6427a3aa8', N'Client-499', N'client499@client.client', N'Hash499', 0, CAST(N'2024-12-14T18:31:22.077' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e4df5f5a-807f-48c2-8462-4c3918e182f0', N'Client-210', N'client210@client.client', N'Hash210', 1, CAST(N'2024-12-14T18:31:21.667' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e515fb06-ee0d-44f8-b393-82cf60b2c12d', N'Client-696', N'client696@client.client', N'Hash696', 1, CAST(N'2024-12-14T18:31:22.260' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e517ad67-23f5-400b-9c51-b25c6069aa07', N'Client-870', N'client870@client.client', N'Hash870', 1, CAST(N'2024-12-14T18:31:22.410' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e56f9b16-bb1c-4788-b036-da72d92caad8', N'Client-49', N'client49@client.client', N'Hash49', 0, CAST(N'2024-12-14T18:31:21.537' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e5cd7a82-8f63-407f-8d9b-7e7d97fe50a7', N'Client-556', N'client556@client.client', N'Hash556', 1, CAST(N'2024-12-14T18:31:22.157' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e6c62e83-f139-4dd1-824e-31edbb66727f', N'Client-166', N'client166@client.client', N'Hash166', 1, CAST(N'2024-12-14T18:31:21.623' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e71216a0-5480-4f97-9376-efe68cff6fbf', N'Client-941', N'client941@client.client', N'Hash941', 0, CAST(N'2024-12-14T18:31:22.477' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e730fce2-cd39-4631-80f8-d3d4dad9d059', N'Client-786', N'client786@client.client', N'Hash786', 1, CAST(N'2024-12-14T18:31:22.337' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e78c8a6a-145c-4ae5-b0c8-ac10636d52bb', N'Client-317', N'client317@client.client', N'Hash317', 0, CAST(N'2024-12-14T18:31:21.793' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e7b638e2-3a92-4b56-8071-7f7a7e713710', N'Client-38', N'client38@client.client', N'Hash38', 1, CAST(N'2024-12-14T18:31:21.530' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e8c6ba47-122a-4656-9fe4-b65ca2ec01a0', N'Client-676', N'client676@client.client', N'Hash676', 1, CAST(N'2024-12-14T18:31:22.247' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e8d3b506-2a2b-47f9-a18d-497754170997', N'Client-501', N'client501@client.client', N'Hash501', 0, CAST(N'2024-12-14T18:31:22.080' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e8e0bdac-22b3-4f27-905d-fc5291ddbb30', N'Client-9', N'client9@client.client', N'Hash9', 0, CAST(N'2024-12-14T18:31:21.517' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e91c63a1-f7dd-4d7a-b771-9d03b9bf7522', N'Client-232', N'client232@client.client', N'Hash232', 1, CAST(N'2024-12-14T18:31:21.690' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e943f864-184c-45b9-9759-57e4af9259de', N'Client-557', N'client557@client.client', N'Hash557', 0, CAST(N'2024-12-14T18:31:22.157' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e951c8a9-7c55-483e-aa64-a67b468ea0bf', N'Client-772', N'client772@client.client', N'Hash772', 1, CAST(N'2024-12-14T18:31:22.323' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'e964c42a-c96f-43fd-b875-dffc5914dde4', N'Client-806', N'client806@client.client', N'Hash806', 1, CAST(N'2024-12-14T18:31:22.353' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ea173bd2-9e21-410b-ae65-0c1a67345881', N'Client-18', N'client18@client.client', N'Hash18', 1, CAST(N'2024-12-14T18:31:21.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ea27b4e5-33e0-4362-b9bf-bda1323ebcd0', N'Client-213', N'client213@client.client', N'Hash213', 0, CAST(N'2024-12-14T18:31:21.670' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ea418af0-1cbd-4abb-b112-4a2db50dde75', N'Client-795', N'client795@client.client', N'Hash795', 0, CAST(N'2024-12-14T18:31:22.347' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'eaad74d0-a23b-4717-b4ae-3161369c0733', N'Client-234', N'client234@client.client', N'Hash234', 1, CAST(N'2024-12-14T18:31:21.690' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'eaeebfed-fd6f-4fb8-a5fe-1bf830579624', N'Client-855', N'client855@client.client', N'Hash855', 0, CAST(N'2024-12-14T18:31:22.397' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'eb35d7df-4e52-488f-a6b8-be803706bddb', N'Client-860', N'client860@client.client', N'Hash860', 1, CAST(N'2024-12-14T18:31:22.400' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'eb460099-f5b4-4d33-b043-920ce6d3298e', N'Client-804', N'client804@client.client', N'Hash804', 1, CAST(N'2024-12-14T18:31:22.353' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ebb058bf-5260-4505-bfba-8e4cbf145bea', N'Client-276', N'client276@client.client', N'Hash276', 1, CAST(N'2024-12-14T18:31:21.740' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ebf8ed03-2c6a-4240-aec1-c7b6a7063968', N'Client-478', N'client478@client.client', N'Hash478', 1, CAST(N'2024-12-14T18:31:22.057' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ec556d44-f3be-4a84-a734-afcdc42326de', N'Client-479', N'client479@client.client', N'Hash479', 0, CAST(N'2024-12-14T18:31:22.057' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ec8b7659-13eb-404a-9d2c-b64fce02e353', N'Client-928', N'client928@client.client', N'Hash928', 1, CAST(N'2024-12-14T18:31:22.463' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ed52fbee-4a86-42e8-8815-eacb234eee8d', N'Client-591', N'client591@client.client', N'Hash591', 0, CAST(N'2024-12-14T18:31:22.180' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ed608f6b-1985-4983-8f9a-4da62775d44e', N'Client-790', N'client790@client.client', N'Hash790', 1, CAST(N'2024-12-14T18:31:22.340' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ed780f43-2810-40e6-95ee-82d4d3dcb7f2', N'Client-343', N'client343@client.client', N'Hash343', 0, CAST(N'2024-12-14T18:31:21.827' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ed855e0d-3df9-4af7-8dd2-eabe0f45a504', N'Client-725', N'client725@client.client', N'Hash725', 0, CAST(N'2024-12-14T18:31:22.283' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ed8721a3-b10c-4ef9-ab9b-01be45d4096a', N'Client-353', N'client353@client.client', N'Hash353', 0, CAST(N'2024-12-14T18:31:21.850' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'edeb646e-f547-4630-94f7-1229ffba8b9b', N'Client-120', N'client120@client.client', N'Hash120', 1, CAST(N'2024-12-14T18:31:21.587' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ee39d703-9679-4396-8289-ec85b52859a4', N'Client-174', N'client174@client.client', N'Hash174', 1, CAST(N'2024-12-14T18:31:21.633' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ee9a963a-0e10-45fa-8409-cd82e800d0cf', N'Sajeeb Ashraf', N's@s.s', N'AQAAAAIAAYagAAAAEGf4ndrO0J/K1pkwNc4V8nH6MoK3BHvGnQHP5B0dAJZ9kRqafpIGFl1uNBRvM7k8qg==', 1, CAST(N'2025-04-15T20:03:50.170' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'eebae116-57b1-4bca-b25b-5030a85142ae', N'Client-712', N'client712@client.client', N'Hash712', 1, CAST(N'2024-12-14T18:31:22.273' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ef0558ee-f1bd-4b68-a2a8-bc187e66752a', N'Client-809', N'client809@client.client', N'Hash809', 0, CAST(N'2024-12-14T18:31:22.357' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ef0c5603-1df7-4b16-9b16-15cc223f550d', N'Client-683', N'client683@client.client', N'Hash683', 0, CAST(N'2024-12-14T18:31:22.250' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ef27b0ad-0793-47cd-ae1e-a688681638fc', N'Client-486', N'client486@client.client', N'Hash486', 1, CAST(N'2024-12-14T18:31:22.063' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'eff57e43-ae59-4874-99e7-f7aaf8224cd1', N'Client-914', N'client914@client.client', N'Hash914', 1, CAST(N'2024-12-14T18:31:22.450' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f058e4ee-3ea0-4507-b023-6e3ee940c7d5', N'Client-943', N'client943@client.client', N'Hash943', 0, CAST(N'2024-12-14T18:31:22.477' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f0631e5d-cd34-4621-839e-ded7fffe237d', N'Client-37', N'client37@client.client', N'Hash37', 0, CAST(N'2024-12-14T18:31:21.530' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f09bf01c-3f2c-4d5a-9dfd-693a6b9b95f4', N'Client-300', N'client300@client.client', N'Hash300', 1, CAST(N'2024-12-14T18:31:21.770' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f0b33efb-20b3-4534-a0a4-e34077d05539', N'Client-152', N'client152@client.client', N'Hash152', 1, CAST(N'2024-12-14T18:31:21.610' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f0ce6455-20bd-49c0-bb5c-37bdba6904f0', N'Client-633', N'client633@client.client', N'Hash633', 0, CAST(N'2024-12-14T18:31:22.213' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f0fa7add-5381-4013-ab92-e76f2879fe35', N'Client-385', N'client385@client.client', N'Hash385', 0, CAST(N'2024-12-14T18:31:21.953' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f1169473-1572-4022-86ee-a0ae78857848', N'Client-757', N'client757@client.client', N'Hash757', 0, CAST(N'2024-12-14T18:31:22.310' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f1287327-fb9b-4e9b-80bf-e44fbc4e4432', N'Client-769', N'client769@client.client', N'Hash769', 0, CAST(N'2024-12-14T18:31:22.320' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f15d1d15-4a60-4480-9df7-15fabb2d2414', N'Client-83', N'client83@client.client', N'Hash83', 0, CAST(N'2024-12-14T18:31:21.563' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f19a1b8f-326d-4b38-95f0-8b112976c8ec', N'Client-375', N'client375@client.client', N'Hash375', 0, CAST(N'2024-12-14T18:31:21.923' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f1bf54ad-7adc-4661-a3dc-66a181fe0448', N'Client-574', N'client574@client.client', N'Hash574', 1, CAST(N'2024-12-14T18:31:22.170' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f221061e-2b49-482b-874f-dec9d79b2489', N'Client-923', N'client923@client.client', N'Hash923', 0, CAST(N'2024-12-14T18:31:22.460' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f2cb49de-9216-43db-9d7c-d78616512c98', N'Client-392', N'client392@client.client', N'Hash392', 1, CAST(N'2024-12-14T18:31:21.973' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f2d3e7a6-f4c2-421e-95ab-96041a5993c7', N'Client-540', N'client540@client.client', N'Hash540', 1, CAST(N'2024-12-14T18:31:22.143' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f3054a91-62be-4cb7-9114-c975807269aa', N'Client-685', N'client685@client.client', N'Hash685', 0, CAST(N'2024-12-14T18:31:22.253' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f3532a28-581a-4ca7-b9b2-701cd8160593', N'Client-788', N'client788@client.client', N'Hash788', 1, CAST(N'2024-12-14T18:31:22.340' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f3558812-3236-4f99-9190-a0cdea2f8204', N'Client-550', N'client550@client.client', N'Hash550', 1, CAST(N'2024-12-14T18:31:22.153' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f37aa35d-04a5-4528-981a-fc486e01b37b', N'Client-269', N'client269@client.client', N'Hash269', 0, CAST(N'2024-12-14T18:31:21.733' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f395b0d8-7925-4991-a642-e32aeba6e7d7', N'Client-245', N'client245@client.client', N'Hash245', 0, CAST(N'2024-12-14T18:31:21.703' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f3e0ad44-8c4c-4ca5-9f05-3c55e66f0d9e', N'Client-546', N'client546@client.client', N'Hash546', 1, CAST(N'2024-12-14T18:31:22.150' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f44251b1-a99d-4c5e-918c-339bb56a34a0', N'Client-268', N'client268@client.client', N'Hash268', 1, CAST(N'2024-12-14T18:31:21.730' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f4897bd8-cc03-4ed8-873d-b2619412d83a', N'Client-783', N'client783@client.client', N'Hash783', 0, CAST(N'2024-12-14T18:31:22.333' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f4c7f83a-96b1-4c67-a250-af635f89ee0e', N'Client-728', N'client728@client.client', N'Hash728', 1, CAST(N'2024-12-14T18:31:22.287' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f4d462b5-2103-411d-b5da-9048cdad6652', N'Client-216', N'client216@client.client', N'Hash216', 1, CAST(N'2024-12-14T18:31:21.673' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f58242bb-d0ac-4940-8f4a-d7a073def731', N'Client-513', N'client513@client.client', N'Hash513', 0, CAST(N'2024-12-14T18:31:22.097' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f5b0482f-a751-489b-acf0-2e5f47f94713', N'Client-984', N'client984@client.client', N'Hash984', 1, CAST(N'2024-12-14T18:31:22.520' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f67e085c-df1a-4121-9b42-2007c6e82786', N'Client-799', N'client799@client.client', N'Hash799', 0, CAST(N'2024-12-14T18:31:22.350' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f6f0cf34-08f3-4cb4-874a-df31e09eaa10', N'Client-739', N'client739@client.client', N'Hash739', 0, CAST(N'2024-12-14T18:31:22.297' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f708759f-7825-4c66-8fff-19651a7d5581', N'Client-177', N'client177@client.client', N'Hash177', 0, CAST(N'2024-12-14T18:31:21.637' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f7442e49-6712-4fd7-9d62-f4fe05302f97', N'Client-760', N'client760@client.client', N'Hash760', 1, CAST(N'2024-12-14T18:31:22.313' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f76a3ec2-0e13-4a76-8c17-76ba769de5ba', N'Client-485', N'client485@client.client', N'Hash485', 0, CAST(N'2024-12-14T18:31:22.063' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f7a062cf-0fa0-4e51-9324-952e1172fabf', N'Client-990', N'client990@client.client', N'Hash990', 1, CAST(N'2024-12-14T18:31:22.523' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f81e7b34-a8ac-46c9-8b93-01e771a538db', N'Client-698', N'client698@client.client', N'Hash698', 1, CAST(N'2024-12-14T18:31:22.263' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f8598cb5-b35c-4f7d-96cb-796c2038d970', N'Client-492', N'client492@client.client', N'Hash492', 1, CAST(N'2024-12-14T18:31:22.070' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f8621b93-5c17-4e54-b56e-e38dbb80a5e6', N'Client-460', N'client460@client.client', N'Hash460', 1, CAST(N'2024-12-14T18:31:22.040' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f8d5b436-a742-4fca-b30d-9def1523950d', N'Client-718', N'client718@client.client', N'Hash718', 1, CAST(N'2024-12-14T18:31:22.277' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f9003fda-7f09-490c-b301-0a4d96cc36ad', N'Client-918', N'client918@client.client', N'Hash918', 1, CAST(N'2024-12-14T18:31:22.453' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f9030e76-36e3-48ef-a905-35409a8a969a', N'Client-535', N'client535@client.client', N'Hash535', 0, CAST(N'2024-12-14T18:31:22.140' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f95939dc-0a63-4f40-9653-efbf60c2470b', N'Client-246', N'client246@client.client', N'Hash246', 1, CAST(N'2024-12-14T18:31:21.707' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f97c2304-7c36-442e-9399-eadc37113adf', N'Client-45', N'client45@client.client', N'Hash45', 0, CAST(N'2024-12-14T18:31:21.533' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f983363e-7b27-48f8-be92-55f3252e30b5', N'Client-81', N'client81@client.client', N'Hash81', 0, CAST(N'2024-12-14T18:31:21.563' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f98411df-5286-4c81-8691-698e5e56ca25', N'Client-672', N'client672@client.client', N'Hash672', 1, CAST(N'2024-12-14T18:31:22.243' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f9c25acd-16c9-4362-b722-135c8a3ded82', N'Client-857', N'client857@client.client', N'Hash857', 0, CAST(N'2024-12-14T18:31:22.397' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f9d2c136-e6ce-4a9c-a9e9-48e83b6d724c', N'Client-835', N'client835@client.client', N'Hash835', 0, CAST(N'2024-12-14T18:31:22.380' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'f9ec9c81-4a80-48f9-896f-4fd237122a15', N'Client-32', N'client32@client.client', N'Hash32', 1, CAST(N'2024-12-14T18:31:21.527' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fa002f46-8faa-4217-8271-d82e29de90dd', N'Client-132', N'client132@client.client', N'Hash132', 1, CAST(N'2024-12-14T18:31:21.597' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fa424127-4332-4ada-94f9-a79780efb043', N'Client-440', N'client440@client.client', N'Hash440', 1, CAST(N'2024-12-14T18:31:22.020' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fa9d26f7-a837-419c-9497-5948aea1c76d', N'Client-451', N'client451@client.client', N'Hash451', 0, CAST(N'2024-12-14T18:31:22.030' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fabcfaac-a86c-4799-bf3a-77022e634906', N'Client-482', N'client482@client.client', N'Hash482', 1, CAST(N'2024-12-14T18:31:22.060' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fad73820-c546-4063-8a84-1ca27f5fd3ef', N'Client-654', N'client654@client.client', N'Hash654', 1, CAST(N'2024-12-14T18:31:22.230' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fb513396-b820-4cbf-9d06-9212927a50f4', N'Client-888', N'client888@client.client', N'Hash888', 1, CAST(N'2024-12-14T18:31:22.427' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fb8a7d6b-9369-48ed-adb3-5fe7549b8dfd', N'Client-467', N'client467@client.client', N'Hash467', 0, CAST(N'2024-12-14T18:31:22.047' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fb9608b6-4693-4681-9373-3d2642dd808e', N'Client-558', N'client558@client.client', N'Hash558', 1, CAST(N'2024-12-14T18:31:22.157' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fba69d98-8142-47d6-a886-817ec58814c1', N'Client-720', N'client720@client.client', N'Hash720', 1, CAST(N'2024-12-14T18:31:22.280' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fc0f089b-f404-4400-8b27-74757b6fd58d', N'Client-590', N'client590@client.client', N'Hash590', 1, CAST(N'2024-12-14T18:31:22.180' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fc15286b-1c14-44bb-b8e2-b782229240ae', N'Client-528', N'client528@client.client', N'Hash528', 1, CAST(N'2024-12-14T18:31:22.130' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fc6473fc-35af-4e2b-ad51-c5d8649c571c', N'Client-684', N'client684@client.client', N'Hash684', 1, CAST(N'2024-12-14T18:31:22.253' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fc768815-05bc-4a03-9402-d11a097fdec2', N'Client-576', N'client576@client.client', N'Hash576', 1, CAST(N'2024-12-14T18:31:22.170' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fda8ac3a-5e48-4275-b3e3-6fc291f56081', N'Client-80', N'client80@client.client', N'Hash80', 1, CAST(N'2024-12-14T18:31:21.563' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fe1889ff-4969-4ab9-b570-f73216c81b04', N'Client-411', N'client411@client.client', N'Hash411', 0, CAST(N'2024-12-14T18:31:21.997' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fe7d6331-e2d5-4c70-aef8-5ac30cc75000', N'Client-564', N'client564@client.client', N'Hash564', 1, CAST(N'2024-12-14T18:31:22.160' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'fe8772f5-80a4-40ae-bfcf-a98c2bded633', N'Client-412', N'client412@client.client', N'Hash412', 1, CAST(N'2024-12-14T18:31:21.997' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ff105db3-3fad-4940-9540-e576318c4470', N'Client-299', N'client299@client.client', N'Hash299', 0, CAST(N'2024-12-14T18:31:21.770' AS DateTime), NULL, NULL, NULL, 3)
GO
INSERT [dbo].[UserInfo] ([UserInfoId], [FullName], [Email], [PasswordHash], [IsActive], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [RoleId]) VALUES (N'ffea0a7d-ff83-48a3-88da-9308837cc996', N'Client-34', N'client34@client.client', N'Hash34', 1, CAST(N'2024-12-14T18:31:21.530' AS DateTime), NULL, NULL, NULL, 3)
GO
ALTER TABLE [dbo].[CarCategory] ADD  CONSTRAINT [DF__CarCatego__Creat__4F7CD00D]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Slot] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SlotBook] ADD  CONSTRAINT [DF__SlotBook__Create__5629CD9C]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF__UserInfo__Create__49C3F6B7]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK__Payment__SlotBoo__628FA481] FOREIGN KEY([SlotBookId])
REFERENCES [dbo].[SlotBook] ([SlotBookId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK__Payment__SlotBoo__628FA481]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK__Slot__CarCategor__534D60F1] FOREIGN KEY([CarCategoryId])
REFERENCES [dbo].[CarCategory] ([CarCategoryId])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK__Slot__CarCategor__534D60F1]
GO
ALTER TABLE [dbo].[SlotBook]  WITH CHECK ADD  CONSTRAINT [FK__SlotBook__SlotId__571DF1D5] FOREIGN KEY([SlotId])
REFERENCES [dbo].[Slot] ([SlotId])
GO
ALTER TABLE [dbo].[SlotBook] CHECK CONSTRAINT [FK__SlotBook__SlotId__571DF1D5]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[40] 2[1] 3) )"
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
         Begin Table = "CarCategory"
            Begin Extent = 
               Top = 21
               Left = 375
               Bottom = 151
               Right = 545
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Slot"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SlotListView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SlotListView'
GO
USE [master]
GO
ALTER DATABASE [CarParking] SET  READ_WRITE 
GO

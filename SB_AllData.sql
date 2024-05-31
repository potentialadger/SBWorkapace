USE [SB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_no] [int] IDENTITY(1,1) NOT NULL,
	[title_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatTopics]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatTopics](
	[TopicNo] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TopicNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventNo] [int] IDENTITY(1,1) NOT NULL,
	[HostUserNo] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[ActivityTime] [datetime2](7) NULL,
	[SignupStartTime] [datetime2](7) NULL,
	[SignupEndTime] [datetime2](7) NULL,
	[Location] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[ImagePath] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[EventNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventParticipants]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventParticipants](
	[EPNo] [int] IDENTITY(1,1) NOT NULL,
	[EventNo] [int] NULL,
	[UserNo] [int] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EPNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventRegistrations]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventRegistrations](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[EventNo] [int] NULL,
	[UserNo] [int] NULL,
	[ParticipantName] [nvarchar](50) NULL,
	[ContactInfo] [nvarchar](255) NULL,
	[RegistrationTime] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[favorite_no] [int] IDENTITY(1,1) NOT NULL,
	[user_no] [int] NULL,
	[post_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[favorite_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FriendState]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendState](
	[FriendStateNo] [int] IDENTITY(1,1) NOT NULL,
	[UserNo] [int] NOT NULL,
	[FriendNo] [int] NULL,
	[StateNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FriendStateNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goals]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goals](
	[GoalNo] [int] IDENTITY(1,1) NOT NULL,
	[GoalName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GoalNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupEvent]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupEvent](
	[EventNo] [int] IDENTITY(1,1) NOT NULL,
	[HostUserNo] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[StartTime] [datetime2](7) NULL,
	[EndTime] [datetime2](7) NULL,
	[MinTotalAmount] [int] NULL,
	[MinTotalQuantity] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[PaymentMethod] [tinyint] NULL,
	[Account] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[point] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupItem]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupItem](
	[ItemNo] [int] IDENTITY(1,1) NOT NULL,
	[EventNo] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Price] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[ImgPath] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupOrder]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupOrder](
	[OrderNo] [int] IDENTITY(1,1) NOT NULL,
	[EventNo] [int] NULL,
	[UserNo] [int] NULL,
	[PaymentMethod] [tinyint] NULL,
	[SetTime] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemSpecification]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSpecification](
	[SpecNo] [int] IDENTITY(1,1) NOT NULL,
	[ItemNo] [int] NULL,
	[SpecValue] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[like_no] [int] IDENTITY(1,1) NOT NULL,
	[user_no] [int] NULL,
	[post_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[like_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[MatchNo] [int] IDENTITY(1,1) NOT NULL,
	[User1No] [int] NOT NULL,
	[User2No] [int] NOT NULL,
	[MatchStatus] [int] NOT NULL,
	[MatchedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MatchNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchChat]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchChat](
	[UserChatNo] [int] IDENTITY(1,1) NOT NULL,
	[UserNo] [int] NOT NULL,
	[FriendNo] [int] NOT NULL,
	[ChatContent] [nvarchar](max) NOT NULL,
	[ContentTime] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserChatNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[DetailNo] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NULL,
	[ItemNo] [int] NULL,
	[ItemQuantity] [int] NULL,
	[ItemSpec] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[post_no] [int] IDENTITY(1,1) NOT NULL,
	[user_no] [int] NULL,
	[category_no] [int] NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[image_url] [nvarchar](255) NULL,
	[update_date] [datetime2](7) NULL,
	[view_count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Replies]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Replies](
	[reply_no] [int] IDENTITY(1,1) NOT NULL,
	[post_no] [int] NULL,
	[user_no] [int] NULL,
	[content] [nvarchar](max) NOT NULL,
	[update_date] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[reply_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[report_no] [int] IDENTITY(1,1) NOT NULL,
	[post_no] [int] NULL,
	[user_no] [int] NULL,
	[reason] [nvarchar](255) NOT NULL,
	[report_date] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[report_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialPhotos]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialPhotos](
	[PhotoNo] [int] IDENTITY(1,1) NOT NULL,
	[FKUserNo] [int] NOT NULL,
	[PhotoPath] [nvarchar](200) NULL,
	[PhotoTheme] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhotoNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateNo] [int] IDENTITY(1,1) NOT NULL,
	[SName] [nvarchar](20) NOT NULL,
	[SDesc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagNo] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TagNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserChat]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserChat](
	[UserChatNo] [int] IDENTITY(1,1) NOT NULL,
	[UserNo] [int] NOT NULL,
	[FriendNo] [int] NOT NULL,
	[ChatContent] [nvarchar](max) NOT NULL,
	[ContentTime] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserChatNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserImage]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserImage](
	[UserImageNo] [int] IDENTITY(1,1) NOT NULL,
	[UserNo] [int] NOT NULL,
	[ImagePath] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserImageNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserNo] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UCName] [nvarchar](50) NOT NULL,
	[UEName] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Birthday] [datetime2](7) NULL,
	[Phone] [nvarchar](50) NULL,
	[UserAddress] [nvarchar](300) NULL,
	[CreationDatetime] [datetime2](7) NULL,
	[LastLoginDatetime] [datetime2](7) NULL,
	[Gender] [tinyint] NOT NULL,
	[GoalNo] [int] NULL,
	[BloodType] [nvarchar](10) NULL,
	[MBTI] [nvarchar](20) NULL,
	[Suspension] [tinyint] NOT NULL,
	[Verify] [tinyint] NOT NULL,
	[isDelete] [tinyint] NOT NULL,
	[isManager] [tinyint] NOT NULL,
	[point] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTags]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTags](
	[FKUserNo] [int] NOT NULL,
	[FKTagNo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FKUserNo] ASC,
	[FKTagNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTopics]    Script Date: 2024/5/27 下午 04:24:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTopics](
	[FKUserNo] [int] NOT NULL,
	[FKTopicNo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FKUserNo] ASC,
	[FKTopicNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (1, N'感情')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (2, N'閒聊')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (3, N'心情')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (4, N'工作')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (5, N'美食')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (6, N'變性')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (7, N'追星')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (8, N'穿搭')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (9, N'旅遊')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (10, N'健身')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (11, N'運動')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (12, N'星座')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (13, N'汽車')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (14, N'機車')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (15, N'3C')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (16, N'寵物')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (17, N'追劇')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (18, N'美髮')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (19, N'籃球')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (20, N'烹飪')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (21, N'遊戲')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (22, N'電影')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (23, N'法律')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (24, N'新聞')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (25, N'玩具 模型')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (26, N'音樂')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (27, N'大學')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (28, N'高中')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (29, N'國中')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (30, N'靈異')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (31, N'攝影')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (32, N'遊戲')
INSERT [dbo].[Categories] ([category_no], [title_name]) VALUES (33, N'測試用')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (4, 3, N'藝術博覽會2024', N'展示現代藝術的博覽會。', CAST(N'2024-06-05T10:00:00.0000000' AS DateTime2), CAST(N'2024-05-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T05:00:00.0000000' AS DateTime2), N'台中市藝術畫廊', N'報名中', N'20240510112432_4487.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (5, 3, N'健康與養生博覽會', N'促進健康與養生的博覽會。', CAST(N'2024-06-10T11:00:00.0000000' AS DateTime2), CAST(N'2024-05-10T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-05T05:00:00.0000000' AS DateTime2), N'台南市社區中心', N'報名中', N'20240510112437_496.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (6, 3, N'音樂節2024', N'各種音樂藝術家的音樂節。', CAST(N'2024-06-15T02:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-10T05:00:00.0000000' AS DateTime2), N'高雄市音樂公園', N'報名中	', N'20240510112443_3584.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (7, 3, N'烹飪藝術工作坊', N'關於烹飪藝術和烹飪的工作坊。', CAST(N'2024-06-20T12:00:00.0000000' AS DateTime2), CAST(N'2024-05-20T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-15T05:00:00.0000000' AS DateTime2), N'台北市烹飪學校', N'報名中	', N'20240510112451_3215.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (8, 3, N'新創提案活動', N'新創公司提案他們的想法的活動。', CAST(N'2024-06-25T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-25T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-20T05:00:00.0000000' AS DateTime2), N'新竹市商業孵化器', N'報名中	', N'20240510112456_5272.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (9, 3, N'文學節2024', N'慶祝文學和書籍的節日。', CAST(N'2024-06-30T10:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-25T05:00:00.0000000' AS DateTime2), N'台中市圖書館', N'報名中	', N'20240510112503_7024.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (10, 3, N'環保意識日', N'提高環保意識的活動。', CAST(N'2024-07-05T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-30T05:00:00.0000000' AS DateTime2), N'台南市生態公園', N'報名中	', N'20240510112509_5330.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (11, 3, N'運動會2024', N'各種體育比賽的運動會。', CAST(N'2024-07-10T01:00:00.0000000' AS DateTime2), CAST(N'2024-06-10T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-05T05:00:00.0000000' AS DateTime2), N'高雄市體育館', N'報名中	', N'20240510112515_8695.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (12, 3, N'科技黑客松2024', N'為科技愛好者舉辦的黑客松活動。', CAST(N'2024-07-15T09:00:00.0000000' AS DateTime2), CAST(N'2024-06-15T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-10T05:00:00.0000000' AS DateTime2), N'台北市創新中心', N'報名中	', N'20240510112522_933.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (16, 3, N'畫廊漫步之約', N'在台中國立美術館舉辦的藝術聯誼活動，欣賞當代藝術。', CAST(N'2025-02-10T14:00:00.0000000' AS DateTime2), CAST(N'2024-12-15T09:00:00.0000000' AS DateTime2), CAST(N'2025-02-09T18:00:00.0000000' AS DateTime2), N'台中市西區五權西路一段2號', N'報名中', N'20240521131726_5724.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (17, 3, N'樂音悠揚聯誼夜', N'在高雄音樂廳舉辦的音樂聯誼活動，欣賞音樂演出。', CAST(N'2025-03-20T19:00:00.0000000' AS DateTime2), CAST(N'2025-01-15T09:00:00.0000000' AS DateTime2), CAST(N'2025-03-19T18:00:00.0000000' AS DateTime2), N'高雄市鹽埕區河西路99號', N'報名中', N'20240521131735_5527.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (18, 3, N'歷史之旅聯誼', N'在新北市立十三行博物館舉辦的歷史聯誼活動，了解台灣歷史。', CAST(N'2025-04-05T10:00:00.0000000' AS DateTime2), CAST(N'2025-02-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-04-04T18:00:00.0000000' AS DateTime2), N'新北市八里區博物館路200號', N'報名中', N'20240521131743_8966.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (19, 3, N'南院藝術聯誼日', N'在嘉義故宮南院舉辦的文化聯誼活動，欣賞亞洲藝術。', CAST(N'2025-05-15T10:00:00.0000000' AS DateTime2), CAST(N'2025-03-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-05-14T18:00:00.0000000' AS DateTime2), N'嘉義縣太保市高鐵西路二段888號', N'報名中', N'20240521131801_5888.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (20, 3, N'美術館奇幻之旅', N'在台北市立美術館舉辦的藝術聯誼活動，欣賞現代藝術。', CAST(N'2025-06-20T14:00:00.0000000' AS DateTime2), CAST(N'2025-04-15T09:00:00.0000000' AS DateTime2), CAST(N'2025-06-19T18:00:00.0000000' AS DateTime2), N'台北市中山區中山北路三段181號', N'報名中', N'20240521131820_6312.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (21, 3, N'南方藝術之約', N'在台南市立美術館舉辦的文化聯誼活動，欣賞藝術展覽。', CAST(N'2025-07-18T14:00:00.0000000' AS DateTime2), CAST(N'2025-05-15T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-17T18:00:00.0000000' AS DateTime2), N'台南市中西區南門路37號', N'報名中', N'20240521131829_4737.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (22, 3, N'新竹文化聯誼日', N'在新竹市立動物園舉辦的聯誼活動，結合動物園探索和文化交流。', CAST(N'2025-08-10T10:00:00.0000000' AS DateTime2), CAST(N'2025-06-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-08-09T18:00:00.0000000' AS DateTime2), N'新竹市東區公園路72號', N'報名中', N'20240521131835_7448.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (23, 3, N'屏東熱情交友會', N'在屏東墾丁國家公園舉辦的聯誼活動，享受陽光與海灘。', CAST(N'2025-09-05T15:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-09-04T18:00:00.0000000' AS DateTime2), N'屏東縣恆春鎮墾丁路', N'報名中', N'20240521131842_1632.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (24, 3, N'宜蘭文化之旅', N'在宜蘭傳藝中心舉辦的聯誼活動，體驗傳統文化。', CAST(N'2025-10-12T09:00:00.0000000' AS DateTime2), CAST(N'2025-08-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-10-11T18:00:00.0000000' AS DateTime2), N'宜蘭縣五結鄉傳藝路', N'報名中', N'20240521131851_494.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (25, 3, N'南投戶外聯誼', N'在南投日月潭舉辦的戶外聯誼活動，體驗湖光山色。', CAST(N'2025-11-20T08:00:00.0000000' AS DateTime2), CAST(N'2025-09-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-11-19T18:00:00.0000000' AS DateTime2), N'南投縣魚池鄉日月潭', N'報名中', N'20240521131859_5417.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (26, 3, N'桃園文化園區聯誼', N'在桃園中壢藝文特區舉辦的聯誼活動，欣賞當地文化展覽。', CAST(N'2025-12-05T10:00:00.0000000' AS DateTime2), CAST(N'2025-10-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-12-04T18:00:00.0000000' AS DateTime2), N'桃園市中壢區中山路', N'報名中', N'20240521131914_3567.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (27, 3, N'台北藝文沙龍', N'在台北當代藝術館舉辦的聯誼活動，欣賞當代藝術作品。', CAST(N'2025-01-25T14:00:00.0000000' AS DateTime2), CAST(N'2024-12-10T09:00:00.0000000' AS DateTime2), CAST(N'2025-01-24T18:00:00.0000000' AS DateTime2), N'台北市中正區長安西路39號', N'報名中', N'20240521131927_4618.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (28, 3, N'苗栗客家文化聯誼', N'在苗栗客家文化園區舉辦的聯誼活動，體驗客家文化。', CAST(N'2025-02-14T09:00:00.0000000' AS DateTime2), CAST(N'2024-12-20T09:00:00.0000000' AS DateTime2), CAST(N'2025-02-13T18:00:00.0000000' AS DateTime2), N'苗栗縣竹南鎮大埔三街6號', N'報名中', N'20240521132639_3352.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (29, 3, N'嘉義森林之戀', N'在嘉義阿里山森林遊樂區舉辦的聯誼活動，享受自然之美。', CAST(N'2025-03-10T08:00:00.0000000' AS DateTime2), CAST(N'2025-01-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-03-09T18:00:00.0000000' AS DateTime2), N'嘉義縣阿里山鄉香林村59號', N'報名中', N'20240521132647_4954.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (30, 3, N'台北市立動物園聯誼', N'在台北市立動物園舉辦的聯誼活動，結合動物園探索和文化交流。', CAST(N'2025-04-18T09:00:00.0000000' AS DateTime2), CAST(N'2025-02-15T09:00:00.0000000' AS DateTime2), CAST(N'2025-04-17T18:00:00.0000000' AS DateTime2), N'台北市文山區新光路二段30號', N'報名中', N'20240521132655_5852.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (31, 3, N'屏東墾丁音樂聯誼', N'在屏東墾丁國家公園舉辦的音樂聯誼活動，享受陽光與音樂。', CAST(N'2025-05-20T17:00:00.0000000' AS DateTime2), CAST(N'2025-03-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-05-19T18:00:00.0000000' AS DateTime2), N'屏東縣恆春鎮墾丁路', N'報名中', N'20240521132715_7885.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (32, 3, N'台中科博館聯誼', N'在台中科學博物館舉辦的聯誼活動，探索科學奧秘。', CAST(N'2025-06-12T10:00:00.0000000' AS DateTime2), CAST(N'2025-04-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-06-11T18:00:00.0000000' AS DateTime2), N'台中市北區館前路1號', N'報名中', N'20240521132723_4959.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (33, 3, N'新北淡水古蹟聯誼', N'在新北淡水紅毛城舉辦的聯誼活動，探索歷史古蹟。', CAST(N'2025-07-15T09:00:00.0000000' AS DateTime2), CAST(N'2025-05-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-14T18:00:00.0000000' AS DateTime2), N'新北市淡水區中正路28巷1號', N'報名中', N'20240521132730_3414.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (34, 3, N'高雄港口之戀', N'在高雄港口舉辦的聯誼活動，欣賞海景和港口風光。', CAST(N'2025-08-25T16:00:00.0000000' AS DateTime2), CAST(N'2025-06-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-08-24T18:00:00.0000000' AS DateTime2), N'高雄市鼓山區蓬萊路', N'報名中', N'20240521132737_6082.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (35, 3, N'台中音樂廳聯誼夜', N'在台中市音樂廳舉辦的聯誼活動，欣賞音樂演出。', CAST(N'2025-09-10T19:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-09-09T18:00:00.0000000' AS DateTime2), N'台中市西屯區惠來路101號', N'報名中', N'20240521132744_1821.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (36, 3, N'台東原住民文化聯誼', N'在台東原住民文化園區舉辦的聯誼活動，體驗原住民文化。', CAST(N'2025-10-05T10:00:00.0000000' AS DateTime2), CAST(N'2025-08-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-10-04T18:00:00.0000000' AS DateTime2), N'台東縣台東市豐年路二段200號', N'報名中', N'20240521132750_2347.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (37, 3, N'基隆海洋博物館聯誼', N'在基隆海洋博物館舉辦的聯誼活動，探索海洋知識。', CAST(N'2025-11-18T09:00:00.0000000' AS DateTime2), CAST(N'2025-09-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-11-17T18:00:00.0000000' AS DateTime2), N'基隆市中正區海洋大道50號', N'報名中', N'20240521133236_8282.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (38, 3, N'宜蘭傳統藝術中心聯誼', N'在宜蘭傳統藝術中心舉辦的聯誼活動，體驗傳統工藝。', CAST(N'2025-12-22T10:00:00.0000000' AS DateTime2), CAST(N'2025-10-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-12-21T18:00:00.0000000' AS DateTime2), N'宜蘭縣五結鄉傳藝路', N'報名中', N'20240521133244_8398.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (39, 3, N'南投妖怪村聯誼', N'在南投妖怪村舉辦的聯誼活動，體驗奇幻氛圍。', CAST(N'2025-01-08T18:00:00.0000000' AS DateTime2), CAST(N'2024-11-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-01-07T18:00:00.0000000' AS DateTime2), N'南投縣埔里鎮中山路四段201號', N'報名中', N'20240521133252_6912.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (40, 3, N'台南古蹟夜遊', N'在台南赤崁樓舉辦的聯誼活動，夜遊古蹟，了解歷史。', CAST(N'2025-02-16T19:00:00.0000000' AS DateTime2), CAST(N'2024-12-20T09:00:00.0000000' AS DateTime2), CAST(N'2025-02-15T18:00:00.0000000' AS DateTime2), N'台南市中西區赤崁街1號', N'報名中', N'20240521133259_5115.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (41, 3, N'屏東小琉球聯誼', N'在屏東小琉球舉辦的聯誼活動，享受海島風情。', CAST(N'2025-03-12T09:00:00.0000000' AS DateTime2), CAST(N'2025-01-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-03-11T18:00:00.0000000' AS DateTime2), N'屏東縣琉球鄉中山路', N'報名中', N'20240521133308_7870.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (42, 3, N'嘉義音樂聯誼夜', N'在嘉義音樂廳舉辦的聯誼活動，欣賞音樂演出。', CAST(N'2025-04-25T19:00:00.0000000' AS DateTime2), CAST(N'2025-02-15T09:00:00.0000000' AS DateTime2), CAST(N'2025-04-24T18:00:00.0000000' AS DateTime2), N'嘉義市西區文化路', N'報名中', N'20240521133324_5065.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (43, 3, N'台中動漫基地聯誼', N'在台中動漫基地舉辦的聯誼活動，欣賞動漫作品。', CAST(N'2025-05-30T14:00:00.0000000' AS DateTime2), CAST(N'2025-03-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-05-29T18:00:00.0000000' AS DateTime2), N'台中市西屯區青海路二段', N'報名中', N'20240521133335_1349.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (44, 3, N'花蓮自然聯誼日', N'在花蓮太魯閣國家公園舉辦的聯誼活動，探索自然美景。', CAST(N'2025-06-18T08:00:00.0000000' AS DateTime2), CAST(N'2025-04-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-06-17T18:00:00.0000000' AS DateTime2), N'花蓮縣秀林鄉富世村富世291號', N'報名中', N'20240521133342_1537.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (45, 3, N'台北動物園奇幻之旅', N'在台北市立動物園舉辦的聯誼活動，結合動物園探索和文化交流。', CAST(N'2025-07-12T09:00:00.0000000' AS DateTime2), CAST(N'2025-05-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-11T18:00:00.0000000' AS DateTime2), N'台北市文山區新光路二段30號', N'報名中', N'20240521133351_3497.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (46, 3, N'高雄哈瑪星文化聯誼', N'在高雄哈瑪星舊火車站舉辦的聯誼活動，探索城市文化。', CAST(N'2025-08-14T16:00:00.0000000' AS DateTime2), CAST(N'2025-06-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-08-13T18:00:00.0000000' AS DateTime2), N'高雄市鼓山區臨海新路', N'報名中', N'20240521133358_9896.png')
INSERT [dbo].[Event] ([EventNo], [HostUserNo], [Title], [Description], [ActivityTime], [SignupStartTime], [SignupEndTime], [Location], [Status], [ImagePath]) VALUES (54, 2, N'豎笛演奏會', N'這是一次精彩演奏會，將在音樂學系音樂廳舉行。', CAST(N'2024-06-01T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-01T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T18:00:00.0000000' AS DateTime2), N'台灣藝術大學', N'報名中', N'20240527155445_5976.jpg')
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[EventRegistrations] ON 

INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (18, 4, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-15T09:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (19, 5, 3, N'黃勢傑', N'0983278909', CAST(N'2024-06-19T09:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (20, 6, 3, N'黃勢傑', N'0983278909', CAST(N'2024-07-04T09:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (21, 7, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-14T10:30:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (22, 8, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-13T11:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (23, 9, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-12T11:30:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (24, 10, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-11T12:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (25, 11, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-10T12:30:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (26, 12, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-09T13:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (27, 16, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-08T13:30:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (28, 17, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-07T14:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (29, 18, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-06T14:30:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (30, 19, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-05T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (31, 20, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-04T15:30:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (32, 21, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-03T16:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (33, 22, 3, N'黃勢傑', N'0983278909', CAST(N'2024-05-02T16:30:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (34, 23, 3, N'黃勢傑', N'0983278909', CAST(N'2024-06-14T17:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (35, 24, 3, N'黃勢傑', N'0983278909', CAST(N'2024-06-14T17:30:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (36, 25, 3, N'黃勢傑', N'0983278909', CAST(N'2024-06-14T18:00:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (37, 26, 3, N'黃勢傑', N'0983278909', CAST(N'2024-06-14T18:30:00.0000000' AS DateTime2))
INSERT [dbo].[EventRegistrations] ([RegistrationID], [EventNo], [UserNo], [ParticipantName], [ContactInfo], [RegistrationTime]) VALUES (42, 28, 3, N'黃勢傑', N'0987654321', CAST(N'2024-05-27T15:53:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[EventRegistrations] OFF
GO
SET IDENTITY_INSERT [dbo].[FriendState] ON 

INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (3, 4, 3, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (4, 3, 4, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (5, 3, 7, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (6, 7, 3, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (7, 22, 3, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (8, 3, 22, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (9, 23, 3, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (10, 3, 23, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (11, 25, 3, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (12, 3, 25, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (15, 3, 20, 3)
INSERT [dbo].[FriendState] ([FriendStateNo], [UserNo], [FriendNo], [StateNo]) VALUES (16, 20, 3, 3)
SET IDENTITY_INSERT [dbo].[FriendState] OFF
GO
SET IDENTITY_INSERT [dbo].[Goals] ON 

INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (1, N'不回答')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (2, N'網友')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (3, N'飯友')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (4, N'酒友')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (5, N'牌友')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (6, N'山友')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (7, N'旅伴')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (8, N'戀愛伴侶')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (9, N'結婚對象')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (10, N'朋友關係')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (11, N'短暫浪漫')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (12, N'匿名網友')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (13, N'一起運動')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (14, N'一起團購')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (15, N'外送拼單')
INSERT [dbo].[Goals] ([GoalNo], [GoalName]) VALUES (16, N'不設限')
SET IDENTITY_INSERT [dbo].[Goals] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupEvent] ON 

INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (1, 30, N'夏季特賣會', N'這是一場涵蓋各種商品的夏季特賣會活動', CAST(N'2024-05-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-07-10T18:00:00.0000000' AS DateTime2), 10000, 100, N'banned', 123, N'822中國信託商業銀行-123456789', N'桃園市中壢區新生路二段421號', 3500)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (2, 31, N'電子產品團購', N'最新最熱的電子產品團購，價格優惠', CAST(N'2024-05-02T10:00:00.0000000' AS DateTime2), CAST(N'2024-07-15T18:00:00.0000000' AS DateTime2), 20000, 50, N'active', 23, NULL, N'台北市信義區虎林街132巷36號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (3, 32, N'家庭用品團購', N'家用電器及日常用品特價團購', CAST(N'2024-05-10T10:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T18:00:00.0000000' AS DateTime2), 15000, 80, N'active', 13, N'808玉山商業銀行-123456789', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (4, 33, N'運動裝備團購', N'高品質運動裝備團購，讓您健康生活', CAST(N'2024-05-22T10:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T18:00:00.0000000' AS DateTime2), 12000, 60, N'active', 13, N'806元大商業銀行-999999999', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (5, 34, N'美食團購', N'美味食品團購，讓您大飽口福', CAST(N'2024-05-23T15:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T18:00:00.0000000' AS DateTime2), 8000, 40, N'active', 23, NULL, N'新北市板橋區中山路一段258號', 3500)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (6, 3, N'最強新北伴手禮-小潘鳳梨酥', N'板橋No.1伴手禮名店的「小潘蛋糕坊」，可是超適合送禮、有夠熱賣的啦，平日總是大排長龍，入手超級困難啊。', CAST(N'2024-05-24T10:07:46.5660000' AS DateTime2), CAST(N'2024-05-30T00:00:00.0000000' AS DateTime2), 0, 0, N'banned', 123, N'816安泰商業銀行-123456789123456', N'新北市板橋區中正路135巷11-1號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (7, 31, N'戶外露營裝備團購', N'各種露營裝備，一站購足', CAST(N'2024-05-05T09:00:00.0000000' AS DateTime2), CAST(N'2024-08-01T18:00:00.0000000' AS DateTime2), 18000, 70, N'active', 13, N'111111111', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (8, 33, N'兒童玩具團購', N'兒童玩具特價優惠，快來選購', CAST(N'2024-05-07T10:00:00.0000000' AS DateTime2), CAST(N'2024-08-05T18:00:00.0000000' AS DateTime2), 5000, 30, N'active', 123, N'222222222', N'臺北市信義區信義路五段7號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (9, 3, N'家居裝飾團購', N'讓您的家更溫馨的裝飾品團購', CAST(N'2024-05-10T10:00:00.0000000' AS DateTime2), CAST(N'2024-08-10T18:00:00.0000000' AS DateTime2), 7000, 50, N'active', 23, NULL, N'高雄市前鎮區中山三路78號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (10, 37, N'美容護膚品團購', N'美容護膚品限時優惠，快來選購', CAST(N'2024-05-12T12:00:00.0000000' AS DateTime2), CAST(N'2024-08-15T18:00:00.0000000' AS DateTime2), 9000, 60, N'active', 123, N'333333333', N'臺北市中正區中山南路21號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (11, 39, N'書籍團購', N'各種書籍特價優惠，讀書愛好者的福音', CAST(N'2024-05-15T09:00:00.0000000' AS DateTime2), CAST(N'2024-08-20T18:00:00.0000000' AS DateTime2), 3000, 25, N'active', 13, N'444444444', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (12, 3, N'汽車配件團購', N'各類汽車配件，一站購足', CAST(N'2024-05-17T11:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T18:00:00.0000000' AS DateTime2), 20000, 100, N'active', 23, NULL, N'台中市南屯區公益路二段88號', 2700)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (13, 36, N'寵物用品團購', N'寵物用品優惠專區，讓您的寵物更幸福', CAST(N'2024-05-19T10:00:00.0000000' AS DateTime2), CAST(N'2024-09-01T18:00:00.0000000' AS DateTime2), 6000, 40, N'active', 123, N'555555555', N'桃園市中壢區新生路二段421號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (14, 32, N'健身器材團購', N'健身器材特惠，讓您在家也能健身', CAST(N'2024-05-21T10:00:00.0000000' AS DateTime2), CAST(N'2024-09-05T18:00:00.0000000' AS DateTime2), 25000, 120, N'active', 13, N'666666666', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (15, 3, N'電子配件團購', N'各類電子配件優惠，讓您的電子產品更實用', CAST(N'2024-05-23T09:00:00.0000000' AS DateTime2), CAST(N'2024-09-10T18:00:00.0000000' AS DateTime2), 8000, 50, N'active', 23, NULL, N'新竹市東區關新路99號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (16, 34, N'廚房用品團購', N'廚房用品特價，讓您的烹飪更便捷', CAST(N'2024-05-25T10:00:00.0000000' AS DateTime2), CAST(N'2024-09-15T18:00:00.0000000' AS DateTime2), 12000, 60, N'active', 123, N'777777777', N'桃園市中壢區中和路139 號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (17, 30, N'園藝用品團購', N'園藝愛好者專屬的優惠活動', CAST(N'2024-05-26T11:00:00.0000000' AS DateTime2), CAST(N'2024-09-20T18:00:00.0000000' AS DateTime2), 5000, 35, N'active', 13, N'888888888', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (18, 31, N'文具團購', N'文具用品特價，學生和上班族必備', CAST(N'2024-05-27T09:00:00.0000000' AS DateTime2), CAST(N'2024-09-25T18:00:00.0000000' AS DateTime2), 4000, 30, N'active', 23, NULL, N'台南市中西區中正路45號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (19, 32, N'音響設備團購', N'高品質音響設備特價團購', CAST(N'2024-05-01T09:00:00.0000000' AS DateTime2), CAST(N'2024-08-10T18:00:00.0000000' AS DateTime2), 15000, 80, N'active', 123, N'999999999', N'臺北市松山區南京東路五段25號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (20, 34, N'夏季服裝團購', N'時尚夏季服裝大促銷', CAST(N'2024-05-03T10:00:00.0000000' AS DateTime2), CAST(N'2024-08-20T18:00:00.0000000' AS DateTime2), 12000, 70, N'active', 13, N'888888888', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (21, 36, N'廚具團購', N'高品質廚具限時優惠', CAST(N'2024-05-06T11:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T18:00:00.0000000' AS DateTime2), 10000, 50, N'active', 23, NULL, N'台南市東區東門路一段91號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (22, 37, N'攝影器材團購', N'專業攝影器材特價促銷', CAST(N'2024-05-08T12:00:00.0000000' AS DateTime2), CAST(N'2024-09-01T18:00:00.0000000' AS DateTime2), 25000, 100, N'active', 123, N'555555555', N'高雄市三民區九如一路1號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (23, 38, N'家電團購', N'各種家用電器優惠團購', CAST(N'2024-05-11T10:00:00.0000000' AS DateTime2), CAST(N'2024-09-05T18:00:00.0000000' AS DateTime2), 30000, 150, N'active', 13, N'777777777', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (24, 39, N'旅行用品團購', N'旅行必備用品大促銷', CAST(N'2024-05-13T09:00:00.0000000' AS DateTime2), CAST(N'2024-09-10T18:00:00.0000000' AS DateTime2), 8000, 45, N'active', 23, NULL, N'桃園市龜山區文化一路88號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (25, 40, N'手工藝品團購', N'精美手工藝品特價優惠', CAST(N'2024-05-16T10:00:00.0000000' AS DateTime2), CAST(N'2024-09-15T18:00:00.0000000' AS DateTime2), 6000, 30, N'active', 123, N'111111111', N'新北市永和區永和路二段88號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (26, 31, N'運動鞋團購', N'各品牌運動鞋特價促銷', CAST(N'2024-05-18T11:00:00.0000000' AS DateTime2), CAST(N'2024-09-20T18:00:00.0000000' AS DateTime2), 15000, 90, N'active', 13, N'222222222', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (27, 33, N'家具團購', N'各式家具特價團購，品質保證', CAST(N'2024-05-20T09:00:00.0000000' AS DateTime2), CAST(N'2024-09-25T18:00:00.0000000' AS DateTime2), 20000, 110, N'active', 23, NULL, N'台南市南區健康路一段66號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (28, 35, N'書法用品團購', N'書法愛好者專屬的優惠活動', CAST(N'2024-05-22T10:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T18:00:00.0000000' AS DateTime2), 4000, 25, N'active', 123, N'333333333', N'臺北市士林區中山北路七段36號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (29, 37, N'戶外運動用品團購', N'戶外運動愛好者的福音', CAST(N'2024-05-24T11:00:00.0000000' AS DateTime2), CAST(N'2024-10-01T18:00:00.0000000' AS DateTime2), 18000, 80, N'active', 13, N'444444444', NULL, 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (30, 39, N'辦公室用品團購', N'高品質辦公室用品特價優惠', CAST(N'2024-05-26T10:00:00.0000000' AS DateTime2), CAST(N'2024-10-05T18:00:00.0000000' AS DateTime2), 12000, 60, N'active', 23, NULL, N'高雄市苓雅區青年一路50號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (31, 30, N'日用品團購', N'日常生活用品優惠大促銷', CAST(N'2024-05-27T09:00:00.0000000' AS DateTime2), CAST(N'2024-10-10T18:00:00.0000000' AS DateTime2), 5000, 40, N'active', 123, N'666666666', N'新北市新莊區中正路200號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (32, 3, N'最強新北伴手禮-小潘鳳梨酥', N'板橋No.1伴手禮名店的「小潘蛋糕坊」，可是超適合送禮、有夠熱賣的啦，平日總是大排長龍，入手超級困難啊。', CAST(N'2024-05-27T14:56:01.8590000' AS DateTime2), CAST(N'2024-05-31T00:00:00.0000000' AS DateTime2), 0, 0, N'banned', 123, N'018全國農業金庫-123456789123456', N'新北市板橋區中山路二段286號', 0)
INSERT [dbo].[GroupEvent] ([EventNo], [HostUserNo], [Title], [Description], [StartTime], [EndTime], [MinTotalAmount], [MinTotalQuantity], [Status], [PaymentMethod], [Account], [Address], [point]) VALUES (33, 3, N'最強新北伴手禮-小潘鳳梨酥', N'板橋No.1伴手禮名店的「小潘蛋糕坊」，可是超適合送禮、有夠熱賣的啦，平日總是大排長龍，入手超級困難啊。', CAST(N'2024-05-27T15:58:37.0710000' AS DateTime2), CAST(N'2024-05-31T00:00:00.0000000' AS DateTime2), 0, 0, N'banned', 123, N'016高雄銀行-123456789123456', N'新北市板橋區中山路二段286號', 0)
SET IDENTITY_INSERT [dbo].[GroupEvent] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupItem] ON 

INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (1, 1, N'夏季涼鞋', 500, N'透氣舒適的夏季涼鞋', N'sandals.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (2, 1, N'太陽眼鏡', 1500, N'防紫外線時尚太陽眼鏡', N'sunglasses.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (3, 2, N'智慧手機', 8000, N'最新款智慧手機，功能強大', N'smartphone.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (4, 2, N'平板電腦', 12000, N'高效能平板電腦，便於攜帶', N'tablet.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (5, 3, N'掃地機器人', 5000, N'全自動掃地機器人，解放雙手', N'robot_vacuum.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (6, 3, N'多功能料理機', 3000, N'多功能料理機，廚房好幫手', N'blender.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (7, 4, N'跑步機', 10000, N'高品質跑步機，家用健身必備', N'treadmill.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (8, 4, N'瑜伽墊', 800, N'防滑瑜伽墊，舒適耐用', N'yoga_mat.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (9, 5, N'進口牛排', 1500, N'頂級進口牛排，美味可口', N'steak.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (10, 5, N'手工巧克力', 500, N'精緻手工巧克力，香濃可口', N'chocolate.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (11, 6, N'鳳梨酥', 20, N'好吃', N'item20240524100819_71204.jpeg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (12, 7, N'帳篷', 3000, N'四人帳篷，防水透氣', N'tent.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (13, 7, N'睡袋', 1200, N'舒適保暖睡袋', N'sleeping_bag.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (14, 7, N'露營燈', 800, N'高亮度露營燈', N'camping_lantern.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (15, 8, N'積木玩具', 500, N'創意積木玩具', N'blocks.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (16, 8, N'毛絨玩具', 300, N'可愛毛絨玩具', N'plush_toy.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (17, 8, N'拼圖', 200, N'益智拼圖', N'puzzle.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (18, 9, N'壁畫', 1500, N'現代風格壁畫', N'wall_art.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (19, 9, N'花瓶', 800, N'陶瓷花瓶', N'vase.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (20, 9, N'靠墊', 500, N'舒適靠墊', N'cushion.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (21, 10, N'面膜', 100, N'保濕面膜', N'face_mask.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (22, 10, N'精華液', 800, N'抗皺精華液', N'serum.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (23, 10, N'防曬霜', 600, N'高效防曬霜', N'sunscreen.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (24, 11, N'小說', 300, N'暢銷小說', N'novel.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (25, 11, N'科學書', 500, N'科學知識書籍', N'science_book.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (26, 11, N'兒童圖書', 200, N'兒童故事書', N'children_book.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (27, 12, N'機油', 600, N'高性能機油', N'engine_oil.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (28, 12, N'剎車片', 1200, N'優質剎車片', N'brake_pads.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (29, 12, N'雨刷', 300, N'耐用雨刷', N'wiper.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (30, 13, N'狗糧', 400, N'高營養狗糧', N'dog_food.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (31, 13, N'貓砂', 300, N'無塵貓砂', N'cat_litter.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (32, 13, N'寵物玩具', 200, N'有趣的寵物玩具', N'pet_toy.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (33, 14, N'啞鈴', 1200, N'可調節啞鈴', N'dumbbell.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (34, 14, N'瑜伽墊', 500, N'防滑瑜伽墊', N'yoga_mat.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (35, 14, N'健身車', 8000, N'家用健身車', N'exercise_bike.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (36, 15, N'手機殼', 100, N'耐用手機殼', N'phone_case.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (37, 15, N'充電寶', 300, N'大容量充電寶', N'power_bank.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (38, 15, N'耳機', 800, N'無線耳機', N'earbuds.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (39, 16, N'鍋具套裝', 2000, N'不粘鍋具套裝', N'cookware_set.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (40, 16, N'刀具', 1000, N'高品質刀具', N'knife_set.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (41, 16, N'砧板', 500, N'抗菌砧板', N'cutting_board.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (42, 17, N'花盆', 300, N'陶瓷花盆', N'flower_pot.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (43, 17, N'園藝剪刀', 200, N'不銹鋼園藝剪刀', N'pruning_shears.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (44, 17, N'澆水壺', 150, N'便攜澆水壺', N'watering_can.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (45, 18, N'筆記本', 100, N'精美筆記本', N'notebook.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (46, 18, N'鋼筆', 200, N'高品質鋼筆', N'fountain_pen.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (47, 18, N'書包', 800, N'舒適書包', N'school_bag.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (48, 19, N'藍牙音箱', 1500, N'高音質藍牙音箱', N'bluetooth_speaker.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (49, 19, N'耳放', 2000, N'高性能耳放', N'headphone_amp.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (50, 19, N'家庭影院', 12000, N'環繞音效家庭影院', N'home_theater.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (51, 20, N'T恤', 300, N'純棉T恤', N'tshirt.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (52, 20, N'短褲', 500, N'時尚短褲', N'shorts.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (53, 20, N'夏季連衣裙', 800, N'輕盈連衣裙', N'summer_dress.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (54, 21, N'煎鍋', 1500, N'不粘煎鍋', N'frying_pan.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (55, 21, N'蒸鍋', 2000, N'多層蒸鍋', N'steamer.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (56, 21, N'壓力鍋', 3000, N'高效壓力鍋', N'pressure_cooker.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (57, 22, N'單反相機', 8000, N'專業單反相機', N'dslr_camera.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (58, 22, N'三腳架', 1500, N'穩定三腳架', N'tripod.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (59, 22, N'攝影包', 1000, N'防水攝影包', N'camera_bag.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (60, 23, N'洗衣機', 15000, N'高效滾筒洗衣機', N'washing_machine.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (61, 23, N'冰箱', 20000, N'節能雙門冰箱', N'refrigerator.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (62, 23, N'微波爐', 3000, N'多功能微波爐', N'microwave_oven.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (63, 24, N'旅行背包', 1500, N'大容量旅行背包', N'travel_backpack.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (64, 24, N'旅行枕', 300, N'舒適旅行枕', N'travel_pillow.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (65, 24, N'行李箱', 5000, N'耐用行李箱', N'suitcase.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (66, 25, N'手工首飾', 800, N'精美手工首飾', N'handmade_jewelry.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (67, 25, N'手工皂', 200, N'天然手工皂', N'handmade_soap.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (68, 25, N'手工陶藝', 1200, N'獨特手工陶藝', N'handmade_pottery.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (69, 26, N'跑步鞋', 1500, N'舒適跑步鞋', N'running_shoes.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (70, 26, N'籃球鞋', 2000, N'高彈籃球鞋', N'basketball_shoes.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (71, 26, N'訓練鞋', 1800, N'全能訓練鞋', N'training_shoes.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (72, 27, N'沙發', 12000, N'舒適布藝沙發', N'sofa.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (73, 27, N'書桌', 5000, N'現代風格書桌', N'desk.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (74, 27, N'衣櫃', 8000, N'大容量衣櫃', N'wardrobe.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (75, 28, N'毛筆', 100, N'高品質毛筆', N'brush.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (76, 28, N'宣紙', 200, N'上等宣紙', N'rice_paper.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (77, 28, N'墨汁', 150, N'純天然墨汁', N'ink.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (78, 29, N'登山鞋', 3000, N'防水登山鞋', N'hiking_shoes.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (79, 29, N'運動背包', 1000, N'多功能運動背包', N'sports_backpack.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (80, 29, N'防曬衣', 800, N'輕便防曬衣', N'sun_protection_clothing.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (81, 30, N'辦公椅', 3000, N'人體工學辦公椅', N'office_chair.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (82, 30, N'文件夾', 100, N'多功能文件夾', N'file_folder.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (83, 30, N'白板', 800, N'高質量白板', N'whiteboard.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (84, 31, N'洗衣液', 200, N'高效洗衣液', N'laundry_detergent.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (85, 31, N'垃圾袋', 100, N'加厚垃圾袋', N'garbage_bag.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (86, 31, N'清潔劑', 150, N'多用途清潔劑', N'cleaner.jpg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (87, 32, N'鳳凰酥', 30, N'好吃', N'item20240527145724_51969.jpeg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (88, 32, N'大理石', 20, N'好吃', N'item20240527145724_8174.jpeg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (89, 33, N'乳酪蛋糕', 80, N'好吃', N'item20240527155940_32544.jpeg')
INSERT [dbo].[GroupItem] ([ItemNo], [EventNo], [Name], [Price], [Description], [ImgPath]) VALUES (90, 33, N'大理石麵包', 20, N'好吃', N'item20240527155940_67150.jpeg')
SET IDENTITY_INSERT [dbo].[GroupItem] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupOrder] ON 

INSERT [dbo].[GroupOrder] ([OrderNo], [EventNo], [UserNo], [PaymentMethod], [SetTime]) VALUES (1, 3, 3, 1, CAST(N'2024-05-23T16:10:03.1450000' AS DateTime2))
INSERT [dbo].[GroupOrder] ([OrderNo], [EventNo], [UserNo], [PaymentMethod], [SetTime]) VALUES (2, 5, 3, 3, CAST(N'2024-05-23T16:24:45.4080000' AS DateTime2))
INSERT [dbo].[GroupOrder] ([OrderNo], [EventNo], [UserNo], [PaymentMethod], [SetTime]) VALUES (3, 1, 3, 3, CAST(N'2024-05-24T10:07:03.1890000' AS DateTime2))
INSERT [dbo].[GroupOrder] ([OrderNo], [EventNo], [UserNo], [PaymentMethod], [SetTime]) VALUES (4, 12, 3, 3, CAST(N'2024-05-27T14:55:23.8060000' AS DateTime2))
INSERT [dbo].[GroupOrder] ([OrderNo], [EventNo], [UserNo], [PaymentMethod], [SetTime]) VALUES (5, 5, 3, 3, CAST(N'2024-05-27T15:57:36.1520000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[GroupOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemSpecification] ON 

INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (1, 1, N'M')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (2, 1, N'L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (3, 2, N'黑色')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (4, 2, N'棕色')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (5, 3, N'64GB')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (6, 3, N'128GB')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (7, 4, N'銀色')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (8, 4, N'灰色')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (9, 5, N'白色')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (10, 6, N'2L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (11, 6, N'4L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (12, 7, N'黑色')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (13, 8, N'紫色')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (14, 9, N'200g')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (15, 10, N'100g')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (16, 11, N'鳳梨')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (17, 12, N'尺寸：240x240cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (18, 12, N'尺寸：300x300cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (19, 13, N'重量：1.2kg')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (20, 13, N'重量：1.5kg')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (21, 14, N'亮度：1000流明')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (22, 14, N'亮度：1500流明')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (23, 15, N'材質：ABS塑料')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (24, 15, N'材質：PC塑料')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (25, 16, N'尺寸：30cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (26, 16, N'尺寸：35cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (27, 17, N'片數：500片')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (28, 17, N'片數：1000片')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (29, 18, N'尺寸：100x100cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (30, 18, N'尺寸：120x120cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (31, 19, N'高度：25cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (32, 19, N'高度：30cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (33, 20, N'材質：棉')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (34, 20, N'材質：絲')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (35, 21, N'功效：保濕')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (36, 21, N'功效：美白')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (37, 22, N'成分：玻尿酸')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (38, 22, N'成分：膠原蛋白')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (39, 23, N'SPF值：50+')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (40, 23, N'SPF值：30+')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (41, 24, N'頁數：300頁')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (42, 24, N'頁數：500頁')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (43, 25, N'主題：科學理論')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (44, 25, N'主題：文學經典')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (45, 26, N'適合年齡：3-6歲')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (46, 26, N'適合年齡：7-10歲')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (47, 27, N'容量：5L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (48, 27, N'容量：10L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (49, 28, N'材質：陶瓷')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (50, 28, N'材質：不鏽鋼')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (51, 29, N'尺寸：26吋')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (52, 29, N'尺寸：28吋')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (53, 30, N'成分：雞肉')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (54, 30, N'成分：牛肉')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (55, 31, N'成分：膨潤土')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (56, 31, N'成分：木質纖維')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (57, 32, N'尺寸：10cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (58, 32, N'尺寸：15cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (59, 33, N'重量：20kg')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (60, 33, N'重量：25kg')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (61, 34, N'尺寸：180x60cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (62, 34, N'尺寸：200x70cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (63, 35, N'尺寸：150x70x120cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (64, 35, N'尺寸：170x80x130cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (65, 36, N'尺寸：6.5寸')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (66, 36, N'尺寸：7寸')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (67, 37, N'容量：10000mAh')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (68, 37, N'容量：15000mAh')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (69, 38, N'連接：藍牙5.0')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (70, 38, N'連接：藍牙4.2')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (71, 39, N'材質：不粘塗層')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (72, 39, N'材質：不鏽鋼')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (73, 40, N'件數：5件')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (74, 40, N'件數：8件')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (75, 41, N'尺寸：40x30cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (76, 41, N'尺寸：45x35cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (77, 42, N'尺寸：30cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (78, 42, N'尺寸：35cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (79, 43, N'長度：20cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (80, 43, N'長度：25cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (81, 44, N'容量：1L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (82, 44, N'容量：1.5L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (83, 45, N'頁數：200頁')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (84, 45, N'頁數：250頁')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (85, 46, N'筆尖：F')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (86, 46, N'筆尖：M')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (87, 47, N'容量：20L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (88, 47, N'容量：25L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (89, 48, N'連接：藍牙5.0')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (90, 48, N'連接：藍牙4.2')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (91, 49, N'失真度：<0.001%')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (92, 49, N'失真度：<0.005%')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (93, 50, N'功率：1000W')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (94, 50, N'功率：1200W')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (95, 51, N'尺寸：L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (96, 51, N'尺寸：XL')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (97, 52, N'尺寸：M')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (98, 52, N'尺寸：L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (99, 53, N'尺寸：S')
GO
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (100, 53, N'尺寸：M')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (101, 54, N'直徑：28cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (102, 54, N'直徑：30cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (103, 55, N'層數：3層')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (104, 55, N'層數：4層')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (105, 56, N'容量：6L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (106, 56, N'容量：8L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (107, 57, N'像素：2400萬')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (108, 57, N'像素：3600萬')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (109, 58, N'高度：150cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (110, 58, N'高度：180cm')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (111, 59, N'容量：20L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (112, 59, N'容量：30L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (113, 60, N'容量：10kg')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (114, 60, N'容量：15kg')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (115, 61, N'容量：400L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (116, 61, N'容量：500L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (117, 62, N'功率：1000W')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (118, 62, N'功率：1200W')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (119, 63, N'容量：50L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (120, 63, N'容量：60L')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (121, 64, N'填充物：記憶棉')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (122, 64, N'填充物：羽絨')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (123, 65, N'尺寸：28寸')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (124, 65, N'尺寸：30寸')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (125, 66, N'設計：手工雕刻')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (126, 66, N'設計：機器雕刻')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (127, 67, N'香味：薰衣草')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (128, 67, N'香味：茉莉花')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (1017, 87, N'原味')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (1018, 88, N'奶油')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (1019, 88, N'巧克力')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (1020, 89, N'乳酪')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (1021, 90, N'奶油')
INSERT [dbo].[ItemSpecification] ([SpecNo], [ItemNo], [SpecValue]) VALUES (1022, 90, N'巧克力')
SET IDENTITY_INSERT [dbo].[ItemSpecification] OFF
GO
SET IDENTITY_INSERT [dbo].[Likes] ON 

INSERT [dbo].[Likes] ([like_no], [user_no], [post_no]) VALUES (10, 3, 1)
INSERT [dbo].[Likes] ([like_no], [user_no], [post_no]) VALUES (3, 3, 2)
INSERT [dbo].[Likes] ([like_no], [user_no], [post_no]) VALUES (12, 3, 10)
INSERT [dbo].[Likes] ([like_no], [user_no], [post_no]) VALUES (11, 3, 30)
SET IDENTITY_INSERT [dbo].[Likes] OFF
GO
SET IDENTITY_INSERT [dbo].[Match] ON 

INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (3, 20, 3, 0, CAST(N'2024-05-27T15:51:13.5458602' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (4, 30, 38, 2, CAST(N'2013-11-05T08:12:54.1023258' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (5, 27, 44, 0, CAST(N'2007-08-12T17:49:01.4563217' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (6, 26, 42, 3, CAST(N'2022-02-28T03:35:27.8974512' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (7, 42, 26, 3, CAST(N'2001-06-17T12:08:39.2541369' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (8, 38, 30, 2, CAST(N'2019-09-23T20:54:16.7852147' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (9, 29, 37, 0, CAST(N'2010-04-09T14:21:43.3698521' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (10, 46, 39, 1, CAST(N'2023-12-02T01:47:58.6325874' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (11, 37, 28, 3, CAST(N'2016-07-29T09:36:12.5214789' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (12, 39, 41, 2, CAST(N'2004-01-14T23:02:35.9658741' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (13, 43, 25, 0, CAST(N'2021-05-20T06:59:27.4178523' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (14, 49, 36, 1, CAST(N'2015-10-26T19:25:49.2536987' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (15, 28, 37, 3, CAST(N'2008-03-03T11:43:03.7412589' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (16, 41, 39, 2, CAST(N'2000-08-31T04:17:38.5896321' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (17, 39, 21, 0, CAST(N'2017-12-08T16:30:52.9632145' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (18, 41, 47, 1, CAST(N'2024-04-16T02:56:14.3258967' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (19, 40, 50, 3, CAST(N'2012-02-22T13:38:26.7415289' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (20, 47, 32, 2, CAST(N'2005-11-19T22:19:41.5896321' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (21, 37, 43, 0, CAST(N'2018-06-11T08:45:58.2536987' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (22, 35, 27, 1, CAST(N'2009-09-27T18:02:13.6325874' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (23, 50, 40, 3, CAST(N'2020-01-04T05:28:36.9874512' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (24, 32, 47, 2, CAST(N'2014-05-01T10:53:52.4569873' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (25, 23, 49, 0, CAST(N'2006-10-15T21:10:05.8974512' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (26, 44, 29, 1, CAST(N'2011-07-24T15:36:19.3214567' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (27, 25, 40, 3, CAST(N'2002-03-10T07:22:45.7418529' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (28, 38, 46, 2, CAST(N'2023-08-06T00:48:57.1236548' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (29, 26, 35, 0, CAST(N'2017-04-21T12:55:24.5896321' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (30, 39, 33, 1, CAST(N'2013-01-18T04:51:46.9632145' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (31, 40, 25, 3, CAST(N'2008-12-13T17:07:12.3258967' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (32, 46, 38, 2, CAST(N'2022-09-09T09:23:35.7412589' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (33, 38, 46, 2, CAST(N'2022-09-09T09:23:35.7412589' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (34, 31, 50, 0, CAST(N'2003-02-25T23:44:58.1452369' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (35, 48, 35, 1, CAST(N'2019-11-30T02:11:21.5896321' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (36, 24, 43, 3, CAST(N'2016-06-07T14:37:44.9632145' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (37, 36, 47, 2, CAST(N'2007-01-01T06:04:08.3258967' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (38, 45, 28, 0, CAST(N'2024-05-16T20:30:31.7415289' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (39, 32, 36, 1, CAST(N'2010-08-03T11:15:49.1236548' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (40, 43, 24, 3, CAST(N'2015-03-22T03:41:05.5874123' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (41, 47, 36, 2, CAST(N'2021-10-28T16:57:28.9654782' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (42, 50, 39, 0, CAST(N'2001-12-19T08:33:52.3258967' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (43, 37, 30, 1, CAST(N'2018-05-05T22:50:14.7415289' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (44, 48, 29, 3, CAST(N'2012-08-11T01:25:38.1236548' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (45, 45, 41, 2, CAST(N'2004-03-29T13:01:59.5896321' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (46, 27, 36, 0, CAST(N'2023-12-25T05:18:22.9632145' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (47, 22, 34, 1, CAST(N'2000-04-23T19:44:46.3258967' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (48, 29, 48, 3, CAST(N'2017-09-20T10:21:08.7412589' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (49, 41, 45, 2, CAST(N'2011-01-26T02:46:31.1452369' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (50, 33, 26, 0, CAST(N'2006-11-12T15:02:54.5896321' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (51, 50, 31, 1, CAST(N'2020-06-18T07:39:17.9632145' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (52, 40, 28, 3, CAST(N'2014-08-15T21:55:41.3258967' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (53, 39, 26, 2, CAST(N'2005-05-08T12:12:04.7415289' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (54, 28, 37, 0, CAST(N'2022-10-31T04:28:28.1236548' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (55, 49, 24, 1, CAST(N'2009-12-24T18:54:51.5896321' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (56, 28, 40, 3, CAST(N'2016-02-10T09:10:14.9632145' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (57, 26, 39, 2, CAST(N'2003-07-27T23:26:38.3258967' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (58, 35, 25, 0, CAST(N'2024-04-02T01:53:01.7415289' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (59, 41, 29, 1, CAST(N'2013-09-14T14:09:25.1236548' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (60, 23, 51, 3, CAST(N'2008-02-21T06:35:48.5896321' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (61, 47, 27, 2, CAST(N'2019-05-17T20:02:11.9632145' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (62, 25, 32, 0, CAST(N'2010-11-09T11:28:35.3258967' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (63, 35, 43, 1, CAST(N'2001-08-06T03:54:58.7415289' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (64, 51, 23, 3, CAST(N'2018-04-01T17:21:22.1236548' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (65, 27, 47, 2, CAST(N'2012-01-28T08:47:45.5896321' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (66, 42, 21, 0, CAST(N'2006-12-15T22:04:08.9632145' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (67, 49, 38, 1, CAST(N'2021-07-22T13:30:32.3258967' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (68, 3, 30, 2, CAST(N'2024-05-28T12:16:00.7777777' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (69, 30, 3, 2, CAST(N'2024-05-28T12:16:00.7777777' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (70, 3, 34, 0, CAST(N'2024-05-24T09:58:50.4364712' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (71, 3, 42, 1, CAST(N'2024-05-24T09:58:53.7445448' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (72, 3, 7, 0, CAST(N'2024-05-24T09:59:10.7597964' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (73, 3, 45, 0, CAST(N'2024-05-24T09:59:10.9509627' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (74, 3, 47, 1, CAST(N'2024-05-24T09:59:11.5660983' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (75, 3, 36, 1, CAST(N'2024-05-24T09:59:12.1111907' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (77, 3, 27, 1, CAST(N'2024-05-27T14:48:44.5748938' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (78, 3, 49, 0, CAST(N'2024-05-27T14:48:48.5778641' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (80, 3, 39, 1, CAST(N'2024-05-27T15:50:40.1968586' AS DateTime2))
INSERT [dbo].[Match] ([MatchNo], [User1No], [User2No], [MatchStatus], [MatchedAt]) VALUES (81, 3, 43, 0, CAST(N'2024-05-27T15:50:48.4553803' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Match] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (1, 1, 5, 4, 9)
INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (2, 1, 6, 4, 11)
INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (3, 2, 10, 2, 15)
INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (4, 3, 1, 1, 2)
INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (5, 3, 2, 2, 4)
INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (6, 4, 27, 2, 48)
INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (7, 4, 28, 1, 50)
INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (8, 4, 29, 1, 52)
INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (9, 5, 9, 1, 14)
INSERT [dbo].[OrderDetail] ([DetailNo], [OrderNo], [ItemNo], [ItemQuantity], [ItemSpec]) VALUES (10, 5, 10, 2, 15)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (1, 3, 1, N'愛的陪伴', N'在這個世界上，有一種力量能夠讓我感受到安心和溫暖，那就是你的陪伴。無論是歡笑還是淚水，我都願意和你一起走過，因為有你的陪伴，我就擁有了全世界。', NULL, CAST(N'2022-06-29T15:18:44.0000000' AS DateTime2), 7)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (2, 3, 1, N'愛的故事', N'我們的愛情就像一本精彩的故事，每一頁都充滿著驚喜和感動，每一章都是我們共同經歷的點點滴滴。讓我們一起翻開這本屬於我們的故事書，共同譜寫著屬於我們的愛情篇章。', NULL, CAST(N'2022-06-02T07:43:27.0000000' AS DateTime2), 5)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (3, 3, 4, N'職場挑戰', N'最近在職場上遇到了一些挑戰，但我相信這都是成長的機會！通過努力和堅持，我相信我能夠克服一切困難，取得更大的成就！', NULL, CAST(N'2023-12-28T18:42:00.0000000' AS DateTime2), 103)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (4, 40, 4, N'職場成就', N'分享一個最近在工作中取得的成就，這是我努力工作的結果，也是同事們共同努力的成果！希望能夠繼續保持這種良好的工作狀態！', NULL, CAST(N'2023-04-28T23:39:32.0000000' AS DateTime2), 80)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (5, 24, 4, N'專業技能', N'最近在學習一些新的專業技能，提升自己在工作中的競爭力！學無止境，希望能夠不斷地提升自己，成為更優秀的職場人才！', NULL, CAST(N'2024-03-10T01:41:15.0000000' AS DateTime2), 96)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (6, 26, 4, N'團隊合作', N'和團隊一起合作完成了一個重要的項目，大家齊心協力，克服了各種困難，取得了令人滿意的成績！這次合作讓我深刻感受到了團隊的力量！', NULL, CAST(N'2024-04-02T15:45:04.0000000' AS DateTime2), 11)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (7, 27, 4, N'職場心得', N'分享一些在職場上的心得和感悟，希望能夠和大家一起交流，共同進步！職場是一個充滿機遇和挑戰的地方，我們需要不斷地學習和成長！', NULL, CAST(N'2024-04-16T19:58:11.0000000' AS DateTime2), 157)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (8, 33, 4, N'工作總結', N'對這段時間的工作進行了一次總結，回顧過去的成就和不足，找到了自己的不足之處，也明確了下一步的努力方向！', NULL, CAST(N'2024-02-15T04:21:09.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (9, 34, 4, N'職場創新', N'最近在工作中提出了一些創新的想法，得到了領導和同事們的認可和支持！創新是推動企業發展的重要動力之一，希望能夠繼續保持這種創新精神！', NULL, CAST(N'2022-09-12T22:43:36.0000000' AS DateTime2), 153)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (10, 28, 4, N'專案管理', N'負責了一個重要的專案管理工作，雖然遇到了很多困難和挑戰，但最終還是成功完成了任務！這次經歷讓我更加成熟和自信！', NULL, CAST(N'2024-03-14T21:22:11.0000000' AS DateTime2), 17)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (11, 26, 4, N'職場溝通', N'在工作中，良好的溝通是非常重要的！最近參加了一個溝通培訓課程，學到了很多寶貴的溝通技巧和方法，希望能夠在工作中更加游刃有余地應用！', NULL, CAST(N'2024-04-16T07:22:33.0000000' AS DateTime2), 37)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (12, 26, 4, N'職場進步', N'工作是一個不斷進步的過程！每一次挑戰和困難都是我們成長的機遇，希望能夠在未來的工作中取得更大的進步和成就！', NULL, CAST(N'2022-10-10T11:31:30.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (13, 35, 4, N'工作壓力', N'最近工作壓力有些大，但我相信壓力是暫時的，成就是永恒的！通過努力和堅持，我相信我能夠克服一切困難，取得更好的成績！', NULL, CAST(N'2022-06-18T07:32:14.0000000' AS DateTime2), 12)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (14, 40, 4, N'職場展望', N'展望未來的職場發展，我對未來充滿信心和期待！希望通過自己的努力和不懈的追求，能夠實現自己的職業夢想！', NULL, CAST(N'2023-02-19T12:44:30.0000000' AS DateTime2), 11)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (15, 32, 4, N'職場挑戰', N'在職場上遇到了一些挑戰，但我相信挑戰是成長的機會！通過努力和堅持，我相信我能夠克服一切困難，取得更大的成就！', NULL, CAST(N'2022-11-16T06:50:12.0000000' AS DateTime2), 9)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (16, 29, 4, N'工作成就', N'分享一個最近在工作中取得的成就，這是我努力工作的結果，也是同事們共同努力的成果！希望能夠繼續保持這種良好的工作狀態！', NULL, CAST(N'2022-07-17T04:13:23.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (17, 27, 4, N'專業技能', N'最近在學習一些新的專業技能，提升自己在工作中的競爭力！學無止境，希望能夠不斷地提升自己，成為更優秀的職場人才！', NULL, CAST(N'2022-09-21T11:58:09.0000000' AS DateTime2), 13)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (18, 3, 3, N'今日感受', N'分享一下今天的一些感受，雖然起伏不定，但是一切都在掌握當中，希望明天會更好！', NULL, CAST(N'2023-12-05T09:21:22.0000000' AS DateTime2), 100)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (19, 28, 3, N'生活中的感動', N'生活中的點點滴滴都是感動，有時候小小的事情就能夠觸動心弦，讓人感到溫暖！', NULL, CAST(N'2023-09-24T17:32:09.0000000' AS DateTime2), 81)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (20, 31, 3, N'感恩與希望', N'感恩身邊的一切，也懷抱著對未來的希望，人生充滿了各種可能性，讓我們充滿信心地向前邁進！', NULL, CAST(N'2022-10-31T12:29:06.0000000' AS DateTime2), 95)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (21, 40, 3, N'心靈寄託', N'有時候心情不好，就需要找一個寄託，讓心情得到舒緩和釋放，讓自己重新充滿活力！', NULL, CAST(N'2023-09-12T20:17:23.0000000' AS DateTime2), 11)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (22, 35, 3, N'生活中的小確幸', N'生活中的小確幸讓人感到幸福，不管是一個微笑還是一個溫暖的?抱，都是生活的美好！', NULL, CAST(N'2023-02-02T16:23:14.0000000' AS DateTime2), 12)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (23, 26, 3, N'心情放空', N'有時候放空一下自己，聽聽音樂，散散步，讓自己的心情得到放鬆，重新找回平靜！', NULL, CAST(N'2023-06-30T15:53:25.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (24, 37, 3, N'向往自由', N'內心深處，我們都向往著自由，希望有一天能夠擁有屬於自己的自由空間，盡情地飛翔！', NULL, CAST(N'2023-03-02T21:18:36.0000000' AS DateTime2), 132)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (25, 38, 3, N'心靈治癒', N'有時候，一個溫暖的擁抱，一句安慰的話語，就能夠治癒受傷的心靈，讓人重新充滿希望！', NULL, CAST(N'2022-07-02T21:15:44.0000000' AS DateTime2), 104)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (26, 29, 3, N'感慨人生', N'人生充滿了各種感慨，有時候望著窗外，心中充滿了對生活的思考和感悟！', NULL, CAST(N'2022-10-11T11:24:45.0000000' AS DateTime2), 16)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (27, 40, 3, N'夢想與現實', N'夢想是美好的，但現實卻是殘酷的，我們需要努力去實現夢想，也需要學會面對現實！', NULL, CAST(N'2023-02-22T11:27:09.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (28, 31, 3, N'心情小記', N'在這裡記錄下自己的心情，分享給大家，也許有人能夠感同身受，與你共勉！', NULL, CAST(N'2024-02-07T20:07:52.0000000' AS DateTime2), 13)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (29, 32, 3, N'感受生活', N'感受生活中的點滴美好，就像握在手中的沙子一樣，一刻不留，但留下的是美好的回憶！', NULL, CAST(N'2023-03-23T12:46:50.0000000' AS DateTime2), 1123)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (30, 33, 3, N'心靈寄託', N'有時候心情不好，就需要找一個寄託，讓心情得到舒緩和釋放，讓自己重新充滿活力！', NULL, CAST(N'2024-04-06T06:13:54.0000000' AS DateTime2), 22)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (31, 34, 3, N'懷抱希望', N'懷抱著對未來的希望，即使前路困難重重，也要勇敢地向前走，相信明天會更好！', NULL, CAST(N'2023-11-03T18:05:04.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (32, 38, 3, N'生活心得', N'生活中的點點滴滴都是生活的心得，讓我們不斷地成長和進步，讓自己的人生更加精彩！', NULL, CAST(N'2022-11-06T08:15:47.0000000' AS DateTime2), 13)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (33, 3, 5, N'探索異國風味料理', N'最近開始探索異國風味料理，嚐試了來自各個國家的美食，每一道菜都讓人驚艷不已！從泰式辣味到義式經典，每一口都是味蕾的享受！', NULL, CAST(N'2023-07-12T13:26:52.0000000' AS DateTime2), 1011)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (34, 32, 5, N'大啖鄉村風味美食', N'這個周末去了一家位於郊外的鄉村餐廳，品嚐了他們的特色美食。簡單卻美味，每一道菜都散發著濃濃的家鄉味道，讓人感受到滿滿的幸福！', NULL, CAST(N'2022-08-24T21:57:00.0000000' AS DateTime2), 85)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (35, 38, 5, N'享受美食之旅', N'計畫一場美食之旅，穿梭於不同的城市，品味各地的特色美食。從道地的地方小吃到高級的料理，每一口都是一場美味的冒險！', NULL, CAST(N'2023-11-11T18:34:57.0000000' AS DateTime2), 97)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (36, 40, 5, N'體驗家庭廚房秘方', N'最近有幸參觀了一位友人的家庭廚房，學習了他們傳承已久的家庭秘方。這些美食雖然簡單，卻充滿了家的味道，讓人回味無窮！', NULL, CAST(N'2022-05-17T17:11:58.0000000' AS DateTime2), 111)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (37, 25, 5, N'探索城市美食地圖', N'開始了一場城市美食地圖的探索之旅，發現了許多隱藏在街角的美食寶藏。每一家小店都有著獨特的味道，讓人驚喜連連！', NULL, CAST(N'2022-07-24T02:46:15.0000000' AS DateTime2), 12)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (38, 36, 5, N'迷戀地中海風味', N'最近迷戀上了地中海風味的美食，清新的海鮮搭配新鮮的蔬菜，帶來了一場味蕾的盛宴。每一道菜都充滿了陽光和活力！', NULL, CAST(N'2022-05-16T04:07:18.0000000' AS DateTime2), 105)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (39, 27, 5, N'品味山野野味料理', N'這個週末決定去山野中品味野味料理，離開城市的喧囂，享受大自然的恬靜。獨特的野味風味讓人回味無窮，仿佛能夠感受到大自然的氣息！', NULL, CAST(N'2021-09-16T07:57:31.0000000' AS DateTime2), 130)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (40, 28, 5, N'沉醉於東方美食', N'近期深深沉醉於東方美食的魅力，迷戀上了各種不同的亞洲料理。從日本的壽司到中國的火鍋，每一種風味都讓人愛不釋手！', NULL, CAST(N'2021-06-05T16:35:35.0000000' AS DateTime2), 14)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (41, 39, 5, N'探索地中海風情', N'近期開始了一場探索地中海風情的美食之旅，品嚐了許多充滿陽光味道的料理。橄欖油的香氣，番茄的鮮甜，每一道菜都是大自然的恩賜！', NULL, CAST(N'2022-07-05T19:42:41.0000000' AS DateTime2), 16)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (42, 33, 5, N'走進美味小巷', N'這個週末走進了一條小巷，發現了一家小而精致的美食店。店裡的美食雖然簡單，卻充滿了家的味道，讓人感受到溫暖和幸福！', NULL, CAST(N'2022-01-11T04:13:03.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (43, 23, 5, N'探索異國風味料理', N'最近開始探索異國風味料理，嚐試了來自各個國家的美食，每一道菜都讓人驚艷不已！從泰式辣味到義式經典，每一口都是味蕾的享受！', NULL, CAST(N'2022-05-20T08:32:07.0000000' AS DateTime2), 12)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (44, 35, 5, N'尋找食樂之旅', N'最近開始了一場尋找食樂之旅，走遍了城市的每一條街道，品嘗了各種美味佳餚，每一口都是對生活的熱愛和享受。從小巷子裡的小吃攤到高級餐廳，每一個地方都散發著獨特的魅力，讓人難以忘懷。', NULL, CAST(N'2021-08-06T12:27:22.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (45, 24, 5, N'味蕾的驚艷之旅', N'這次的味蕾之旅真是讓人驚艷不已，從清淡的湯品到香辣的火鍋，每一種口味都帶給我不同的感受和體驗。每一道菜都是廚師用心製作的絕妙之作，讓我仿佛置身於美食的海洋中，無法自拔。', NULL, CAST(N'2021-12-24T13:41:48.0000000' AS DateTime2), 8)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (46, 36, 5, N'飄香的美食之旅', N'這段時間參加了一場美食之旅，從早到晚品嘗了各種美食，從傳統的家常菜到創意的料理，每一道菜都讓我感受到了食物的魔力。美食不僅僅是填飽肚子，更是一種享受和體驗，讓我對生活充滿了熱情和期待。', NULL, CAST(N'2021-08-28T08:48:31.0000000' AS DateTime2), 99)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (47, 40, 5, N'探索美食之路', N'我是一個熱愛美食的人，喜歡探索各種不同口味的美食，從家鄉的小吃到外地的特色美食，每一種都讓我回味無窮。在這條美食之路上，我不斷地尋找著新的驚喜和感動，享受著生活帶來的每一份美味。', NULL, CAST(N'2022-03-16T08:30:59.0000000' AS DateTime2), 151)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (48, 3, 2, N'今天的話題', N'分享一個今天和朋友討論的話題，引發了很多有趣的討論！大家都有自己獨特的見解和觀點，讓這個話題變得更加豐富和有趣。希望以後還能有更多這樣的話題！', NULL, CAST(N'2023-04-19T22:27:22.0000000' AS DateTime2), 12)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (49, 22, 2, N'心情分享', N'最近心情很不錯，想和大家分享一下！希望大家也能夠有好心情，享受生活的美好！不管是工作還是生活，都要保持一顆平常心，心態開朗，才能夠更好地面對一切！', NULL, CAST(N'2021-11-11T19:20:59.0000000' AS DateTime2), 8)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (50, 33, 2, N'生活感悟', N'最近對生活有了一些新的感悟，想和大家分享一下！生活就像一場旅程，充滿了各種驚喜和挑戰，我們要學會享受每一個當下，珍惜眼前的一切，才能夠更加快樂！', NULL, CAST(N'2021-10-25T08:29:03.0000000' AS DateTime2), 9)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (51, 34, 2, N'趣味分享', N'分享一個最近發生的趣味事情，讓我笑了好久！有時候生活中的小插曲和趣事，能夠帶給我們意外的快樂和驚喜。希望這個故事也能夠讓你們笑一笑！', NULL, CAST(N'2021-08-18T07:04:22.0000000' AS DateTime2), 11)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (52, 25, 2, N'心靈鴛鴦', N'談一談心靈鴛鴦的感受，當兩個人的心靈能夠相互呼應，產生共鳴，這種感覺真是太美妙了！希望每一個人都能夠找到屬於自己的心靈伴侶，一起走過每一段人生旅程！', NULL, CAST(N'2022-04-10T21:56:23.0000000' AS DateTime2), 120)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (53, 36, 2, N'心情寫真', N'寫下今天的心情，感受到了一種莫名的寧靜和舒適。有時候，靜靜地坐下來，回想一下生活中的點點滴滴，會讓人感到心情愉悅，感慨萬千。', NULL, CAST(N'2022-12-26T09:18:27.0000000' AS DateTime2), 110)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (54, 27, 2, N'分享喜悅', N'分享一個讓我感到喜悅的瞬間，不管是小小的驚喜還是意外的收穫，都值得珍惜和分享！希望這份喜悅也能夠感染到你們，讓大家一起快樂！', NULL, CAST(N'2021-05-31T03:33:53.0000000' AS DateTime2), 1303)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (55, 38, 2, N'感情交流', N'最近和朋友進行了一次深入的感情交流，讓我們更加了解彼此，增進了感情。和朋友坦誠相待，分享心情，是一件非常美好的事情！', NULL, CAST(N'2022-07-16T20:43:23.0000000' AS DateTime2), 14)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (56, 39, 2, N'生活瑣事', N'生活中的一些瑣事，也許看似微不足道，但卻能夠觸動人心。記錄下這些瑣事，讓我們能夠更加珍惜生活中的每一個細節，感受到生活的美好！', NULL, CAST(N'2021-10-09T02:15:00.0000000' AS DateTime2), 16)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (57, 31, 2, N'回憶探索', N'回憶過去的點點滴滴，有時候會讓人感到一種溫暖和感慨。不管是美好的回憶還是遺憾，都是生活的一部分，值得我們珍藏和回味！', NULL, CAST(N'2022-01-10T03:09:00.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (58, 33, 2, N'友情寶藏', N'朋友是生活中最珍貴的寶藏，和朋友聊天，分享心情，總是能夠給人帶來無盡的快樂和溫暖。希望每一個人都能夠擁有一群知心的朋友！', NULL, CAST(N'2023-04-03T05:20:53.0000000' AS DateTime2), 12)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (59, 40, 2, N'幸福時刻', N'幸福不在於擁有多少財富，而在於能夠和心愛的人一起分享生活的點點滴滴。記錄下這些幸福時刻，讓我們能夠永遠珍藏！', NULL, CAST(N'2021-10-26T13:22:37.0000000' AS DateTime2), 11)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (60, 32, 2, N'生活心得', N'生活中的每一次經歷都是一份財富，每一次心得都值得我們去記住。分享生活心得，讓我們更加明白生活的真諦，更加感悟人生的意義！', NULL, CAST(N'2021-10-07T00:24:16.0000000' AS DateTime2), 90)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (61, 25, 2, N'情感寫照', N'用文字描繪出自己的情感世界，讓心靈得到釋放和寄託。有時候，一句話，一段文字，就能夠表達出內心深處的感受和情感！', NULL, CAST(N'2021-11-20T14:33:07.0000000' AS DateTime2), 10)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (62, 26, 2, N'靈魂對話', N'心靈的對話，是一種靈魂的交流，一種無聲的溝通。用心靈對話，感受彼此的溫暖和理解，讓彼此更加靠近，更加親密！', NULL, CAST(N'2022-11-08T01:38:21.0000000' AS DateTime2), 13)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (63, 3, 1, N'愛的微笑', N'當你微笑的時候，我的世界瞬間明亮起來，所有的煩惱和憂愁都煙消雲散了。你的笑容是我生活中最美的風景，讓我感受到了愛的溫暖和幸福。', NULL, CAST(N'2021-06-02T00:43:54.0000000' AS DateTime2), 104)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (64, 32, 1, N'心靈的共鳴', N'我們之間有著一種特殊的連結，彼此之間的心靈似乎是相互呼應的，每一個眼神、每一個微笑都在傳達著深深的情感。這份共鳴讓我感受到了愛的力量和美好。', NULL, CAST(N'2021-05-31T05:47:56.0000000' AS DateTime2), 83)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (65, 33, 1, N'愛的陪伴', N'在生活的每一個角落，都能感受到你的陪伴和支持，這份溫暖讓我感受到了愛的存在和意義。無論是喜悅還是挑戰，有你的陪伴就是最好的禮物。', NULL, CAST(N'2021-12-14T00:28:03.0000000' AS DateTime2), 90)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (66, 34, 1, N'情深意濃', N'我們的愛情是那樣的深沉和真摯，彼此之間的情感是那樣的濃烈和激動人心。這份愛讓我們彼此依偎在一起，共同面對生活的風雨，共同經歷人生的甜酸苦辣。', NULL, CAST(N'2022-07-23T19:34:49.0000000' AS DateTime2), 111)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (67, 25, 1, N'愛的承諾', N'我願意用一生的時間來陪伴你，無論是風雨還是晴天，我都會牽著你的手，永遠不離不棄。這份承諾是我對你的愛情宣言，讓我們一起走向幸福的未來。', NULL, CAST(N'2022-11-30T21:25:13.0000000' AS DateTime2), 12)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (68, 36, 1, N'愛的呼喚', N'每一次思念你，我都會感受到心中那份無法言喻的情感，彷彿是一種力量在召喚著我，讓我更加渴望和你相遇、相擁、相守。這份愛讓我心神蕩漾，讓我感受到了愛的呼喚。', NULL, CAST(N'2021-12-02T18:14:29.0000000' AS DateTime2), 1011)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (69, 27, 1, N'情深意長', N'我們的愛情是那樣的長久和持久，彼此之間的情感是那樣的深厚和真摯。無論經歷了多少風雨，我們的愛情依然堅如磐石，讓我們彼此擁有了一個永恆的家。', NULL, CAST(N'2021-12-13T18:23:15.0000000' AS DateTime2), 13)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (70, 28, 1, N'愛的渴望', N'我渴望著和你共度每一個美好的時刻，分享生活中的喜悅和感動，彼此相互扶持和鼓勵。這份渴望讓我感受到了愛的力量和美好，讓我願意為了你做任何事情。', NULL, CAST(N'2023-02-24T02:32:59.0000000' AS DateTime2), 14)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (71, 29, 1, N'愛的浪漫', N'每一次和你相遇，都是一場浪漫的冒險，每一次牽手，都是一段溫馨的故事。在愛情的世界裡，我們彼此相愛相守，一起經歷著生活的點點滴滴，共同譜寫著屬於我們的浪漫篇章。', NULL, CAST(N'2021-09-23T05:10:57.0000000' AS DateTime2), 16)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (72, 30, 1, N'愛的信念', N'我相信著愛情的力量，相信著你我之間的情感，無論遇到什麼困難和挑戰，我們都能夠攜手共渡，一起勇敢地面對，因為我們彼此的愛情是那麼的堅定和真摯。', NULL, CAST(N'2021-11-16T01:34:29.0000000' AS DateTime2), 100)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (73, 31, 1, N'愛的溫馨', N'你的一句關心，一個微笑，都能讓我感受到溫暖和幸福。你是我生命中最珍貴的人，我願意用我的一切來呵護你，愛護你，讓你永遠幸福快樂。', NULL, CAST(N'2022-05-11T19:50:39.0000000' AS DateTime2), 12)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (74, 32, 1, N'愛的誓言', N'我願意對你發誓，無論是貧窮還是富貴，健康還是疾病，我都會永遠愛著你，無條件地支持和包容你。這份誓言是我對你的承諾，讓我們一起走向幸福的未來。', NULL, CAST(N'2021-06-15T07:56:34.0000000' AS DateTime2), 121)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (75, 40, 1, N'愛的陪伴', N'在這個世界上，有一種力量能夠讓我感受到安心和溫暖，那就是你的陪伴。無論是歡笑還是淚水，我都願意和你一起走過，因為有你的陪伴，我就擁有了全世界。', NULL, CAST(N'2021-06-12T13:45:24.0000000' AS DateTime2), 16)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (76, 34, 1, N'愛的故事', N'我們的愛情就像一本精彩的故事，每一頁都充滿著驚喜和感動，每一章都是我們共同經歷的點點滴滴。讓我們一起翻開這本屬於我們的故事書，共同譜寫著屬於我們的愛情篇章。', NULL, CAST(N'2021-11-25T10:03:42.0000000' AS DateTime2), 14)
INSERT [dbo].[Posts] ([post_no], [user_no], [category_no], [title], [content], [image_url], [update_date], [view_count]) VALUES (77, 35, 1, N'愛的陽光', N'你的愛就像是一道陽光，溫暖著我的心靈，照亮著我的生活。有了你的陪伴，我感受到了生命的美好和幸福，願我們的愛情能夠永遠如此明亮和璀璨。', NULL, CAST(N'2022-02-03T08:20:20.0000000' AS DateTime2), 14)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Replies] ON 

INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (2, 2, 3, N'', CAST(N'2024-05-22T14:16:05.7590000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (3, 3, 25, N'在職場上遇到挑戰是很正常的，這也是成長的一部分。加油，你一定能克服困難！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (4, 3, 26, N'對於職場的挑戰，堅持和努力是很重要的，相信你能夠克服一切困難，取得更大的成就！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (5, 3, 27, N'挑戰是成長的機會，加油！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (6, 3, 30, N'相信自己，你一定能夠克服眼前的困難，取得更大的成就！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (7, 3, 31, N'努力和堅持是克服困難的關鍵，加油！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (8, 4, 40, N'恭喜你取得了這個成就！繼續保持好的工作狀態，為自己的職業生涯鋪平道路！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (9, 4, 26, N'這是一個了不起的成就！祝賀你的努力得到了回報，希望你能繼續保持好的工作狀態！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (10, 4, 33, N'分享成功的喜悅！希望你能繼續取得更多的成就，成為更出色的職場人才！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (11, 4, 30, N'你的努力得到了回報，繼續加油保持好的工作狀態！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (12, 4, 32, N'這是一個值得驕傲的成就！希望你能繼續努力，取得更多的成功！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (13, 5, 33, N'提升專業技能是很重要的，這將為你在職場上的發展增添更多機會！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (14, 5, 36, N'學無止境，希望你能不斷地提升自己，成為更具競爭力的職場人才！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (15, 5, 37, N'恭喜你的學習進步！相信你的努力將會得到回報，成為更優秀的職場人才！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (16, 5, 28, N'持續學習，不斷進步，這將會為你的職業生涯打下堅實的基礎！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (17, 5, 29, N'專業技能的提升是職場成功的關鍵之一，加油！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (18, 1, 25, N'分享感受是很棒的，希望你的明天更美好！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (19, 1, 30, N'感受生活中的美好是很重要的，加油！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (20, 1, 31, N'人生中的起起伏伏，都是成長的一部分，加油！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (21, 1, 40, N'希望你能充滿信心地向前邁進，明天會更好！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (22, 1, 29, N'分享感受是讓人更加親近的方式，希望你一切順利！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (23, 2, 25, N'是的，生活中的小事情往往最打動人心，加油！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (24, 2, 26, N'感動是生活中不可或缺的一部分，希望你一直能感受到溫暖！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (25, 2, 29, N'對生活心存感恩，希望你的未來充滿希望！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (26, 2, 30, N'生活中的每一個感動都值得我們珍惜，加油！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (27, 2, 32, N'小小的感動也能夠帶來巨大的溫暖，加油！', CAST(N'2024-05-23T16:50:52.1166667' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (28, 64, 25, N'感恩身邊的一切，未來充滿無限可能，加油！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (29, 64, 29, N'對未來充滿希望，勇敢地向前走，一切都會更好的！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (30, 64, 40, N'相信自己，你一定能夠克服一切困難，取得更大的成就！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (31, 64, 32, N'感恩過去，懷抱希望，未來一定更美好！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (32, 64, 33, N'感恩身邊的一切，讓我們充滿信心地向前邁進！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (33, 33, 25, N'探索異國風味料理是一個很棒的體驗，希望你能發現更多美味！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (34, 33, 26, N'這聽起來很有趣！美食之旅是一個很棒的計畫，祝你玩得開心！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (35, 33, 30, N'每種料理都有其獨特的魅力，希望你的美食之旅能夠充滿驚喜！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (36, 33, 31, N'品嚐不同國家的美食是一種文化的體驗，期待你的美食之旅！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (37, 33, 29, N'大啖美食，享受生活！祝你一路愉快！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (38, 34, 33, N'鄉村風味美食總是充滿著溫暖，希望你度過了一個美好的周末！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (39, 34, 40, N'鄉村餐廳的美食總是讓人回味無窮，期待下次再品嚐！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (40, 34, 27, N'簡單卻美味的鄉村風味，讓人感受到家的溫馨，真是美好的體驗！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (41, 34, 28, N'大啖鄉村美食，享受慢生活！期待你下次的餐廳之旅！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (42, 34, 29, N'鄉村風味的美食總是讓人回味無窮，期待你下次的分享！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (43, 35, 33, N'美食之旅一定會是一場精彩的冒險，希望你能收穫滿滿！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (44, 35, 31, N'計畫一場美食之旅是一個很棒的主意，希望你能品嚐到各種美味！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (45, 35, 30, N'每一口都是一場冒險，享受美食之旅的每一刻吧！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (46, 35, 40, N'品嚐各地美食是一種文化的體驗，期待你的美食之旅！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (47, 35, 29, N'美食之旅一定會是一段難忘的旅程，祝你玩得開心！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (48, 48, 25, N'討論有趣的話題總是很有意思的，希望你能分享更多精彩的話題！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (49, 48, 26, N'有趣的討論可以豐富生活，期待你的下一個話題！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (50, 48, 27, N'分享與朋友的討論讓生活更有意思，期待你的更多分享！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (51, 48, 28, N'有趣的話題總是能夠讓人心情愉悅，期待你的分享！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (52, 48, 29, N'分享討論讓我們更了解彼此，期待你的下一個話題！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (53, 49, 25, N'心情不錯是好事，希望你能一直保持好心情！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (54, 49, 26, N'分享好心情是很棒的，希望你的心情一直都很好！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (55, 49, 27, N'保持好心情很重要，希望你的心情一直都很好！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (56, 49, 28, N'心情愉悅是最重要的，希望你能一直保持好心情！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (57, 49, 29, N'享受生活的美好是最重要的，希望你的心情一直都很好！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (58, 50, 25, N'生活感悟讓人豁然開朗，希望你能分享更多感悟！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (59, 50, 26, N'對生活的感悟讓我們更加珍惜眼前的一切，期待你的分享！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (60, 50, 27, N'分享生活感悟是很有意義的，期待你的更多分享！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (61, 50, 28, N'生活感悟讓我們更加成熟，希望你能一直保持豁然開朗的心態！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (62, 50, 29, N'對生活的感悟讓我們更懂得珍惜，期待你的下一個分享！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (63, 18, 25, N'你的愛讓我的世界充滿了光彩，我願意為你的微笑付出一切！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (64, 18, 26, N'你的微笑是我最大的動力，願我們的愛情永恆！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (65, 18, 27, N'你的笑容是我生活中最美的風景，願我們的愛情永不褪色！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (66, 18, 28, N'你的微笑讓我感受到了愛的溫暖，願我們的愛情長存！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (67, 18, 29, N'愛你的每一天，愛你的每一個微笑，願我們的愛情永遠如初！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (68, 20, 25, N'我們之間的共鳴讓我們更加緊密，願我們的愛情天長地久！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (69, 20, 26, N'彼此的心靈相通，我們的愛情將永不磨滅！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (70, 20, 27, N'每一個眼神都是對彼此深深的愛的表達，願我們的愛情永恆不變！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (71, 20, 28, N'你的愛讓我感受到了無比的溫暖，願我們的愛情永遠綻放！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (72, 20, 29, N'我們的心靈相通，願我們的愛情永遠如初！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (73, 19, 25, N'有你的陪伴，我感到無比幸福，願我們的愛情永遠長存！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (74, 19, 26, N'你的支持是我最大的動力，願我們的愛情永恆！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (75, 19, 27, N'感謝你的陪伴和支持，願我們的愛情更加美好！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (76, 19, 28, N'你的愛是我生命中最美的禮物，願我們的愛情永不磨滅！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (77, 19, 29, N'無論喜悅還是挑戰，有你的陪伴就是我最大的幸福！', CAST(N'2024-05-23T16:50:52.1200000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (81, 11, 3, N'好了啦啦啦啦啦啊啦啦啦啦啊啦啦啦啦', CAST(N'2024-05-27T16:14:15.8470000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (82, 30, 3, N'上帝與你同在', CAST(N'2024-05-27T16:15:26.1040000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (83, 3, 3, N'是喔真的假的', CAST(N'2024-05-23T17:51:07.8870000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (84, 7, 3, N'嗨嗨嗨', CAST(N'2024-05-24T09:53:20.7780000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (86, 7, 3, N'你好 

我認同你說的', CAST(N'2024-05-27T14:43:09.4830000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (88, 7, 22, N'我可以跟你分享', CAST(N'2024-05-27T16:08:24.8240000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (89, 7, 23, N'安安你好', CAST(N'2024-05-27T16:08:52.4550000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (90, 11, 23, N'我可以跟你認識一下嗎??', CAST(N'2024-05-27T16:09:12.8380000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (91, 30, 23, N'我真心覺得很棒', CAST(N'2024-05-27T16:09:24.1420000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (92, 7, 24, N'我覺得很棒ㄟ', CAST(N'2024-05-27T16:09:48.5190000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (93, 11, 24, N'安安你好啊', CAST(N'2024-05-27T16:09:55.1530000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (94, 30, 24, N'拍拍不要哭', CAST(N'2024-05-27T16:10:15.2590000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (95, 7, 25, N'薪水多少啊', CAST(N'2024-05-27T16:11:04.3640000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (96, 11, 33, N'去溝通', CAST(N'2024-05-27T16:11:39.4170000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (97, 7, 33, N'讚讚', CAST(N'2024-05-27T16:11:58.2420000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (98, 11, 41, N'我認同你說的話，真是金玉良言', CAST(N'2024-05-27T16:12:48.3000000' AS DateTime2))
INSERT [dbo].[Replies] ([reply_no], [post_no], [user_no], [content], [update_date]) VALUES (99, 30, 41, N'養隻寵物是一個非常棒的選擇，但不要吉娃娃', CAST(N'2024-05-27T16:13:29.1890000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Replies] OFF
GO
SET IDENTITY_INSERT [dbo].[SocialPhotos] ON 

INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (1, 2, N'20240527115843_3578.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (2, 2, N'20240527115843_1119.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (3, 2, N'20240527115843_1862.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (4, 2, N'20240527115843_2942.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (9, 4, N'20240523195352_6923.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (10, 4, N'20240523195352_7334.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (11, 4, N'20240523195352_2728.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (12, 4, N'20240523195352_8828.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (13, 7, N'20240523195506_792.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (14, 7, N'20240527114329_6484.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (15, 7, N'20240523195506_6276.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (16, 7, N'20240523195506_4413.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (17, 8, N'20240523195617_1118.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (18, 8, N'20240523195617_6904.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (19, 8, N'20240523195617_569.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (20, 8, N'20240523195617_2672.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (21, 20, N'20240527105004_1449.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (22, 20, N'20240527105636_7775.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (23, 20, N'20240527105335_793.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (24, 20, N'20240527105247_5231.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (25, 21, N'20240523200125_881.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (26, 21, N'20240523200125_5864.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (27, 21, N'20240523200125_3925.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (28, 21, N'20240523200125_597.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (29, 22, N'20240523200232_6590.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (30, 22, N'20240527112901_677.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (31, 22, N'20240523200232_8924.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (32, 22, N'20240523200232_5045.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (33, 23, N'20240527115213_9971.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (34, 23, N'20240523200405_8837.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (35, 23, N'20240523200405_3888.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (36, 23, N'20240523200405_9525.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (37, 24, N'20240523200527_8712.jpeg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (38, 24, N'20240523200527_2502.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (39, 24, N'20240523200527_4470.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (40, 24, N'20240527114205_5855.jpeg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (41, 25, N'20240523200615_6257.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (42, 25, N'20240527113757_2819.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (43, 25, N'20240527113757_212.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (44, 25, N'20240523200615_4316.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (45, 26, N'20240523200707_3715.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (46, 26, N'20240523200707_3018.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (47, 26, N'20240527110322_8371.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (48, 26, N'20240527110322_4764.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (49, 27, N'20240523200759_3593.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (50, 27, N'20240523200759_7200.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (51, 27, N'20240527112112_8556.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (52, 27, N'20240523200759_888.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (53, 28, N'20240523200915_7514.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (54, 28, N'20240523200915_6020.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (55, 28, N'20240527113950_2126.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (56, 28, N'20240523200915_5462.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (57, 29, N'20240523201009_7154.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (58, 29, N'20240523201009_7726.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (59, 29, N'20240523201009_8168.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (60, 29, N'20240523201009_409.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (61, 30, N'20240523201100_3439.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (62, 30, N'20240523201100_477.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (63, 30, N'20240527114108_2563.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (64, 30, N'20240523201100_3361.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (65, 31, N'20240523201156_3012.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (66, 31, N'20240523201156_9683.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (67, 31, N'20240523201156_3426.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (68, 31, N'20240523201156_2768.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (69, 32, N'20240523201252_2447.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (70, 32, N'20240523201252_4825.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (71, 32, N'20240527110110_9721.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (72, 32, N'20240527110110_196.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (73, 33, N'20240523201352_6445.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (74, 33, N'20240523201352_2385.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (75, 33, N'20240523201352_2174.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (76, 33, N'20240523201352_8298.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (77, 34, N'20240523201448_8762.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (78, 34, N'20240523201448_560.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (79, 34, N'20240523201448_8378.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (80, 34, N'20240523201448_2652.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (81, 35, N'20240523201546_6332.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (82, 35, N'20240523201546_3960.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (83, 35, N'20240523201546_5417.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (84, 35, N'20240527111437_9531.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (85, 36, N'20240523201633_2729.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (86, 36, N'20240523201633_4064.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (87, 36, N'20240527112005_6539.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (88, 36, N'20240523201633_2173.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (89, 37, N'20240523201739_2536.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (90, 37, N'20240523201739_3195.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (91, 37, N'20240527112808_2890.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (92, 37, N'20240523201739_3609.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (93, 38, N'20240523201843_6957.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (94, 38, N'20240523201843_9900.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (95, 38, N'20240523201843_587.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (96, 38, N'20240527114818_8146.jpeg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (97, 39, N'20240523201943_9738.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (98, 39, N'20240523201943_8351.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (99, 39, N'20240523201943_8757.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (100, 39, N'20240523201943_7416.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (101, 40, N'20240523202033_2010.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (102, 40, N'20240523202033_1274.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (103, 40, N'20240523202033_5924.jpg', N'我的寵物')
GO
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (104, 40, N'20240523202033_2965.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (105, 41, N'20240523202129_5472.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (106, 41, N'20240523202129_7313.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (107, 41, N'20240523202129_976.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (108, 41, N'20240523202129_7981.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (109, 42, N'20240523202221_1237.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (110, 42, N'20240523202221_7764.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (111, 42, N'20240523202221_6544.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (112, 42, N'20240523202221_9691.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (113, 43, N'20240527115027_2041.jpeg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (114, 43, N'20240523202318_2465.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (115, 43, N'20240523202318_7834.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (116, 43, N'20240523202318_6771.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (117, 44, N'20240523202410_6917.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (118, 44, N'20240523202410_7617.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (119, 44, N'20240523202410_5603.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (120, 44, N'20240523202410_8602.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (121, 45, N'20240523202518_6033.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (122, 45, N'20240523202518_1498.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (123, 45, N'20240527114459_8844.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (124, 45, N'20240523202518_1982.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (125, 46, N'20240523202614_8015.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (126, 46, N'20240523202614_7782.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (127, 46, N'20240523202614_1414.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (128, 46, N'20240523202614_7259.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (129, 47, N'20240523202718_6113.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (130, 47, N'20240527110618_9371.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (131, 47, N'20240523202718_5113.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (132, 47, N'20240527110618_6947.jpeg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (133, 48, N'20240523202816_1043.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (134, 48, N'20240523202816_7271.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (135, 48, N'20240523202816_994.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (136, 48, N'20240523202816_6403.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (137, 49, N'20240523202918_33.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (138, 49, N'20240523202918_2380.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (139, 49, N'20240523202918_451.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (140, 49, N'20240527113419_2418.jpeg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (141, 50, N'20240527110953_1746.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (142, 50, N'20240523203032_4270.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (143, 50, N'20240523203032_5011.jpg', N'偉大紀錄')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (144, 50, N'20240523203039_8544.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (145, 51, N'20240523203142_9051.jpg', N'我的照片')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (146, 51, N'20240523203142_8742.jpg', N'旅行壯遊')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (147, 51, N'20240523203142_6471.jpg', N'我的寵物')
INSERT [dbo].[SocialPhotos] ([PhotoNo], [FKUserNo], [PhotoPath], [PhotoTheme]) VALUES (148, 51, N'20240527113242_1050.jpg', N'偉大紀錄')
SET IDENTITY_INSERT [dbo].[SocialPhotos] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateNo], [SName], [SDesc]) VALUES (1, N'申請中', N'已送出申請')
INSERT [dbo].[State] ([StateNo], [SName], [SDesc]) VALUES (2, N'待回覆', N'收到邀請')
INSERT [dbo].[State] ([StateNo], [SName], [SDesc]) VALUES (3, N'好友', N'互為好友')
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (1, N'JAVA')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (2, N'懶癌末期')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (3, N'無話不談')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (4, N'美劇')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (5, N'健身')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (6, N'韓劇')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (7, N'NBA')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (8, N'咖啡成癮')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (9, N'爬山')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (10, N'游泳')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (11, N'馬拉松')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (12, N'ABC')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (13, N'今天吃什麼')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (14, N'健行')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (15, N'打工度假')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (16, N'留學生活')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (17, N'Youtube')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (18, N'新移民')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (19, N'唱歌')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (20, N'打工')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (21, N'貓')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (22, N'狗')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (23, N'奶茶控')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (24, N'夜貓子')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (25, N'手控')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (26, N'音控')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (27, N'顏控')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (28, N'喜歡年上')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (29, N'喜歡年下')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (30, N'穩聊')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (31, N'古風')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (32, N'文青')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (33, N'愛動物')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (34, N'鬼片')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (35, N'泰拳')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (36, N'重訓')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (37, N'衝浪')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (38, N'不抽菸')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (39, N'不喝酒')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (40, N'作息規律')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (41, N'素食主義者')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (42, N'大叔')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (43, N'不會說謊')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (44, N'好相處')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (45, N'美食甜點')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (46, N'運動')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (47, N'不菸不酒')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (48, N'下廚小能手')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (49, N'真心')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (50, N'手遊')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (51, N'閱讀')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (52, N'正能量')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (53, N'脾氣好')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (54, N'陽光男孩')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (55, N'愛睡覺')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (56, N'背包客')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (57, N'野外活動')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (58, N'心理學')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (59, N'數學')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (60, N'股票')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (61, N'攝影')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (62, N'自煮')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (63, N'外食')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (64, N'影集')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (65, N'陸劇')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (66, N'找個聊得來的人')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (67, N'滑雪')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (68, N'熱愛生活')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (69, N'情感豐富')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (70, N'單身')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (71, N'刺青')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (72, N'擋車')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (73, N'傳說對決')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (74, N'園藝')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (75, N'下棋')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (76, N'棒球')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (77, N'來個說走就走的旅行')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (78, N'成人話題')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (79, N'不排除聊色')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (80, N'LOL')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (81, N'KTV')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (82, N'演戲')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (83, N'打code')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (84, N'工程師')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (85, N'樂觀')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (86, N'金融投資')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (87, N'愛音樂')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (88, N'ROCK!')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (89, N'看展')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (90, N'研究歷史')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (91, N'獨立樂團')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (92, N'韓團')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (93, N'追星')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (94, N'Y2K')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (95, N'時尚')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (96, N'reddit')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (97, N'友善食光')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (98, N'i珍食')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (99, N'小資族')
GO
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (100, N'英文')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (101, N'日文')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (102, N'生活要自己學會快樂')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (103, N'想找個互相陪伴的人')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (104, N'無釐頭')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (105, N'愛笑')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (106, N'熟了就很瘋')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (107, N'學生')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (108, N'上班族')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (109, N'創業')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (110, N'原神')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (111, N'鋼琴')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (112, N'武術')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (113, N'科技產品')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (114, N'幽默風趣')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (115, N'熱愛生活')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (116, N'瘋瘋癲癲')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (117, N'藝術家')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (118, N'可愛')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (119, N'帥氣')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (120, N'率性')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (121, N'走在夢想的路上')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (122, N'溫柔體貼')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (123, N'專一')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (124, N'老實人')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (125, N'轉職')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (126, N'設計')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (127, N'抖S')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (128, N'抖M')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (129, N'黑客')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (130, N'愛冒險')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (131, N'我都可以聊喔')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (132, N'手工藝')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (133, N'高蛋白飲食')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (134, N'佛系交友')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (135, N'討厭人多的地方')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (136, N'插畫家')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (137, N'愛發呆')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (138, N'塔羅')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (139, N'算命')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (140, N'夾娃娃')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (141, N'智性戀')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (142, N'音樂創作')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (143, N'鬼才')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (144, N'搞怪')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (145, N'跳tone')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (146, N'理性')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (147, N'感性')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (148, N'逛街')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (149, N'小酌')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (150, N'喜歡交朋友')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (151, N'害羞')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (152, N'慢熟')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (153, N'可靠')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (154, N'講幹話')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (155, N'穿搭')
INSERT [dbo].[Tags] ([TagNo], [TagName]) VALUES (156, N'電視劇')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[UserChat] ON 

INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (1, 4, 3, N'asd', CAST(N'2024-05-23T12:44:36.5706762' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (2, 3, 4, N'asdasd', CAST(N'2024-05-23T12:44:38.9342495' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (3, 3, 4, N'好帥', CAST(N'2024-05-23T12:44:46.0610840' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (4, 3, 4, N'a', CAST(N'2024-05-23T12:44:48.6765127' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (5, 3, 4, N'a', CAST(N'2024-05-23T12:44:52.2682798' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (6, 3, 4, N'a', CAST(N'2024-05-23T12:44:55.5502806' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (7, 3, 4, N'a', CAST(N'2024-05-23T12:44:56.5791666' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (8, 4, 3, N'g', CAST(N'2024-05-23T12:44:58.8530053' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (9, 4, 3, N'g', CAST(N'2024-05-23T12:44:59.6271437' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (10, 4, 3, N'g', CAST(N'2024-05-23T12:45:00.5198640' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (11, 4, 3, N'g', CAST(N'2024-05-23T12:45:01.5216470' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (12, 4, 3, N'g', CAST(N'2024-05-23T12:45:02.6516654' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (13, 4, 3, N'g', CAST(N'2024-05-23T12:45:04.7046160' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (14, 4, 3, N'g', CAST(N'2024-05-23T12:45:05.8675548' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (15, 4, 3, N'g', CAST(N'2024-05-23T12:45:06.8420200' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (16, 3, 4, N'a', CAST(N'2024-05-23T12:45:08.5674101' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (17, 3, 4, N'a', CAST(N'2024-05-23T12:45:10.6328784' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (18, 3, 4, N'a', CAST(N'2024-05-23T12:45:11.6683327' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (19, 3, 4, N'a', CAST(N'2024-05-23T12:45:12.7902652' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (20, 3, 4, N'asdasd', CAST(N'2024-05-23T12:45:46.3692580' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (21, 4, 3, N'asdasd', CAST(N'2024-05-23T12:45:48.2987337' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (22, 4, 3, N'asdasd', CAST(N'2024-05-23T12:45:50.2927643' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (23, 4, 3, N'zxczxc', CAST(N'2024-05-23T12:46:28.6858230' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (24, 7, 3, N'aaaa', CAST(N'2024-05-23T14:35:51.8148291' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (25, 3, 7, N'fffff', CAST(N'2024-05-23T14:35:54.2573946' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (26, 3, 4, N'哈囉
', CAST(N'2024-05-23T15:33:41.1201722' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (27, 4, 3, N'你好', CAST(N'2024-05-23T15:33:44.5157190' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (28, 3, 4, N'hi', CAST(N'2024-05-23T16:02:43.7898988' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (29, 4, 3, N'hihi', CAST(N'2024-05-23T16:02:49.0872756' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (30, 3, 4, N'幹', CAST(N'2024-05-23T16:02:53.5628989' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (31, 4, 3, N'去鼠', CAST(N'2024-05-23T16:03:02.7312909' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (32, 3, 4, N'低能', CAST(N'2024-05-23T16:05:33.0859182' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (33, 3, 7, N'sd', CAST(N'2024-05-24T09:48:09.2298805' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (34, 7, 3, N'sdsd', CAST(N'2024-05-24T09:48:12.9666945' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (35, 4, 3, N'000', CAST(N'2024-05-27T13:48:51.0644309' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (1035, 4, 3, N'你好啊', CAST(N'2024-05-27T14:37:05.9098976' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (1036, 3, 4, N'你好啊', CAST(N'2024-05-27T14:37:11.2491137' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (1037, 20, 3, N'哈囉', CAST(N'2024-05-27T15:39:43.7034786' AS DateTime2))
INSERT [dbo].[UserChat] ([UserChatNo], [UserNo], [FriendNo], [ChatContent], [ContentTime]) VALUES (1038, 3, 20, N'你好', CAST(N'2024-05-27T15:39:50.9987168' AS DateTime2))
SET IDENTITY_INSERT [dbo].[UserChat] OFF
GO
SET IDENTITY_INSERT [dbo].[UserImage] ON 

INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (1, 3, N'user20240520145103_4731.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (2, 3, N'user20240520145103_4598.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (3, 3, N'user20240520145103_5103.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (4, 3, N'user20240520145103_1102.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (5, 3, N'user20240520145103_1507.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (6, 3, N'user20240520145103_8560.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (7, 3, N'user20240520145103_8474.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (8, 3, N'user20240520145103_3383.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (9, 3, N'user20240520145103_6479.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (10, 3, N'user20240520145103_1141.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (11, 3, N'user20240520145103_1306.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (12, 3, N'user20240520145103_7591.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (13, 3, N'user20240520145103_3538.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (14, 3, N'user20240520145103_2965.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (15, 3, N'user20240522115518_5802.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (16, 3, N'user20240522115518_1373.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (17, 3, N'user20240522115518_7041.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (18, 3, N'user20240522115518_9511.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (19, 3, N'user20240522115518_3195.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (20, 3, N'user20240522115518_6468.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (21, 3, N'user20240522115518_4068.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (22, 3, N'user20240522115518_6335.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (23, 3, N'user20240522115518_6635.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (24, 3, N'user20240522115518_4193.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (25, 3, N'user20240522115518_9744.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (26, 3, N'user20240522115518_7873.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (27, 3, N'user20240522115518_837.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (28, 3, N'user20240522115518_7806.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (29, 3, N'user20240522115524_145.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (30, 3, N'user20240522115524_2250.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (31, 3, N'user20240522115524_5576.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (32, 3, N'user20240522115524_8429.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (33, 3, N'user20240522115524_2358.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (34, 3, N'user20240522115524_884.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (35, 3, N'user20240522115524_3356.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (36, 3, N'user20240522115524_7777.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (37, 3, N'user20240522115524_5952.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (38, 3, N'user20240522115524_3129.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (39, 3, N'user20240522115524_3979.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (40, 3, N'user20240522115524_5666.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (41, 3, N'user20240522115524_7052.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (42, 3, N'user20240522115524_873.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (43, 3, N'user20240522115532_2700.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (44, 3, N'user20240522115532_7777.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (45, 3, N'user20240522115532_7771.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (46, 3, N'user20240522115532_794.jpeg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (47, 3, N'user20240522115532_1881.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (48, 3, N'user20240522115532_8623.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (49, 3, N'user20240522115532_1577.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (50, 3, N'user20240522115532_6492.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (51, 3, N'user20240522115532_2371.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (52, 3, N'user20240522115532_6146.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (53, 3, N'user20240522115532_6960.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (54, 3, N'user20240522115532_9394.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (55, 3, N'user20240522115532_9042.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (56, 3, N'user20240522115532_344.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (57, 3, N'user20240522154914_7884.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (58, 3, N'user20240522154914_339.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (59, 3, N'user20240522154914_2305.jpg')
INSERT [dbo].[UserImage] ([UserImageNo], [UserNo], [ImagePath]) VALUES (60, 20, N'user20240523150852_4362.jpg')
SET IDENTITY_INSERT [dbo].[UserImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (2, N'aaa', N'123', N'管理員', N'manager', N'櫻木花道', N'user20240515161825_6552.jpeg', N'aa00516838@gmail.com', CAST(N'2024-07-05T00:00:00.0000000' AS DateTime2), N'0972874898', N'台南市關廟區東勢里和平路22巷9弄5號', CAST(N'2024-07-03T00:44:00.0000000' AS DateTime2), CAST(N'2024-05-27T16:04:24.9935523' AS DateTime2), 1, 3, N'O', N'ESFJ', 0, 0, 0, 1, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (3, N'bbb', N'123', N'黃勢傑', N'Neo', N'', N'user20240524133214_276.jpg', N'aa00516838@gmail.com', CAST(N'1995-07-02T00:00:00.0000000' AS DateTime2), N'0978543685', N'台南市關廟區東勢里和平路22巷9弄5號', CAST(N'2024-07-05T18:31:00.0000000' AS DateTime2), CAST(N'2024-05-27T16:13:42.8691637' AS DateTime2), 1, 13, N'', N'', 0, 0, 0, 0, 1300)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (4, N'ccc', N'123', N'黃大明', N'Zac', N'海賊王', N'user20240515162013_2950.jpg', N'aa00516838@gmail.com', CAST(N'2000-11-14T00:00:00.0000000' AS DateTime2), N'0972874898', N'台南市關廟區東勢里和平路22巷9弄5號', CAST(N'2024-06-08T08:55:00.0000000' AS DateTime2), CAST(N'2024-05-27T14:49:46.0712230' AS DateTime2), 1, 11, N'B', N'ESFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (7, N'ddd', N'123', N'黃先生', N'Zac', N'柯南', N'user20240515161155_7891.jpg', N'aa00516838@gmail.com', CAST(N'2001-02-11T00:00:00.0000000' AS DateTime2), N'0972874898', N'台南市關廟區東勢里和平路22巷9弄5號', CAST(N'2024-09-09T07:06:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:42:45.5540920' AS DateTime2), 1, 2, N'B', N'ESFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (8, N'eee', N'123', N'黃小明', N'Zac', N'夜神月', N'user20240515161901_3115.jpeg', N'aa00516838@gmail.com', CAST(N'2001-06-07T00:00:00.0000000' AS DateTime2), N'0972874898', N'台南市關廟區東勢里和平路22巷9弄5號', CAST(N'2025-01-13T02:48:00.0000000' AS DateTime2), CAST(N'2024-06-23T11:55:00.0000000' AS DateTime2), 0, 16, N'A', N'ESTP', 1, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (20, N'fff', N'123', N'陳雨欣', N'amy', N'朴寶劍', N'user20240523150852_4362.jpg', N'aa023423438@gmail.com', CAST(N'1993-06-16T00:00:00.0000000' AS DateTime2), N'0972874555', N'台南市關廟區東勢里和平路22巷9弄5號', CAST(N'2024-05-23T15:08:52.6743167' AS DateTime2), CAST(N'2024-05-27T15:51:41.8685931' AS DateTime2), 1, 13, N'O', N'ESFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (21, N'ggg', N'123', N'蔡佐廷', N'jarry', N'鳴人', N'user20240523155219_1792.jpg', N'abcf4983@gmail.com', CAST(N'2008-07-18T00:00:00.0000000' AS DateTime2), N'0975235697', N'台北市信義區松山路25號', CAST(N'2022-07-05T12:20:00.0000000' AS DateTime2), CAST(N'2024-05-23T19:58:48.8091135' AS DateTime2), 1, 6, N'AB', N'INFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (22, N'user1', N'123', N'陳宇軒', N'Ethan', N'灰原哀', N'user20240523155231_2540.jpg', N'user1@gmail.com', CAST(N'1988-12-21T00:00:00.0000000' AS DateTime2), N'0912345678', N'台中市西屯區惠來路200號', CAST(N'2022-09-15T02:30:00.0000000' AS DateTime2), CAST(N'2024-05-27T16:08:11.9635704' AS DateTime2), 1, 3, N'A', N'ENFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (23, N'user2', N'123', N'李明瑜', N'Sophia', N'野比大雄', N'user20240523155247_4441.jpg', N'user2@gmail.com', CAST(N'1995-07-02T00:00:00.0000000' AS DateTime2), N'0987654321', N'高雄市前鎮區復興路100號', CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T16:08:42.4430243' AS DateTime2), 0, 11, N'O', N'ISFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (24, N'user3', N'123', N'吳佳芸', N'Isabella', N'朝田渚', N'user20240523155301_6660.jpg', N'user3@gmail.com', CAST(N'2002-10-17T00:00:00.0000000' AS DateTime2), N'0918765432', N'新北市汐止區明峰街50號', CAST(N'2023-03-28T06:20:00.0000000' AS DateTime2), CAST(N'2024-05-27T16:09:36.0800479' AS DateTime2), 1, 11, N'AB', N'ENTJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (25, N'user4', N'123', N'張宇晴', N'Olivia', N'轟焦凍', N'user20240523155316_9301.jpg', N'user4@gmail.com', CAST(N'1990-05-29T00:00:00.0000000' AS DateTime2), N'0933221144', N'桃園市龜山區文化一路300號', CAST(N'2022-07-10T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T16:10:27.8053198' AS DateTime2), 0, 12, N'B', N'ISFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (26, N'user5', N'123', N'劉柏嘉', N'Noah', N'日向翔陽', N'user20240523155329_4356.jpg', N'user5@gmail.com', CAST(N'1999-01-11T00:00:00.0000000' AS DateTime2), N'0966887722', N'新竹市東區科技大道500號', CAST(N'2021-11-05T05:40:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:02:22.2365825' AS DateTime2), 1, 16, N'A', N'ENTP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (27, N'user6', N'123', N'陳思妍', N'Emma', N'龍崎小夜子', N'user20240523155345_476.jpg', N'user6@gmail.com', CAST(N'1992-08-06T00:00:00.0000000' AS DateTime2), N'0955443322', N'台南市永康區中華路150號', CAST(N'2022-04-20T03:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:20:59.9018535' AS DateTime2), 0, 16, N'B', N'ISFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (28, N'user7', N'123', N'王思涵', N'Liam', N'藍羽露露', N'user20240523155356_8234.jpg', N'user7@gmail.com', CAST(N'2001-03-13T00:00:00.0000000' AS DateTime2), N'0988665544', N'基隆市中正區義一路80號', CAST(N'2023-01-31T16:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:39:05.7516638' AS DateTime2), 1, 8, N'AB', N'ENFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (29, N'user8', N'123', N'林佳瑜', N'Ava', N'宮園薰', N'user20240523155408_790.jpg', N'user8@gmail.com', CAST(N'1985-09-24T00:00:00.0000000' AS DateTime2), N'0977112233', N'台北市大安區復興南路一段100號', CAST(N'2022-12-30T11:30:00.0000000' AS DateTime2), CAST(N'2024-05-23T20:09:33.0492836' AS DateTime2), 0, 6, N'O', N'INTJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (30, N'user9', N'123', N'黃俊諺', N'Jacob', N'黑子哲也', N'user20240523155422_9029.jpg', N'user9@gmail.com', CAST(N'1993-04-09T00:00:00.0000000' AS DateTime2), N'0966554433', N'新竹縣竹北市中華路500號', CAST(N'2022-06-01T14:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:40:30.4659152' AS DateTime2), 1, 6, N'A', N'ISFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (31, N'user10', N'123', N'邱郁涵', N'Emily', N'早乙女アルト', N'user20240523155433_7650.jpg', N'user10@gmail.com', CAST(N'2000-11-20T00:00:00.0000000' AS DateTime2), N'0988778899', N'台北市信義區松仁路50號', CAST(N'2023-05-15T07:00:00.0000000' AS DateTime2), CAST(N'2024-05-23T20:11:16.6881330' AS DateTime2), 0, 1, N'B', N'ENFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (32, N'user11', N'123', N'李芝嫻', N'Phyllis', N'結城明日奈', N'user20240523155446_8842.jpg', N'aabcf0983@gmail.com', CAST(N'1991-01-14T00:00:00.0000000' AS DateTime2), N'0978456123', N'新北市板橋區民生路200號', CAST(N'2023-09-12T01:45:00.0000000' AS DateTime2), CAST(N'2024-05-27T10:57:59.1755267' AS DateTime2), 1, 9, N'A', N'ENFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (33, N'user12', N'123', N'陳心慈', N'Erin', N'洛克李', N'user20240523155459_4762.jpg', N'babcf1983@gmail.com', CAST(N'1985-07-02T00:00:00.0000000' AS DateTime2), N'0936789012', N'台中市西區文心路100號', CAST(N'2023-02-27T06:22:00.0000000' AS DateTime2), CAST(N'2024-05-27T16:11:20.5591523' AS DateTime2), 0, 2, N'B', N'ISFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (34, N'user13', N'123', N'吳雅潔', N'Vivian', N'田島光明', N'user20240523155508_4398.jpg', N'cabcf2983@gmail.com', CAST(N'1998-12-26T00:00:00.0000000' AS DateTime2), N'0987654321', N'高雄市鼓山區五福路80號', CAST(N'2024-03-06T11:35:00.0000000' AS DateTime2), CAST(N'2024-05-23T20:14:04.6887982' AS DateTime2), 1, 10, N'AB', N'ENTJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (35, N'user14', N'123', N'張家瑋', N'Natalie', N'神樂', N'user20240523155606_6297.jpg', N'dabcf3983@gmail.com', CAST(N'1992-05-08T00:00:00.0000000' AS DateTime2), N'0937812456', N'台南市中西區民族路120號', CAST(N'2023-07-17T23:53:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:11:06.3230956' AS DateTime2), 0, 4, N'O', N'ISFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (36, N'user15', N'123', N'劉姿吟', N'Isabelle', N'雨宮天', N'user20240523155619_9829.jpeg', N'eabcf4983@gmail.com', CAST(N'1995-09-21T00:00:00.0000000' AS DateTime2), N'0963258741', N'桃園市桃園區樹仁路60號', CAST(N'2023-11-30T14:17:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:19:54.1949692' AS DateTime2), 1, 11, N'A', N'INFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (37, N'user16', N'123', N'蔡嘉琪', N'Evelyn', N'土萌黃', N'user20240523155633_1548.png', N'fabcf5983@gmail.com', CAST(N'1987-03-13T00:00:00.0000000' AS DateTime2), N'0912345678', N'新竹市東區學府路150號', CAST(N'2024-02-03T03:28:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:27:10.4764035' AS DateTime2), 0, 9, N'B', N'ESTJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (38, N'user17', N'123', N'林岱宜', N'Chloe', N'高木同學', N'user20240523155652_6690.jpg', N'gabcf6983@gmail.com', CAST(N'1993-08-30T00:00:00.0000000' AS DateTime2), N'0958741236', N'宜蘭縣宜蘭市民生路200號', CAST(N'2024-01-24T07:42:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:47:07.6173285' AS DateTime2), 1, 3, N'AB', N'INTP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (39, N'user18', N'123', N'施雅珊', N'Jasmine', N'岡部倫太郎', N'user20240523155829_9218.png', N'habcf7983@gmail.com', CAST(N'1991-04-17T00:00:00.0000000' AS DateTime2), N'0987123456', N'桃園市中壢區中央路150號', CAST(N'2023-10-05T10:20:00.0000000' AS DateTime2), CAST(N'2024-05-23T20:19:12.8791313' AS DateTime2), 0, 10, N'O', N'ESFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (40, N'user19', N'123', N'鄒怡婷', N'Emma', N'夏目貴志', N'user20240523155845_9627.jpg', N'iabcf8983@gmail.com', CAST(N'1989-11-28T00:00:00.0000000' AS DateTime2), N'0963852741', N'嘉義市西區民族路120號', CAST(N'2024-04-14T13:09:00.0000000' AS DateTime2), CAST(N'2024-05-23T20:19:55.2784812' AS DateTime2), 1, 10, N'A', N'ENFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (41, N'user20', N'123', N'何芷榆', N'Sophia', N'艾米莉亞', N'user20240523155858_3198.jpg', N'jabcf9983@gmail.com', CAST(N'1996-06-04T00:00:00.0000000' AS DateTime2), N'0912785634', N'屏東縣屏東市自由路80號', CAST(N'2023-12-22T05:24:00.0000000' AS DateTime2), CAST(N'2024-05-27T16:12:16.2483807' AS DateTime2), 0, 10, N'B', N'ISTJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (42, N'user21', N'123', N'陳明玉', N'Emily', N'綾波零', N'user20240523155911_2140.jpg', N'user21@gmail.com', CAST(N'1992-12-06T00:00:00.0000000' AS DateTime2), N'0912345678', N'台南市永康區中山路33號', CAST(N'2022-10-12T10:30:00.0000000' AS DateTime2), CAST(N'2024-05-23T20:21:41.9930757' AS DateTime2), 0, 2, N'A', N'ENTJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (43, N'user22', N'123', N'李佳雯', N'Jessica', N'獅子王司', N'user20240523155926_1356.jpg', N'user22@gmail.com', CAST(N'1985-07-22T00:00:00.0000000' AS DateTime2), N'0987654321', N'高雄市左營區自由二路55號', CAST(N'2021-04-18T05:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:49:27.3580157' AS DateTime2), 0, 5, N'O', N'ISFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (44, N'user23', N'123', N'吳珮瑜', N'Olivia', N'伊芙琳', N'user20240523155936_9773.png', N'user23@gmail.com', CAST(N'1998-05-15T00:00:00.0000000' AS DateTime2), N'0955123456', N'桃園市龜山區文二路77號', CAST(N'2020-09-01T14:10:00.0000000' AS DateTime2), CAST(N'2024-05-23T20:23:33.1531646' AS DateTime2), 1, 5, N'AB', N'ISFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (45, N'user24', N'123', N'黃俊賢', N'David', N'亞斯納', N'user20240523155947_1115.jpg', N'user24@gmail.com', CAST(N'1990-10-04T00:00:00.0000000' AS DateTime2), N'0933987654', N'新竹市東區中正路88號', CAST(N'2021-12-20T06:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:44:31.0795369' AS DateTime2), 1, 3, N'B', N'INTJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (46, N'user25', N'123', N'張雅涵', N'Sophia', N'芽吹', N'user20240523160000_688.jpg', N'user25@gmail.com', CAST(N'1993-03-26T00:00:00.0000000' AS DateTime2), N'0966789012', N'台中市西屯區市政北二路99號', CAST(N'2022-07-15T02:45:00.0000000' AS DateTime2), CAST(N'2024-05-23T20:25:35.1609677' AS DateTime2), 0, 11, N'A', N'ENFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (47, N'user26', N'123', N'林昱彤', N'Ryan', N'司波達也', N'user20240523160011_3111.jpg', N'user26@gmail.com', CAST(N'2000-08-10T00:00:00.0000000' AS DateTime2), N'0988765432', N'新北市汐止區新台五路一段123號', CAST(N'2021-05-30T09:15:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:04:33.2426511' AS DateTime2), 1, 8, N'O', N'ENFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (48, N'user27', N'123', N'陳巧玲', N'Lily', N'野田信', N'user20240523160022_7349.jpg', N'user27@gmail.com', CAST(N'1989-01-02T00:00:00.0000000' AS DateTime2), N'0977123456', N'彰化縣和美鎮彰美路二段77號', CAST(N'2022-02-28T12:00:00.0000000' AS DateTime2), CAST(N'2024-05-23T20:27:30.2530920' AS DateTime2), 0, 1, N'AB', N'INFP', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (49, N'user28', N'123', N'鍾佳慧', N'Cathy', N'御門涼子', N'user20240523160044_5369.jpg', N'user28@gmail.com', CAST(N'1995-06-01T00:00:00.0000000' AS DateTime2), N'0944987654', N'苗栗縣苗栗市中正路55號', CAST(N'2021-10-10T03:35:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:34:07.0491230' AS DateTime2), 0, 10, N'B', N'ISFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (50, N'user29', N'123', N'黃雅婷', N'Cindy', N'鹽見百合子', N'user20240523160101_2225.jpg', N'user29@gmail.com', CAST(N'1991-09-17T00:00:00.0000000' AS DateTime2), N'0966456789', N'嘉義市東區文化路88號', CAST(N'2022-04-05T07:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:07:14.5981745' AS DateTime2), 0, 6, N'A', N'ESFJ', 0, 0, 0, 0, 0)
INSERT [dbo].[Users] ([UserNo], [Account], [UserPassword], [UCName], [UEName], [NickName], [Avatar], [Email], [Birthday], [Phone], [UserAddress], [CreationDatetime], [LastLoginDatetime], [Gender], [GoalNo], [BloodType], [MBTI], [Suspension], [Verify], [isDelete], [isManager], [point]) VALUES (51, N'user30', N'123', N'周子瑜', N'Mia', N'羽川翼', N'user20240523160108_594.jpg', N'user30@gmail.com', CAST(N'1997-07-13T00:00:00.0000000' AS DateTime2), N'0955456789', N'屏東縣屏東市中山路66號', CAST(N'2022-01-25T01:00:00.0000000' AS DateTime2), CAST(N'2024-05-27T11:31:10.4221587' AS DateTime2), 0, 9, N'O', N'ISFP', 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (2, 7)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (2, 8)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (2, 10)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (3, 4)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (3, 5)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (3, 9)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (3, 10)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (3, 11)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (4, 56)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (4, 59)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (4, 64)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (7, 5)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (7, 8)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (7, 34)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (7, 39)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (8, 29)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (8, 33)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (8, 36)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (20, 5)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (20, 6)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (20, 10)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (20, 14)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (21, 4)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (21, 5)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (21, 9)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (22, 4)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (22, 7)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (22, 11)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (22, 19)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (23, 6)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (23, 10)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (23, 26)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (24, 43)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (24, 57)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (24, 75)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (24, 84)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (24, 91)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (25, 6)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (25, 9)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (25, 15)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (26, 4)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (26, 8)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (26, 10)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (26, 21)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (27, 6)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (27, 26)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (27, 27)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (27, 28)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (27, 60)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (27, 82)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (28, 17)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (28, 57)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (28, 59)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (28, 60)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (28, 63)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (29, 5)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (29, 9)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (29, 108)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (30, 49)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (30, 52)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (30, 67)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (31, 82)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (31, 86)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (31, 88)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (32, 4)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (32, 8)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (32, 108)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (32, 110)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (33, 83)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (33, 107)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (33, 121)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (33, 122)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (34, 85)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (34, 90)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (34, 91)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (35, 7)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (35, 21)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (35, 24)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (35, 27)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (36, 12)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (36, 14)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (36, 19)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (36, 25)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (36, 74)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (36, 94)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (37, 126)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (37, 129)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (37, 131)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (37, 132)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (37, 133)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (38, 91)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (38, 134)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (38, 155)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (39, 44)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (39, 60)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (39, 62)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (40, 18)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (40, 30)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (40, 35)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (41, 15)
GO
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (41, 38)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (41, 55)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (41, 59)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (41, 62)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (42, 36)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (42, 39)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (42, 59)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (43, 18)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (43, 34)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (43, 53)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (44, 82)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (44, 101)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (44, 113)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (45, 43)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (45, 57)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (45, 59)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (46, 86)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (46, 87)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (46, 104)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (47, 4)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (47, 8)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (47, 29)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (48, 86)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (48, 89)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (48, 91)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (49, 125)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (49, 136)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (49, 143)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (50, 5)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (50, 46)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (50, 70)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (51, 42)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (51, 47)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (51, 61)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (51, 66)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (51, 68)
INSERT [dbo].[UserTags] ([FKUserNo], [FKTagNo]) VALUES (51, 115)
GO
/****** Object:  Index [uc_favorite]    Script Date: 2024/5/27 下午 04:24:17 ******/
ALTER TABLE [dbo].[Favorites] ADD  CONSTRAINT [uc_favorite] UNIQUE NONCLUSTERED 
(
	[user_no] ASC,
	[post_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uc_like]    Script Date: 2024/5/27 下午 04:24:17 ******/
ALTER TABLE [dbo].[Likes] ADD  CONSTRAINT [uc_like] UNIQUE NONCLUSTERED 
(
	[user_no] ASC,
	[post_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uc_report]    Script Date: 2024/5/27 下午 04:24:17 ******/
ALTER TABLE [dbo].[Reports] ADD  CONSTRAINT [uc_report] UNIQUE NONCLUSTERED 
(
	[post_no] ASC,
	[user_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueUserPhoto]    Script Date: 2024/5/27 下午 04:24:17 ******/
ALTER TABLE [dbo].[SocialPhotos] ADD  CONSTRAINT [UniqueUserPhoto] UNIQUE NONCLUSTERED 
(
	[FKUserNo] ASC,
	[PhotoTheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupEvent] ADD  DEFAULT ((0)) FOR [Account]
GO
ALTER TABLE [dbo].[GroupEvent] ADD  DEFAULT ((0)) FOR [Address]
GO
ALTER TABLE [dbo].[GroupEvent] ADD  DEFAULT ((0)) FOR [point]
GO
ALTER TABLE [dbo].[Match] ADD  DEFAULT ((0)) FOR [MatchStatus]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ((0)) FOR [view_count]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Suspension]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Verify]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [isManager]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [point]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD FOREIGN KEY([HostUserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[EventParticipants]  WITH CHECK ADD FOREIGN KEY([EventNo])
REFERENCES [dbo].[Event] ([EventNo])
GO
ALTER TABLE [dbo].[EventParticipants]  WITH CHECK ADD FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[EventRegistrations]  WITH CHECK ADD FOREIGN KEY([EventNo])
REFERENCES [dbo].[Event] ([EventNo])
GO
ALTER TABLE [dbo].[EventRegistrations]  WITH CHECK ADD FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([post_no])
REFERENCES [dbo].[Posts] ([post_no])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([user_no])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[FriendState]  WITH CHECK ADD FOREIGN KEY([FriendNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[FriendState]  WITH CHECK ADD FOREIGN KEY([StateNo])
REFERENCES [dbo].[State] ([StateNo])
GO
ALTER TABLE [dbo].[FriendState]  WITH CHECK ADD FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[GroupEvent]  WITH CHECK ADD FOREIGN KEY([HostUserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[GroupItem]  WITH CHECK ADD FOREIGN KEY([EventNo])
REFERENCES [dbo].[GroupEvent] ([EventNo])
GO
ALTER TABLE [dbo].[GroupOrder]  WITH CHECK ADD FOREIGN KEY([EventNo])
REFERENCES [dbo].[GroupEvent] ([EventNo])
GO
ALTER TABLE [dbo].[GroupOrder]  WITH CHECK ADD FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[ItemSpecification]  WITH CHECK ADD FOREIGN KEY([ItemNo])
REFERENCES [dbo].[GroupItem] ([ItemNo])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([post_no])
REFERENCES [dbo].[Posts] ([post_no])
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD FOREIGN KEY([user_no])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([User1No])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD FOREIGN KEY([User2No])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[MatchChat]  WITH CHECK ADD FOREIGN KEY([FriendNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[MatchChat]  WITH CHECK ADD FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ItemNo])
REFERENCES [dbo].[GroupItem] ([ItemNo])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ItemSpec])
REFERENCES [dbo].[ItemSpecification] ([SpecNo])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderNo])
REFERENCES [dbo].[GroupOrder] ([OrderNo])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([category_no])
REFERENCES [dbo].[Categories] ([category_no])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([user_no])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[Replies]  WITH CHECK ADD FOREIGN KEY([post_no])
REFERENCES [dbo].[Posts] ([post_no])
GO
ALTER TABLE [dbo].[Replies]  WITH CHECK ADD FOREIGN KEY([user_no])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([post_no])
REFERENCES [dbo].[Posts] ([post_no])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([user_no])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[SocialPhotos]  WITH CHECK ADD FOREIGN KEY([FKUserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[UserChat]  WITH CHECK ADD FOREIGN KEY([FriendNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[UserChat]  WITH CHECK ADD FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[UserImage]  WITH CHECK ADD FOREIGN KEY([UserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([GoalNo])
REFERENCES [dbo].[Goals] ([GoalNo])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UserTags]  WITH CHECK ADD FOREIGN KEY([FKTagNo])
REFERENCES [dbo].[Tags] ([TagNo])
GO
ALTER TABLE [dbo].[UserTags]  WITH CHECK ADD FOREIGN KEY([FKUserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO
ALTER TABLE [dbo].[UserTopics]  WITH CHECK ADD FOREIGN KEY([FKTopicNo])
REFERENCES [dbo].[ChatTopics] ([TopicNo])
GO
ALTER TABLE [dbo].[UserTopics]  WITH CHECK ADD FOREIGN KEY([FKUserNo])
REFERENCES [dbo].[Users] ([UserNo])
GO

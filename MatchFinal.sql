--榆喬

CREATE TABLE Goals (
    GoalNo      INT  identity(1,1) PRIMARY KEY,
    GoalName    NVARCHAR(20)  NOT NULL,
);


--勢傑
CREATE TABLE Users(
	UserNo		int	identity(1,1)	PRIMARY KEY,
	Account		nvarchar(50)	NOT NULL,
	UserPassword	nvarchar(50)	NOT NULL,
	UCName		nvarchar(50)	NOT NULL,
	UEName		nvarchar(50)	NULL,
	NickName	nvarchar(50)	NULL,
	Avatar		nvarchar(100)	NULL,
	Email		nvarchar(100)	NULL,
	Birthday	datetime2		NULL,
	Phone		nvarchar(50)	NULL,
	UserAddress		nvarchar(300)	NULL,
	CreationDatetime	datetime2	null,	--先設null比較好操作
	LastLoginDatetime	datetime2	null,	--先設null比較好操作
	Gender		tinyint			NOT NULL,
	GoalNo		int				NULL,
	BloodType	nvarchar(10)		NULL,
	MBTI		nvarchar(20)	NULL,
	Suspension	tinyint  DEFAULT 0		NOT NULL,
	Verify		tinyint  DEFAULT 0		NOT NULL,
	isDelete    tinyint  DEFAULT 0		NOT NULL,
	isManager    tinyint  DEFAULT 0		NOT NULL,
	point		int		 DEFAULT 0		NOT NULL,
	FOREIGN KEY (goalNo) REFERENCES goals(goalNo) ON DELETE SET NULL
);

CREATE TABLE State (
    StateNo      INT    identity(1,1)     PRIMARY KEY,
    SName    NVARCHAR(20)  NOT NULL,
	SDesc    NVARCHAR(50)  NULL,
);

CREATE TABLE FriendState (
    FriendStateNo INT identity(1,1) PRIMARY KEY,
    UserNo    INT  NOT NULL,
	FriendNo    INT  NULL,
	StateNo    INT  NULL,
	FOREIGN KEY (UserNo) REFERENCES Users(UserNo),
	FOREIGN KEY (FriendNo) REFERENCES Users(UserNo),
	FOREIGN KEY (StateNo) REFERENCES State(StateNo),
);

CREATE TABLE UserImage (
    UserImageNo INT identity(1,1) PRIMARY KEY,
    UserNo    INT  NOT NULL,
	ImagePath    NVARCHAR(200)  NOT NULL,
	FOREIGN KEY (UserNo) REFERENCES Users(UserNo)
);

CREATE TABLE UserChat (
    UserChatNo INT identity(1,1) PRIMARY KEY,
    UserNo    INT  NOT NULL,
	FriendNo    INT  NOT NULL,
	ChatContent NVARCHAR(MAX) NOT NULL,
	ContentTime datetime2 null,
	FOREIGN KEY (UserNo) REFERENCES Users(UserNo),
	FOREIGN KEY (FriendNo) REFERENCES Users(UserNo)
);



--榆喬

CREATE TABLE SocialPhotos(
    PhotoNo     INT  identity(1,1) PRIMARY KEY,
    FKUserNo      INT		      NOT NULL,
    PhotoPath   NVARCHAR(200) NULL,
    PhotoTheme  NVARCHAR(30)  NOT NULL,
	FOREIGN KEY (FKUserNo) REFERENCES Users(UserNo),
	CONSTRAINT UniqueUserPhoto UNIQUE(FKUserNo, PhotoTheme)
);

CREATE TABLE Tags(
    TagNo	    INT	 identity(1,1)	PRIMARY KEY,
    TagName		NVARCHAR(30)  NOT NULL,
);


CREATE TABLE UserTags(
    FKUserNo    INT NOT NULL REFERENCES Users(UserNo),
    FKTagNo     INT NOT NULL REFERENCES Tags(TagNo),
    PRIMARY KEY (FKUserNo , FKTagNo)
)

CREATE TABLE ChatTopics(
    TopicNo	    INT	 identity(1,1)	PRIMARY KEY,
    TopicName   NVARCHAR(20)  NOT NULL,
);


CREATE TABLE UserTopics(
    FKUserNo    INT NOT NULL REFERENCES Users(UserNo),
    FKTopicNo   INT NOT NULL REFERENCES ChatTopics(TopicNo),
    PRIMARY KEY (FKUserNo , FKTopicNo)
);


CREATE TABLE Match(
    MatchNo     INT identity(1,1) PRIMARY KEY,
    User1No     INT  NOT NULL ,
    User2No     INT  NOT NULL ,
	MatchStatus INT DEFAULT 0  NOT NULL ,
	MatchedAt   DATETIME2  NOT NULL ,
	FOREIGN KEY (User1No) REFERENCES Users(UserNo),
	FOREIGN KEY (User2No) REFERENCES Users(UserNo)
);

CREATE TABLE MatchChat (
    UserChatNo INT identity(1,1) PRIMARY KEY,
    UserNo    INT  NOT NULL,
	FriendNo    INT  NOT NULL,
	ChatContent NVARCHAR(MAX) NOT NULL,
	ContentTime datetime2 null,
	FOREIGN KEY (UserNo) REFERENCES Users(UserNo),
	FOREIGN KEY (FriendNo) REFERENCES Users(UserNo)
);


--官正
CREATE TABLE GroupEvent(
    EventNo INT PRIMARY KEY IDENTITY(1,1),
    HostUserNo INT,
    Title NVARCHAR(255),
    Description NVARCHAR(500),
    StartTime DATETIME2,
    EndTime DATETIME2,
    MinTotalAmount INT,
    MinTotalQuantity INT,
    Status NVARCHAR(50),
    PaymentMethod TINYINT, -- 1為匯款 2為面交 3為點數
    Account NVARCHAR(50) DEFAULT 0, -- 有1的話才需要填寫
    Address NVARCHAR(100) DEFAULT 0, -- 有2的話才需要填寫
	point int DEFAULT 0,
    FOREIGN KEY (HostUserNo) REFERENCES Users (UserNo)
);

CREATE TABLE GroupItem(
    ItemNo INT PRIMARY KEY IDENTITY(1,1),
    EventNo INT,
    Name NVARCHAR(255),
    Price INT,
    Description NVARCHAR(500),
    ImgPath NVARCHAR(100),
    FOREIGN KEY (EventNo) REFERENCES GroupEvent (EventNo)
)

CREATE TABLE ItemSpecification(
    SpecNo INT PRIMARY KEY IDENTITY(1,1),
    ItemNo INT,
    SpecValue NVARCHAR(100),
    FOREIGN KEY (ItemNo) REFERENCES GroupItem (ItemNo)
);

CREATE TABLE GroupOrder(
    OrderNo INT PRIMARY KEY IDENTITY(1,1),
    EventNo INT,
    UserNo INT,
    PaymentMethod TINYINT,
	SetTime DATETIME2,
    FOREIGN KEY (EventNo) REFERENCES GroupEvent(EventNo),
    FOREIGN KEY (UserNo) REFERENCES Users (UserNo)
);

CREATE TABLE OrderDetail(
	DetailNo INT PRIMARY KEY IDENTITY(1,1),
	OrderNo INT,
	ItemNo INT,
	ItemQuantity INT,
	ItemSpec INT null,
	FOREIGN KEY (OrderNo) REFERENCES GroupOrder(OrderNo),
	FOREIGN KEY (ItemNo) REFERENCES GroupItem(ItemNo),
	FOREIGN KEY (ItemSpec) REFERENCES ItemSpecification(SpecNo)
);


--佐廷
-- 分類版資料表 (Categories)
CREATE TABLE Categories (
    category_no INT IDENTITY(1,1) PRIMARY KEY, -- 主鍵
    title_name NVARCHAR(50) NOT NULL, -- 分類版名稱
);

-- 文章資料表 (Posts)
CREATE TABLE Posts (
    post_no INT IDENTITY(1,1) PRIMARY KEY, -- 文章編號 主鍵 用於唯一標識每篇文章
    user_no INT, -- 外來鍵 指向發佈該文章的用戶
    category_no INT NOT NULL, -- 外來鍵，指向分類版
    title NVARCHAR(100) NOT NULL, -- 文章標題
    content NVARCHAR(MAX) NOT NULL, -- 文章內容
	image_url NVARCHAR(255), -- 圖片URL
	update_date DATETIME2, -- 更新最後日期
    view_count INT DEFAULT 0, -- 瀏覽次數
    FOREIGN KEY (user_no) REFERENCES Users(UserNo), -- 外來鍵UserNo關聯至Users表的(UserNo)
    FOREIGN KEY (category_no) REFERENCES Categories(category_no) -- 外來鍵CategoryNo，關聯至分類版資料表(CategoryNo)
);

-- 回覆資料表 (Replies)
CREATE TABLE Replies (
    reply_no INT IDENTITY(1,1) PRIMARY KEY, -- 主鍵 用於唯一標識每個回覆
    post_no INT, -- 外來鍵 指向被回覆的文章
    user_no INT, -- 外來鍵 指向發表該回覆的用戶
    content NVARCHAR(MAX) NOT NULL, -- 回覆內容
	update_date DATETIME2, -- 更新最後日期
    FOREIGN KEY (post_no) REFERENCES Posts(post_no), -- 外來鍵PostNo關聯至Posts表的(PostNo)
    FOREIGN KEY (user_no) REFERENCES Users(UserNo) -- 外來鍵UserNo關聯至Users表的(UserNo)
);

-- 檢舉資料表 (Reports) 針對文章
CREATE TABLE Reports (
    report_no INT IDENTITY(1,1) PRIMARY KEY, -- 主鍵
    post_no INT, -- 外來鍵 指向被檢舉的文章
    user_no INT, -- 外來鍵 指向檢舉該文章的用戶
    reason NVARCHAR(255) NOT NULL, -- 檢舉原因
    report_date DATETIME2, -- 檢舉日期
	CONSTRAINT uc_report UNIQUE (post_no, user_no), -- 唯一性約束，確保同一個使用者不會重複檢舉同一篇文章
    FOREIGN KEY (post_no) REFERENCES Posts(post_no), -- 外來鍵PostNo關聯至Posts表的(PostNo)
    FOREIGN KEY (user_no) REFERENCES Users(UserNo) -- 外來鍵UserNo關聯至Users表的(UserNo)
);

-- 喜歡資料表 (LikesForum) 使用者點擊喜歡的文章
CREATE TABLE LikesForum (
    like_no INT IDENTITY(1,1) PRIMARY KEY, -- 主鍵
    user_no INT, -- 外來鍵 指向點擊喜歡的使用者
    post_no INT, -- 外來鍵 指向被喜歡的文章
    CONSTRAINT uc_like UNIQUE (user_no, post_no), -- 唯一性約束，確保同一個使用者不會重複點擊喜歡同一篇文章
    FOREIGN KEY (user_no) REFERENCES Users(UserNo), -- 外來鍵UserNo關聯至Users表的(UserNo)
    FOREIGN KEY (post_no) REFERENCES Posts(post_no) -- 外來鍵PostNo關聯至Posts表的(PostNo)
);

-- 收藏資料表 (Favorites)
CREATE TABLE Favorites (
    favorite_no INT IDENTITY(1,1) PRIMARY KEY, -- 主鍵
    user_no INT, -- 外來鍵 指向收藏該文章的用戶
    post_no INT, -- 外來鍵 指向被收藏的文章 --1,2,5--split,append 
    CONSTRAINT uc_favorite UNIQUE (user_no, post_no), -- 唯一性約束，確保同一個使用者不會重複收藏同一篇文章
    FOREIGN KEY (user_no) REFERENCES Users(UserNo), -- 外來鍵UserNo關聯至Users表的(UserNo)
    FOREIGN KEY (post_no) REFERENCES Posts(post_no) -- 外來鍵PostNo關聯至Posts表的(PostNo)
);


--葵瑜
CREATE TABLE Event (
    EventNo INT identity(1,1) PRIMARY KEY,
    HostUserNo INT FOREIGN KEY REFERENCES Users(UserNo),
    Title NVARCHAR(255),
    Description NVARCHAR(MAX),
    ActivityTime DATETIME2,
    SignupStartTime DATETIME2,
    SignupEndTime DATETIME2,
    Location NVARCHAR(255),
    Status NVARCHAR(50),
	ImagePath NVARCHAR(255),
);

CREATE TABLE EventParticipants (
	EPNo INT identity(1,1) PRIMARY KEY,
    EventNo INT FOREIGN KEY REFERENCES Event(EventNo),
    UserNo INT FOREIGN KEY REFERENCES Users(UserNo),
    Status NVARCHAR(50)
);

CREATE TABLE EventRegistrations (
    RegistrationID INT PRIMARY KEY,
    EventNo INT,
    UserNo INT,
    ParticipantName NVARCHAR(50),
    ContactInfo NVARCHAR(255),
    RegistrationTime DATETIME2,
    FOREIGN KEY (EventNo) REFERENCES Event(EventNo),
    FOREIGN KEY (UserNo) REFERENCES Users(UserNo)
);

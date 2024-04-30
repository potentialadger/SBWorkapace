--榆喬


CREATE TABLE Goals (
    GoalNo      INT  identity(1,1) PRIMARY KEY,
    GoalName    NVARCHAR(20)  NOT NULL,
);


CREATE TABLE SocialPhotos(
    PhotoNo     INT  identity(1,1) PRIMARY KEY,
    UserNo      INT		      NOT NULL,
    PhotoPath   NVARCHAR(100) NULL,
    PhotoTheme  NVARCHAR(30)  NOT NULL,
	FOREIGN KEY (UserNo) REFERENCES Users(UserNo)
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
)


INSERT INTO UserTags (FKUserNo, FKTagNo)
VALUES
(3,1),(3,2),(5,3),
(6,1),(6,2),(6,3)
GO


CREATE TABLE Match(
    MatchNo     INT identity(1,1) PRIMARY KEY,
    User1No     INT  NOT NULL ,
    User2No     INT  NOT NULL ,
	MatchStatus INT  NOT NULL ,
	MatchedAt   DATETIME2  NOT NULL ,
	FOREIGN KEY (User1No) REFERENCES Users(UserNo),
	FOREIGN KEY (User2No) REFERENCES Users(UserNo)
);
--create database MedicalSystem
--select * from customer
--select permission.permissionID, permissionName, description 
--from RolePermissions join permission on permission.permissionID = RolePermissions.permissionID
--where roleID = 1;
--delete from RolePermissions where roleID = 8
--delete from Role where roleID = 8
--update staff set roleID = 2 where staffID = 2

/*SELECT * FROM Staff
select * from invoice
select * from servicePackage
SELECT * FROM [dbo].[Invoice] WHERE createdAt >= CONVERT(DATETIME, '10/02/2024', 103)
SELECT * FROM [dbo].[Invoice] WHERE createdAt BETWEEN CONVERT(DATETIME, '10/02/2024', 103) AND CONVERT(DATETIME, '16/02/2024', 103) and paymentStatus = 'Pending'
ORDER BY invoiceID OFFSET 0 ROWS FETCH NEXT 2 ROWS ONLY
select * from permission
select * from RolePermissions
update Staff set status = N'Inactive' where staffID = 1;
INSERT [dbo].[Staff] ( [fullName], [email], [password], [phone], [hireDate], [roleID], [status], [profilePicture]) VALUES ( N'Vu Thang', N'thang@gmail.com', N'thang123', N'1234567890', CONVERT(DATETIME, '15/01/2025', 103), 1, N'Active', NULL)
*/
/*delete from staff where staffID = 12

select * from staff where fullName like '%j%' and roleID = 4
--INSERT [dbo].[Staff] ( [fullName], [email], [password], [phone],[gender], [dateOfBirth],[address], [hireDate], [roleID], [status], [profilePicture]) VALUES ( N'John Smith', N'john.smith@medical.com', N'hash123', N'1234567890', N'Male', CONVERT(DATETIME, '15/01/2004', 103), N'123 Medical St',CONVERT(DATETIME, '15/01/2025', 103), 1, N'Active', NULL)
update staff
set fullName = N'Vu Thang', email = N'thang@gmail.com', password = N'123', phone='1234567890', hireDate = CONVERT(DATETIME, '15/01/2004', 103), roleID = 2, status = 'Active'
where staffID = 5
delete from staff where staffID = 6;*/
USE [MedicalSystem]
GO



/****** Object:  Table [dbo].[Categories]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[customerID] [int] NULL, 
	[staff_id] [int] NULL,
	[content] [nvarchar](max) NOT NULL,
	[status] [bit] NULL,
	[created_at] [datetime] NULL,
	[parent_comment_id] [int] NULL, -- Bình luận cha
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultation]    Script Date: 15/01/2025 9:08:13 CH ******/

/****** Object:  Table [dbo].[Customer]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[fullName] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](15) NULL,
	[address] [nvarchar](255) NULL,
	[accountStatus] [nvarchar](20) NULL,
	[registrationDate] [datetime] NULL,
	[dateOfBirth] [datetime] NULL,
	[gender] [nvarchar](10) NULL,
	[profilePicture] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Feedback]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[invoiceID] [int] NULL,
	[rating] [int] NULL,
	[comment] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[serviceType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[examinationID] [int] NULL,
	[totalAmount] [decimal](18, 2) NULL,
	[paymentStatus] [nvarchar](20) NULL,
	[paymentDate] [datetime] NULL,
	[paymentMethod] [nvarchar](50) NULL,
	[createdAt] [datetime] NULL,
	[discountID][int] Null,
PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 15/01/2025 9:08:13 CH ******/
CREATE TABLE Discount (
    discountID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    discountName NVARCHAR(255) NOT NULL,
    percentage DECIMAL(5,2) NOT NULL CHECK (percentage BETWEEN 0 AND 100),
	[status] NVARCHAR(255) NOT NULL,
);
/****** Object:  Table [dbo].[MedicalExamination]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalExamination](
	[examinationID] [int] IDENTITY(1,1) NOT NULL,
	[examinationDate] [datetime] NULL,
	[customerID] [int] NULL,
	[status] [nvarchar](20) NULL,
	[consultantID] [int] NULL,
	[notes] [nvarchar](255) NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[examinationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[recordID] [int] IDENTITY(1,1) NOT NULL,
	[examinationID] [int] NULL,
	[diagnosis] [nvarchar](255) NULL,
	[treatmentPlan] [nvarchar](255) NULL,
	[medicationsPrescribed] [nvarchar](255) NULL,
	[createdAt] [datetime] NULL,
	[notes] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[recordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[permissionID] [int] IDENTITY(1,1) NOT NULL,
	[permissionName] [nvarchar](50) NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[permissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Posts](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](255) NULL,
    [content] [nvarchar](MAX) NOT NULL,
    [created_by] [int] NOT NULL,
    [category_id] [int] NULL,
    [status] [bit] NULL,
    [image] [varbinary](max) NULL,
    [detail] [nvarchar](MAX) NOT NULL,
    [created_at] [datetime] NULL,
    [updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Professional]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professional](
	[professionalID] [int] IDENTITY(1,1) NOT NULL,
	[specialization] [nvarchar](100) NOT NULL,
	[officeHours] [nvarchar](100) NULL,
	[qualification] [nvarchar](255) NULL,
	[biography] [nvarchar](max) NULL,
	[profilePicture] [varbinary](max) NULL,
	[status] [nvarchar](20) NULL,
	[createdAt] [datetime] NULL,
	[staffID] [int] NULL,
 CONSTRAINT [PK__Professi__A734593F6505FCC1] PRIMARY KEY CLUSTERED 
(
	[professionalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[roleID] [int] NOT NULL,
	[permissionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC,
	[permissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalService]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalService](
	[examinationID] [int] NOT NULL,
	[packageID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[examinationID] ASC,
	[packageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePackage]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePackage](
	[packageID] [int] IDENTITY(1,1) NOT NULL,
	[packageName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[service_image] VARBINARY(MAX) NULL,
	[type] [nvarchar](255) NULL,
	[price] [decimal](18, 2) NULL,
	[duration] [int] NULL,
	[status] [nvarchar](10) NULL,
	[createdAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[packageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[staffID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[password] [nvarchar](255) NULL,
	[phone] [nvarchar](15) NULL,
	[gender] [nvarchar](10) NULL,
	[dateOfBirth] [datetime] NULL,
	[address] [nvarchar](255) NULL,
	[hireDate] [datetime] NULL,
	[roleID] [int] NULL,
	[status] [nvarchar](20) NULL,
	[profilePicture] [varbinary](max) NULL,
 CONSTRAINT [PK__Staff__6465E19E19C0644B] PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkingSchedule]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingSchedule](
	[scheduleID] [int] IDENTITY(1,1) NOT NULL,
	[professionalID] [int] NOT NULL,
	[dayOfWeek] [int] NULL,
	[startTime] [time](7) NULL,
	[endTime] [time](7) NULL,
	[shift] [nvarchar](50) NULL,
	[status] VARCHAR(10) DEFAULT 'On'
PRIMARY KEY CLUSTERED 
(
	[scheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfessionalLeave]    Script Date: 15/01/2025 9:08:13 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessionalLeave](
    [leaveID] [int] IDENTITY(1,1) NOT NULL,
    [professionalID] [int] NOT NULL,
    [leaveDate] [date] NOT NULL,
    [reason] [nvarchar](255) NULL,
    [status] [nvarchar](20) DEFAULT 'Pending' NOT NULL, -- Mặc định là "Đang xử lý"
    [createdAt] [datetime] DEFAULT (getdate()) NOT NULL,
PRIMARY KEY CLUSTERED 
(
    [leaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [name], [description], [status]) VALUES (1, N'General Health', N'General health topics', 1)
INSERT [dbo].[Categories] ([category_id], [name], [description], [status]) VALUES (2, N'Cardiology', N'Heart-related articles', 1)
INSERT [dbo].[Categories] ([category_id], [name], [description], [status]) VALUES (3, N'Pediatrics', N'Child health information', 1)
INSERT [dbo].[Categories] ([category_id], [name], [description], [status]) VALUES (4, N'Nutrition', N'Diet and nutrition advice', 1)
INSERT [dbo].[Categories] ([category_id], [name], [description], [status]) VALUES (5, N'Mental Health', N'Mental health resources', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 
INSERT INTO [dbo].[Comments] ([comment_id], [post_id], [customerID], [staff_id], [content], [status], [created_at], [parent_comment_id]) 
VALUES 
(1, 1, 1, NULL, N'Very informative article!', 1, CAST(N'2025-01-15T21:06:22.763' AS DateTime), NULL),
(2, 1, 2, NULL, N'Thanks for the tips', 1, CAST(N'2025-01-15T21:06:22.763' AS DateTime), NULL),
(3, 2, 3, NULL, N'This helped me understand vaccinations better', 1, CAST(N'2025-01-15T21:06:22.763' AS DateTime), NULL),
(4, 3, 4, NULL, N'Great dietary advice', 1, CAST(N'2025-01-15T21:06:22.763' AS DateTime), NULL),
(5, 4, 5, NULL, N'Really helpful mental health information', 1, CAST(N'2025-01-15T21:06:22.763' AS DateTime), NULL);
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO

SET IDENTITY_INSERT [dbo].[Customer] ON 

SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT INTO [dbo].[Customer] 
    ([customerID], [username], [password], [fullName], [email], [phone], [address], [accountStatus], [registrationDate], [dateOfBirth], [gender], [profilePicture]) 
VALUES
    (1, 'user1', '$2a$12$1Ky.jol4ETZlcjXY8DCBS.byUuIIdjeeRnpXuAiOfBMsuJ9zP1AP6', N'Nguyễn Văn A', 'user1@gmail.com', '0901234567', N'Hà Nội', 'Active', '2023-01-15', '1990-05-20', N'Male', NULL),
    (2, 'user2', '$2a$12$tvJQ7UV6f42lwMLLFkvhcOcMTuYgbcO53VlEQm5viwJCNxPzqlgvi', N'Trần Thị B', 'user2@gmail.com', '0912345678', N'Hồ Chí Minh', 'Active', '2023-02-10', '1995-07-15', N'Female', NULL),
    (3, 'user3', '$2a$12$e7EbH3z6S5SsmzZJingL2eGK0iDjvj9ELAF7cgbmV1ZTOcxF0l1pS', N'Lê Văn C', 'user3@gmail.com', '0923456789', N'Đà Nẵng', 'Inactive', '2023-03-05', '1988-09-25', N'Male', NULL),
    (4, 'user4', '$2a$12$AZeWilzcCcD/4Hm.AFP4me2cZg6Xlcq.ZmOslIM3sjoiupLMBAouq', N'Phạm Thị D', 'user4@gmail.com', '0934567890', N'Hải Phòng', 'Active', '2023-04-12', '1992-11-10', N'Female', NULL),
    (5, 'user5', '$2a$12$1/sXjyBN/zHE4RYKAtM.zOKwONP4nhTQqQQSZu91HRtMjHsflW5M2', N'Hoàng Văn E', 'user5@gmail.com', '0945678901', N'Bình Dương', 'Active', '2023-05-08', '1998-03-30', N'Male', NULL),
    (6, 'user6', '$2a$12$3/cEomXgMRghnTN3WJ8v6exC38rfCQrDJlka41ebKoxwojTuOCy4S', N'Võ Thị F', 'user6@gmail.com', '0956789012', N'Cần Thơ', 'Inactive', '2023-06-20', '1985-06-05', N'Female', NULL),
    (7, 'user7', '$2a$12$TXUy75cpgtHbUudKKASTdOlWTAUkc2BICTGNIMQeBZOlyvsDzfSvK', N'Đặng Văn G', 'user7@gmail.com', '0967890123', N'Quảng Ninh', 'Active', '2023-07-15', '1991-08-17', N'Male', NULL),
    (8, 'user8', '$2a$12$tDDUMhpUAgIMzqGyTv/6xuXa49eUGkCDOK7XCPXwn5PwCt5tEYtP.', N'Ngô Thị H', 'user8@gmail.com', '0978901234', N'Nghệ An', 'Active', '2023-08-10', '1996-12-22', N'Female', NULL),
    (9, 'user9', '$2a$12$H0gCEhMC2The4/o8XdoZuOtJF1UAR/omLPkwjVH.cJqCIkEDIjvXO', N'Bùi Văn I', 'user9@gmail.com', '0989012345', N'Đồng Nai', 'Inactive', '2023-09-18', '1987-04-12', N'Male', NULL),
    (10, 'user10', '$2a$12$5PNgoTkXTb90q9f5TzfXt.JJ1UP7/A38AW6hW39n2I.opIV96TKPi', N'Nguyễn Thị J', 'user10@gmail.com', '0990123456', N'Huế', 'Active', '2023-10-01', '1993-02-28', N'Female', NULL),
    (11, 'user11', '$2a$12$YPWH.8S8LTrRFpRF21H6TeJTJOm/S8dWGtks4KpVfAXG40snJm28C', N'Trần Văn K', 'user11@gmail.com', '0901122334', N'Hà Nam', 'Active', '2023-11-07', '1990-10-10', N'Male', NULL),
    (12, 'user12', '$2a$12$oYsMlZMKz78ThJLxHZfone.CBL3MHiIfNTPdqGCTfW.cY/BZcEo1q', N'Lê Thị L', 'user12@gmail.com', '0912233445', N'Tây Ninh', 'Inactive', '2023-12-12', '1994-07-01', N'Female', NULL),
    (13, 'user13', '$2a$12$O0yh.qDKXmvtr.taS0Paneo7/r61SStQ1XCbrktbCS4qWi738ZILK', N'Phạm Văn M', 'user13@gmail.com', '0923344556', N'Vĩnh Phúc', 'Active', '2024-01-05', '1989-11-30', N'Male', NULL),
    (14, 'user14', '$2a$12$372eMPcNSc8TdP5BgxJm0eT0pZg6sHLhWmrNfWEm4Yt3OFUo34Ftq', N'Hoàng Thị N', 'user14@gmail.com', '0934455667', N'Thanh Hóa', 'Active', '2024-01-20', '1997-06-18', N'Female', NULL),
    (15, 'user15', '$2a$12$w1lMo2t9SbZDAKCLaNcnveq9e69pDFl4ge7z21C8coT9IbrNTyP12', N'Võ Văn O', 'user15@gmail.com', '0945566778', N'Hòa Bình', 'Inactive', '2024-02-01', '1986-09-05', N'Male', NULL),
	(16, 'user16', '$2a$12$2GXjhXRcq2ntRBV42ruMNOxyB6E15iiw7hGDjEym7qT7C5UxupC2K', N'Đời Là Bể Khổ', 'user16@gmail.com', '0401234567', N'Hà Nội', 'Active', '2023-01-15', '1990-05-20', N'Male', NULL),
    (17, 'user17', '$2a$12$3RtMcZmobGewRvYJ.xx.G.hrIxfmBu8QMSPSi//G8HkODA4yG1yg6', N'Nguyễn Lê H', 'user17@gmail.com', '0122345678', N'Hồ Chí Minh', 'Active', '2023-02-10', '1995-07-15', N'Female', NULL),
    (18, 'user18', '$2a$12$//5KmNnm9qKxquAMKAa7muAuezcO9uAOHt4uruwhFtgfmSfJIEXDW', N'Hoàng THị V', 'user18@gmail.com', '0223456789', N'Đà Nẵng', 'Inactive', '2023-03-05', '1988-09-25', N'Male', NULL),
    (19, 'user19', '$2a$12$dgjyXp/qBT3w1qfx73tHw.Cz3WQCyboP5zqzURmX6FAPw8/Gn0OGG', N'Phạm Thị A', 'user19@gmail.com', '0909567890', N'Hải Phòng', 'Active', '2023-04-12', '1992-11-10', N'Female', NULL),
    (20, 'user20', '$2a$12$5exzojmS4gZTwHCRpGtXOe4KFWNroq1w8paLpqkTAQ.Mo20F3Lt5u', N'Hoàng Lê T', 'user20@gmail.com', '0921678901', N'Bình Dương', 'Active', '2023-05-08', '1998-03-30', N'Male', NULL),
    (21, 'user21', '$2a$12$gkHP9Jx0Xj4D83kXzp8MOe1RGXuDwCsiV7QSJyFJ28ooKgFuJJinu', N'Võ Thị F', 'user21@gmail.com', '0956790012', N'Cần Thơ', 'Inactive', '2023-06-20', '1985-06-05', N'Female', NULL),
    (22, 'user22', '$2a$12$rbIE2rugKJ2Skp4tFYi68utbICOkZd2OCgTbdAzVIDGxNVqgsKfzS', N'Đặng Văn G', 'user22@gmail.com', '09678320123', N'Quảng Ninh', 'Active', '2023-07-15', '1991-08-17', N'Male', NULL),
    (23, 'user23', '$2a$12$s9OOKoxJfEvaxPHC3t0qBewZ1ofAm94.Cwu7YgaIknbhfAxeFTBzK', N'Ngô Thị H', 'user23@gmail.com', '0978965234', N'Nghệ An', 'Active', '2023-08-10', '1996-12-22', N'Female', NULL),
    (24, 'user24', '$2a$12$ly./IQS4N9KXUonMWr0/6OouY48ZwkVMron87V35IeOb0Y322vGqO', N'Bùi Văn I', 'user24@gmail.com', '0989090345', N'Đồng Nai', 'Inactive', '2023-09-18', '1987-04-12', N'Male', NULL),
    (25, 'user25', '$2a$12$Ti7HeDAvaV4GRE1JsidYbulslrgiZGZfr9JG5p6j/cBUE5jnmx.lS', N'Nguyễn Thị J', 'use25@gmail.com', '0994523456', N'Huế', 'Active', '2023-10-01', '1993-02-28', N'Female', NULL),
    (26, 'user26', '$2a$12$ieqolIlkV5gQSafCdqGfieUm0YyVJ0flBZvb7AbJetRSyWMXinszW', N'Trần Văn K', 'user26@gmail.com', '0901112334', N'Hà Nam', 'Active', '2023-11-07', '1990-10-10', N'Male', NULL),
    (27, 'user27', '$2a$12$Lj5.TDuyrgHPHloRKsSncepSjmXbHDWkWmvKtVsSo1yU3tw7gDbUO', N'Lê Thị L', 'user27@gmail.com', '0912233465', N'Tây Ninh', 'Inactive', '2023-12-12', '1994-07-01', N'Female', NULL),
    (28, 'user28', '$2a$12$EipSnzgV0q/1ouqnZWLgnuEN9MdKvQVRKUUfwLdKsdQLJJYVVCKh.', N'Phạm Văn M', 'user28@gmail.com', '0923344556', N'Vĩnh Phúc', 'Active', '2024-01-05', '1989-11-30', N'Male', NULL),
    (29, 'user29', '$2a$12$rHloo.4RUCKr6Aa8HI7qweKGi6fznJPLO9iSDADwhhItR5cKuKNgS', N'Hoàng Thị N', 'user29@gmail.com', '0934452667', N'Thanh Hóa', 'Active', '2024-01-20', '1997-06-18', N'Female', NULL),
    (30, 'user30', '$2a$12$b8U2YlRUN6V4f3TddSO99u4yhRWMZlj29G25kvcjdad0D5bDLXKhG', N'Võ Văn O', 'user30@gmail.com', '0945566773', N'Hòa Bình', 'Inactive', '2024-02-01', '1986-09-05', N'Male', NULL);
SET IDENTITY_INSERT [dbo].[Customer] OFF

SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedbackID], [invoiceID], [rating], [comment], [date], [serviceType]) VALUES (1, 1, 5, N'Excellent service', CAST(N'2025-01-15T21:06:22.767' AS DateTime), N'General Checkup')
INSERT [dbo].[Feedback] ([feedbackID], [invoiceID], [rating], [comment], [date], [serviceType]) VALUES (2, 2, 4, N'Good experience', CAST(N'2025-01-15T21:06:22.767' AS DateTime), N'Specialist Consultation')
INSERT [dbo].[Feedback] ([feedbackID], [invoiceID], [rating], [comment], [date], [serviceType]) VALUES (3, 3, 5, N'Very professional', CAST(N'2025-01-15T21:06:22.767' AS DateTime), N'Pediatric Care')
INSERT [dbo].[Feedback] ([feedbackID], [invoiceID], [rating], [comment], [date], [serviceType]) VALUES (4, 4, 4, N'Helpful staff', CAST(N'2025-01-15T21:06:22.767' AS DateTime), N'General Checkup')
INSERT [dbo].[Feedback] ([feedbackID], [invoiceID], [rating], [comment], [date], [serviceType]) VALUES (5, 5, 5, N'Great care', CAST(N'2025-01-15T21:06:22.767' AS DateTime), N'Emergency Care')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT INTO [dbo].[Invoice] 
    ([invoiceID], [examinationID], [totalAmount], [paymentStatus], [paymentDate], [paymentMethod], [createdAt],[discountID]) 
VALUES
    (1, 1, 280.00, 'Paid', '2024-02-10 10:30:00', 'Credit Card', '2024-02-09 15:00:00',1),
    (2, 2, 400.00, 'Pending', NULL, NULL, '2024-02-10 08:45:00',null),
    (3, 3, 270.00, 'Paid', '2024-02-11 12:15:00', 'Cash', '2024-02-10 09:00:00',null),
    (4, 4, 300.00, 'Paid', '2024-02-12 14:00:00', 'Bank Transfer', '2024-02-11 10:20:00',null),
    (5, 5, 280.00, 'Pending', NULL, NULL, '2024-02-12 11:30:00',null),
    (6, 6, 850000, 'Paid', '2024-02-13 09:00:00', 'Credit Card', '2024-02-12 16:30:00',null),
    (7, 7, 450000, 'Paid', '2024-02-14 10:15:00', 'Cash', '2024-02-13 11:45:00',null),
    (8, 8, 700000, 'Pending', NULL, NULL, '2024-02-14 14:00:00',null),
    (9, 9, 980000, 'Paid', '2024-02-15 08:20:00', 'Bank Transfer', '2024-02-14 09:30:00',null),
    (10, 10, 600000, 'Paid', '2024-02-16 12:45:00', 'Credit Card', '2024-02-15 13:10:00',null),
    (11, 11, 550000, 'Pending', NULL, NULL, '2024-02-16 14:30:00',null),
    (12, 12, 800000, 'Paid', '2024-02-17 09:00:00', 'Cash', '2024-02-16 10:20:00',null),
    (13, 13, 950000, 'Paid', '2024-02-18 11:15:00', 'Bank Transfer', '2024-02-17 12:30:00',null),
    (14, 14, 500000, 'Pending', NULL, NULL, '2024-02-18 15:00:00',null),
    (15, 15, 750000, 'Paid', '2024-02-19 14:10:00', 'Credit Card', '2024-02-18 16:45:00',null);
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
INSERT INTO Discount (discountName, percentage,[status]) VALUES
(N'Children under 15', 20.00,N'Active'),
(N'Elderly above 60', 30.00,N'Active'),
(N'Disabled People', 40.00,N'Inactive');
SET IDENTITY_INSERT [dbo].[MedicalExamination] ON 

INSERT INTO [dbo].[MedicalExamination] 
    ([examinationID], [examinationDate], [customerID], [status], [consultantID], [notes], [createdAt]) 
VALUES
    (1, '2024-02-01', 1, 'Completed', 1, NULL, '2024-01-31'),
    (2, '2024-02-02', 2, 'Pending', 2, NULL, '2024-02-01'),
    (3, '2024-02-03', 3, 'Completed', 3, NULL, '2024-02-02'),
    (4, '2024-02-04', 4, 'In Progress', 4, NULL, '2024-02-03'),
    (5, '2024-02-05', 5, 'Completed', 5, NULL, '2024-02-04'),
    (6, '2024-02-06', 6, 'Cancelled', 3, NULL, '2024-02-05'),
    (7, '2024-02-07', 7, 'Completed', 3, NULL, '2024-02-06'),
    (8, '2024-02-08', 8, 'Pending', 3, NULL, '2024-02-07'),
    (9, '2024-02-09', 9, 'Completed', 3, NULL, '2024-02-08'),
    (10, '2024-02-10', 10, 'In Progress', 3, NULL, '2024-02-09'),
    (11, '2024-02-11', 11, 'Completed', 1, NULL, '2024-02-10'),
    (12, '2024-02-12', 12, 'Pending', 2, NULL, '2024-02-11'),
    (13, '2024-02-13', 13, 'In Progress', 3, NULL, '2024-02-12'),
    (14, '2024-02-14', 14, 'Completed', 4, NULL, '2024-02-13'),
    (15, '2024-02-15', 15, 'Cancelled', 5, NULL, '2024-02-14');
	SET IDENTITY_INSERT [dbo].[MedicalExamination] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalRecord] ON 

INSERT [dbo].[MedicalRecord] ([recordID], [examinationID], [diagnosis], [treatmentPlan], [medicationsPrescribed], [createdAt], [notes]) VALUES (1, 1, N'Healthy', N'Regular exercise and balanced diet', N'None', CAST(N'2025-01-15T21:06:22.767' AS DateTime), NULL)
INSERT [dbo].[MedicalRecord] ([recordID], [examinationID], [diagnosis], [treatmentPlan], [medicationsPrescribed], [createdAt], [notes]) VALUES (2, 2, N'Minor infection', N'Antibiotics course', N'Amoxicillin', CAST(N'2025-01-15T21:06:22.767' AS DateTime), NULL)
INSERT [dbo].[MedicalRecord] ([recordID], [examinationID], [diagnosis], [treatmentPlan], [medicationsPrescribed], [createdAt], [notes]) VALUES (3, 3, N'Regular checkup', N'Continue current routine', N'Vitamins', CAST(N'2025-01-15T21:06:22.767' AS DateTime), NULL)
INSERT [dbo].[MedicalRecord] ([recordID], [examinationID], [diagnosis], [treatmentPlan], [medicationsPrescribed], [createdAt], [notes]) VALUES (4, 4, N'Routine examination', N'Regular follow-up', N'None', CAST(N'2025-01-15T21:06:22.767' AS DateTime), NULL)
INSERT [dbo].[MedicalRecord] ([recordID], [examinationID], [diagnosis], [treatmentPlan], [medicationsPrescribed], [createdAt], [notes]) VALUES (5, 5, N'Minor injury', N'Rest and ice application', N'Ibuprofen', CAST(N'2025-01-15T21:06:22.767' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[MedicalRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 
INSERT INTO [dbo].[MedicalService] (examinationID, packageID)
VALUES 
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
INSERT [dbo].[Permission] ([permissionID], [permissionName], [description]) VALUES 
(1, N'View Appointment', N'Can view appointment of customer'),
(2, N'Create Appointment', N'Can create new appointments'),
(3, N'Edit Appointment', N'Can modify existing appointments'),
(4, N'View Invoice', N'Can view all list invoice, search by date or status'),
(5, N'Create Invoice', N'Can generate invoices for customers'),
(6, N'Edit Invoice', N'Can confirm and process payments'),
(7, N'Create Blog', N'Can create new blog posts'),
(8, N'View Blog', N'Can view blog posts'),
(9, N'Update Blog', N'Can edit existing blog posts'),
(10, N'Delete Blog', N'Can delete blog posts'),
(11, N'Create Medical Record', N'Can create new medical records'),
(12, N'View Medical Record', N'Can view patient medical history'),
(13, N'Update Medical Record', N'Can change patient medical before send to customer'),
(14, N'Delete Medical Record', N'Can delete medical before send to customer'),
(15, N'View Working Schedule', N'Can view personal working schedule'),
(16, N'Update working schedule', N'Can change attibute in appointment'),
(17, N'Create Service', N'Can create new services'),
(18, N'View Service', N'Can view service details'),
(19, N'Update Service', N'Can update existing services'),
(20, N'Delete Service', N'Can delete services'),
(21, N'View Revenue Statistics', N'Can view revenue statistics'),
(22, N'View Service Usage Statistics', N'Can view service usage statistics'),
(23, N'Create Staff', N'Can add new staff members'),
(24, N'View Staff', N'Can view staff information'),
(25, N'Update Staff', N'Can update staff details'),
(26, N'Delete Staff', N'Can remove staff members'),
(27, N'Manage Role Permissions', N'Can assign and manage role-based permissions for staff'),
(28, N'View patient', N'Can view profile of patient'),
(29, N'View Feedback', N'Can view customer feedback'),
(30, N'Answer Customer Questions', N'Can respond to customer inquiries');
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT INTO [dbo].[Posts] 
    ([post_id], [title], [content], [created_by], [category_id], [status], [image], [detail], [created_at], [updated_at]) 
VALUES
(1, N'Heart Health Tips', N'Important tips for maintaining heart health...', 1, 2, 1, NULL, 
 N'Detailed heart health guide...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(2, N'Child Vaccination Guide', N'Complete guide to child vaccinations...', 2, 3, 1, NULL, 
 N'Detailed vaccination schedule...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(3, N'Healthy Diet Basics', N'Foundation of a healthy diet...', 3, 4, 1, NULL, 
 N'Detailed diet plan...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(4, N'Mental Wellness', N'Taking care of your mental health...', 4, 5, 1, NULL, 
 N'Detailed mental wellness guide...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(5, N'Exercise Benefits', N'Why regular exercise is important...', 5, 1, 1, NULL, 
 N'Detailed exercise benefits...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(6, N'Heart Health Tips', N'Important tips for maintaining heart health...', 1, 2, 1, NULL, 
 N'Detailed heart health guide...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(7, N'Child Vaccination Guide', N'Complete guide to child vaccinations...', 2, 3, 1, NULL, 
 N'Detailed vaccination schedule...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(8, N'Healthy Diet Basics', N'Foundation of a healthy diet...', 3, 4, 1, NULL, 
 N'Detailed diet plan...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(9, N'Mental Wellness', N'Taking care of your mental health...', 4, 5, 1, NULL, 
 N'Detailed mental wellness guide...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(10, N'Exercise Benefits', N'Why regular exercise is important...', 5, 1, 1, NULL, 
 N'Detailed exercise benefits...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

 (11, N'Heart Health Tips', N'Important tips for maintaining heart health...', 1, 2, 1, NULL, 
 N'Detailed heart health guide...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(12, N'Child Vaccination Guide', N'Complete guide to child vaccinations...', 2, 3, 1, NULL, 
 N'Detailed vaccination schedule...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(13, N'Healthy Diet Basics', N'Foundation of a healthy diet...', 3, 4, 1, NULL, 
 N'Detailed diet plan...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(14, N'Mental Wellness', N'Taking care of your mental health...', 4, 5, 1, NULL, 
 N'Detailed mental wellness guide...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(15, N'Exercise Benefits', N'Why regular exercise is important...', 5, 1, 1, NULL, 
 N'Detailed exercise benefits...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

 (16, N'Heart Health Tips', N'Important tips for maintaining heart health...', 1, 2, 1, NULL, 
 N'Detailed heart health guide...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(17, N'Child Vaccination Guide', N'Complete guide to child vaccinations...', 2, 3, 1, NULL, 
 N'Detailed vaccination schedule...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(18, N'Healthy Diet Basics', N'Foundation of a healthy diet...', 3, 4, 1, NULL, 
 N'Detailed diet plan...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(19, N'Mental Wellness', N'Taking care of your mental health...', 4, 5, 1, NULL, 
 N'Detailed mental wellness guide...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime)),

(20, N'Exercise Benefits', N'Why regular exercise is important...', 5, 1, 1, NULL, 
 N'Detailed exercise benefits...', CAST(N'2025-01-15T21:06:22.763' AS DateTime), 
 CAST(N'2025-01-15T21:06:22.763' AS DateTime));

SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Professional] ON 

INSERT [dbo].[Professional] ([professionalID], [specialization], [officeHours], [qualification], [biography], [profilePicture], [status], [createdAt], [staffID]) VALUES (1, N'Cardiology',  N'9:00-17:00', N'MD, FACC', N'Experienced cardiologist', NULL, N'Active', CAST(N'2025-01-15T21:06:22.760' AS DateTime), 2)
INSERT [dbo].[Professional] ([professionalID], [specialization], [officeHours], [qualification], [biography], [profilePicture], [status], [createdAt], [staffID]) VALUES (2, N'Pediatrics',  N'8:00-16:00', N'MD, FAAP', N'Caring pediatrician', NULL, N'Active', CAST(N'2025-01-15T21:06:22.760' AS DateTime), 3)
INSERT [dbo].[Professional] ([professionalID], [specialization], [officeHours], [qualification], [biography], [profilePicture], [status], [createdAt], [staffID]) VALUES (3, N'General Medicine', N'10:00-18:00', N'MD', N'Family physician', NULL, N'Active', CAST(N'2025-01-15T21:06:22.760' AS DateTime), 1)
INSERT [dbo].[Professional] ([professionalID], [specialization], [officeHours], [qualification], [biography], [profilePicture], [status], [createdAt], [staffID]) VALUES (4, N'Neurology', N'9:00-17:00', N'MD, PhD', N'Specialist neurologist', NULL, N'Active', CAST(N'2025-01-15T21:06:22.760' AS DateTime), 4)
INSERT [dbo].[Professional] ([professionalID], [specialization], [officeHours], [qualification], [biography], [profilePicture], [status], [createdAt], [staffID]) VALUES (5, N'Dermatology',  N'8:00-16:00', N'MD, FAAD', N'Expert dermatologist', NULL, N'Active', CAST(N'2025-01-15T21:06:22.760' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[Professional] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleID], [roleName], [description]) VALUES 
(1, N'Receptionist', N'Handles customer interactions, manages appointments, and answers inquiries.'),
(2, N'Accountant', N'Processes invoices, confirms payments, and manages financial transactions.'),
(3, N'Media Manager', N'Oversees blog content creation, updates, and media management.'),
(4, N'Doctor', N'Creates medical records, views working schedule, and checks patient history.'),
(5, N'Expert', N'Handles specialized medical tasks, views schedules, and reviews medical histories.'),
(6, N'Business Director', N'Manages services, tracks revenue, and analyzes service usage statistics.'),
(7, N'HR Director', N'Oversees staff management and assigns role-based permissions.');
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RolePermissions] ([roleID], [permissionID]) VALUES 
(1, 1), (1, 2),(1, 3),
(2, 4),(2, 5),(2, 6), 
(3, 7),(3, 8),(3, 9),(3, 10),
(4, 11),(4, 12),(4, 13), 
(5, 14),(5, 15),(5, 16),
(6, 17),(6, 18),(6, 19),(6, 20), (6, 21), (6, 22),
(7, 23),(7, 24),(7, 25),(7, 26),(7, 27);
GO
SET IDENTITY_INSERT [dbo].[ServicePackage] ON 

INSERT [dbo].[ServicePackage] ([packageID], [packageName], [description],[service_image],[type], [price], [duration],[status], [createdAt]) VALUES (1, N'Basic Checkup', N'General health examination',null, N'Basic', CAST(100.00 AS Decimal(18, 2)), 30,'on', CAST(N'2025-01-15T21:06:22.763' AS DateTime))
INSERT [dbo].[ServicePackage] ([packageID], [packageName], [description],[service_image], [type], [price], [duration],[status], [createdAt]) VALUES (2, N'Comprehensive Exam', N'Full body checkup',null, N'Basic', CAST(250.00 AS Decimal(18, 2)), 60,'on', CAST(N'2025-01-15T21:06:22.763' AS DateTime))
INSERT [dbo].[ServicePackage] ([packageID], [packageName], [description],[service_image], [type], [price], [duration],[status], [createdAt]) VALUES (3, N'Specialist Consultation', N'Consultation with specialist',null, N'VIP',CAST(150.00 AS Decimal(18, 2)), 45,'on', CAST(N'2025-01-15T21:06:22.763' AS DateTime))
INSERT [dbo].[ServicePackage] ([packageID], [packageName], [description],[service_image], [type], [price], [duration],[status], [createdAt]) VALUES (4, N'Pediatric Package', N'Children''s health checkup',null, N'VIP', CAST(120.00 AS Decimal(18, 2)), 40,'on', CAST(N'2025-01-15T21:06:22.763' AS DateTime))
INSERT [dbo].[ServicePackage] ([packageID], [packageName], [description],[service_image], [type], [price], [duration],[status], [createdAt]) VALUES (5, N'Senior Care Package', N'Elderly health examination',null, N'VIP', CAST(180.00 AS Decimal(18, 2)), 50,'on', CAST(N'2025-01-15T21:06:22.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[ServicePackage] OFF
GO
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 
INSERT [dbo].[Staff] ([staffID], [fullName], [email], [password], [phone],[gender], [dateOfBirth],[address], [hireDate], [roleID], [status], [profilePicture]) VALUES (1, N'John Smith', N'john.smith@medical.com', N'$2a$12$YOWCte2qP5z28cG6D5niY.0PMgfRkWKUL.33VGD5EKXQm9gOf0Cq6', N'1234567890', N'Male', CAST(N'1980-05-15T00:00:00.000' AS DateTime), N'123 Medical St',CAST(N'2025-01-15T00:00:00.000' AS DateTime), 1, N'Active', NULL)
INSERT [dbo].[Staff] ([staffID], [fullName], [email], [password], [phone],[gender], [dateOfBirth],[address], [hireDate], [roleID], [status], [profilePicture]) VALUES (2, N'Sarah Johnson', N'sarah.j@medical.com', N'$2a$12$vLDYJBoTgFEPHSYOOFYrjuo2svDcvU12J7k2GUW/8Yo7Db3a90HT.', N'2345678901', N'Female', CAST(N'1985-03-20T00:00:00.000' AS DateTime), N'456 Health Ave', CAST(N'2025-01-15T00:00:00.000' AS DateTime), 2, N'Active', NULL)
INSERT [dbo].[Staff] ([staffID], [fullName], [email], [password], [phone],[gender], [dateOfBirth],[address], [hireDate], [roleID], [status], [profilePicture]) VALUES (3, N'Mike Wilson', N'mike.w@medical.com', N'$2a$12$XJ8vojWU9WrDqw017a3OuutmOBUxucDzbQvvpBWuhUr2/rzG2MNwG', N'3456789012',  N'Male', CAST(N'1975-08-10T00:00:00.000' AS DateTime), N'789 Care Ln',CAST(N'2025-01-15T00:00:00.000' AS DateTime), 3, N'Active', NULL)
INSERT [dbo].[Staff] ([staffID], [fullName], [email], [password], [phone],[gender], [dateOfBirth],[address], [hireDate], [roleID], [status], [profilePicture]) VALUES (4, N'Lisa Brown', N'lisa.b@medical.com', N'$2a$12$W/3DEo6mLaHUjuaVjKa.buvqRg2cFTM7GoNFZYfDTgWSOKUVrXpGq', N'4567890123', N'Female', CAST(N'1982-11-25T00:00:00.000' AS DateTime), N'321 Brain St', CAST(N'2025-01-15T00:00:00.000' AS DateTime), 4, N'Active', NULL)
INSERT [dbo].[Staff] ([staffID], [fullName], [email], [password], [phone],[gender], [dateOfBirth],[address], [hireDate], [roleID], [status], [profilePicture]) VALUES (5, N'Tom Davis', N'tom.d@medical.com', N'$2a$12$lbmLqtVstglVfdTk15FnWevbDbcZNV6UBwL3XgNiyLBDjFe/skHua', N'5678901234', N'Male', CAST(N'1988-04-30T00:00:00.000' AS DateTime), N'654 Skin Ave',CAST(N'2025-01-15T00:00:00.000' AS DateTime), 5, N'Active', NULL)
INSERT [dbo].[Staff] ([staffID], [fullName], [email], [password], [phone], [gender], [dateOfBirth], [address], [hireDate], [roleID], [status], [profilePicture]) 
VALUES 
(6, N'Emma White', N'emma.w@medical.com', N'$2a$12$nDAHZodeLNNEhYSsqBTHm.tUSj5ehAwZlwYqjUXT6HzB1ASaTyEwe', N'6789012345', N'Female', CAST(N'1990-06-12T00:00:00.000' AS DateTime), N'789 Heart St', CAST(N'2025-01-16T00:00:00.000' AS DateTime), 2, N'Active', NULL),
(7, N'James Miller', N'james.m@medical.com', N'$2a$12$bqbG6znpzvygEPqeOOaFDOH3SImdmw6CflnFTGPWvNdi.Xm079Tqm', N'7890123456', N'Male', CAST(N'1983-09-28T00:00:00.000' AS DateTime), N'456 Lung Rd', CAST(N'2025-01-16T00:00:00.000' AS DateTime), 3, N'Active', NULL),
(8, N'Alice Green', N'alice.g@medical.com', N'$2a$12$N/u5Gki05RM39pS7r5LSweY1EkWx3JqNrZlSmJpAYkIIeVnjgqlDy', N'8901234567', N'Female', CAST(N'1992-12-05T00:00:00.000' AS DateTime), N'123 Liver St', CAST(N'2025-01-17T00:00:00.000' AS DateTime), 1, N'Active', NULL),
(9, N'Robert Clark', N'robert.c@medical.com', N'$2a$12$J.Gl4sMlMPq9w2GgOesVp.hCQaZQE0lgcTSlJ2MU9l6Fm.JLI/eIi', N'9012345678', N'Male', CAST(N'1987-07-19T00:00:00.000' AS DateTime), N'321 Brain Ln', CAST(N'2025-01-17T00:00:00.000' AS DateTime), 4, N'Active', NULL),
(10, N'Sophia Adams', N'sophia.a@medical.com', N'$2a$12$u/NMdEAvKzTfOsJovMa/eOZ80xOJirIfiZxm5I1nRbH4ZE9DyuIBq', N'0123456789', N'Female', CAST(N'1995-02-14T00:00:00.000' AS DateTime), N'654 Spine Ave', CAST(N'2025-01-18T00:00:00.000' AS DateTime), 5, N'Active', NULL),
(11, N'Daniel Lewis', N'daniel.l@medical.com', N'$2a$12$DBn3OHwiEmvjGJiD4U5uG.GXDmBXDTuuXPEKhBerQmDsptcfU8hQW', N'1230987654', N'Male', CAST(N'1981-10-08T00:00:00.000' AS DateTime), N'987 Kidney Rd', CAST(N'2025-01-18T00:00:00.000' AS DateTime), 2, N'Active', NULL),
(12, N'Olivia Scott', N'olivia.s@medical.com', N'$2a$12$Fd2pbXm5tk65MAMpGtC9u.0do5MDUqnZG5ilD6t25S6bEhxTYyvaO', N'2341098765', N'Female', CAST(N'1993-05-21T00:00:00.000' AS DateTime), N'321 Nerve St', CAST(N'2025-01-19T00:00:00.000' AS DateTime), 3, N'Active', NULL),
(13, N'William Hall', N'william.h@medical.com', N'$2a$12$mytJv9kj0cTtnhcXR4wZPOqBC/aQI8DD8s/psD1SLfInnn/aoURQe', N'3452109876', N'Male', CAST(N'1984-08-31T00:00:00.000' AS DateTime), N'159 Bone Ave', CAST(N'2025-01-19T00:00:00.000' AS DateTime), 4, N'Active', NULL),
(14, N'Ava Martinez', N'ava.m@medical.com', N'$2a$12$tYKFuw43DGr9gb3z4A2Zru9Lji3tTjOloQlGGHxw8C0xxEq0g2xq.', N'4563210987', N'Female', CAST(N'1991-11-11T00:00:00.000' AS DateTime), N'753 Tissue Rd', CAST(N'2025-01-20T00:00:00.000' AS DateTime), 1, N'Active', NULL),
(15, N'Benjamin King', N'benjamin.k@medical.com', N'$2a$12$HoJv8TRG9rZFWST36zVHu.WFoSiNeKckD1HDvDHN7ZY9e6Aswx.jm', N'5674321098', N'Male', CAST(N'1986-03-03T00:00:00.000' AS DateTime), N'852 Vein Ln', CAST(N'2025-01-20T00:00:00.000' AS DateTime), 5, N'Active', NULL);
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO

SET IDENTITY_INSERT [dbo].[WorkingSchedule] ON 
INSERT [dbo].[WorkingSchedule] ([scheduleID], [professionalID], [dayOfWeek], [startTime], [endTime], [shift],[status]) VALUES (1, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time), N'MORNING',N'On')
INSERT [dbo].[WorkingSchedule] ([scheduleID], [professionalID], [dayOfWeek], [startTime], [endTime], [shift],[status]) VALUES (2, 2, 2, CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time), N'MORNING',N'On')
INSERT [dbo].[WorkingSchedule] ([scheduleID], [professionalID], [dayOfWeek], [startTime], [endTime], [shift],[status]) VALUES (3, 3, 3, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), N'AFTERNOON',N'On')
INSERT [dbo].[WorkingSchedule] ([scheduleID], [professionalID], [dayOfWeek], [startTime], [endTime], [shift],[status]) VALUES (4, 4, 4, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), N'AFTERNOON',N'On')
INSERT [dbo].[WorkingSchedule] ([scheduleID], [professionalID], [dayOfWeek], [startTime], [endTime], [shift],[status]) VALUES (5, 5, 5, CAST(N'18:00:00' AS Time), CAST(N'23:00:00' AS Time), N'EVENING',N'On')
SET IDENTITY_INSERT [dbo].[WorkingSchedule] OFF
GO
SET IDENTITY_INSERT [dbo].[ProfessionalLeave] ON
INSERT INTO [dbo].[ProfessionalLeave]
    ([leaveID], [professionalID], [leaveDate], [reason], [status], [createdAt])
VALUES
    (1, 1, '2025-03-15', N'Lý do cá nhân', 'Pending', GETDATE()),
    (2, 1, '2025-03-16', N'Lý do cá nhân', 'Approved', GETDATE()),
    (3, 2, '2025-03-20', N'Nghỉ phép thường niên', 'Pending', GETDATE()),
    (4, 2, '2025-03-21', N'Nghỉ phép thường niên', 'Pending', GETDATE()),
    (5, 3, '2025-04-10', N'Lý do sức khỏe', 'Approved', GETDATE()),
    (6, 3, '2025-04-11', N'Lý do sức khỏe', 'Approved', GETDATE()),
    (7, 4, '2025-03-25', N'Tham dự hội nghị y khoa', 'Pending', GETDATE()),
    (8, 4, '2025-03-26', N'Tham dự hội nghị y khoa', 'Rejected', GETDATE()),
    (9, 5, '2025-04-05', N'Nghỉ không lương', 'Cancelled', GETDATE()),
    (10, 5, '2025-04-06', N'Nghỉ không lương', 'Approved', GETDATE())
SET IDENTITY_INSERT [dbo].[ProfessionalLeave] OFF
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [registrationDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[MedicalExamination] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[MedicalRecord] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Professional] ADD  CONSTRAINT [DF__Professio__statu__5812160E]  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [dbo].[Professional] ADD  CONSTRAINT [DF__Professio__creat__59063A47]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[ServicePackage] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF__Staff__hireDate__60A75C0F]  DEFAULT (getdate()) FOR [hireDate]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_ParentComment] FOREIGN KEY([parent_comment_id])
REFERENCES [dbo].[Comments] ([comment_id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_ParentComment]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD CONSTRAINT [FK_Comments_Staff] FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Staff]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Posts] ([post_id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Post]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_User] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_User]
GO

ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY(invoiceID)
REFERENCES [dbo].[Invoice] ([invoiceID])
GO

GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([discountID])
REFERENCES [dbo].[Discount] ([discountID])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([examinationID])
REFERENCES [dbo].[MedicalExamination] ([examinationID])
GO

GO
ALTER TABLE [dbo].[MedicalExamination]  WITH CHECK ADD FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[MedicalExamination]  WITH CHECK ADD  CONSTRAINT [FK_MedicalExamination_Professional] FOREIGN KEY([consultantID])
REFERENCES [dbo].[Professional] ([professionalID])
GO
ALTER TABLE [dbo].[MedicalExamination] CHECK CONSTRAINT [FK_MedicalExamination_Professional]
GO
ALTER TABLE [dbo].[MedicalService]  WITH CHECK ADD FOREIGN KEY([examinationID])
REFERENCES [dbo].[MedicalExamination] ([examinationID])
GO
ALTER TABLE [dbo].[MedicalService]  WITH CHECK ADD FOREIGN KEY([packageID])
REFERENCES [dbo].[ServicePackage] ([packageID])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([examinationID])
REFERENCES [dbo].[MedicalExamination] ([examinationID])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Category]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_CreatedBy] FOREIGN KEY([created_by])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_CreatedBy]
GO
ALTER TABLE [dbo].[Professional]  WITH CHECK ADD  CONSTRAINT [FK_Professional_Staff] FOREIGN KEY([staffID])
REFERENCES [dbo].[Staff] ([staffID])
GO
ALTER TABLE [dbo].[Professional] CHECK CONSTRAINT [FK_Professional_Staff]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD FOREIGN KEY([permissionID])
REFERENCES [dbo].[Permission] ([permissionID])
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK__Staff__roleID__619B8048] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK__Staff__roleID__619B8048]
GO
ALTER TABLE [dbo].[WorkingSchedule]  WITH CHECK ADD  CONSTRAINT [FK__WorkingSc__profe__5BE2A6F2] FOREIGN KEY([professionalID])
REFERENCES [dbo].[Professional] ([professionalID])
GO
ALTER TABLE [dbo].[WorkingSchedule] CHECK CONSTRAINT [FK__WorkingSc__profe__5BE2A6F2]
GO
ALTER TABLE [dbo].[ProfessionalLeave] WITH CHECK ADD CONSTRAINT [FK_ProfessionalLeave_Professional] 
FOREIGN KEY([professionalID]) REFERENCES [dbo].[Professional] ([professionalID])
GO
ALTER TABLE [dbo].[ProfessionalLeave] CHECK CONSTRAINT [FK_ProfessionalLeave_Professional]
GO

if exists (select * from sysobjects where id = OBJECT_ID('[Grade]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [Grade]

CREATE TABLE [Grade] (
[StuNo] [nvarchar]  (8) NOT NULL,
[StuName] [nvarchar]  (6) NOT NULL,
[StuSex] [nvarchar]  (2) NOT NULL,
[StuClass] [nvarchar]  (12) NOT NULL,
[Math] [int]  NULL,
[Chs] [int]  NULL,
[En] [int]  NULL)

ALTER TABLE [Grade] WITH NOCHECK ADD  CONSTRAINT [PK_Grade] PRIMARY KEY  NONCLUSTERED ( [StuNo] )
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20100001',N'张三',N'男',N'计算机1001',66,66,66)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20100002',N'李四',N'女',N'软件工程1001',77,77,77)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20100003',N'王风和',N'男',N'计算机1001',88,88,88)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20100004',N'王五',N'男',N'计算机1002',76,87,99)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20110001',N'刘新民',N'女',N'计算机1001',77,53,77)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20110002',N'黄河',N'女',N'网络1101',67,82,74)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20110003',N'长江',N'男',N'网络1101',45,70,68)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20110004',N'泰山',N'男',N'网络1101',69,91,90)
if exists (select * from sysobjects where id = OBJECT_ID('[StuInfo]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [StuInfo]

CREATE TABLE [StuInfo] (
[StuNo] [nvarchar]  (8) NOT NULL,
[StuName] [nvarchar]  (6) NOT NULL,
[StuSex] [nvarchar]  (2) NULL,
[StuAge] [int]  NULL,
[StuPolity] [nvarchar]  (6) NULL,
[StuHome] [nvarchar]  (10) NULL)

ALTER TABLE [StuInfo] WITH NOCHECK ADD  CONSTRAINT [PK_StuInfo] PRIMARY KEY  NONCLUSTERED ( [StuNo] )
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuPolity],[StuHome]) VALUES ( N'0001',N'李四',N'男',20,N'党员',N'北京市')
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuHome]) VALUES ( N'0002',N'陈七',N'女',22,N'山东')
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuHome]) VALUES ( N'0003',N'张大民',N'男',20,N'上海市')
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuPolity],[StuHome]) VALUES ( N'0004',N'赵六',N'男',21,N'党员',N'河南省')
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuHome]) VALUES ( N'0005',N'张三',N'女',23,N'河北省')

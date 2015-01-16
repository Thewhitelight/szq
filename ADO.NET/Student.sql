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
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20100001',N'����',N'��',N'�����1001',66,66,66)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20100002',N'����',N'Ů',N'�������1001',77,77,77)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20100003',N'�����',N'��',N'�����1001',88,88,88)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20100004',N'����',N'��',N'�����1002',76,87,99)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20110001',N'������',N'Ů',N'�����1001',77,53,77)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20110002',N'�ƺ�',N'Ů',N'����1101',67,82,74)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20110003',N'����',N'��',N'����1101',45,70,68)
INSERT [Grade] ([StuNo],[StuName],[StuSex],[StuClass],[Math],[Chs],[En]) VALUES ( N'20110004',N'̩ɽ',N'��',N'����1101',69,91,90)
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
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuPolity],[StuHome]) VALUES ( N'0001',N'����',N'��',20,N'��Ա',N'������')
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuHome]) VALUES ( N'0002',N'����',N'Ů',22,N'ɽ��')
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuHome]) VALUES ( N'0003',N'�Ŵ���',N'��',20,N'�Ϻ���')
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuPolity],[StuHome]) VALUES ( N'0004',N'����',N'��',21,N'��Ա',N'����ʡ')
INSERT [StuInfo] ([StuNo],[StuName],[StuSex],[StuAge],[StuHome]) VALUES ( N'0005',N'����',N'Ů',23,N'�ӱ�ʡ')

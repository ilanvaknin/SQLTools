USE [Permissions]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [employeeId], [ADAccount], [ADGuid], [Role], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [mainPositionId]) VALUES (1, 93166, N'system', N'fa9e3959-a0aa-4a1b-acc4-74b5aa8238c6', 1, 1, CAST(N'2020-12-30T17:10:58.710' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Users] ([Id], [employeeId], [ADAccount], [ADGuid], [Role], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [mainPositionId]) VALUES (2, 93164, N'eliransh', N'dd474056-acc4-4215-8b02-df9d2bfa4e2e', 1, 1, CAST(N'2020-12-30T17:10:58.823' AS DateTime), 1, NULL, NULL, 36462)
INSERT [dbo].[Users] ([Id], [employeeId], [ADAccount], [ADGuid], [Role], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [mainPositionId]) VALUES (3, 93165, N'marinasn', N'4f6f7305-678e-4b51-b2fd-232b8081df54', 1, 1, CAST(N'2020-12-30T17:10:58.843' AS DateTime), 1, NULL, NULL, 46745)
SET IDENTITY_INSERT [dbo].[Users] OFF


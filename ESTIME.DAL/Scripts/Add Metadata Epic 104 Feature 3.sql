SET IDENTITY_INSERT [ESTIME].[tl_EstimeFileType] ON 
GO
INSERT INTO [ESTIME].[tl_EstimeFileType]
           ([Id]
		   ,[Code]
           ,[NameEnglish]
           ,[NameFrench]
           ,[FileTypeId]
           ,[ColumnDelimiterId]
           ,[SheetNumber]
           ,[IsUniform])
     VALUES
           (9
		   ,'MIPCC'
           ,'Interprovincial Migration Child CCTB'
           ,'Interprovincial Migration Child CCTB'
           ,2
           ,null
           ,null
           ,0)
GO
SET IDENTITY_INSERT [ESTIME].[tl_EstimeFileType] Off
GO

SET IDENTITY_INSERT [ESTIME].[tl_InputVariable] ON 
GO
INSERT INTO [ESTIME].[tl_InputVariable]
           ([ID]
		   ,[EstimeFileTypeId]
           ,[VariableId]
           ,[DisplayOrder]
           ,[isMandatory]
           ,[isParameter])
     VALUES
           (55, 9, 22, 1, 1, 0),
		   (56, 9, 2, 2, 1, 0),
		   (57, 9, 1, 3, 1, 0)
GO
SET IDENTITY_INSERT [ESTIME].[tl_InputVariable] Off
GO


SET IDENTITY_INSERT [ESTIME].[tl_InputCoordinate] ON 
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7250, 1, 57, 3, 54)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7251, 2, 57, 3, 55)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7252, 3, 57, 3, 56)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7253, 4, 57, 3, 57)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7254, 5, 57, 3, 58)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7255, 6, 57, 3, 59)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7256, 7, 57, 3, 60)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7257, 8, 57, 3, 61)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7258, 9, 57, 3, 62)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7259, 10, 57, 3, 63)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7260, 11, 57, 3, 64)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7261, 12, 57, 3, 65)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7262, 13, 57, 3, 66)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7263, 14, 57, 3, 77)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7264, 15, 57, 3, 78)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7265, 16, 57, 3, 79)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7266, 17, 57, 3, 80)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7267, 18, 57, 3, 81)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7268, 19, 57, 3, 82)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7269, 20, 57, 3, 83)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7270, 21, 57, 3, 84)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7271, 22, 57, 3, 85)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7272, 23, 57, 3, 86)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7273, 24, 57, 3, 87)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7274, 25, 57, 3, 88)
GO
INSERT [ESTIME].[tl_InputCoordinate] ([Id], [RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7275, 26, 57, 3, 89)
GO
SET IDENTITY_INSERT [ESTIME].[tl_InputCoordinate] OFF
GO


SET IDENTITY_INSERT [ESTIME].[tl_InputVariableValue] ON 
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42816, 1, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42818, 2, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42820, 3, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42822, 4, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42824, 5, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42826, 6, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42828, 7, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42830, 8, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42832, 9, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42834, 10, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42836, 11, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42838, 12, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42840, 13, 55, N'2')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42842, 14, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42844, 15, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42846, 16, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42848, 17, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42850, 18, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42852, 19, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42854, 20, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42856, 21, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42858, 22, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42860, 23, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42862, 24, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42864, 25, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42866, 26, 55, N'A')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42817, 1, 56, N'10')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42819, 2, 56, N'11')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42821, 3, 56, N'12')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42823, 4, 56, N'13')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42825, 5, 56, N'24')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42827, 6, 56, N'35')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42829, 7, 56, N'46')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42831, 8, 56, N'47')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42833, 9, 56, N'48')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42835, 10, 56, N'59')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42837, 11, 56, N'63')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42839, 12, 56, N'62')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42841, 13, 56, N'61')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42843, 14, 56, N'10')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42845, 15, 56, N'11')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42847, 16, 56, N'12')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42849, 17, 56, N'13')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42851, 18, 56, N'24')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42853, 19, 56, N'35')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42855, 20, 56, N'46')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42857, 21, 56, N'47')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42859, 22, 56, N'48')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42861, 23, 56, N'59')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42863, 24, 56, N'63')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42865, 25, 56, N'62')
GO
INSERT [ESTIME].[tl_InputVariableValue] ([Id], [RecordNumber], [InputVariableId], [VariableValue]) VALUES (42867, 26, 56, N'61')
GO
SET IDENTITY_INSERT [ESTIME].[tl_InputVariableValue] OFF
GO

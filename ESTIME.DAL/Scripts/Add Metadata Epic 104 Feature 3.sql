
INSERT INTO [ESTIME].[tl_EstimeFileType]
           ([Code]
           ,[NameEnglish]
           ,[NameFrench]
           ,[FileTypeId]
           ,[ColumnDelimiterId]
           ,[SheetNumber]
           ,[IsUniform])
     VALUES
           ('MIPCC'
           ,'Interprovincial Migration Child CCTB'
           ,'Interprovincial Migration Child CCTB'
           ,2
           ,null
           ,null
           ,0)

go

declare @EstimeFileTypeId int
select @EstimeFileTypeId = Id from Estime.tl_EstimeFileType where Code = 'MIPCC'

INSERT INTO [ESTIME].[tl_InputVariable]
           ([EstimeFileTypeId]
           ,[VariableId]
           ,[DisplayOrder]
           ,[isMandatory]
           ,[isParameter])
     VALUES
           (@EstimeFileTypeId, 22, 1, 1, 0),
		   (@EstimeFileTypeId, 2, 2, 1, 0),
		   (@EstimeFileTypeId, 1, 3, 1, 0)
go

declare @EstimeFileTypeId int
select @EstimeFileTypeId = Id from Estime.tl_EstimeFileType where Code = 'MIPCC'
declare @InputVariable_Value int
select @InputVariable_Value = Id from ESTIME.tl_InputVariable where EstimeFileTypeId = @EstimeFileTypeId and VariableId = 1

INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (1, @InputVariable_Value, 3, 54)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (2, @InputVariable_Value, 3, 55)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (3, @InputVariable_Value, 3, 56)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (4, @InputVariable_Value, 3, 57)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (5, @InputVariable_Value, 3, 58)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (6, @InputVariable_Value, 3, 59)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (7, @InputVariable_Value, 3, 60)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (8, @InputVariable_Value, 3, 61)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (9, @InputVariable_Value, 3, 62)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (10, @InputVariable_Value, 3, 63)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (11, @InputVariable_Value, 3, 64)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (12, @InputVariable_Value, 3, 65)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (13, @InputVariable_Value, 3, 66)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (14, @InputVariable_Value, 3, 77)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (15, @InputVariable_Value, 3, 78)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (16, @InputVariable_Value, 3, 79)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (17, @InputVariable_Value, 3, 80)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (18, @InputVariable_Value, 3, 81)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (19, @InputVariable_Value, 3, 82)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (20, @InputVariable_Value, 3, 83)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (21, @InputVariable_Value, 3, 84)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (22, @InputVariable_Value, 3, 85)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (23, @InputVariable_Value, 3, 86)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (24, @InputVariable_Value, 3, 87)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (25, @InputVariable_Value, 3, 88)
INSERT [ESTIME].[tl_InputCoordinate] ([RecordNumber], [InputVariableId], [ColumnNumber], [RowNumber]) VALUES (26, @InputVariable_Value, 3, 89)
GO

declare @EstimeFileTypeId int
select @EstimeFileTypeId = Id from Estime.tl_EstimeFileType where Code = 'MIPCC'
declare @InputVariable_Prov int, @InputVariable_Status int
select @InputVariable_Prov = Id from ESTIME.tl_InputVariable where EstimeFileTypeId = @EstimeFileTypeId and VariableId = 2
select @InputVariable_Status = Id from ESTIME.tl_InputVariable where EstimeFileTypeId = @EstimeFileTypeId and VariableId = 22

INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (1, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (2, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (3, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (4, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (5, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (6, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (7, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (8, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (9, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (10, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (11, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (12, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (13, @InputVariable_Status, N'2')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (14, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (15, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (16, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (17, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (18, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (19, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (20, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (21, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (22, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (23, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (24, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (25, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (26, @InputVariable_Status, N'A')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (1, @InputVariable_Prov, N'10')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (2, @InputVariable_Prov, N'11')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (3, @InputVariable_Prov, N'12')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (4, @InputVariable_Prov, N'13')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (5, @InputVariable_Prov, N'24')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (6, @InputVariable_Prov, N'35')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (7, @InputVariable_Prov, N'46')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (8, @InputVariable_Prov, N'47')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (9, @InputVariable_Prov, N'48')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (10, @InputVariable_Prov, N'59')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (11, @InputVariable_Prov, N'63')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (12, @InputVariable_Prov, N'62')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (13, @InputVariable_Prov, N'61')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (14, @InputVariable_Prov, N'10')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (15, @InputVariable_Prov, N'11')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (16, @InputVariable_Prov, N'12')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (17, @InputVariable_Prov, N'13')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (18, @InputVariable_Prov, N'24')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (19, @InputVariable_Prov, N'35')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (20, @InputVariable_Prov, N'46')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (21, @InputVariable_Prov, N'47')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (22, @InputVariable_Prov, N'48')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (23, @InputVariable_Prov, N'59')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (24, @InputVariable_Prov, N'63')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (25, @InputVariable_Prov, N'62')
INSERT [ESTIME].[tl_InputVariableValue] ([RecordNumber], [InputVariableId], [VariableValue]) VALUES (26, @InputVariable_Prov, N'61')

go
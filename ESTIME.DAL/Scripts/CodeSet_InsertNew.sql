--CodeSet related table

DELETE FROM ESTIME.tc_CodeMember
DELETE FROM ESTIME.tc_CodeSet
DELETE FROM ESTIME.tc_CodeSetType

DBCC CHECKIDENT("ESTIME.tc_CodeSetType", RESEED, 0)
DBCC CHECKIDENT("ESTIME.tc_CodeSet", RESEED, 0)
DBCC CHECKIDENT("ESTIME.tc_CodeMember", RESEED, 0)

INSERT INTO ESTIME.tc_CodeSetType(Code, NameEnglish, NameFrench)
VALUES('SYSTEM', 'System', NULL )

DECLARE @NewCodeSetId INTEGER
DECLARE @NewCodeMemberTopId INTEGER
DECLARE @NewCodeMemberUpId INTEGER

--GEO
INSERT INTO ESTIME.tc_CodeSet(Code, NameEnglish, NameFrench, CodeSetTypeId)
VALUES('GEO', 'Geography', NULL, 1)
SET @NewCodeSetId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('09', 'CA', 'Canada', 'Canada', @NewCodeSetId, NULL, NULL, NULL)
SET @NewCodeMemberTopId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('01', 'AT', 'Atlantic', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)
SET @NewCodeMemberUpId  = SCOPE_IDENTITY()
INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('10', 'NL', 'Newfoundland and Labrador', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId, NULL),
	('11', 'PE', 'Prince Edward Island', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId,  NULL),
	('12', 'NS', 'Nova Scotia', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId, NULL),
	('13', 'NB', 'New Brunswick', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('24', 'QC', 'Quebec', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
	('35', 'ON', 'Ontario', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('04', 'PR', 'Prairies', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)
SET @NewCodeMemberUpId  = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('46', 'MB', 'Manitoba', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId, NULL),
	('47', 'SK', 'Saskatchewan', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId, NULL),
	('48', 'AB', 'Alberta', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('59', 'BC', 'British Columbia', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('06', 'TR', 'Territories', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)
SET @NewCodeMemberUpId  = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('61', 'YT', 'Yukon', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId, NULL),
	('62', 'NT', 'Northwest Territories', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId, NULL),
	('63', 'NU', 'Nunavut', NULL, @NewCodeSetId, @NewCodeMemberUpId , @NewCodeMemberTopId, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('99', 'UN', 'Unknow', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('80', 'EX', 'Outside Canada', NULL, 1, NULL, NULL, NULL)
SET @NewCodeMemberTopId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('8001', 'US', 'United States', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
	('8002', 'OT', 'Other Countries', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

--CTBSTATUS
INSERT INTO ESTIME.tc_CodeSet(Code, NameEnglish, NameFrench, CodeSetTypeId)
VALUES('CTBSTATUS', 'CTB Status', NULL, 1)
SET @NewCodeSetId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('A', NULL, 'All', NULL, @NewCodeSetId, NULL, NULL, NULL)
SET @NewCodeMemberTopId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('1', NULL, 'Ineligible', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
	('2', NULL,  'Eligible', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
	('3', NULL,  'Entitled', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

--Count Type
INSERT INTO ESTIME.tc_CodeSet(Code, NameEnglish, NameFrench, CodeSetTypeId)
VALUES('CNTTYPE', 'Type of Count', NULL, 1)
SET @NewCodeSetId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('1', NULL, 'Family', NULL, @NewCodeSetId, NULL, NULL, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('2', NULL, 'Person', NULL, @NewCodeSetId, NULL, NULL, NULL)
SET @NewCodeMemberTopId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('3', NULL, 'Adult', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
('4', NULL, 'Child', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('5', NULL, 'Child Pre', NULL, 3, NULL, NULL, NULL),
	('6', NULL, 'Child Cur', NULL, 3, NULL, NULL, NULL)

--Family Type
INSERT INTO ESTIME.tc_CodeSet(Code, NameEnglish, NameFrench, CodeSetTypeId)
VALUES('FAMTYPE', 'Family Type', NULL, 1)
SET @NewCodeSetId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('1', NULL, 'All Family', NULL, @NewCodeSetId, NULL, NULL, NULL)
SET @NewCodeMemberTopId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('2', NULL, 'With no Children', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('3', NULL, 'With Children', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)
SET @NewCodeMemberUpId = SCOPE_IDENTITY()
DECLARE @TempCodeMemberUpId AS INTEGER 
SET @TempCodeMemberUpId = @NewCodeMemberUpId 

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('4', NULL, 'Children Age 0-17', NULL, @NewCodeSetId, @NewCodeMemberUpId, @NewCodeMemberTopId, NULL)
SET @NewCodeMemberUpId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('5', NULL, 'Children Age 0-6', NULL, @NewCodeSetId, @NewCodeMemberUpId, @NewCodeMemberTopId, NULL),
	('6', NULL, 'Children Age 7-17', NULL, @NewCodeSetId, @NewCodeMemberUpId, @NewCodeMemberTopId, NULL)

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('7', NULL, 'Children Age 18+', NULL, @NewCodeSetId, @TempCodeMemberUpId, @NewCodeMemberTopId, NULL)

--SEX
INSERT INTO ESTIME.tc_CodeSet(Code, NameEnglish, NameFrench, CodeSetTypeId)
VALUES('SEX', 'Sex', NULL, 1)
SET @NewCodeSetId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('A', NULL, 'All', NULL, @NewCodeSetId, NULL, NULL, NULL)
SET @NewCodeMemberTopId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('M', NULL, 'Male', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
	('F', NULL,  'Female', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

--Children Number
INSERT INTO ESTIME.tc_CodeSet(Code, NameEnglish, NameFrench, CodeSetTypeId)
VALUES('CHLDNUM', 'Number of Children', NULL, 1)
SET @NewCodeSetId = SCOPE_IDENTITY()
	
INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('A', NULL, 'All', NULL, @NewCodeSetId, NULL, NULL, NULL)
SET @NewCodeMemberTopId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('1', NULL, '1-Child', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
	('2', NULL,  '2-Child', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
	('3', NULL,  '3-Child', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
	('4', NULL,  '4+-Child', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

--Data Source
INSERT INTO ESTIME.tc_CodeSet(Code, NameEnglish, NameFrench, CodeSetTypeId)
VALUES('DATASRC', 'Data Source', NULL, 1)
SET @NewCodeSetId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('A', NULL, 'All', NULL, 7, NULL, NULL, NULL)
SET @NewCodeMemberTopId = SCOPE_IDENTITY()

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, NameEnglish, NameFrench, CodeSetId, AggUpId, AggTopId, DisplayOrder)
VALUES('TF', NULL, 'T1FF', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL),
	('EM', NULL,  'Emmigration', NULL, @NewCodeSetId, @NewCodeMemberTopId, @NewCodeMemberTopId, NULL)

SELECT * FROM ESTIME.tc_CodeSet
SELECT * FROM ESTIME.tc_CodeMember
USE [ESTIME_Dev]
GO

DECLARE @NewCodeSetId INTEGER
DECLARE @NewCodeMemberTopId INTEGER
DECLARE @NewCodeMemberUpId INTEGER

INSERT INTO [ESTIME].[tc_CodeSet]([Code], [CodeSetTypeId], [NameEnglish], [NameFrench])
VALUES ('AGE', 1, 'Age', NULL)
SET @NewCodeSetId = SCOPE_IDENTITY()

UPDATE ESTIME.tl_Variable
SET CodeSetId = @NewCodeSetId
where Code = 'AGE';

DECLARE @AgeVal INT = 0

INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
VALUES('A', NULL, @NewCodeSetId, 'All', NULL, NULL, NULL);
SET @NewCodeMemberTopId = SCOPE_IDENTITY();

WHILE (@AgeVal <= 121)
BEGIN
	IF (@AgeVal = 0)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES('CHILD', '0-17', @NewCodeSetId, 'Child 0 to 17', NULL, NULL, NULL);
		SET @NewCodeMemberTopId = SCOPE_IDENTITY();
		SET @NewCodeMemberUpId = SCOPE_IDENTITY();

		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES('C05', '0-5', @NewCodeSetId, '5 and under', NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
		SET @NewCodeMemberUpId = SCOPE_IDENTITY();
	END

	IF (@AgeVal < 6)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES(@AgeVal, NULL, @NewCodeSetId, @AgeVal, NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
	END

	IF (@AgeVal = 6)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES('C617', '6-17', @NewCodeSetId, '6 to 17', NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
		SET @NewCodeMemberUpId = SCOPE_IDENTITY();
	END

	IF (@AgeVal >= 6 AND @AgeVal < 18)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES(@AgeVal, NULL, @NewCodeSetId, @AgeVal, NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
	END

	IF (@AgeVal = 18)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES('ADULT', '18Plus', @NewCodeSetId, 'Adult 18 - 121', NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
		SET @NewCodeMemberTopId = SCOPE_IDENTITY();
		SET @NewCodeMemberUpId = SCOPE_IDENTITY();

		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES('A1824', '18-24', @NewCodeSetId, '18 - 24', NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
		SET @NewCodeMemberUpId = SCOPE_IDENTITY();
	END

	IF (@AgeVal >= 18 AND @AgeVal < 25)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES(@AgeVal, NULL, @NewCodeSetId, @AgeVal, NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
	END

	IF (@AgeVal = 25)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES('A2544', '25-44', @NewCodeSetId, '25 to 44', NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
		SET @NewCodeMemberUpId = SCOPE_IDENTITY();
	END

	IF (@AgeVal >= 25 AND @AgeVal < 45)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES(@AgeVal, NULL, @NewCodeSetId, @AgeVal, NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
	END

	IF (@AgeVal = 45)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES('A4564', '45-64', @NewCodeSetId, '45 to 64', NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
		SET @NewCodeMemberUpId = SCOPE_IDENTITY();
	END

	IF (@AgeVal >= 45 AND @AgeVal < 65)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES(@AgeVal, NULL, @NewCodeSetId, @AgeVal, NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
	END

	IF (@AgeVal = 65)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES('A65P', '65Plus', @NewCodeSetId, '65 and plus', NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
		SET @NewCodeMemberUpId = SCOPE_IDENTITY();
	END

	IF (@AgeVal >= 65)
	BEGIN
		INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
		VALUES(@AgeVal, NULL, @NewCodeSetId, @AgeVal, NULL, @NewCodeMemberTopId, @NewCodeMemberUpId);
	END

	SET @AgeVal +=1;
END

--insert the unknown
INSERT INTO ESTIME.tc_CodeMember(Code, AlphaCode, CodeSetId, NameEnglish, NameFrench, AggUpId, AggTopId)
VALUES('U', 'UNKNOWN', @NewCodeSetId, 'Unknown', NULL, NULL, NULL);




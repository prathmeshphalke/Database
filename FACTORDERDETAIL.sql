USE [CTILAB]
GO

/****** Object:  StoredProcedure [dbo].[FACTORDERDETAIL]    Script Date: 8/8/2018 5:00:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    Prathmesh Phalke
-- Create date: 07/31/2018
-- Description:	Populating Fact Order detail by rules.
-- =============================================
ALTER PROCEDURE [dbo].[FACTORDERDETAIL] @count1Timebuyer int
, @count2Timebuyer int
, @count3Timebuyer int
, @count4Timebuyer int
, @count5Timebuyer int
, @count6Timebuyer int
, @count7Timebuyer int
, @count8Timebuyer int
, @count9Timebuyer int
, @count10Timebuyer int
AS
  TRUNCATE TABLE Fact_OrderDetail
  ALTER SEQUENCE dbo.orderby1 RESTART WITH 1

  DECLARE @cnt int = 1
 --FIRST TIME BUYER LOOP
  --===========================================================================================================
  WHILE @cnt <= @count1Timebuyer
  BEGIN
    SET @cnt = @cnt + 1
    DECLARE @cntprod int = 1
    DECLARE @dat int = dbo.RandNum(4353, 5813)
    DECLARE @cust int = @cnt
    DECLARE @ord int = NEXT VALUE FOR Orderby1
    WHILE @cntprod <= dbo.RandNum(1, 4)
    BEGIN
      INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
      , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
      , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
      , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
        VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust, @dat, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord, @cntprod, NULL, 
		dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
      SET @cntprod = @cntprod + 1
    END
  END

  --=================================================================================================================
  --SECOND TIME BUYER LOOP
  --=================================================================================================================
  SET @cnt = 6476

  WHILE @cnt <= @count2Timebuyer
  BEGIN
    SET @cnt = @cnt + 1

    DECLARE @cust2 int = @cnt
    DECLARE @cnt1 int = 1

    WHILE @cnt1 <= 2
    BEGIN
      DECLARE @cntprod2 int = 1
      DECLARE @dat2 int = dbo.RandNum(4353, 5813)
      DECLARE @ord2 int = NEXT VALUE FOR Orderby1
      WHILE @cntprod2 <= dbo.RandNum(1, 3)
      BEGIN
        IF @cnt1 = 1
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust2, @dat2, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord2, @cntprod2, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

        ELSE
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 16), dbo.RandNum(1, 2), @cust2, @dat2, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord2, @cntprod2, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
        SET @cntprod2 = @cntprod2 + 1
      END
      SET @cnt1 = @cnt1 + 1
    END
  END
 --=================================================================================================================
  --THIRD TIME BUYER LOOP
  --=================================================================================================================
  SET @cnt = 9622

  WHILE @cnt <= @count3Timebuyer
  BEGIN
    SET @cnt = @cnt + 1

    DECLARE @cust3 int = @cnt
    DECLARE @cnt2 int = 1

    WHILE @cnt2 <= 3
    BEGIN
      DECLARE @cntprod3 int = 1
      DECLARE @dat3 int = dbo.RandNum(4353, 5813)
      DECLARE @ord3 int = NEXT VALUE FOR Orderby1
      WHILE @cntprod3 <= dbo.RandNum(1, 3)
      BEGIN
        IF @cnt2 = 1
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust3, @dat3, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord3, @cntprod3, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

        ELSE
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 16), dbo.RandNum(1, 2), @cust3, @dat3, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord3, @cntprod3, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
        SET @cntprod3 = @cntprod3 + 1
      END
      SET @cnt2 = @cnt2 + 1
    END
  END
--=========================================================================================================================
 --FOUR TIME BUYER LOOP
  --=================================================================================================================
  SET @cnt = 11840

  WHILE @cnt <= @count4Timebuyer
  BEGIN
    SET @cnt = @cnt + 1

    DECLARE @cust4 int = @cnt
    DECLARE @cnt3 int = 1

    WHILE @cnt3 <= 4
    BEGIN
      DECLARE @cntprod4 int = 1
      DECLARE @dat4 int = dbo.RandNum(4353, 5813)
      DECLARE @ord4 int = NEXT VALUE FOR Orderby1
      WHILE @cntprod4 <= dbo.RandNum(1, 3)
      BEGIN
        IF @cnt3 = 1
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust4, @dat4, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord4, @cntprod4, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

        ELSE
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 16), dbo.RandNum(1, 2), @cust4, @dat4, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord4, @cntprod4, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
        SET @cntprod4 = @cntprod4 + 1
      END
      SET @cnt3 = @cnt3 + 1
    END
  END
--=========================================================================================================================
 --FIVE TIME BUYER LOOP
  --=================================================================================================================
  SET @cnt = 13319

  WHILE @cnt <= @count5Timebuyer
  BEGIN
    SET @cnt = @cnt + 1

    DECLARE @cust5 int = @cnt
    DECLARE @cnt4 int = 1

    WHILE @cnt4 <= 5
    BEGIN
      DECLARE @cntprod5 int = 1
      DECLARE @dat5 int = dbo.RandNum(4353, 5813)
      DECLARE @ord5 int = NEXT VALUE FOR Orderby1
      WHILE @cntprod5 <= dbo.RandNum(1, 3)
      BEGIN
        IF @cnt4 = 1
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust5, @dat5, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord5, @cntprod5, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

        ELSE
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 16), dbo.RandNum(1, 2), @cust5, @dat5, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord5, @cntprod5, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
        SET @cntprod5 = @cntprod5 + 1
      END
      SET @cnt4 = @cnt4 + 1
    END
  END
  --==========================================================================================================================
   --SIX TIME BUYER LOOP
  --=================================================================================================================
  SET @cnt = 14613

  WHILE @cnt <= @count6Timebuyer
  BEGIN
    SET @cnt = @cnt + 1

    DECLARE @cust6 int = @cnt
    DECLARE @cnt5 int = 1

    WHILE @cnt5 <= 6
    BEGIN
      DECLARE @cntprod6 int = 1
      DECLARE @dat6 int = dbo.RandNum(4353, 5813)
      DECLARE @ord6 int = NEXT VALUE FOR Orderby1
      WHILE @cntprod6 <= dbo.RandNum(1, 4)
      BEGIN
        IF @cnt5 = 1
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust6, @dat6, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord6, @cntprod6, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

        ELSE
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 16), dbo.RandNum(1, 2), @cust6, @dat6, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord6, @cntprod6, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
        SET @cntprod6 = @cntprod6 + 1
      END
      SET @cnt5 = @cnt5 + 1
    END
  END
  --==========================================================================================================================
   --SEVEN TIME BUYER LOOP
  --=================================================================================================================
  SET @cnt = 15722

  WHILE @cnt <= @count7Timebuyer
  BEGIN
    SET @cnt = @cnt + 1

    DECLARE @cust7 int = @cnt
    DECLARE @cnt6 int = 1

    WHILE @cnt6 <= 7
    BEGIN
      DECLARE @cntprod7 int = 1
      DECLARE @dat7 int = dbo.RandNum(4353, 5813)
      DECLARE @ord7 int = NEXT VALUE FOR Orderby1
      WHILE @cntprod7 <= dbo.RandNum(1, 4)
      BEGIN
        IF @cnt6 = 1
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust7, @dat7, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord7, @cntprod7, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

        ELSE
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 16), dbo.RandNum(1, 2), @cust7, @dat7, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord7, @cntprod7, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
        SET @cntprod7 = @cntprod7 + 1
      END
      SET @cnt6 = @cnt6 + 1
    END
  END
   --==========================================================================================================================
   --EIGHT TIME BUYER LOOP
  --=================================================================================================================
  SET @cnt = 16646

  WHILE @cnt <= @count8Timebuyer
  BEGIN
    SET @cnt = @cnt + 1

    DECLARE @cust8 int = @cnt
    DECLARE @cnt7 int = 1

    WHILE @cnt7 <= 8
    BEGIN
      DECLARE @cntprod8 int = 1
      DECLARE @dat8 int = dbo.RandNum(4353, 5813)
      DECLARE @ord8 int = NEXT VALUE FOR Orderby1
      WHILE @cntprod8 <= dbo.RandNum(1, 4)
      BEGIN
        IF @cnt7 = 1
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust8, @dat8, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord8, @cntprod8, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

        ELSE
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 16), dbo.RandNum(1, 2), @cust8, @dat8, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord8, @cntprod8, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
        SET @cntprod8 = @cntprod8 + 1
      END
      SET @cnt7 = @cnt7 + 1
    END
  END
  --========================================================================================================================== 
     --NINE TIME BUYER LOOP
  --=================================================================================================================
  SET @cnt = 17570

  WHILE @cnt <= @count9Timebuyer
  BEGIN
    SET @cnt = @cnt + 1

    DECLARE @cust9 int = @cnt
    DECLARE @cnt8 int = 1

    WHILE @cnt8 <= 9
    BEGIN
      DECLARE @cntprod9 int = 1
      DECLARE @dat9 int = dbo.RandNum(4353, 5813)
      DECLARE @ord9 int = NEXT VALUE FOR Orderby1
      WHILE @cntprod9 <= dbo.RandNum(1, 4)
      BEGIN
        IF @cnt8 = 1
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust9, @dat9, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord9, @cntprod9, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

        ELSE
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 16), dbo.RandNum(1, 2), @cust9, @dat9, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord9, @cntprod9, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
        SET @cntprod9 = @cntprod9 + 1
      END
      SET @cnt8 = @cnt8 + 1
    END
  END
  --========================================================================================================================== 
     --TEN OR MORE TIME BUYER LOOP
  --=================================================================================================================
  SET @cnt = 18125

  WHILE @cnt <= @count10Timebuyer
  BEGIN
    DECLARE @cust10 int = @cnt
    DECLARE @cnt9 int = 1
	SET @cnt = @cnt + 1
	  

    WHILE @cnt9 <= 10
    BEGIN
      DECLARE @cntprod10 int = 1
      DECLARE @dat10 int = dbo.RandNum(4353, 5813)
      	  DECLARE @ord10 int = NEXT VALUE FOR Orderby1
	        WHILE @cntprod10 <= dbo.RandNum(1, 4)
      BEGIN
        IF @cnt9 = 1
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 12), dbo.RandNum(1, 2), @cust10, @dat10, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord10, @cntprod10, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

        ELSE
          INSERT INTO Fact_OrderDetail ([Campaign_Dim_Key], [Channel_Dim_Key], [Customer_Dim_Key], [DATE_DIM_KEY], [Product_Dim_key]
          , [Store_Dim_Key], [OrderNumber], [OrderLineNumber], SaleAmountPrice, [Quantity], [ETLInsertDate]
          , [ETLUpdateDate], [ETLDeleteDate], [ETLDeleteFlag], [ETLSourceSystem], [ETLSourceSystemKeyCol]
          , [ETLSourceSystemKeyVal], [ETLCycleID], [ETLWorkGroupId], [ETLProcessId])
            VALUES (dbo.RandNum(1, 16), dbo.RandNum(1, 2), @cust10, @dat10, dbo.RandNum(1, 295), dbo.RandNum(1, 22), @ord10, @cntprod10, NULL, 
			dbo.RandNum(1, 5), SYSDATETIME(), SYSDATETIME(), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
        SET @cntprod10 = @cntprod10 + 1
      END
      SET @cnt9 = @cnt9 + 1
    END
  END
  --========================================================================================================================== 
  
  UPDATE Fact_OrderDetail
  SET SaleAmountPrice = f.Quantity * p.ProductPrice, PricePerLineNumber = p.ProductPrice
  FROM Fact_OrderDetail f
  JOIN Dim_Product p
    ON f.Product_Dim_key = p.Product_Dim_key
--=========================================================================================================================

GO



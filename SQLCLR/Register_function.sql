USE [FlexMirror]
GO
/****** Object:  UserDefinedFunction [dbo].[ParseMDXParameters]    Script Date: 4/29/2021 9:19:07 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
create FUNCTION [dbo].[ReplaceSpecial](@inputtext [nvarchar](max), @filter [nvarchar](max), @replacewith [nvarchar](max))
RETURNS [nvarchar](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [UserDefinedFunctions].[UserDefinedFunctions].[ReplaceSpecial]
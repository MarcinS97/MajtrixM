/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.2269)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [DM_Matryca]    Script Date: 01.09.2017 13:17:40 ******/
CREATE DATABASE [DM_Matryca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DM_Matryca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DM_Matryca.mdf' , SIZE = 43008KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DM_Matryca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DM_Matryca_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DM_Matryca] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DM_Matryca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DM_Matryca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DM_Matryca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DM_Matryca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DM_Matryca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DM_Matryca] SET ARITHABORT OFF 
GO
ALTER DATABASE [DM_Matryca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DM_Matryca] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [DM_Matryca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DM_Matryca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DM_Matryca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DM_Matryca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DM_Matryca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DM_Matryca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DM_Matryca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DM_Matryca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DM_Matryca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DM_Matryca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DM_Matryca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DM_Matryca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DM_Matryca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DM_Matryca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DM_Matryca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DM_Matryca] SET RECOVERY FULL 
GO
ALTER DATABASE [DM_Matryca] SET  MULTI_USER 
GO
ALTER DATABASE [DM_Matryca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DM_Matryca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DM_Matryca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DM_Matryca] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DM_Matryca] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DM_Matryca]
GO
/****** Object:  User [vcuser]    Script Date: 01.09.2017 13:17:41 ******/
CREATE USER [vcuser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [newuser]    Script Date: 01.09.2017 13:17:41 ******/
CREATE USER [newuser] FOR LOGIN [newuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [vcuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [vcuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [vcuser]
GO
ALTER ROLE [db_owner] ADD MEMBER [newuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [newuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [newuser]
GO
/****** Object:  SqlAssembly [KDR]    Script Date: 01.09.2017 13:17:41 ******/
CREATE ASSEMBLY [KDR]
FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C0103003EEE49560000000000000000E00002210B010B00001000000006000000000000EE2F0000002000000040000000000010002000000002000004000000000000000400000000000000008000000002000000000000030040850000100000100000000010000010000000000000100000000000000000000000982F000053000000004000009002000000000000000000000000000000000000006000000C000000602E00001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E74657874000000F40F0000002000000010000000020000000000000000000000000000200000602E7273726300000090020000004000000004000000120000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000001600000000000000000000000000004000004200000000000000000000000000000000D02F000000000000480000000200050084230000DC0A000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E02280500000A2A133002004C00000001000011036F0600000A280700000A027B030000046F0800000A320772010000702B27027B03000004036F0600000A280700000A6F0900000A1F312E0772010000702B05720D00007000000A2B00062A1B3004005200000002000011140B730C0000060C08027D030000040000037217000070072D0F08FE060D000006730A00000A0B2B000718280B00000A0A06280C00000A2D03062B057201000070000DDE0A260072010000700DDE0000092A000001100000000010003545000A010000011B300300650000000400001100730E00000A0A00060F00280F00000A2D090F00281000000A2B057227000070000F01280F00000A2D090F01281000000A2B05722700007000280100000672270000706F1100000AA516000001281200000A0BDE0D26007229000070731300000A7A00072A00000001100000000007004E55000D010000011E02280500000A2A13300100110000000100001100027B010000046F1700000A0A2B00062A520002731800000A7D0100000402147D020000042A000013300300A300000005000011000F01280F00000A16FE010A062D05388E0000000525281900000A2D1C0F01281000000A027B02000004281A00000A281200000A281B00000A281C00000A16FE010A062D022B5B027B010000046F1700000A7E1D00000A281E00000A16FE010A062D12027B01000004048C040000016F1F00000A26027B010000040F01281000000A6F2000000A2605281C00000A16FE010A062D0D020F01281000000A7D020000042A00133002002100000005000011001403FE0116FE010A062D022B12027B01000004037B010000046F1F00000A262A000000133002003F00000006000011007E1D00000A0A027B010000042C13027B010000046F2100000A16FE0216FE012B0117000C082D0C027B010000046F1700000A0A06732200000A0B2B00072A00133002002900000005000011000314FE0116FE010A062D0B7297000070732300000A7A02036F2400000A732500000A7D010000042A000000133002002A00000005000011000314FE0116FE010A062D0B72A5000070732300000A7A03027B010000046F1700000A6F2600000A002A1E02280500000A2A000042534A4201000100000000000C00000076322E302E35303732370000000005006C000000D8030000237E0000440400004004000023537472696E67730000000084080000B40000002355530038090000100000002347554944000000480900009401000023426C6F6200000000000000020000015717A2010902000000FA253300160000010000001C00000004000000030000000D0000000B0000000100000026000000080000000600000001000000010000000100000001000000030000000100000000000A000100000000000600300029000A005E0043000A0093007E000A009E007E000600CA00BE00060036012C01060048012C010A00870143000600D601C3012700EA01000006001902F90106003902F9010E008D026E020E00AE026E020600C00229000600D00229000E00EC026E020E00FB026E020E0001036E020A00240343000A003903370006005603290006006A03290006007403F90106008F0329000A00A50343000A00C603430006001C04290000000000010000000000010001000100100012000000050001000100012010001C000000050001000400030110005B020000050003000C000100D8001D000100EC00210006006E012100B0200000000091006F000A0001002021000000009600A80010000300A421000000008618B80019000500AC21000000008308F50024000500C9210000000086000C0119000500E02100000000860011012800050090220000000086001C0132000800C0220000000086002201380009000C2300000000E60143013D000900442300000000E601550143000A007A23000000008618B80019000B005020000000008618B80019000B00582000000000860093026B000B00000001006E01000002007501000001008001000002007501000001009901000002009F0100000300A90100000100AF0100000100B50100000100BC0100000100A802030009004100B80019004900B80060005900B80066006100B80019000900B80019007100B60224007900C80271008100D70276008100E2027A008900B800830091000E038900810016039300A100B8001900A900B800190021004303A6002100B6022400A9004E03AA0019005E03B000B900B800B600C100B8001900C900B8001900D100B800C2000900CD0324002900B80019001900D60335018100DF033B011900EB0341011900F9033501810001042100810007043B01290015044A012900150450012900D70276002100B800B600E100B800B6003100320424002900B800B60039005501B6002E001B006A012E00230073012E001300610140006B00A1006300B300C80064000B004D008300A300A10084000B004D007F0098002100BB0056015A010300010000005B01490002000400030004800000000000000000000000000000000057020000020000000000000000000000010020000000000002000000000000000000000001003700000000000200000000000000000000000100290000000000040002000000003C4D6F64756C653E004B44522E646C6C0046756E6374696F6E7300636174006D73636F726C69620053797374656D004F626A6563740053797374656D2E44617461004D6963726F736F66742E53716C5365727665722E536572766572004942696E61727953657269616C697A65004576616C756174655269676874730053797374656D2E446174612E53716C54797065730053716C426F6F6C65616E0053716C537472696E6700436865636B52696768747345787072002E63746F720053797374656D2E5465787400537472696E674275696C646572005F696E7465726D656469617465526573756C74004F6C6456616C7565006765745F496E7465726D656469617465526573756C7400496E697400416363756D756C617465004D65726765005465726D696E6174650053797374656D2E494F0042696E61727952656164657200526561640042696E61727957726974657200577269746500496E7465726D656469617465526573756C740056616C7565730045787072657373696F6E005269676874730053716C46616365744174747269627574650076616C756500736570617261746F72006D65726765006F7468657200726561646572007772697465720053797374656D2E446961676E6F73746963730044656275676761626C6541747472696275746500446562756767696E674D6F6465730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C697479417474726962757465004B4452003C3E635F5F446973706C6179436C617373320053797374656D2E546578742E526567756C617245787072657373696F6E73004D61746368003C4576616C756174655269676874733E625F5F300052696768740043617074757265006765745F56616C756500436F6E7665727400546F496E74333200537472696E67006765745F4C656E677468006765745F4368617273004D617463684576616C7561746F720052656765780052656765784F7074696F6E73005265706C6163650049734E756C6C4F72456D7074790053716C46756E6374696F6E41747472696275746500446174615461626C65006765745F49734E756C6C00436F6D7075746500426F6F6C65616E006F705F496D706C6963697400457863657074696F6E00436F6D70696C657247656E6572617465644174747269627574650053657269616C697A61626C654174747269627574650053716C55736572446566696E656441676772656761746541747472696275746500466F726D617400546F537472696E67006F705F46616C7365006F705F457175616C697479006F705F42697477697365416E64006F705F5472756500456D707479006F705F496E657175616C69747900417070656E6400417267756D656E744E756C6C457863657074696F6E0052656164537472696E6700000000000B660061006C007300650000097400720075006500000F5C00620028005C0064002B0029000001006D4E006900650070006F0070007200610077006E006100200073006B004201610064006E0069006100200077007900720061007C0165006E00690061002000660075006E006B0063006A006900200043006800650063006B005200690067006800740073004500780070007200010D720065006100640065007200000D77007200690074006500720000009E06ED598F901A4EBA910DBCCCF30AE50008B77A5C561934E0890500020E0E0E080002110D11111111032000010306121502060E0320000E0920030111111111110D05200101120C042000111105200101121905200101121D0328000E120100010054020A49734E756C6C61626C650105200101112904200101080520010E1235040001080E0320000804200103080307010E052002011C180900040E0E0E1245114D040001020E0807040E124512100E0401000000032000020520021C0E0E050001110D02042001010E0607021255110D05200101116D6C01000200000005005402124973496E76617269616E74546F4E756C6C73015402174973496E76617269616E74546F4475706C696361746573005402124973496E76617269616E74546F4F726465720054080B4D61784279746553697A65FFFFFFFF540E044E616D650363617405000102110D050002020E0E080002110D110D110D05200112151C05200112150E030701020607030E1111020801000701000000000801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F7773010000000000003EEE495600000000020000001C0100007C2E00007C1000005253445370D95CBB5526A2449DB9EB6A4360D2B910000000643A5C5F4769745C5243505C5243505C4B44525F44425C6F626A5C44656275675C4B44522E70646200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C02F00000000000000000000DE2F0000002000000000000000000000000000000000000000000000D02F000000000000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF250020001000000000000000000000000000000000000000000000000000000100100000001800008000000000000000000000000000000100010000003000008000000000000000000000000000000100000000004800000058400000340200000000000000000000340234000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000000000000000000000000000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B00494010000010053007400720069006E006700460069006C00650049006E0066006F0000007001000001003000300030003000300034006200300000002C0002000100460069006C0065004400650073006300720069007000740069006F006E000000000020000000300008000100460069006C006500560065007200730069006F006E000000000030002E0030002E0030002E003000000030000800010049006E007400650072006E0061006C004E0061006D00650000004B00440052002E0064006C006C0000002800020001004C006500670061006C0043006F0070007900720069006700680074000000200000003800080001004F0072006900670069006E0061006C00460069006C0065006E0061006D00650000004B00440052002E0064006C006C000000340008000100500072006F006400750063007400560065007200730069006F006E00000030002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000030002E0030002E0030002E0030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000F03F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
WITH PERMISSION_SET = SAFE
GO
/****** Object:  UserDefinedAggregate [dbo].[cat]    Script Date: 01.09.2017 13:17:41 ******/
CREATE AGGREGATE [dbo].[cat]
(@value [nvarchar](max), @separator [nvarchar](max), @mergep [bit])
RETURNS[nvarchar](max)
EXTERNAL NAME [KDR].[cat]
GO
/****** Object:  UserDefinedFunction [dbo].[bom]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[bom] (@data datetime)
RETURNS datetime
AS
BEGIN
	declare @d datetime
	set @d = DATEADD(dd, 0, DATEDIFF(dd, 0, @data))
	set @d = DATEADD(mm, DATEDIFF(mm, 0, @d), 0)
	return @d
END
GO
/****** Object:  UserDefinedFunction [dbo].[boy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[boy] (@data datetime)
RETURNS datetime
AS
BEGIN
	declare @d datetime
	set @d = DATEADD(dd, 0, DATEDIFF(dd, 0, @data))
	set @d = dateadd(d, -datepart(dy, @d) + 1, @d)
	--set @d = dateadd(year, datepart(year, @data) - 2000, '20000101')	
	return @d
END
GO
/****** Object:  UserDefinedFunction [dbo].[CheckRights]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CheckRights](@rights varchar(max), @rlist varchar(max))	-- comma delimited and
RETURNS int
AS
BEGIN
	declare @ret int
	set @ret = 1
	declare @idx varchar(10)

	if @rights is null or @rlist is null or LEN(@rlist) = 0
		set @ret = 0
	else	
		while len(@rlist) > 0
		begin
			set @idx = LTRIM(RTRIM(left(@rlist, charindex(',', @rlist+',')-1)))
			if dbo.GetRightId(@rights, convert(int, @idx)) = 0 begin
				set @ret = 0
				break
			end 
			set @rlist = stuff(@rlist, 1, charindex(',', @rlist+','), '')
		end	
	RETURN @ret;
END
GO
/****** Object:  UserDefinedFunction [dbo].[CheckRightsExpr]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[CheckRightsExpr](@exp [nvarchar](max), @val [nvarchar](max))
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [KDR].[Functions].[CheckRightsExpr]
GO
/****** Object:  UserDefinedFunction [dbo].[dd]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[dd] (@data varchar(10))  --dd-mm-yyyy
RETURNS datetime
AS
BEGIN
	declare @ret datetime 
	if @data is null or LTRIM(@data) = '' 
		set @ret = null
	else
		set @ret = convert(datetime, @data, 105)
	return @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[dds]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[dds] (@data varchar(10))  --dd-mm-yyyy
RETURNS varchar(10) --yyyy-mm-dd
AS
BEGIN
	declare @ret varchar(10)
	if @data is null or LTRIM(@data) = '' 
		set @ret = null
	else
		set @ret = convert(varchar(10), convert(datetime, @data, 105), 20)
	return @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[eom]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[eom] (@data datetime)
RETURNS datetime
AS
BEGIN
	declare @d datetime
	set @d = DATEADD(dd, 0, DATEDIFF(dd, 0, @data))
	set @d = DATEADD(d, -1, DATEADD(mm, DATEDIFF(m, 0, @d) + 1, 0))
	return @d
END
GO
/****** Object:  UserDefinedFunction [dbo].[eoy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[eoy] (@data datetime)
RETURNS datetime
AS
BEGIN
	declare @d datetime
	set @d = DATEADD(dd, 0, DATEDIFF(dd, 0, @data))
	set @d = dateadd(d, -datepart(d, @d), dateadd(m, 13 - datepart(m, @d), @d)) 
	--set @d = dateadd(year, datepart(year, @data) - 2000, '20001231')	
	return @d
END
GO
/****** Object:  UserDefinedFunction [dbo].[FirstUpper]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FirstUpper] (@name nvarchar(200))
RETURNS nvarchar(200)
AS
BEGIN
	DECLARE @idx  INT
	DECLARE @char NCHAR(1)
	DECLARE @prev NCHAR(1)
	DECLARE @out  NVARCHAR(200)

	SET @out = LOWER(@name)
	SET @idx = 1
	set @prev = ' '

	WHILE @idx <= LEN(@name)
	BEGIN
		SET @char = SUBSTRING(@name, @idx, 1)    
		IF @prev IN (' ', '-')
		BEGIN
			SET @out = STUFF(@out, @idx, 1, UPPER(@char))
		END
		SET @idx = @idx + 1    
		set @prev = @char;
	END
	RETURN @out
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetMatrycaPracownicySql]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetMatrycaPracownicySql](@tmptable varchar(20), @strorg varchar(max), @pracId int, @status varchar(10), @data datetime)
RETURNS nvarchar(max)
AS
BEGIN
	declare @sql nvarchar(max)
	declare @tmp varchar(30)
	if @tmptable is null 
		set @tmp = ''
	else
		set @tmp = 'into ' + @tmptable 

	if @pracId is not null
		set @sql = '
			declare @pracId int = ' + CONVERT(varchar,@pracId) + '
			declare @data datetime = ''' + CONVERT(nvarchar(10), @data, 20) + '''
			select P.*, D.IdStruktury 
			' + @tmp + '
			from Pracownicy P
			left join Oddelegowania D on D.IdPracownika = P.Id_Pracownicy and @data between D.Od and D.Do and D.Status = 2 
			where P.Id_Pracownicy = @pracId
			'
	else if @status = 'd'
		set @sql = '
			select P.*, -9 as IdStruktury
			' + @tmp + '
			from Pracownicy P where P.Id_Pracownicy in 
			(
				select distinct IdPracownika from Oddelegowania D 
				where 
					D.IdStruktury in (' + @strorg + ') 
				and D.Status = 2 
			)'   
	else begin
		declare @and_status varchar(100)
		set @and_status =
			case 
				when @status = 'p'	  then 'and P.Status >= 0'
				when @status = 'z'	  then 'and P.Status = -1'
				when @status = 'all'  then 'and P.Status >= -1'
				when @status = 'arch' then 'and P.Status = -3'
			else ''
			end
	
		set @sql = '
			declare @data datetime = ''' + CONVERT(nvarchar(10), @data, 20) + '''
			select P.*, D.IdStruktury 
			' + @tmp + '
			from Pracownicy P
			left join Oddelegowania D on D.IdPracownika = P.Id_Pracownicy and @data between D.Od and D.Do and D.Status = 2 
			where 
				(P.Id_Str_OrgM in (' + @strorg + ') or D.IdStruktury in (' + @strorg + ')) 
			' + @and_status
	end	
	return @sql
END



/*
declare @pracId int = null
declare @status varchar(10) = 'p'
declare @data datetime = GETDATE()
declare @strorg varchar(max) = '1,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40'
declare @sql nvarchar(max)

declare @t datetime = GETDATE()
set @sql = dbo.fn_GetMatrycaPracownicySql(null, @strorg, null, 'p', GETDATE())
select @sql
select DATEDIFF(MS, @t, GETDATE())
*/
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetOceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetOceny] (@zadid int, @pracid int, @typ int)
RETURNS nvarchar(max)
AS
BEGIN
	declare @oceny varchar(max)

	if @typ = 1 begin
		select @oceny = ISNULL(@oceny + ',', '') + convert(varchar, Ocena) from Oceny  
		where Id_Zadania = @zadid and Id_Pracownicy = @pracid
		order by DataOceny, Ocena
	end
	RETURN @oceny
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPracownicyRCP]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop function fn_GetPracownicyRCP 
--CREATE FUNCTION fn_GetPracownicyRCP 
CREATE FUNCTION [dbo].[fn_GetPracownicyRCP] 
(	
	@data datetime
)
RETURNS @ret TABLE 
(
	[Id] [int] NOT NULL,
	[Login] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Nazwisko] [nvarchar](255) NOT NULL,
	[Opis] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Mailing] [bit] NOT NULL,
	[IdDzialu] [int] NULL,
	[IdStanowiska] [int] NULL,
	[IdKierownika] [int] NULL,
	[IdProjektu] [int] NULL,
	[Admin] [bit] NOT NULL,
	[Kierownik] [bit] NOT NULL,
	[Raporty] [bit] NOT NULL,
	[KadryId] [varchar](20) NULL,
	[Stawka] [money] NULL,
	[RcpId] [int] NULL,
	[Status] [int] NULL,
	[RcpStrefaId] [int] NULL,
	[RcpAlgorytm] [int] NULL,
	[Created] [datetime] NOT NULL,
	[DataZatr] [datetime] NULL,
	[EtatL] [int] NULL,
	[EtatM] [int] NULL,
	[Info] [nvarchar](500) NULL,
	[CCInfo] [nvarchar](200) NULL,
	[Rights] [varchar](50) NULL,
	[GrSplitu] [int] NULL,
	[IdLinii] [int] NULL,
	[Nick] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[NrKarty1] [varchar](50) NULL,
	[NrKarty2] [varchar](50) NULL,
	[DataZwol] [datetime] NULL,
	[KadryId2] [varchar](20) NULL
)
AS BEGIN

	insert into @ret
	select 
	K.Id_Przelozeni as Id, K.Login, K.Imie, K.Nazwisko, null as Opis, K.Email, dbo.GetRightId(K.Rights, 6) as Mailing, null as IdDzialu, K.Id_Stanowiska as IdStanowiska, 
	K1.IdPrzelozonego as IdKierownika, 
	null as IdProjektu, dbo.GetRightId(K.Rights, 0) as Admin, 1 as Kierownik, dbo.GetRightId(K.Rights, 5) as Raporty, K.Nr_Ewid as KadryId, 

	0 as Stawka, 

	null as RcpId, K.Status, null as RcpStrefaId, null as RcpAlgorytm, 
	'20140701' as Created, 
	dbo.dd(B.dataZatrudnienia) as DataZatr, 
	
	ISNULL(case B.wymiarEtatu 
		when 1 then 1
		when 7/8 then 7
		when 6/8 then 3
		when 5/8 then 5
		when 4/8 then 1
		when 3/8 then 3
		when 2/8 then 1
		when 1/8 then 1
	else 8 * B.wymiarEtatu
	end, 1) EtatL, 
	
	ISNULL(case B.wymiarEtatu 
		when 1 then 1
		when 7/8 then 8
		when 6/8 then 4
		when 5/8 then 8
		when 4/8 then 2
		when 3/8 then 8
		when 2/8 then 4
		when 1/8 then 8
	else 8
	end, 1) EtatM, 
	
	null as Info, null as CCInfo,
   --0123456789012345678901234567890123456
	dbo.GetRightIdChr(K.Rights, 0) +	-- 0 - 0 adm     (RCP - rRight)
	dbo.GetRightIdChr(K.Rights, 1) +	-- 1 - 1 rights
	'00000000000' +		--
	dbo.GetRightIdChr(K.Rights, 32) +	-- 13 - rWnioskiUrlopoweAcc        
	dbo.GetRightIdChr(K.Rights, 26) +	-- 14 - rWnioskiUrlopoweAdm        
	dbo.GetRightIdChr(K.Rights, 12) +	-- 15 - rReadOnly
	dbo.GetRightIdChr(K.Rights, 6) +	-- 16 - _rMAiling
	dbo.GetRightIdChr(K.Rights, 33) +	-- 17 - rWnioskiUrlopoweSub
	'0' + 
	dbo.GetRightIdChr(K.Rights, 22) +	-- 19 - rSuperuser
	'0000' +
	dbo.GetRightIdChr(K.Rights, 27) +	-- 24 - rPlanUrlopow
	dbo.GetRightIdChr(K.Rights, 24) +	-- 25 - rPortalAdmin
	dbo.GetRightIdChr(K.Rights, 28) +	-- 26 - rPlanUrlopowSwoj	
	'0' + 
	dbo.GetRightIdChr(K.Rights, 31) +	-- 28 - rWnioskiUrlopowe
	dbo.GetRightIdChr(K.Rights, 29) +	-- 29 - rPlanUrlopowEditPo
	'0' +
	dbo.GetRightIdChr(K.Rights, 23) +	-- 31 - rPortalTmp
	dbo.GetRightIdChr(K.Rights, 25) +	-- 32 - rPortalArticles
	dbo.GetRightIdChr(K.Rights, 34) +	-- 33 - rWnioskiUrlopoweNoAccMail
    '000' +
	dbo.GetRightIdChr(K.Rights, 30) +	-- 37 - rPlanUrlopowAcc
    '00000' as Rights, 
	null as GrSplitu, null as IdLinii, 
	--K.Login as nick, 
	K.Nick, 
	K.Password as Pass, null as NrKarty1, null as NrKarty2, null DataZwol, 
	convert(varchar, K.Id2) KadryId2
	
	from Przelozeni K 
	left join StrukturaPrzelozeni SP on SP.IdPrzelozonego = K.Id_Przelozeni
	outer apply 
	(
	select top 1 * from dbo.fn_GetStrOrgTreeUp(SP.IdStruktury, 0, @data) S
	inner join StrukturaPrzelozeni SP1 on SP1.IdStruktury = S.Id
	) K1
	left join baan_v_dane_osobowe B on B.nrEwidencyjny = K.Id2
	
	union all

	select 
	-P.Id_Pracownicy as Id, P.Login, P.Imie, P.Nazwisko, null as Opis, P.Email, 1 as Mailing, null as IdDzialu, P.Id_Stanowiska as IdStanowiska,  
	K.Id_Przelozeni as IdKierownika, 
	null as IdProjektu, 0 as Admin, 0 as Kierownik, 0 as Raporty, P.Nr_Ewid as KadryId, 0 as Stawka, null as RcpId, P.Status, null as RcpStrefaId, null as RcpAlgorytm, 
	'20140701' as Created, 
	--P.DataZatr, 
	dbo.dd(B.dataZatrudnienia) as DataZatr, 
	
	ISNULL(case B.wymiarEtatu 
		when 1 then 1
		when 7/8 then 7
		when 6/8 then 3
		when 5/8 then 5
		when 4/8 then 1
		when 3/8 then 3
		when 2/8 then 1
		when 1/8 then 1
	else 8 * B.wymiarEtatu
	end, 1) EtatL, 
	
	ISNULL(case B.wymiarEtatu 
		when 1 then 1
		when 7/8 then 8
		when 6/8 then 4
		when 5/8 then 8
		when 4/8 then 2
		when 3/8 then 8
		when 2/8 then 4
		when 1/8 then 8
	else 8
	end, 1) EtatM, 
	
	null as Info, null as CCInfo, 
	--'0000000000000000000000001010100100000000000' as Rights,
	
	P.Rights, 	
	null as GrSplitu, null as IdLinii, P.Nick, P.Password as Pass, null as NrKarty1, null as NrKarty2, P.DataZwol, 
	convert(varchar, P.Id2) as KadryId2
	from Pracownicy P 
	left join Oddelegowania D on D.IdPracownika = P.Id_Pracownicy and @data between D.Od and ISNULL(D.Do, '20990909') and D.Status = 2
	left join StrOrg S on S.Id_Str_Org = ISNULL(D.IdStruktury, P.Id_Str_OrgM)
	outer apply 
	(
	select top 1 * from dbo.fn_GetStrOrgTreeUp(S.Id_Str_Org, 1, @data) S
	inner join StrukturaPrzelozeni SP on SP.IdStruktury = S.Id
	) SP
	left join Przelozeni K on K.Id_Przelozeni = ISNULL(D.IdKierownika, ISNULL(P.IdKierownika, SP.IdPrzelozonego))   -- z oddelegowania, jezeli nie ma przypisany, jak nie ma to pierwszy ze struktury
	left join baan_v_dane_osobowe B on B.nrEwidencyjny = P.Id2
	where P.Nr_Ewid not in (select Nr_Ewid from Przelozeni where Status >= 0)

RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetStrOrgTree]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetStrOrgTree](@rootId int, @withRoot bit, @data datetime) 
RETURNS @ret TABLE
(
	Lp int NOT NULL,
	_id int NOT NULL,
	Id int NOT NULL,
	ParentId int NULL,
	Symbol nvarchar(255) NULL,
	Nazwa nvarchar(255) NULL,
	NazwaEN nvarchar(255) NULL,
	Typ int NULL,
	Od datetime NOT NULL,
	Do datetime NULL,
	Hlevel int not null,  -- 0..
	SortPath VARBINARY(8000) not null
) 
AS
BEGIN
	declare @prac table
	(
		Lp int NOT NULL,
		_id int NOT NULL,
		Id int NOT NULL,
		ParentId int NULL,
		Symbol nvarchar(255) NULL,
		Nazwa nvarchar(255) NULL,
		NazwaEN nvarchar(255) NULL,
		Typ int NULL,
		Od datetime NOT NULL,
		Do datetime NULL
	) 
	
	----- sortowanie i selekcja wg daty, czas jest odcianany od @data -----
	set @data = DATEADD(dd, 0, DATEDIFF(dd, 0, @data))
	insert into @prac
	select 
		ROW_NUMBER() over(order by P.Symb_Jedn) AS Lp, 
		P.Id_Str_Org as _id,
		P.Id_Str_Org as Id,
		P.Id_Parent as ParentId,
		P.Symb_Jedn as Symbol,
		P.Nazwa_Jedn as Nazwa,
		P.Nazwa_JednEN as NazwaEN,
		--1 as Typ,
		Typ,
		@data as Od,
		null as Do
	from StrOrg P 
	--where @data between P.Od and ISNULL(P.Do, '20990909')
	;
	----- root -----
	if @rootId = 0
		set @withRoot = 0;
	----- tree -----
	with SubTree as
	(
	SELECT 
		P.*,
		0 AS HLevel,
		CAST(CAST(P.Lp AS BINARY(4)) AS VARBINARY(8000)) AS SortPath
	FROM @prac P
	WHERE @withRoot = 0 and P.ParentId = @rootId or
          @withRoot = 1 and P.Id = @rootId 

	UNION ALL 

	SELECT 
		R.*,
		ST.HLevel + 1 AS HLevel,
		CAST(ST.SortPath + CAST(R.Lp AS BINARY(4)) AS VARBINARY(8000)) AS SortPath
	FROM @prac R
	INNER JOIN SubTree ST ON ST.Id = R.ParentId
	)
	
	insert @ret 
	SELECT * 
	FROM SubTree A
	ORDER BY A.SortPath

	RETURN
/*-------------------------
select * from dbo.fn_GetStrOrgTree(0, 1, GETDATE())
select * from dbo.fn_GetStrOrgTree(1, 1, GETDATE())
select * from dbo.fn_GetStrOrgTree(1, 0, GETDATE())
select * from dbo.fn_GetStrOrgTree(5, GETDATE())
select 
SPACE((Hlevel-1)*4) + 
--replicate('&nbsp;', (Hlevel - 1) * 4) +
--replicate('&nbsp;|', Hlevel - 1) + '-' +     
Nazwa + ISNULL(' (' + Symbol + ')', ''), * 
from dbo.fn_GetStrOrgTree(0, 1, GETDATE())

select SPACE(Hlevel*4) + Nazwa + ISNULL(' (' + Symbol + ')', ''), * from dbo.fn_GetStrOrgTree(0, 1, GETDATE())
select SPACE(Hlevel*4) + Nazwa + ISNULL(' (' + Symbol + ')', ''), * from dbo.fn_GetStrOrgTree(0, 0, GETDATE())
select SPACE(Hlevel*4) + Nazwa + ISNULL(' (' + Symbol + ')', ''), * from dbo.fn_GetStrOrgTree(1, 1, GETDATE())
select SPACE(Hlevel*4) + Nazwa + ISNULL(' (' + Symbol + ')', ''), * from dbo.fn_GetStrOrgTree(1, 0, GETDATE())
select SPACE(Hlevel*4) + Nazwa + ISNULL(' (' + Symbol + ')', ''), * from dbo.fn_GetStrOrgTree(12, 1, GETDATE())
select SPACE(Hlevel*4) + Nazwa + ISNULL(' (' + Symbol + ')', ''), * from dbo.fn_GetStrOrgTree(12, 0, GETDATE())

----------------------------*/
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetStrOrgTreeUp]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetStrOrgTreeUp](@strId int, @withStr bit, @data datetime) 
RETURNS @ret TABLE
(
	--Lp int NOT NULL,
	_id int NOT NULL,
	Id int NOT NULL,
	ParentId int NULL,
	Symbol nvarchar(255) NULL,
	Nazwa nvarchar(255) NULL,
	NazwaEN nvarchar(255) NULL,
	Typ int NULL,
	Od datetime NOT NULL,
	Do datetime NULL,
	Hlevel int not null,  -- 0..
	Hlevel2 int not null, -- 0..
	--SortPath VARBINARY(8000) not null,
	Data datetime
) 
AS
BEGIN
	declare @cnt int
	set @data = DATEADD(dd, 0, DATEDIFF(dd, 0, @data));
	----
	with Struct AS (
		select 
			P.*,
			0 AS HLevel			
		from StrOrg P
		where P.Id_Str_Org = @strId --and R.Status = 1 and @data between R.Od and ISNULL(R.Do, '20990909')
		
		union all
		
		select
			R.*,
			S.HLevel - 1 AS HLevel			
		from StrOrg R
		inner join Struct S ON S.Id_Parent = R.Id_Str_Org
		--where R.Status = 1 and @data between R.Od and ISNULL(R.Do, '20990909')
	)
	insert @ret 
	select 
		Id_Str_Org,
		Id_Str_Org,
		Id_Parent,
		Symb_Jedn,
		Nazwa_Jedn,
		Nazwa_JednEN,
		--1,
		Typ,
		@data,
		null,
		HLevel + (select COUNT(*) from Struct) - 1 as HLevel2,
		HLevel,
		@data 
	from Struct where @withStr = 1 or Id_Str_Org <> @strId
	order by HLevel
	RETURN
END

/*

select * from dbo.fn_GetStrOrgTreeUp(12, 1, GETDATE())
select * from dbo.fn_GetStrOrgTreeUp(12, 0, GETDATE())

*/
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetStrPrzelozony]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetStrPrzelozony]
(
	@strId int, @typ int, @sep nvarchar(100)
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @ret nvarchar(max)
	if (@sep is null) set @sep = ', '
	if @typ = 1
		select @ret = isnull(@ret + @sep, '') + K.Nazwisko + ' ' + K.Imie
		from StrOrg S
		left join StrukturaPrzelozeni SP on SP.IdStruktury = S.Id_Str_Org
		left join Przelozeni K on K.Id_Przelozeni = SP.IdPrzelozonego
		where S.Id_Str_Org = @strId and K.Status >= 0
		order by K.Nazwisko, K.Imie desc
	RETURN @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSubLinie]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetSubLinie](@strId int, @date datetime) 
RETURNS @ret TABLE
(
	[Id_Str_Org] [int] NOT NULL,	
	[Id_Parent] [int] NULL,
	[Symb_Jedn] [nvarchar](255) NULL,
	[Nazwa_Jedn] [nvarchar](255) NULL,
	[Nazwa_JednEN] [nvarchar](255) NULL,
	[DataOd] [datetime] NULL,
	[DataDo] [datetime] NULL
) 
AS
BEGIN
	with Struct AS (
		select * from StrOrg 
		where Id_Str_Org = @strId
	union all
		select S.* from StrOrg S
		inner join Struct P ON P.Id_Str_Org = S.Id_Parent
	)
	insert @ret 
		select Id_Str_Org, Id_Parent, Symb_Jedn, Nazwa_Jedn, Nazwa_JednEN, null as DataOd, null as DataDo 
		from Struct 
		where Id_Str_Org not in (select distinct Id_Parent from StrOrg where Id_Parent is not null)	
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetUpStrOrg]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetUpStrOrg](@strId int, @date datetime) 
RETURNS @ret TABLE
(
	[Id_Str_Org] [int] NOT NULL,	
	[Id_Parent] [int] NULL,
	[Symb_Jedn] [nvarchar](255) NULL,
	[Nazwa_Jedn] [nvarchar](255) NULL,
	[Nazwa_JednEN] [nvarchar](255) NULL,
	[DataOd] [datetime] NULL,
	[DataDo] [datetime] NULL
) 
AS
BEGIN
	with Struct AS (
		select * from StrOrg 
		where Id_Str_Org = @strId
	union all
		select S.* from StrOrg S
		inner join Struct P ON P.Id_Parent = S.Id_Str_Org
	)
	insert @ret 
		select Id_Str_Org, Id_Parent, Symb_Jedn, Nazwa_Jedn, Nazwa_JednEN, null as DataOd, null as DataDo 
		from Struct
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetZadaniaTypy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetZadaniaTypy]
(
	@typ int, @lang varchar(10), @sep varchar(10)
)
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @ret nvarchar(max)
	if (@sep is null) set @sep = ', '
	
	select 
		@ret = isnull(@ret + @sep, '') + case when @lang = 'PL' then TypNazwa else TypNazwaEN end 	
	from ZadaniaTypy 
	where @typ & Id != 0
	order by Kolejnosc
	
	RETURN @ret
END

/*
select dbo.fn_GetZadaniaTypy(1, 'PL', null)

*/
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetZadanieOceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE FUNCTION [dbo].[fn_GetZadanieOceny] (@zadid int, @norate char(1))
CREATE FUNCTION [dbo].[fn_GetZadanieOceny] (@zadid int, @norate char(1))
RETURNS nvarchar(max)
AS
BEGIN
	declare @oceny varchar(max) = ''
	select @oceny = @oceny + ISNULL(convert(varchar, Ocena), @norate) from Pracownicy P 
	left join Oceny O on O.Id_Pracownicy = P.Id_Pracownicy and O.Id_Zadania = @zadid 
		--and O.Aktualna = 1
		and O.DataOceny = '20140101'
	order by P.Id_Pracownicy
	RETURN @oceny
END

--select DataOceny, COUNT(*) from Oceny group by DataOceny order by 2 desc
GO
/****** Object:  UserDefinedFunction [dbo].[GeneratePass2]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GeneratePass2] (    
	@passwordLength smallint, 
    @lowerCaseBit bit, 
	@upperCaseBit  bit, 
	@numberBit bit, 
	@specialBit bit
)  
RETURNS varchar(200)
AS
BEGIN
	if @passwordLength is null set @passwordLength = 8
	if @lowerCaseBit is null set @lowerCaseBit = 1
	if @upperCaseBit is null set @upperCaseBit = 1
	if @numberBit is null set @numberBit = 1
	if @specialBit is null set @specialBit = 1
	
	declare @generatedPassword varchar(128)
	-- Variables holding the characters to be used
	--DECLARE @lowerCaseChar char(26) set @lowerCaseChar = 'abcdefghijklmnopqrstuvwxyz'
	--DECLARE @upperCaseChar char(26) set @upperCaseChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
	--DECLARE @numberChar char(10) set @numberChar = '0123456789'
	
	-- wykluczam niejednoznaczne znaki l,O,0
	DECLARE @lowerCaseChar char(26) set @lowerCaseChar = 'abcdefghijkamnopqrstuvwxyz'
	DECLARE @upperCaseChar char(26) set @upperCaseChar = 'ABCDEFGHAJKLMNBPQRSTUVWXYZ'
	DECLARE @numberChar char(10) set @numberChar = '5123456789'
	/*
	As per BOL (see topic: strong passwords):
	If used in an OLE DB or ODBC connection string, a login or password
	must not contain the following characters: [] {}() , ; ?
	These characters are used to either initialize a connection or
	separate connection values.
	*/
	DECLARE @specialChar char(33) set @specialChar = '`~#$%^&-_=+\\|:\"<.>/?';

	-- Placeholder for password. 128 is the maximum length allowed for passwords.
	DECLARE @password varchar(128) set @password = N'';

	-- String together the characters to be used for generating the password.
	-- It is set to be maximum 95 characters (26 + 26 + 10 + 33)
	DECLARE @workingSet nvarchar(95) set @workingSet = N'';
  
	IF @lowerCaseBit = 1 SET @workingSet = @workingSet + @lowerCaseChar;
	IF @upperCaseBit = 1 SET @workingSet = @workingSet + @upperCaseChar;
	IF @numberBit = 1 SET @workingSet = @workingSet + @numberChar;
	IF @specialBit = 1 SET @workingSet = @workingSet + @specialChar;
  
	-- Now that we have a set of characters, let's generate some random numbers.
	DECLARE @i tinyint set @i = 1;
	declare @num bit set @num = 0
	declare @ch char
	  
	WHILE @i <= @passwordLength
	BEGIN
		set @ch =  SUBSTRING(@workingSet, CONVERT(int, 1 + (LEN(@workingSet) * (select RAND from vrand))), 1)
		if CHARINDEX( @ch, @numberChar) > 0 
			set @num = 1
		SET @password = @password + @ch
        SET @i = @i + 1;
	END

	SET @generatedPassword = @password;
	if @numberBit = 1 and @num = 0 
		set @generatedPassword = LEFT(@generatedPassword, @passwordLength - 1) + SUBSTRING(@numberChar, CONVERT(int, 1 + (LEN(@numberChar) * (select RAND from vrand))), 1)
	return @generatedPassword
END 

/*
CREATE VIEW [dbo].[vrand]
AS
 SELECT RAND() rand

select dbo.GeneratePass2(8,1,1,1,0), dbo.GeneratePass(8, null, null, null)
*/






GO
/****** Object:  UserDefinedFunction [dbo].[GetCounter]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCounter](@start int, @end int) 
	RETURNS @dt TABLE (idx int)
AS 
BEGIN
	DECLARE @i INT 
	
	SET @i = @start 
	WHILE (@i <= @end) 
	BEGIN 
		INSERT INTO @dt (idx) VALUES (@i)
		SET @i = (@i + 1) 
	END 
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetCounter2]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCounter2](@start int, @inc int, @count int) 
	RETURNS @dt TABLE (idx int)
AS 
BEGIN
	DECLARE @i INT 
	DECLARE @v INT 
	
	SET @i = 1 
	SET @v = @start 
	WHILE (@i <= @count) 
	BEGIN 
		INSERT INTO @dt (idx) VALUES (@v)
		SET @i = @i + 1 
		SET @v = @v + @inc
	END 
	RETURN
END

/*
select * from dbo.GetCounter2(100, 30, 40)
*/
GO
/****** Object:  UserDefinedFunction [dbo].[getdate]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getdate] (@data datetime)
RETURNS datetime
AS
BEGIN
	declare @d datetime
	select @d = DATEADD(dd, 0, DATEDIFF(dd, 0, @data))
	return @d
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetDates2]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  UserDefinedFunction [dbo].[GetDates2]    Script Date: 03/15/2012 10:43:47 ******/
/****** Object:  UserDefinedFunction [dbo].[GetDates2]    Script Date: 03/01/2012 11:09:13 ******/
CREATE FUNCTION [dbo].[GetDates2](@startdate datetime, @enddate datetime) 
	RETURNS @dt TABLE (Lp int, Data datetime)
AS 
BEGIN
	DECLARE @i INT 
	DECLARE @cnt INT 

	SET @cnt = DATEDIFF(DAY, @startdate, @enddate) + 1;
	
	SET @i = 0 
	WHILE (@i < @cnt) 
	BEGIN 
		INSERT INTO @dt (Lp, Data) VALUES (@i, DATEADD(DAY, @i, @startdate))
		SET @i = (@i + 1) 
	END 
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetRightId]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetRightId](@rights varchar(max), @right int)
--ALTER FUNCTION [dbo].[GetRightId](@rights varchar(max), @right int)
RETURNS int
AS
BEGIN
	declare @value int
	set @value = ISNULL(case when @right < 0 or @right >= LEN(@rights) then 0 else CONVERT(int, SUBSTRING(@rights, @right + 1, 1)) end, 0)
	RETURN @value;
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetRightIdChr]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetRightIdChr](@rights varchar(max), @right int)
RETURNS char
AS
BEGIN
	declare @value char
	set @value = case when @right < 0 or @right >= LEN(@rights) then 0 else CONVERT(int, SUBSTRING(@rights, @right + 1, 1)) end
	RETURN @value;
END
GO
/****** Object:  UserDefinedFunction [dbo].[gettime]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[gettime] (@data datetime)
--ALTER FUNCTION getdate (@data datetime)
RETURNS datetime
AS
BEGIN
	declare @d datetime
	select @d = DATEADD(dd, DATEDIFF(dd, @data, '19000101'), @data)
	return @d
END
GO
/****** Object:  UserDefinedFunction [dbo].[MaxDate2]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MaxDate2] (@d1 datetime, @d2 datetime)
RETURNS datetime
AS
BEGIN
    declare @dd1 datetime
    declare @dd2 datetime
    declare @ret datetime
    set @dd1 = ISNULL(@d1, '20990909')
    set @dd2 = ISNULL(@d2, '20990909')
    if @dd1 > @dd2
        set @ret = @dd1
    else
        set @ret = @dd2
    return @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[MaxDate3]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MaxDate3] (@d1 datetime, @d2 datetime, @d3 datetime)
RETURNS datetime
AS
BEGIN
    declare @ret datetime
    declare @dd2 datetime
    declare @dd3 datetime
    set @ret = ISNULL(@d1, '20990909')
    set @dd2 = ISNULL(@d2, '20990909')
    set @dd3 = ISNULL(@d3, '20990909')
    if @dd2 > @ret set @ret = @dd2
    if @dd3 > @ret set @ret = @dd3
    return @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[MaxDate4]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MaxDate4] (@d1 datetime, @d2 datetime, @d3 datetime, @d4 datetime)
RETURNS datetime
AS
BEGIN
declare @ret datetime
declare @dd2 datetime
declare @dd3 datetime
declare @dd4 datetime
set @ret = ISNULL(@d1, '20990909')
set @dd2 = ISNULL(@d2, '20990909')
set @dd3 = ISNULL(@d3, '20990909')
set @dd4 = ISNULL(@d4, '20990909')
if @dd2 > @ret set @ret = @dd2
if @dd3 > @ret set @ret = @dd3
if @dd4 > @ret set @ret = @dd4
return @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[MinDate2]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MinDate2] (@d1 datetime, @d2 datetime)
RETURNS datetime
AS
BEGIN
    declare @dd1 datetime
    declare @dd2 datetime
    declare @ret datetime
    set @dd1 = ISNULL(@d1, '20990909')
    set @dd2 = ISNULL(@d2, '20990909')
    if @dd1 < @dd2
        set @ret = @dd1
    else
        set @ret = @dd2
    return @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[MinDate3]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MinDate3] (@d1 datetime, @d2 datetime, @d3 datetime)
RETURNS datetime
AS
BEGIN
    declare @dd2 datetime
    declare @dd3 datetime
    declare @ret datetime
    set @ret = ISNULL(@d1, '20990909')
    set @dd2 = ISNULL(@d2, '20990909')
    set @dd3 = ISNULL(@d3, '20990909')
    if @dd2 < @ret set @ret = @dd2
    if @dd3 < @ret set @ret = @dd3
    return @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[MinDate4]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MinDate4] (@d1 datetime, @d2 datetime, @d3 datetime, @d4 datetime)
RETURNS datetime
AS
BEGIN
declare @dd2 datetime
declare @dd3 datetime
declare @dd4 datetime
declare @ret datetime
set @ret = ISNULL(@d1, '20990909')
set @dd2 = ISNULL(@d2, '20990909')
set @dd3 = ISNULL(@d3, '20990909')
set @dd4 = ISNULL(@d4, '20990909')
if @dd2 < @ret set @ret = @dd2
if @dd3 < @ret set @ret = @dd3
if @dd4 < @ret set @ret = @dd4
return @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[noPL]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[noPL](@pl nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
	DECLARE @ret NVARCHAR(max)
	set @ret =
		--REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(  nie rozroznia upper
		REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		LOWER(@pl)
		,'ą','a'),'ć','c'),'ę','e'),'ł','l'),'ń','n'),'ó','o'),'ś','s'),'ź','z'),'ż','z')
		--,'Ą','A'),'Ć','C'),'Ę','E'),'Ł','L'),'Ń','N'),'Ó','O'),'Ś','S'),'Ź','Z'),'Ż','Z')
	RETURN @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[PROPERCASE]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[PROPERCASE]
(
--The string to be converted to proper case
@input varchar(8000)
)
--This function returns the proper case string of varchar type
RETURNS varchar(8000)
AS
BEGIN
IF @input IS NULL 
BEGIN
--Just return NULL if input string is NULL
RETURN NULL
END

--Character variable declarations
DECLARE @output varchar(8000)
--Integer variable declarations
DECLARE @ctr int, @len int, @found_at int
--Constant declarations
DECLARE @LOWER_CASE_a int, @LOWER_CASE_z int, @Delimiter char(3), @UPPER_CASE_A int, @UPPER_CASE_Z int

--Variable/Constant initializations
SET @ctr = 1
SET @len = LEN(@input)
SET @output = ''
SET @LOWER_CASE_a = 97
SET @LOWER_CASE_z = 122
SET @Delimiter = ' ,-'
SET @UPPER_CASE_A = 65
SET @UPPER_CASE_Z = 90

WHILE @ctr <= @len
BEGIN
--This loop will take care of reccuring white spaces
WHILE CHARINDEX(SUBSTRING(@input,@ctr,1), @Delimiter) > 0
BEGIN
SET @output = @output + SUBSTRING(@input,@ctr,1)
SET @ctr = @ctr + 1
END

IF ASCII(SUBSTRING(@input,@ctr,1)) BETWEEN @LOWER_CASE_a AND @LOWER_CASE_z
BEGIN
--Converting the first character to upper case
SET @output = @output + UPPER(SUBSTRING(@input,@ctr,1))
END
ELSE
BEGIN
SET @output = @output + SUBSTRING(@input,@ctr,1)
END

SET @ctr = @ctr + 1

WHILE CHARINDEX(SUBSTRING(@input,@ctr,1), @Delimiter) = 0 AND (@ctr <= @len)
BEGIN
IF ASCII(SUBSTRING(@input,@ctr,1)) BETWEEN @UPPER_CASE_A AND @UPPER_CASE_Z
BEGIN
SET @output = @output + LOWER(SUBSTRING(@input,@ctr,1))
END
ELSE
BEGIN
SET @output = @output + SUBSTRING(@input,@ctr,1)
END
SET @ctr = @ctr + 1
END

END
RETURN @output
END
GO
/****** Object:  UserDefinedFunction [dbo].[R]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[R](@rights varchar(max), @right int)
RETURNS char
AS
BEGIN
	declare @value char
	set @value = case when @right < 0 or @right >= LEN(@rights) then 0 else CONVERT(int, SUBSTRING(@rights, @right + 1, 1)) end
	RETURN @value;
END
GO
/****** Object:  UserDefinedFunction [dbo].[same]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[same] (@t1 nvarchar(max), @t2 nvarchar(max), @concat int)
RETURNS nvarchar(max)
AS
BEGIN
	declare @ret nvarchar(max)
	if @t1 is null or @t2 is null
		if @t1 is not null 
			set @ret = @t1
		else
			set @ret = @t2
	else
		if @t1 = @t2 
			set @ret = @t1
		else
			set @ret = 
				case @concat
					when 1 then @t1 + ' - ' + @t2
					when 2 then @t1 + ' (' + @t2 + ')'
					when 3 then @t1 + ', ' + @t2
					when 4 then @t1 + ' [' + @t2 + ']'
				else			@t1 + ' ' + @t2
				end 
	RETURN @ret
END
GO
/****** Object:  UserDefinedFunction [dbo].[SplitInt]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitInt](@str varchar(max), @delimiter char(1))       
returns @temptable TABLE (lp int, items int)       
as       
begin       
	if @str is not null and len(@str) > 0 begin       
		declare @idx int       
		declare @lp int       
		declare @slice varchar(max)       
		if @delimiter is null set @delimiter = ','
	  
		set @idx = 1       
		set @lp = 1
		while @idx!= 0       
		begin       
			set @idx = charindex(@delimiter,@str)       
			if @idx!=0       
				set @slice = left(@str,@idx - 1)       
			else       
				set @slice = @str       
	         
			if (len(@slice)>0) begin  
				insert into @temptable (lp, items) values (@lp, @slice)       
				set @lp = @lp + 1
			end
			set @str = right(@str,len(@str) - @idx)       
			if len(@str) = 0 break       
		end   
	end
	return       
end

/*
select * from dbo.SplitInt('1,2,3,4,5,10,9,8', ',')
select * from dbo.SplitInt('1;2;3;4;5;10;9;8', ';')
select * from dbo.SplitInt('1,2,3,4,5,10,9,8', null)
*/
GO
/****** Object:  UserDefinedFunction [dbo].[SplitInt2]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitInt2](@str varchar(max), @delimiter char(1))       
returns @temptable TABLE (lp int, items int)       
as       
begin       
	if @str is not null and len(@str) > 0 begin      
		declare @start int 
		declare @idx int       
		declare @lp int       
		declare @slice varchar(max)       
		if @delimiter is null set @delimiter = ','
		
		set @idx = 1
		set @start = 1
		set @lp = 1
		while @idx != 0 begin       
			set @idx = charindex(@delimiter,@str,@start)       
			if @idx != 0 begin       
				set @slice = substring(@str,@start,@idx - @start)       
				set @start = @idx + 1
			end	
			else 
				if @start = 1       
					set @slice = @str       
				else
					set @slice = substring(@str,@start,len(@str) - @start + 1)       
	         
			if len(@slice) > 0 begin  
				insert into @temptable (lp, items) values (@lp, @slice)       
				set @lp = @lp + 1
			end
		end   
	end
	return       
end

/*
select * from dbo.SplitInt2('1,2,3,4,5,10,9,8', ',')
select * from dbo.SplitInt2('1;2;3;4;5;10;9;8', ';')
select * from dbo.SplitInt2('1,2,3,4,5,10,9,8', null)
select * from dbo.SplitInt2('123', ',')
select * from dbo.SplitInt2('', ',')
select * from dbo.SplitInt2(null, ',')

declare @t datetime = GETDATE()
select * from dbo.SplitInt2('1,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40', ',')
select DATEDIFF(MS, @t, GETDATE())

declare @t datetime = GETDATE()
select * from dbo.SplitInt('1,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40', ',')
select DATEDIFF(MS, @t, GETDATE())

*/
GO
/****** Object:  UserDefinedFunction [dbo].[SplitStr]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitStr](@String nvarchar(max), @Delimiter char(1))       
returns @temptable TABLE (items nvarchar(max))       
as       
begin       
  declare @idx int       
  declare @slice varchar(8000)       
    
  select @idx = 1       
      if len(@String) < 1 or @String is null  return       
     
   while @idx!= 0       
   begin       
       set @idx = charindex(@Delimiter,@String)       
       if @idx!=0       
           set @slice = left(@String,@idx - 1)       
       else       
           set @slice = @String       
         
       if(len(@slice)>0)  
           insert into @temptable(Items) values(@slice)       
 
       set @String = right(@String,len(@String) - @idx)       
       if len(@String) = 0 break       
   end   
return       
end  
GO
/****** Object:  UserDefinedFunction [dbo].[ToTimeHMM]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ToTimeHMM](@sec INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @seconds INT;
	DECLARE @m INT;
	DECLARE @h INT;
	DECLARE @mm VARCHAR(2);
	DECLARE @hh VARCHAR(10);
	
	SET @seconds = abs(@sec)
	--SET @m = FLOOR((@seconds / 60) % 60);
	--SET @h = FLOOR(@seconds / 3600);
	SET @m = (@seconds / 60) % 60;
	SET @h = @seconds / 3600;
	
	IF (@m < 10) SET @mm = '0' + CONVERT(VARCHAR, @m, 1);
	ELSE SET @mm = CONVERT(VARCHAR, @m, 1);
	IF @sec < 0 
		SET @hh = '-' + CONVERT(VARCHAR, @h, 1);
	ELSE
		SET @hh = CONVERT(VARCHAR, @h, 1);
	
	RETURN @hh + ':' + @mm;
END
GO
/****** Object:  Table [dbo].[Absencja]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absencja](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPracownika] [int] NULL,
	[NR_EW] [nvarchar](20) NOT NULL,
	[DataOd] [datetime] NOT NULL,
	[DataDo] [datetime] NULL,
	[Kod] [int] NOT NULL,
	[IleDni] [int] NULL,
	[Godzin] [float] NULL,
 CONSTRAINT [PK_Absencja] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbsencjaKody]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsencjaKody](
	[Kod] [int] NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[Symbol] [nvarchar](10) NULL,
	[Widoczny] [bit] NOT NULL,
	[Status] [int] NULL,
	[GodzinPracy] [int] NOT NULL,
	[DniWolne] [bit] NOT NULL,
	[Kolor] [varchar](50) NULL,
	[KolorPU] [varchar](50) NULL,
	[PokazSymbolPU] [bit] NOT NULL,
	[WyborPU] [bit] NOT NULL,
	[WidocznyPU] [bit] NOT NULL,
	[Kolejnosc] [int] NULL,
	[NowaLinia] [bit] NOT NULL,
	[Opis] [nvarchar](500) NULL,
	[Typ] [int] NOT NULL,
	[Typ2] [char](1) NULL,
	[Kod2] [varchar](20) NULL,
 CONSTRAINT [PK_AbsencjaKody] PRIMARY KEY CLUSTERED 
(
	[Kod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbsencjeDlugotrwale]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsencjeDlugotrwale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rok] [datetime] NOT NULL,
	[IdPracownika] [int] NOT NULL,
	[Powod] [nvarchar](500) NULL,
	[PowodKod] [int] NULL,
	[AutorId] [int] NULL,
	[DataWpisu] [datetime] NOT NULL,
	[Od] [datetime] NOT NULL,
	[Do] [datetime] NULL,
 CONSTRAINT [PK_AbsencjeDlugotrwale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Akcja]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Akcja](
	[ID_Akcja] [int] IDENTITY(1,1) NOT NULL,
	[Akcja] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_Akcja] PRIMARY KEY CLUSTERED 
(
	[ID_Akcja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certyfikaty]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certyfikaty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUprawnienia] [int] NULL,
	[IdPracownika] [int] NULL,
	[Numer] [nvarchar](200) NULL,
	[DataWaznosci] [datetime] NULL,
	[Kategoria] [nvarchar](200) NULL,
	[DataZdobyciaUprawnien] [datetime] NULL,
	[DataWaznosciPsychotestow] [datetime] NULL,
	[DataWaznosciBadanLekarskich] [datetime] NULL,
	[DataWaznosciUmowy] [datetime] NULL,
	[UmowaLojalnosciowa] [bit] NOT NULL,
	[ImportId] [int] NULL,
	[DataZdobyciaUprawnienOk] [bit] NOT NULL,
	[DataWaznosciPsychotestowOk] [bit] NOT NULL,
	[DataWaznosciBadanLekarskichOk] [bit] NOT NULL,
	[UmowaLojalnosciowaOk] [bit] NOT NULL,
	[DataWaznosciSet] [bit] NOT NULL,
	[Aktualny] [bit] NOT NULL,
	[Uwagi] [nvarchar](500) NULL,
 CONSTRAINT [PK_Certyfikaty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CertyfikatySpaw]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertyfikatySpaw](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCertyfikatu] [int] NOT NULL,
	[IdUprawnienia] [int] NOT NULL,
	[IdPracownika] [int] NOT NULL,
	[SymbolSpawacza] [nvarchar](255) NULL,
	[Norma] [nvarchar](255) NULL,
	[Proces] [nvarchar](255) NULL,
	[TypMaterialu] [nvarchar](255) NULL,
	[TypZlacza] [nvarchar](255) NULL,
	[GrMaterialowa15608] [nvarchar](255) NULL,
	[MaterialDodatkowy] [nvarchar](255) NULL,
	[Grubosc] [nvarchar](255) NULL,
	[GruboscMin] [nvarchar](255) NULL,
	[GruboscMax] [nvarchar](255) NULL,
	[Srednica] [nvarchar](255) NULL,
	[Pozycja] [nvarchar](255) NULL,
	[NazwaUrzadzenia] [nvarchar](255) NULL,
	[NrCertyfikatu] [nvarchar](255) NULL,
	[DataWydania] [datetime] NULL,
	[DataWaznosci] [datetime] NOT NULL,
	[DataWaznosciOstPrzedl] [datetime] NULL,
	[DataNastPrzedl] [datetime] NULL,
	[IdMistrza] [int] NULL,
	[Mistrz] [nvarchar](255) NULL,
	[SymbolSpawalni] [nvarchar](255) NULL,
	[Uwagi] [nvarchar](255) NULL,
	[Aktualny] [bit] NOT NULL,
	[ImportId] [int] NULL,
	[Umiejetnosc] [nvarchar](30) NULL,
 CONSTRAINT [PK_CertyfikatySpaw] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cmd]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cmd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cmd] [varchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Msg1] [nvarchar](500) NULL,
	[Msg2] [nvarchar](2000) NULL,
	[AuthorId] [int] NULL,
	[Created] [datetime] NULL,
	[Executed] [datetime] NULL,
	[AuthKey] [varchar](255) NULL,
	[Par1] [nvarchar](500) NULL,
	[Par2] [nvarchar](500) NULL,
	[Par3] [nvarchar](500) NULL,
	[Par4] [nvarchar](500) NULL,
	[Par5] [nvarchar](500) NULL,
	[Par6] [nvarchar](500) NULL,
 CONSTRAINT [PK_Cmd] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[copyPracownicy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[copyPracownicy](
	[Id_Pracownicy] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_Zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_OrgM] [int] NULL,
	[x_Id_Str_OrgA] [int] NULL,
	[Id_Status] [int] NULL,
	[Status] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[APT] [bit] NOT NULL,
	[IdStrumienia] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[ScalData] [datetime] NULL,
	[ScalActualId] [int] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Rights] [varchar](50) NULL,
	[Id2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[copyPrzelozeni]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[copyPrzelozeni](
	[Id_Przelozeni] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_Org] [int] NULL,
	[Email] [nvarchar](255) NULL,
	[Telefon] [float] NULL,
	[Id_Priorytet] [int] NULL,
	[Login] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Blokada] [bit] NOT NULL,
	[Rights] [varchar](50) NULL,
	[Status] [int] NOT NULL,
	[x_IdsStrOrg] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Id2] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[copyStanowiska]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[copyStanowiska](
	[Id_Stanowiska] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa_Stan] [varchar](50) NULL,
	[Nazwa_StanEN] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[copyStrOrg]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[copyStrOrg](
	[Id_Str_Org] [int] IDENTITY(1,1) NOT NULL,
	[Id_Parent] [int] NULL,
	[Symb_Jedn] [nvarchar](255) NULL,
	[Nazwa_Jedn] [nvarchar](255) NULL,
	[Nazwa_JednEN] [nvarchar](255) NULL,
	[ID_Upr_Przel] [int] NULL,
	[Typ] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[copyStrukturaPrzelozeni]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[copyStrukturaPrzelozeni](
	[IdStruktury] [int] NOT NULL,
	[IdPrzelozonego] [int] NOT NULL,
	[DataOd] [datetime] NULL,
	[DataDo] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Frekwencja]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frekwencja](
	[Id_Frekwencja] [int] IDENTITY(1,1) NOT NULL,
	[Id_Pracownicy] [int] NULL,
	[Id_Akcja] [int] NULL,
	[Id_Str_Org] [int] NULL,
	[Data_Akcji] [date] NULL,
 CONSTRAINT [PK_Frm_Frekwencja] PRIMARY KEY CLUSTERED 
(
	[Id_Frekwencja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrOperacji]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrOperacji](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Symbol] [varchar](50) NOT NULL,
	[Nazwa] [varchar](255) NULL,
	[NazwaEN] [nvarchar](255) NULL,
 CONSTRAINT [PK_Tbl_Gr_Operacji] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrZatr]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrZatr](
	[Id_Gr_Zatr] [int] NOT NULL,
	[Rodzaj_Umowy] [nvarchar](50) NULL,
	[Rodzaj_UmowyEN] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_Gr_ZatrN] PRIMARY KEY CLUSTERED 
(
	[Id_Gr_Zatr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impMatryca]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impMatryca](
	[Dział] [nvarchar](255) NULL,
	[Obszar] [nvarchar](255) NULL,
	[Podobszar] [nvarchar](255) NULL,
	[Stanowisko] [nvarchar](255) NULL,
	[Uprawnienie] [nvarchar](255) NULL,
	[Waga czynności] [float] NULL,
	[Nr globalny] [float] NULL,
	[Zadanie] [nvarchar](255) NULL,
	[Lp] [float] NULL,
	[IdStrOrg] [int] NULL,
	[IdObszar] [int] NULL,
	[IdStanowiska] [int] NULL,
	[Upr] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impMatrycaMaj]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impMatrycaMaj](
	[nr ew pracownika] [float] NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imię] [nvarchar](255) NULL,
	[Dział] [nvarchar](255) NULL,
	[Stanowisko] [nvarchar](255) NULL,
	[Przełożony] [nvarchar](255) NULL,
	[nr ew przełożonego] [float] NULL,
	[Obszar w matrycy] [nvarchar](255) NULL,
	[IdDzialu] [int] NULL,
	[Idstanowiska] [int] NULL,
	[IdObszarMatryca] [int] NULL,
	[IdKierownika] [int] NULL,
	[IdPracownika] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportData]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportData](
	[Typ] [varchar](20) NOT NULL,
	[Id] [int] NOT NULL,
	[_Id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Id1] [int] NULL,
	[Id2] [int] NULL,
	[Id3] [int] NULL,
	[Id4] [int] NULL,
	[Text1] [nvarchar](500) NULL,
	[Text2] [nvarchar](500) NULL,
	[Text3] [nvarchar](500) NULL,
	[Text4] [nvarchar](500) NULL,
	[Code1] [int] NULL,
	[Code2] [int] NULL,
	[Code3] [int] NULL,
	[Code4] [int] NULL,
	[Data1] [datetime] NULL,
	[Data2] [datetime] NULL,
	[Data3] [datetime] NULL,
	[Data4] [datetime] NULL,
	[Float1] [float] NULL,
	[Float2] [float] NULL,
	[Float3] [float] NULL,
	[Float4] [float] NULL,
	[Bool1] [bit] NULL,
	[Bool2] [bit] NULL,
	[Bool3] [bit] NULL,
	[Bool4] [bit] NULL,
 CONSTRAINT [PK_ImportData] PRIMARY KEY CLUSTERED 
(
	[Typ] ASC,
	[Id] ASC,
	[_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impPracownicy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impPracownicy](
	[Nr ew pracownika] [float] NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imię] [nvarchar](255) NULL,
	[Data zatrudnienia] [datetime] NULL,
	[Dział] [nvarchar](255) NULL,
	[Stanowisko] [nvarchar](255) NULL,
	[Umowa do] [datetime] NULL,
	[e-mail] [nvarchar](255) NULL,
	[Przełożony] [nvarchar](255) NULL,
	[Nr ew przełożonego] [float] NULL,
	[IdStanowiska] [int] NULL,
	[IdPracownika] [int] NULL,
	[IdKierownika] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impPracownicy_20150325]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impPracownicy_20150325](
	[Nazwisko] [nvarchar](255) NULL,
	[Imię] [nvarchar](255) NULL,
	[Dział] [nvarchar](255) NULL,
	[Stanowisko] [nvarchar](255) NULL,
	[Przełożony] [nvarchar](255) NULL,
	[Nr ew przełożonego] [float] NULL,
	[K1] [float] NULL,
	[F8] [nvarchar](255) NULL,
	[IdPracownika] [int] NULL,
	[IdKierownika] [int] NULL,
	[IdStrOrg] [int] NULL,
	[IdStanowiska] [int] NULL,
	[nrew] [varchar](20) NULL,
	[id2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impStrOrg]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impStrOrg](
	[Parent ] [float] NULL,
	[Ja] [float] NULL,
	[Nazwa] [nvarchar](255) NULL,
	[Symbol] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impUprawnienia]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impUprawnienia](
	[Nr] [float] NULL,
	[Nazwa uprawnienia] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impZadania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impZadania](
	[Nr listy globalnej] [float] NULL,
	[Globalna lista czynności] [nvarchar](255) NULL,
	[Uprawnienia i szkolenia (symbol)] [nvarchar](255) NULL,
	[Waga] [float] NULL,
	[3] [float] NULL,
	[4] [float] NULL,
	[5] [float] NULL,
	[6] [float] NULL,
	[7] [float] NULL,
	[8] [float] NULL,
	[9] [float] NULL,
	[21] [float] NULL,
	[10] [float] NULL,
	[13] [float] NULL,
	[14] [nvarchar](255) NULL,
	[15] [nvarchar](255) NULL,
	[17] [nvarchar](255) NULL,
	[18] [nvarchar](255) NULL,
	[19] [nvarchar](255) NULL,
	[20] [nvarchar](255) NULL,
	[Sprawdzenie] [nvarchar](255) NULL,
	[Uwagi] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[impZmianyMistrza]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impZmianyMistrza](
	[Nazwisko] [nvarchar](255) NULL,
	[Imię] [nvarchar](255) NULL,
	[Dział] [nvarchar](255) NULL,
	[Stanowisko] [nvarchar](255) NULL,
	[Przełożony] [nvarchar](255) NULL,
	[Nr ew przełożonego] [float] NULL,
	[IdPracownika] [int] NULL,
	[IdStanowiska] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kody]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kody](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typ] [nvarchar](25) NULL,
	[Kod] [nvarchar](25) NULL,
	[Nazwa] [nvarchar](200) NULL,
	[NazwaEN] [nvarchar](200) NULL,
	[Nazwa2] [nvarchar](200) NULL,
	[Nazwa2EN] [nvarchar](200) NULL,
	[Str1] [nvarchar](500) NULL,
	[Str2] [nvarchar](500) NULL,
	[Str3] [nvarchar](500) NULL,
	[Str4] [nvarchar](500) NULL,
	[Int1] [int] NULL,
	[Int2] [int] NULL,
	[Int3] [int] NULL,
	[Int4] [int] NULL,
	[Data1] [datetime] NULL,
	[Data2] [datetime] NULL,
	[Data3] [datetime] NULL,
	[Data4] [datetime] NULL,
	[Float1] [float] NULL,
	[Float2] [float] NULL,
	[Float3] [float] NULL,
	[Float4] [float] NULL,
	[Kolejnosc] [int] NULL,
	[Aktywny] [bit] NOT NULL,
 CONSTRAINT [PK_Kody] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Komp]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Komp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](1024) NULL,
	[NazwaEN] [nvarchar](1024) NULL,
	[Opis] [nvarchar](1024) NULL,
	[OpisEN] [nvarchar](1024) NULL,
	[DataOd] [datetime] NOT NULL,
	[DataDo] [datetime] NULL,
	[Waga] [float] NULL,
	[Lp] [int] NULL,
	[ShowHeader] [bit] NOT NULL,
 CONSTRAINT [PK_KompPytania] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KompOdpowiedzi]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KompOdpowiedzi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPracownika] [int] NOT NULL,
	[IdProgramu] [int] NOT NULL,
	[IdPytania] [int] NOT NULL,
	[IdOdpowiedzi] [int] NULL,
 CONSTRAINT [PK_KompOdpowiedzi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KompStan]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KompStan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPytania] [int] NOT NULL,
	[IdStanowiska] [int] NOT NULL,
	[DataOd] [datetime] NOT NULL,
	[DataDo] [datetime] NULL,
	[Poziom] [float] NULL,
 CONSTRAINT [PK_KompPytStan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KompWskazniki]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KompWskazniki](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lp] [int] NULL,
	[Nazwa] [nvarchar](1024) NULL,
	[NazwaEN] [nvarchar](1024) NULL,
	[IdKomp] [int] NOT NULL,
	[Waga] [float] NULL,
	[DataOd] [datetime] NULL,
	[DataDo] [datetime] NULL,
	[ShowGrade] [bit] NOT NULL,
 CONSTRAINT [PK_KompPytaniaOdp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KompWskaznikiOceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KompWskaznikiOceny](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lp] [int] NULL,
	[IdWskaznika] [int] NOT NULL,
	[Nazwa] [nvarchar](512) NULL,
	[NazwaEN] [nvarchar](512) NULL,
	[Wartosc] [float] NULL,
 CONSTRAINT [PK_KompWskaznikiOceny] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KryteriaOceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KryteriaOceny](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Klucz0] [nvarchar](2) NOT NULL,
	[Klucz1] [nvarchar](2) NOT NULL,
	[Wartosc] [nvarchar](2) NOT NULL,
	[Od] [datetime] NOT NULL,
	[Do] [datetime] NULL,
	[Id_Stanowiska] [int] NULL,
 CONSTRAINT [PK_KryteriaOceny] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lang]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lang](
	[Lang] [varchar](20) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Msg] [nvarchar](2000) NOT NULL,
	[Trans] [nvarchar](2000) NULL,
	[MsgHash]  AS (CONVERT([varbinary](16),hashbytes('MD5',[Msg]),(0))),
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Lang] PRIMARY KEY CLUSTERED 
(
	[Lang] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinieZadania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinieZadania](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Str_Org] [int] NOT NULL,
	[Id_Zadania] [int] NOT NULL,
	[Id_Obszary] [int] NULL,
	[Id_Podobszary] [int] NULL,
	[Id_Maszyny] [int] NULL,
	[Id_Task] [int] NULL,
	[Id_Dzialanie] [int] NULL,
	[Id_Narzedzie] [int] NULL,
	[Id_Rodzaj] [int] NULL,
	[Id_Poziom] [int] NULL,
	[Id_Director] [int] NULL,
	[ProdAdm] [varchar](20) NULL,
	[Dyr] [varchar](20) NULL,
	[Lp] [int] NULL,
	[StrOrg] [varchar](20) NULL,
	[IdZadania1] [int] NULL,
 CONSTRAINT [PK_LinieZadania_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinieZadania_20150407]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinieZadania_20150407](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Str_Org] [int] NOT NULL,
	[Id_Zadania] [int] NOT NULL,
	[Id_Obszary] [int] NULL,
	[Id_Podobszary] [int] NULL,
	[Id_Maszyny] [int] NULL,
	[Id_Task] [int] NULL,
	[Id_Dzialanie] [int] NULL,
	[Id_Narzedzie] [int] NULL,
	[Id_Rodzaj] [int] NULL,
	[Id_Poziom] [int] NULL,
	[Id_Director] [int] NULL,
	[ProdAdm] [varchar](20) NULL,
	[Dyr] [varchar](20) NULL,
	[Lp] [int] NULL,
	[StrOrg] [varchar](20) NULL,
	[IdZadania1] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataCzas] [datetime] NOT NULL,
	[ParentId] [int] NOT NULL,
	[Typ] [int] NOT NULL,
	[Typ2] [int] NULL,
	[PracId] [int] NULL,
	[Login] [nvarchar](50) NULL,
	[Par] [char](10) NULL,
	[Kod] [int] NULL,
	[Kod2] [int] NULL,
	[Kod3] [int] NULL,
	[Kod4] [int] NULL,
	[Info] [nvarchar](1800) NULL,
	[Info2] [nvarchar](2000) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mailing]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mailing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typ] [varchar](25) NOT NULL,
	[Grupa] [varchar](25) NULL,
	[Opis] [nvarchar](200) NULL,
	[Temat] [nvarchar](200) NULL,
	[Tresc] [nvarchar](2000) NULL,
	[Aktywny] [bit] NOT NULL,
 CONSTRAINT [PK_Mailing] PRIMARY KEY CLUSTERED 
(
	[Typ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailingGrupy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailingGrupy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grupa] [varchar](25) NOT NULL,
	[Opis] [nvarchar](200) NULL,
	[ZnacznikiSql] [nvarchar](2000) NULL,
	[ZnacznikiSqlTest] [nvarchar](2000) NULL,
 CONSTRAINT [PK_MailingGrupy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailingZnaczniki]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailingZnaczniki](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grupa] [nvarchar](25) NOT NULL,
	[Znacznik] [varchar](30) NOT NULL,
	[Opis] [nvarchar](200) NULL,
	[Kolejnosc] [int] NULL,
 CONSTRAINT [PK_MailingZnaczniki] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MDzialania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MDzialania](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](255) NULL,
	[NazwaEN] [nvarchar](255) NULL,
	[IdParent] [int] NULL,
	[IdParents] [varchar](500) NULL,
 CONSTRAINT [PK_MDzialania] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MMaszyny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MMaszyny](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](255) NULL,
	[NazwaEN] [nvarchar](255) NULL,
	[IdParent] [int] NULL,
	[IdParents] [varchar](500) NULL,
	[IdParents2] [varchar](500) NULL,
 CONSTRAINT [PK_Maszyny] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MNarzedzia]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MNarzedzia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](255) NULL,
	[NazwaEN] [nvarchar](255) NULL,
	[IdParent] [int] NULL,
	[IdParents] [varchar](500) NULL,
	[IdParents2] [varchar](500) NULL,
 CONSTRAINT [PK_MNarzedzia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MObszary]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MObszary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](255) NULL,
	[NazwaEN] [nvarchar](255) NULL,
	[IdParent] [int] NULL,
 CONSTRAINT [PK_Obszary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monity]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typ] [char](10) NOT NULL,
	[EventId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Monity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPodobszary]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPodobszary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](255) NULL,
	[NazwaEN] [nvarchar](255) NULL,
	[IdParent] [int] NULL,
	[IdParents] [varchar](500) NULL,
 CONSTRAINT [PK_Podobszary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPoziomy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPoziomy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](255) NULL,
	[NazwaEN] [nvarchar](255) NULL,
	[IdParent] [int] NULL,
	[IdParents] [varchar](500) NULL,
 CONSTRAINT [PK_MPoziomy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRodzaje]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRodzaje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](255) NULL,
	[NazwaEN] [nvarchar](255) NULL,
	[IdParent] [int] NULL,
 CONSTRAINT [PK_MRodzaje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MZadania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MZadania](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](255) NULL,
	[NazwaEN] [nvarchar](255) NULL,
	[IdParent] [int] NULL,
 CONSTRAINT [PK_MZadania] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oceny](
	[Id_Oceny] [int] IDENTITY(1,1) NOT NULL,
	[Id_Pracownicy] [int] NOT NULL,
	[Id_Zadania] [int] NOT NULL,
	[Ocena] [int] NULL,
	[Id_Przelozony] [int] NOT NULL,
	[DataOceny] [datetime] NOT NULL,
	[Aktualna] [bit] NOT NULL,
	[Uwagi] [nvarchar](200) NULL,
	[IdStruktury] [int] NULL,
	[IdStrParent] [int] NULL,
	[ScalIdPrac] [int] NULL,
	[Nr_Ark] [int] NULL,
	[IdZadania1] [int] NULL,
	[Typ] [int] NULL,
	[Wartosc] [float] NULL,
 CONSTRAINT [PK_Tbl_OcenyN] PRIMARY KEY CLUSTERED 
(
	[Id_Oceny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OcenyNazwy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OcenyNazwy](
	[Ocena] [int] NULL,
	[Nazwa] [nvarchar](100) NULL,
	[Opis] [nvarchar](200) NULL,
	[Color] [varchar](20) NULL,
	[BkColor] [varchar](20) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NazwaEN] [nvarchar](100) NULL,
	[OpisEN] [nvarchar](200) NULL,
	[Wybor] [bit] NOT NULL,
	[Kolejnosc] [int] NULL,
	[Procent] [nvarchar](50) NULL,
	[Symbol] [nvarchar](10) NULL,
	[Wartosc] [float] NULL,
 CONSTRAINT [PK_OcenyNazwy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oddelegowania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oddelegowania](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPracownika] [int] NOT NULL,
	[Od] [datetime] NOT NULL,
	[Do] [datetime] NOT NULL,
	[IdStruktury] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[IdKierownikaRq] [int] NULL,
	[DataRq] [datetime] NULL,
	[UwagiRq] [nvarchar](200) NULL,
	[IdKierownikaAcc] [int] NULL,
	[DataAcc] [datetime] NULL,
	[UwagiAcc] [nvarchar](200) NULL,
	[Status] [int] NOT NULL,
	[Typ] [int] NOT NULL,
	[MailingKadry] [bit] NOT NULL,
	[Pole1] [nvarchar](200) NULL,
	[Pole2] [nvarchar](200) NULL,
	[Pole3] [nvarchar](200) NULL,
	[Pole4] [nvarchar](200) NULL,
	[Pole5] [nvarchar](200) NULL,
	[Pole6] [nvarchar](200) NULL,
	[Pole7] [nvarchar](200) NULL,
	[Pole8] [nvarchar](200) NULL,
	[Uwaga1] [nvarchar](500) NULL,
	[Uwaga2] [nvarchar](500) NULL,
	[Uwaga3] [nvarchar](500) NULL,
	[StatusKadry] [int] NULL,
 CONSTRAINT [PK_Oddelegowania] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBKartaSekcje]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBKartaSekcje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typ] [int] NULL,
	[Nazwa] [nvarchar](128) NULL,
	[NazwaEN] [nvarchar](128) NULL,
 CONSTRAINT [PK_ONBSekcje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBKarty]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBKarty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPracownika] [int] NOT NULL,
	[IdOpiekuna] [int] NULL,
	[IdPrzelozonego] [int] NULL,
	[DataZalozenia] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[DataKoncaOP] [datetime] NULL,
	[DataKoncaPW] [datetime] NULL,
	[Uwagi] [nvarchar](1024) NULL,
 CONSTRAINT [PK_ONBKarty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBMiejscaSzkolen]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBMiejscaSzkolen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](128) NULL,
	[NazwaEn] [nvarchar](128) NULL,
 CONSTRAINT [PK_ONBMiejscaSzkolen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBStrSzkolenia]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBStrSzkolenia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdStrOrg] [int] NOT NULL,
	[IdSzkolenia] [int] NOT NULL,
 CONSTRAINT [PK_ONBStrSzkolenia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBStrZadania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBStrZadania](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdZadania] [int] NOT NULL,
	[IdStrOrg] [int] NOT NULL,
 CONSTRAINT [PK_ONBStrZadania] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBSzkoleniaGrupy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBSzkoleniaGrupy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](128) NULL,
	[NazwaEN] [nvarchar](128) NULL,
	[Link] [nvarchar](1024) NULL,
 CONSTRAINT [PK_ONBSzkoleniaSekcje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBSzkoleniaPracownicy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBSzkoleniaPracownicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdKarty] [int] NOT NULL,
	[SzkolenieId] [int] NULL,
	[Zaliczyl] [bit] NULL,
	[TypId] [int] NOT NULL,
 CONSTRAINT [PK_ONBSzkoleniaPracownicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBSzkoleniaTerminy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBSzkoleniaTerminy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RodzajSzkoleniaId] [int] NOT NULL,
	[TrenerId] [int] NULL,
	[Status] [int] NOT NULL,
	[Data] [datetime] NULL,
	[MiejsceId] [int] NULL,
	[Uwagi] [nvarchar](1024) NULL,
	[RzCzasTrwania] [int] NULL,
 CONSTRAINT [PK_ONBSzkolenia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBSzkoleniaTrenerzy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBSzkoleniaTrenerzy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTrenera] [int] NOT NULL,
	[IdSzkolenia] [int] NOT NULL,
 CONSTRAINT [PK_ONBSzkoleniaTrenerzy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBSzkoleniaTypy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBSzkoleniaTypy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](512) NULL,
	[NazwaEN] [nvarchar](512) NULL,
	[Status] [int] NULL,
	[Typ] [int] NULL,
	[IdGrupy] [int] NULL,
	[CzasTrwania] [int] NULL,
 CONSTRAINT [PK_ONBRodzajeSzkolen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBZadania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBZadania](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](512) NULL,
	[NazwaEN] [nvarchar](512) NULL,
 CONSTRAINT [PK_ONBZadania] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ONBZaliczenia]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ONBZaliczenia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdKarty] [int] NOT NULL,
	[Zaliczyl] [bit] NULL,
	[Data] [datetime] NULL,
	[IdProwadzacego] [int] NULL,
	[Zalecenia] [nvarchar](512) NULL,
	[IdZadania] [int] NOT NULL,
 CONSTRAINT [PK_ONBZaliczenia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassSkills]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassSkills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Poziom] [nvarchar](100) NOT NULL,
	[OpisZlacza] [nvarchar](200) NOT NULL,
	[Kwalifikacje] [nvarchar](100) NOT NULL,
	[Aktywny] [bit] NOT NULL,
 CONSTRAINT [PK_PassSkils] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pkt]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pkt](
	[Lp] [int] NOT NULL,
	[Ocena] [int] NULL,
	[Opis] [nvarchar](255) NULL,
 CONSTRAINT [PK_Tbl_PktN] PRIMARY KEY CLUSTERED 
(
	[Lp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy](
	[Id_Pracownicy] [int] NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_Zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_OrgM] [int] NULL,
	[x_Id_Str_OrgA] [int] NULL,
	[Id_Status] [int] NULL,
	[Status] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[APT] [bit] NOT NULL,
	[IdStrumienia] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[ScalData] [datetime] NULL,
	[ScalActualId] [int] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Rights] [varchar](100) NULL,
	[Id2] [int] NULL,
	[Plec] [char](1) NULL,
	[Id3] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Tbl_Pracownicy_1] PRIMARY KEY CLUSTERED 
(
	[Id_Pracownicy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy_]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy_](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Imie] [nvarchar](50) NULL,
	[Nazwisko] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Mailing] [bit] NOT NULL,
	[IdDzialu] [int] NULL,
	[IdStanowiska] [int] NULL,
	[IdKierownika] [int] NULL,
	[IdProjektu] [int] NULL,
	[Admin] [bit] NOT NULL,
	[Kierownik] [bit] NOT NULL,
	[Raporty] [bit] NOT NULL,
	[KadryId] [char](5) NULL,
	[Stawka] [money] NULL,
	[RcpId] [int] NULL,
	[Status] [int] NULL,
	[RcpStrefaId] [int] NULL,
	[RcpAlgorytm] [int] NULL,
	[Created] [datetime] NOT NULL,
	[DataZatr] [datetime] NULL,
	[EtatL] [int] NULL,
	[EtatM] [int] NULL,
	[Info] [nvarchar](500) NULL,
	[CCInfo] [nvarchar](200) NULL,
	[Rights] [varchar](100) NULL,
	[GrSplitu] [int] NULL,
	[IdLinii] [int] NULL,
	[Nick] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[NrKarty1] [varchar](50) NULL,
	[NrKarty2] [varchar](50) NULL,
	[DataZwol] [datetime] NULL,
	[KadryId2] [varchar](20) NULL,
	[PassExpire] [datetime] NULL,
	[OkresProbnyDo] [datetime] NULL,
 CONSTRAINT [PK_Pracownicy_] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy_20150315]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy_20150315](
	[Id_Pracownicy] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_Zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_OrgM] [int] NULL,
	[x_Id_Str_OrgA] [int] NULL,
	[Id_Status] [int] NULL,
	[Status] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[APT] [bit] NOT NULL,
	[IdStrumienia] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[ScalData] [datetime] NULL,
	[ScalActualId] [int] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Rights] [varchar](50) NULL,
	[Id2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy_20150326]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy_20150326](
	[Id_Pracownicy] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_Zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_OrgM] [int] NULL,
	[x_Id_Str_OrgA] [int] NULL,
	[Id_Status] [int] NULL,
	[Status] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[APT] [bit] NOT NULL,
	[IdStrumienia] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[ScalData] [datetime] NULL,
	[ScalActualId] [int] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Rights] [varchar](50) NULL,
	[Id2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy_20150401]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy_20150401](
	[Id_Pracownicy] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_Zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_OrgM] [int] NULL,
	[x_Id_Str_OrgA] [int] NULL,
	[Id_Status] [int] NULL,
	[Status] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[APT] [bit] NOT NULL,
	[IdStrumienia] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[ScalData] [datetime] NULL,
	[ScalActualId] [int] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Rights] [varchar](50) NULL,
	[Id2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy_20150710]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy_20150710](
	[Id_Pracownicy] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_Zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_OrgM] [int] NULL,
	[x_Id_Str_OrgA] [int] NULL,
	[Id_Status] [int] NULL,
	[Status] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[APT] [bit] NOT NULL,
	[IdStrumienia] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[ScalData] [datetime] NULL,
	[ScalActualId] [int] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Rights] [varchar](100) NULL,
	[Id2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy_20150727]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy_20150727](
	[Id_Pracownicy] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_Zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_OrgM] [int] NULL,
	[x_Id_Str_OrgA] [int] NULL,
	[Id_Status] [int] NULL,
	[Status] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[APT] [bit] NOT NULL,
	[IdStrumienia] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[ScalData] [datetime] NULL,
	[ScalActualId] [int] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Rights] [varchar](100) NULL,
	[Id2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy_20160115]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy_20160115](
	[Id_Pracownicy] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_Zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_OrgM] [int] NULL,
	[x_Id_Str_OrgA] [int] NULL,
	[Id_Status] [int] NULL,
	[Status] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[APT] [bit] NOT NULL,
	[IdStrumienia] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[ScalData] [datetime] NULL,
	[ScalActualId] [int] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Rights] [varchar](100) NULL,
	[Id2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy_20160926]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy_20160926](
	[Id_Pracownicy] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_Zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_OrgM] [int] NULL,
	[x_Id_Str_OrgA] [int] NULL,
	[Id_Status] [int] NULL,
	[Status] [int] NOT NULL,
	[IdKierownika] [int] NULL,
	[APT] [bit] NOT NULL,
	[IdStrumienia] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[ScalData] [datetime] NULL,
	[ScalActualId] [int] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Rights] [varchar](100) NULL,
	[Id2] [int] NULL,
	[Plec] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PracownicyHistoria]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracownicyHistoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPracownika] [int] NOT NULL,
	[Od] [datetime] NULL,
	[Do] [datetime] NULL,
	[IdStrOrg] [int] NULL,
	[IdKierownika] [int] NULL,
	[IdStanowiska] [int] NULL,
 CONSTRAINT [PK_PracownicyHistoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PracownicyStrOrg]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracownicyStrOrg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPracownika] [int] NOT NULL,
	[IdStrOrg] [int] NULL,
	[IdParent] [int] NULL,
	[IdParentNew] [int] NULL,
	[Data] [datetime] NOT NULL,
 CONSTRAINT [PK_PracownicyStrOrg] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priorytet]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priorytet](
	[Id_Piorytet] [int] NOT NULL,
	[Priorytet] [int] NULL,
	[Opis] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tbl_PriorytetN] PRIMARY KEY CLUSTERED 
(
	[Id_Piorytet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produktywnosc]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produktywnosc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Data] [datetime] NULL,
	[IdPracownika] [int] NULL,
	[Wartosc] [float] NULL,
 CONSTRAINT [PK_Produktywnosc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataOd] [datetime] NOT NULL,
	[DataDo] [datetime] NOT NULL,
	[DataOcenyOd] [datetime] NULL,
	[DataOcenyDo] [datetime] NULL,
	[Status] [int] NOT NULL,
	[Nazwa] [nvarchar](512) NULL,
	[NazwaEN] [nvarchar](512) NULL,
	[OkresKarencji] [int] NULL,
 CONSTRAINT [PK_Programy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramyAnkiety]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramyAnkiety](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProgramu] [int] NOT NULL,
	[IdPracownika] [int] NOT NULL,
	[IdStrOrg] [int] NULL,
	[IdPrzelozonego] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ProgramyAnkiety] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramyOceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramyOceny](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProgramu] [int] NULL,
	[IdPracownika] [int] NULL,
	[IdZadania] [int] NULL,
	[Ocena] [int] NULL,
	[Uwagi] [nvarchar](1024) NULL,
 CONSTRAINT [PK_ProgramyOceny] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramyZadania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramyZadania](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProgramu] [int] NOT NULL,
	[IdZadania] [int] NOT NULL,
	[IdStrOrg] [int] NULL,
 CONSTRAINT [PK_ProgramyZadania] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Przelozeni_20150124]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przelozeni_20150124](
	[Id_Przelozeni] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_Org] [int] NULL,
	[Email] [nvarchar](255) NULL,
	[Telefon] [float] NULL,
	[Id_Priorytet] [int] NULL,
	[Login] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Blokada] [bit] NOT NULL,
	[Rights] [varchar](50) NULL,
	[Status] [int] NOT NULL,
	[x_IdsStrOrg] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Id2] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Przelozeni_x]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przelozeni_x](
	[Id_Przelozeni] [int] IDENTITY(1,1) NOT NULL,
	[Nazwisko] [nvarchar](255) NULL,
	[Imie] [nvarchar](255) NULL,
	[Imie2] [nvarchar](255) NULL,
	[Nr_Ewid] [nvarchar](255) NULL,
	[Id_Gr_zatr] [int] NULL,
	[Id_Stanowiska] [int] NULL,
	[Id_Str_Org] [int] NULL,
	[Email] [nvarchar](255) NULL,
	[Telefon] [float] NULL,
	[Id_Priorytet] [int] NULL,
	[Login] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Blokada] [bit] NOT NULL,
	[Rights] [varchar](50) NULL,
	[Status] [int] NOT NULL,
	[x_IdsStrOrg] [varchar](200) NULL,
	[Nick] [varchar](50) NULL,
	[Id2] [int] NULL,
	[DataZatr] [datetime] NULL,
	[DataUmDo] [datetime] NULL,
	[DataZwol] [datetime] NULL,
	[Nr_Ewid2] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_PrzelożeniN] PRIMARY KEY CLUSTERED 
(
	[Id_Przelozeni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaportyScheduler]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaportyScheduler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[IdPracownika] [int] NOT NULL,
	[IdRaportu] [int] NOT NULL,
	[Parametry] [nvarchar](2000) NULL,
	[Typ] [int] NOT NULL,
	[cc] [nvarchar](2000) NULL,
	[bcc] [nvarchar](2000) NULL,
	[DataStartu] [datetime] NOT NULL,
	[DataStopu] [datetime] NULL,
	[InterwalTyp] [varchar](20) NULL,
	[Interwal] [int] NULL,
	[InterwalSql] [nvarchar](2000) NULL,
	[NextStart] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Aktywny] [bit] NOT NULL,
	[LastStart] [datetime] NULL,
	[LastStop] [datetime] NULL,
	[LastError] [nvarchar](1000) NULL,
 CONSTRAINT [PK_RaportyScheduler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scheduler]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scheduler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typ] [varchar](25) NULL,
	[Grupa] [varchar](25) NULL,
	[SQL] [nvarchar](max) NULL,
	[Aktywny] [bit] NOT NULL,
	[Komentarz] [nvarchar](max) NULL,
	[Kolejnosc] [int] NULL,
	[Wersja] [varchar](20) NULL,
	[WersjaData] [datetime] NULL,
	[AutorId] [int] NULL,
 CONSTRAINT [PK_Scheduler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerCommands]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerCommands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cmd] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Msg1] [nvarchar](500) NULL,
	[Msg2] [nvarchar](2000) NULL,
	[AuthorId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[Par1] [nvarchar](500) NULL,
	[Par2] [nvarchar](500) NULL,
	[Par3] [nvarchar](500) NULL,
	[Par4] [nvarchar](500) NULL,
	[Par5] [nvarchar](500) NULL,
	[Par6] [nvarchar](500) NULL,
 CONSTRAINT [PK_ServerCommands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SqlContent]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SqlContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grupa] [nvarchar](50) NOT NULL,
	[Typ] [int] NOT NULL,
	[MenuText] [nvarchar](200) NULL,
	[MenuTextEN] [nvarchar](200) NULL,
	[ConStr] [nvarchar](100) NULL,
	[Sql] [nvarchar](max) NULL,
	[Opis] [nvarchar](max) NULL,
	[Kolejnosc] [int] NULL,
	[Aktywny] [bit] NOT NULL,
 CONSTRAINT [PK_poOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SqlMenu]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SqlMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grupa] [nvarchar](50) NULL,
	[ParentId] [int] NULL,
	[MenuText] [nvarchar](200) NOT NULL,
	[MenuTextEN] [nvarchar](200) NOT NULL,
	[ToolTip] [nvarchar](500) NULL,
	[ToolTipEN] [nvarchar](500) NULL,
	[Command] [nvarchar](500) NULL,
	[Kolejnosc] [int] NULL,
	[Aktywny] [bit] NOT NULL,
	[Image] [nvarchar](255) NULL,
	[Rights] [varchar](200) NULL,
	[Par1] [nvarchar](200) NULL,
	[Par2] [nvarchar](200) NULL,
	[Sql] [nvarchar](max) NULL,
	[SqlParams] [nvarchar](max) NULL,
	[Mode] [int] NULL,
 CONSTRAINT [PK_SqlMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stanowiska]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stanowiska](
	[Id_Stanowiska] [int] NOT NULL,
	[Nazwa_Stan] [varchar](50) NULL,
	[Nazwa_StanEN] [nvarchar](255) NULL,
 CONSTRAINT [PK_Tbl_Stanowiska] PRIMARY KEY CLUSTERED 
(
	[Id_Stanowiska] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Nazwa] [nvarchar](100) NULL,
	[Nazwa2] [nvarchar](100) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusPrac]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusPrac](
	[Id_Status_Prac] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_Status_PracN] PRIMARY KEY CLUSTERED 
(
	[Id_Status_Prac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrOrg]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrOrg](
	[Id_Str_Org] [int] IDENTITY(1,1) NOT NULL,
	[Id_Parent] [int] NULL,
	[Symb_Jedn] [nvarchar](255) NULL,
	[Nazwa_Jedn] [nvarchar](255) NULL,
	[Nazwa_JednEN] [nvarchar](255) NULL,
	[ID_Upr_Przel] [int] NULL,
	[Typ] [int] NOT NULL,
	[Path] [varchar](500) NULL,
 CONSTRAINT [PK_Tbl_Str_OrgN] PRIMARY KEY CLUSTERED 
(
	[Id_Str_Org] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrOrg_20141218]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrOrg_20141218](
	[Id_Str_Org] [int] IDENTITY(1,1) NOT NULL,
	[Id_Parent] [int] NULL,
	[Symb_Jedn] [nvarchar](255) NULL,
	[Nazwa_Jedn] [nvarchar](255) NULL,
	[Nazwa_JednEN] [nvarchar](255) NULL,
	[ID_Upr_Przel] [int] NULL,
	[Typ] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrOrg_20141228]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrOrg_20141228](
	[Id_Str_Org] [int] IDENTITY(1,1) NOT NULL,
	[Id_Parent] [int] NULL,
	[Symb_Jedn] [nvarchar](255) NULL,
	[Nazwa_Jedn] [nvarchar](255) NULL,
	[Nazwa_JednEN] [nvarchar](255) NULL,
	[ID_Upr_Przel] [int] NULL,
	[Typ] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrOrg_20150524]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrOrg_20150524](
	[Id_Str_Org] [int] IDENTITY(1,1) NOT NULL,
	[Id_Parent] [int] NULL,
	[Symb_Jedn] [nvarchar](255) NULL,
	[Nazwa_Jedn] [nvarchar](255) NULL,
	[Nazwa_JednEN] [nvarchar](255) NULL,
	[ID_Upr_Przel] [int] NULL,
	[Typ] [int] NOT NULL,
	[Path] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrOrg_20151231]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrOrg_20151231](
	[Id_Str_Org] [int] IDENTITY(1,1) NOT NULL,
	[Id_Parent] [int] NULL,
	[Symb_Jedn] [nvarchar](255) NULL,
	[Nazwa_Jedn] [nvarchar](255) NULL,
	[Nazwa_JednEN] [nvarchar](255) NULL,
	[ID_Upr_Przel] [int] NULL,
	[Typ] [int] NOT NULL,
	[Path] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrOrg_20170228]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrOrg_20170228](
	[Id_Str_Org] [int] IDENTITY(1,1) NOT NULL,
	[Id_Parent] [int] NULL,
	[Symb_Jedn] [nvarchar](255) NULL,
	[Nazwa_Jedn] [nvarchar](255) NULL,
	[Nazwa_JednEN] [nvarchar](255) NULL,
	[ID_Upr_Przel] [int] NULL,
	[Typ] [int] NOT NULL,
	[Path] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrukturaPrzelozeni]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrukturaPrzelozeni](
	[IdStruktury] [int] NOT NULL,
	[IdPrzelozonego] [int] NOT NULL,
	[DataOd] [datetime] NULL,
	[DataDo] [datetime] NULL,
 CONSTRAINT [PK_StrukturaKierownicy] PRIMARY KEY CLUSTERED 
(
	[IdPrzelozonego] ASC,
	[IdStruktury] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrukturaPrzelozeni_20141228]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrukturaPrzelozeni_20141228](
	[IdStruktury] [int] NOT NULL,
	[IdPrzelozonego] [int] NOT NULL,
	[DataOd] [datetime] NULL,
	[DataDo] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StrukturaPrzelozeni_20150326]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StrukturaPrzelozeni_20150326](
	[IdStruktury] [int] NOT NULL,
	[IdPrzelozonego] [int] NOT NULL,
	[DataOd] [datetime] NULL,
	[DataDo] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teksty]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teksty](
	[Typ] [varchar](20) NOT NULL,
	[Opis] [nvarchar](200) NOT NULL,
	[Tekst] [nvarchar](max) NULL,
	[TekstEN] [nvarchar](max) NULL,
 CONSTRAINT [PK_Teksty] PRIMARY KEY CLUSTERED 
(
	[Typ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpImportData]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpImportData](
	[Typ] [varchar](20) NOT NULL,
	[Id] [int] NOT NULL,
	[_Id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Id1] [int] NULL,
	[Id2] [int] NULL,
	[Id3] [int] NULL,
	[Id4] [int] NULL,
	[Text1] [nvarchar](500) NULL,
	[Text2] [nvarchar](500) NULL,
	[Text3] [nvarchar](500) NULL,
	[Text4] [nvarchar](500) NULL,
	[Code1] [int] NULL,
	[Code2] [int] NULL,
	[Code3] [int] NULL,
	[Code4] [int] NULL,
	[Data1] [datetime] NULL,
	[Data2] [datetime] NULL,
	[Data3] [datetime] NULL,
	[Data4] [datetime] NULL,
	[Float1] [float] NULL,
	[Float2] [float] NULL,
	[Float3] [float] NULL,
	[Float4] [float] NULL,
	[Bool1] [bit] NULL,
	[Bool2] [bit] NULL,
	[Bool3] [bit] NULL,
	[Bool4] [bit] NULL,
 CONSTRAINT [PK_tmpImportData] PRIMARY KEY CLUSTERED 
(
	[Typ] ASC,
	[Id] ASC,
	[_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uprawnienia]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uprawnienia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typ] [int] NOT NULL,
	[Symbol] [nvarchar](200) NULL,
	[Nazwa] [nvarchar](200) NOT NULL,
	[NazwaEN] [nvarchar](200) NULL,
	[Poziom] [nvarchar](200) NULL,
	[PoziomEN] [nvarchar](200) NULL,
	[Opis] [nvarchar](200) NULL,
	[Pola] [nvarchar](200) NULL,
	[Kolejnosc] [int] NULL,
	[Aktywne] [bit] NOT NULL,
	[Produkcyjne] [bit] NOT NULL,
	[Nieprodukcyjne] [bit] NOT NULL,
	[PaszportSpawacza] [bit] NOT NULL,
	[KwalifikacjeId] [int] NULL,
	[PoziomId] [int] NULL,
	[PoziomPoziom] [int] NULL,
	[Grupa] [bit] NOT NULL,
	[Wymagane] [bit] NOT NULL,
	[Zablokowane] [bit] NOT NULL,
 CONSTRAINT [PK_Uprawnienia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UprawnieniaGrupySpecyfikacja]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UprawnieniaGrupySpecyfikacja](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGrupy] [int] NOT NULL,
	[IdUprawnienia] [int] NOT NULL,
	[Od] [datetime] NOT NULL,
	[Do] [datetime] NULL,
 CONSTRAINT [PK_UprawnieniaGrupySpecyfikacja] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UprawnieniaKwalifikacje]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UprawnieniaKwalifikacje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typ] [int] NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[Kolejnosc] [int] NULL,
	[Aktywna] [bit] NOT NULL,
	[NazwaEN] [nvarchar](100) NULL,
 CONSTRAINT [PK_UprawnieniaKwalifikacje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UprawnieniaTypy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UprawnieniaTypy](
	[Id] [int] NOT NULL,
	[TypNazwa] [nvarchar](100) NOT NULL,
	[Kolejnosc] [int] NULL,
	[Aktywny] [bit] NOT NULL,
	[Wybor] [bit] NOT NULL,
	[TypNazwaEN] [nvarchar](100) NULL,
 CONSTRAINT [PK_UprawnieniaTypy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserParams]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserParams](
	[UserId] [int] NOT NULL,
	[Typ] [varchar](50) NOT NULL,
	[Str1] [nvarchar](200) NULL,
	[Str2] [nvarchar](500) NULL,
	[Int1] [int] NULL,
	[Int2] [int] NULL,
	[Data1] [datetime] NULL,
	[Data2] [datetime] NULL,
	[Float1] [float] NULL,
	[Float2] [float] NULL,
	[Bool1] [bit] NOT NULL,
	[Bool2] [bit] NOT NULL,
 CONSTRAINT [PK_UserParams] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Typ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ustawienia]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ustawienia](
	[Id] [int] NOT NULL,
	[Konserwacja] [bit] NULL,
	[ADKontroler] [nvarchar](100) NULL,
	[ADPath] [nvarchar](500) NULL,
	[SMTPSerwer] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[AppAddr] [nvarchar](200) NULL,
	[IdSupervisor] [int] NULL,
	[StartSystemu] [datetime] NULL,
	[Wersja] [nvarchar](20) NULL,
 CONSTRAINT [PK_Ustawienia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wagi]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wagi](
	[Id_Waga] [int] IDENTITY(1,1) NOT NULL,
	[Waga] [int] NOT NULL,
	[Waga_Opis] [nvarchar](200) NULL,
	[Waga_OpisEN] [nvarchar](200) NULL,
 CONSTRAINT [PK_Tbl_WagiN] PRIMARY KEY CLUSTERED 
(
	[Id_Waga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Widelki]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Widelki](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataOd] [datetime] NOT NULL,
	[DataDo] [datetime] NULL,
	[Od] [int] NULL,
	[Do] [int] NULL,
	[Typ] [int] NOT NULL,
	[Ocena] [nvarchar](2) NOT NULL,
	[Id_Stanowiska] [int] NOT NULL,
 CONSTRAINT [PK_Widelki] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zadania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zadania](
	[Id_Zadania] [int] IDENTITY(1,1) NOT NULL,
	[Id_Gr_Oper] [int] NULL,
	[NazwaZadania] [nvarchar](511) NOT NULL,
	[Waga] [int] NULL,
	[Sumowane] [bit] NOT NULL,
	[APT] [bit] NOT NULL,
	[Global] [int] NULL,
	[Id_Maszyny1] [int] NULL,
	[Id_Obszary1] [int] NULL,
	[Id_Podobszary1] [int] NULL,
	[Id_Director1] [int] NULL,
	[Id_Task1] [int] NULL,
	[Typ] [int] NULL,
	[NazwaZadaniaEN] [nvarchar](511) NULL,
	[Id_Rodzaj1] [int] NULL,
	[Id_Poziom1] [int] NULL,
	[ProdAdm1] [varchar](20) NULL,
	[Dyr1] [varchar](20) NULL,
	[Lp1] [int] NULL,
	[StrOrg1] [varchar](20) NULL,
	[Id_Dzialanie1] [int] NULL,
	[Id_Narzedzie1] [int] NULL,
	[Onboarding] [bit] NOT NULL,
 CONSTRAINT [PK_Tbl_ZadaniaN] PRIMARY KEY CLUSTERED 
(
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZadaniaGrupy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZadaniaGrupy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](200) NOT NULL,
	[NazwaEN] [nvarchar](200) NOT NULL,
	[Kolejnosc] [int] NULL,
	[Typ] [int] NOT NULL,
	[Aktywna] [bit] NOT NULL,
 CONSTRAINT [PK_ZadaniaGrupy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZadaniaGrupyTypy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZadaniaGrupyTypy](
	[Id] [int] NOT NULL,
	[Nazwa] [nvarchar](200) NOT NULL,
	[NazwaEN] [nvarchar](200) NOT NULL,
	[Wybor] [bit] NOT NULL,
 CONSTRAINT [PK_ZadaniaGrupyTypy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZadaniaGrupyZadania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZadaniaGrupyZadania](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGrupy] [int] NOT NULL,
	[IdZadania] [int] NOT NULL,
	[Od] [datetime] NOT NULL,
	[Do] [datetime] NULL,
 CONSTRAINT [PK_ZadaniaGrupyZadania] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZadaniaStanowiska]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZadaniaStanowiska](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Zadania] [int] NOT NULL,
	[Id_Stanowiska] [int] NOT NULL,
	[Od] [datetime] NOT NULL,
	[Do] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZadaniaTypy]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZadaniaTypy](
	[Id] [int] NOT NULL,
	[TypNazwa] [nvarchar](100) NOT NULL,
	[Kolejnosc] [int] NULL,
	[Aktywny] [bit] NOT NULL,
	[Wybor] [bit] NOT NULL,
	[TypNazwaEN] [nvarchar](100) NULL,
	[Dodatkowe] [bit] NOT NULL,
 CONSTRAINT [PK_ZadaniaTypy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZadaniaUprawnienia]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZadaniaUprawnienia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdZadania] [int] NOT NULL,
	[IdUprawnienia] [int] NOT NULL,
	[Od] [datetime] NOT NULL,
	[Do] [datetime] NULL,
 CONSTRAINT [PK_ZadaniaUprawnienia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zastepstwa]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zastepstwa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdZastepowany] [int] NOT NULL,
	[IdZastepujacy] [int] NOT NULL,
	[Od] [datetime] NOT NULL,
	[Do] [datetime] NOT NULL,
 CONSTRAINT [PK_Zastepstwa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VCertyfikatyUprawnienie]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VCertyfikatyUprawnienie] as 
select 
     C.[Id]
	,C.[IdUprawnienia]
	,C.[IdPracownika]
	,C.[Numer]
	,C.[DataWaznosci]
	,C.[Kategoria]
	,C.[DataZdobyciaUprawnien]
	,C.[DataWaznosciPsychotestow]
	,C.[DataWaznosciBadanLekarskich]
	,C.[DataWaznosciUmowy]
	,C.[UmowaLojalnosciowa]
	,C.[ImportId]
	,C.[DataZdobyciaUprawnienOk]
	,C.[DataWaznosciPsychotestowOk]
	,C.[DataWaznosciBadanLekarskichOk]
	,C.[UmowaLojalnosciowaOk]
	,C.[DataWaznosciSet]
	,C.[Aktualny]
	,C.[Uwagi]
	,U.Id as UprId
	,U.Typ, U.KwalifikacjeId, U.PoziomId, U.PoziomPoziom, U.Symbol, U.Nazwa, U.NazwaEN, U.Poziom, U.PoziomEN, U.Opis, U.Pola, U.Aktywne, U.Kolejnosc 
from Certyfikaty C
left join Uprawnienia U on U.Id = C.IdUprawnienia
GO
/****** Object:  View [dbo].[VCertyfikatyUprawnienie2]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VCertyfikatyUprawnienie2] as 
--create view VCertyfikatyUprawnienie2 as 
select 
     C.[Id]
	,C.[IdUprawnienia]
	,C.[IdPracownika]
	,C.[Numer]
	,C.[DataWaznosci]
	,C.[Kategoria]
	,C.[DataZdobyciaUprawnien]
	,C.[DataWaznosciPsychotestow]
	,C.[DataWaznosciBadanLekarskich]
	,C.[DataWaznosciUmowy]
	,C.[UmowaLojalnosciowa]
	,C.[ImportId]
	,C.[DataZdobyciaUprawnienOk]
	,C.[DataWaznosciPsychotestowOk]
	,C.[DataWaznosciBadanLekarskichOk]
	,C.[UmowaLojalnosciowaOk]
	,C.[DataWaznosciSet]
	,C.[Aktualny]
	,C.[Uwagi]
	,C.UprId, C.Typ, C.KwalifikacjeId, C.PoziomId, C.PoziomPoziom, C.Symbol, C.Nazwa, C.NazwaEN, C.Poziom, C.PoziomEN, C.Opis, C.Pola, C.Aktywne, C.Kolejnosc 	
	,ISNULL(C2.Id, C.Id) as Id2
	,ISNULL(C2.PoziomPoziom, C.PoziomPoziom) as PoziomPoziom2 
	,ISNULL(C2.DataWaznosci, C.DataWaznosci) as DataWaznosci2
from VCertyfikatyUprawnienie C
outer apply (select top 1 * from VCertyfikatyUprawnienie
            where C.PoziomId is not null 
            and Typ = C.Typ and KwalifikacjeId = C.KwalifikacjeId and IdPracownika = C.IdPracownika and Aktualny = 1 
            and PoziomId = C.PoziomId --and PoziomPoziom &lt;= C1.PoziomPoziom 
            and DataWaznosci >= C.DataWaznosci
            order by PoziomPoziom desc) C2
GO
/****** Object:  View [dbo].[VCertyfikaty]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VCertyfikaty] as 
select
	C.Id, ISNULL(U2.Id, C.IdUprawnienia) as IdUprawnienia, C.IdPracownika, C.Numer, C.DataWaznosci, C.Kategoria, C.DataZdobyciaUprawnien, C.DataWaznosciPsychotestow, C.DataWaznosciBadanLekarskich, C.DataWaznosciUmowy, C.UmowaLojalnosciowa, C.ImportId, C.Aktualny, C.Uwagi, 
	C.UprId, C.Typ, C.KwalifikacjeId, 
	U2.Id as IdUprawnienia2, U2.PoziomId, U2.PoziomPoziom, U2.Symbol, U2.Nazwa, U2.NazwaEN, U2.Poziom, U2.PoziomEN, U2.Opis, U2.Pola, U2.Aktywne, U2.Kolejnosc 

	/* 
	C.IdPracownika, 
	U2.PoziomPoziom, U2.Symbol, C.DataWaznosci, 
	C.IdUprawnienia, C.Numer, C.DataWaznosci, C.Symbol, C.PoziomPoziom,
	U.IdUprawnienia, U.Numer, U.DataWaznosci, U.Symbol, U.PoziomPoziom
	,
	*/
	/*
	C.IdPracownika, U2.Id, U2.Symbol, U2.PoziomPoziom 
	,C.*
	*/
from VCertyfikatyUprawnienie C
outer apply (select top 1 * from VCertyfikatyUprawnienie C2 where C2.Typ = C.Typ and C2.KwalifikacjeId = C.KwalifikacjeId and C2.IdPracownika = C.IdPracownika and C2.PoziomPoziom < C.PoziomPoziom and C.Aktualny = 1 order by C2.PoziomPoziom desc) U
left join Uprawnienia U2 on U2.Typ = C.Typ and U2.KwalifikacjeId = C.KwalifikacjeId and U2.PoziomPoziom between ISNULL(U.PoziomPoziom + 1, 0) and C.PoziomPoziom
GO
/****** Object:  View [dbo].[VZadania]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VZadania]
AS
SELECT     Z.Id_Zadania, Z.NazwaZadania, Z.Waga, Z.Sumowane, S.Symb_Jedn AS SymbolStrumienia, S.Nazwa_Jedn AS NazwaStrumienia, L.Symb_Jedn AS SymbolLinii, 
                      L.Nazwa_Jedn AS NazwaLinii, G.Symbol AS GrOperacjiSymbol, G.Nazwa AS GrOperacjiNazwa, L.Id_Str_Org AS IdLinia
FROM         dbo.Zadania AS Z LEFT OUTER JOIN
                      dbo.LinieZadania AS LZ ON LZ.Id_Zadania = Z.Id_Zadania LEFT OUTER JOIN
                      dbo.StrOrg AS L ON L.Id_Str_Org = LZ.Id_Str_Org LEFT OUTER JOIN
                      dbo.StrOrg AS S ON S.Id_Str_Org = L.Id_Parent LEFT OUTER JOIN
                      dbo.GrOperacji AS G ON G.Id = Z.Id_Gr_Oper
GO
/****** Object:  View [dbo].[VOceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VOceny]
AS
SELECT     dbo.VZadania.Id_Zadania, dbo.VZadania.NazwaZadania, dbo.VZadania.Waga, dbo.VZadania.Sumowane, dbo.VZadania.SymbolStrumienia, 
                      dbo.VZadania.NazwaStrumienia, dbo.VZadania.SymbolLinii, dbo.VZadania.NazwaLinii, dbo.VZadania.GrOperacjiSymbol, dbo.VZadania.GrOperacjiNazwa, 
                      dbo.Pracownicy.Id_Pracownicy, dbo.Pracownicy.Nazwisko, dbo.Pracownicy.Imie, dbo.Pracownicy.Imie2, dbo.Pracownicy.Nr_Ewid, dbo.Pracownicy.Id_Gr_Zatr, 
                      dbo.Pracownicy.Id_Stanowiska, dbo.Pracownicy.Id_Str_OrgM, dbo.Pracownicy.x_Id_Str_OrgA, dbo.Pracownicy.Id_Status, dbo.Pracownicy.Status, 
                      dbo.Pracownicy.IdKierownika, dbo.Oceny.Ocena, dbo.Oceny.DataOceny, dbo.Oceny.Ocena * dbo.VZadania.Waga AS [Wartość ważona], 
                      dbo.Pracownicy.Nazwisko + ' ' + dbo.Pracownicy.Imie AS Pracownik, dbo.Oceny.Id_Oceny, dbo.Oceny.Aktualna, dbo.VZadania.IdLinia
FROM         dbo.Oceny INNER JOIN
                      dbo.Pracownicy ON dbo.Oceny.Id_Pracownicy = dbo.Pracownicy.Id_Pracownicy LEFT OUTER JOIN
                      dbo.VZadania ON dbo.Oceny.Id_Zadania = dbo.VZadania.Id_Zadania
GO
/****** Object:  View [dbo].[VLinie]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VLinie] as
select
S.Id_Str_Org as StrId, S.Symb_Jedn as StrSymbol, S.Nazwa_Jedn as StrNazwa,
L.Id_Str_Org as LiniaId, L.Symb_Jedn as LiniaSymbol, L.Nazwa_Jedn as
LiniaNazwa
from StrOrg L
left outer join StrOrg S on S.Id_Str_Org = L.Id_Parent
where L.Id_Str_Org not in (select distinct Id_Parent from StrOrg where
Id_Parent is not null)
and L.Id_Parent is not null
and S.Id_Parent is not null
GO
/****** Object:  View [dbo].[vPracownicyShort]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPracownicyShort]
AS
SELECT     dbo.Pracownicy.Nazwisko + N' ' + dbo.Pracownicy.Imie AS Pracownik, dbo.Pracownicy.Id_Pracownicy, dbo.VLinie.LiniaId, dbo.VLinie.LiniaSymbol,
                       dbo.VLinie.StrId, dbo.VLinie.StrSymbol
FROM         dbo.Pracownicy LEFT OUTER JOIN
                      dbo.VLinie ON dbo.Pracownicy.Id_Str_OrgM = dbo.VLinie.LiniaId
GO
/****** Object:  View [dbo].[VStrumienie]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VStrumienie]
AS
SELECT DISTINCT StrId, StrSymbol, StrNazwa
FROM         dbo.VLinie
GO
/****** Object:  View [dbo].[VZadaniaOceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VZadaniaOceny]
AS
SELECT     S.Id_Str_Org AS StrId, S.Symb_Jedn AS StrSymbol, S.Nazwa_Jedn AS StrNazwa, L.Id_Str_Org AS LiniaId, L.Symb_Jedn AS LiniaSymbol, 
                      L.Nazwa_Jedn AS LiniaNazwa, Z.Id_Zadania, Z.NazwaZadania,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.LinieZadania AS LZ2 LEFT OUTER JOIN
                                                   dbo.StrOrg AS L2 ON L2.Id_Str_Org = LZ2.Id_Str_Org
                            WHERE      (L2.Id_Parent = L.Id_Parent) AND (LZ2.Id_Zadania = Z.Id_Zadania)) AS IloscNaStr, Z.Waga, G.Symbol AS GrOperSymbol, G.Nazwa AS GrOperNazwa,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 3
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (P.Status >= 0)) AS Ocena3,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 3 LEFT OUTER JOIN
                                                   dbo.StrOrg AS PL ON PL.Id_Str_Org = P.Id_Str_OrgM
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (PL.Id_Parent = ISNULL(S.Id_Str_Org, PL.Id_Parent)) AND (P.Status >= 0)) AS Ocena3sm,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 3
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (P.Id_Str_OrgM = ISNULL(L.Id_Str_Org, P.Id_Str_OrgM)) AND (P.Status >= 0)) AS Ocena3jm,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 2
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (P.Status >= 0)) AS Ocena2,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 2 LEFT OUTER JOIN
                                                   dbo.StrOrg AS PL ON PL.Id_Str_Org = P.Id_Str_OrgM
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (PL.Id_Parent = ISNULL(S.Id_Str_Org, PL.Id_Parent)) AND (P.Status >= 0)) AS Ocena2sm,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 2
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (P.Id_Str_OrgM = ISNULL(L.Id_Str_Org, P.Id_Str_OrgM)) AND (P.Status >= 0)) AS Ocena2jm,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 1
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (P.Status >= 0)) AS Ocena1,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 1 LEFT OUTER JOIN
                                                   dbo.StrOrg AS PL ON PL.Id_Str_Org = P.Id_Str_OrgM
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (PL.Id_Parent = ISNULL(S.Id_Str_Org, PL.Id_Parent)) AND (P.Status >= 0)) AS Ocena1sm,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 1
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (P.Id_Str_OrgM = ISNULL(L.Id_Str_Org, P.Id_Str_OrgM)) AND (P.Status >= 0)) AS Ocena1jm,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 0
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (P.Status >= 0)) AS Ocena0,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 0 LEFT OUTER JOIN
                                                   dbo.StrOrg AS PL ON PL.Id_Str_Org = P.Id_Str_OrgM
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (PL.Id_Parent = ISNULL(S.Id_Str_Org, PL.Id_Parent)) AND (P.Status >= 0)) AS Ocena0sm,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Pracownicy AS P LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Pracownicy = P.Id_Pracownicy AND O.Aktualna = 1 AND O.Ocena = 0
                            WHERE      (O.Id_Zadania = Z.Id_Zadania) AND (P.Id_Str_OrgM = ISNULL(L.Id_Str_Org, P.Id_Str_OrgM)) AND (P.Status >= 0)) AS Ocena0jm
FROM         dbo.Zadania AS Z LEFT OUTER JOIN
                      dbo.LinieZadania AS LZ ON LZ.Id_Zadania = Z.Id_Zadania LEFT OUTER JOIN
                      dbo.StrOrg AS L ON L.Id_Str_Org = LZ.Id_Str_Org LEFT OUTER JOIN
                      dbo.StrOrg AS S ON S.Id_Str_Org = L.Id_Parent LEFT OUTER JOIN
                      dbo.GrOperacji AS G ON G.Id = Z.Id_Gr_Oper
GO
/****** Object:  View [dbo].[VZadaniaOcenyStrumienie]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VZadaniaOcenyStrumienie]
AS
SELECT DISTINCT 
                      StrId, StrSymbol, StrNazwa, Id_Zadania, NazwaZadania, Waga, GrOperSymbol, GrOperNazwa, Ocena3, Ocena3sm, Ocena2, Ocena2sm, Ocena1, 
                      Ocena1sm, Ocena0, Ocena0sm, IloscNaStr
FROM         dbo.VZadaniaOceny
GO
/****** Object:  View [dbo].[Przelozeni]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Przelozeni] as
select 
Id_Pracownicy as Id_Przelozeni,
Nazwisko, Imie, Imie2, Nr_Ewid, Id_Gr_Zatr, Id_Stanowiska, Id_Str_OrgM as Id_Str_Org, Email, 
cast(null as float) as Telefon,   --?????
cast(1 as int) as Id_Priorytet, 
Login, Password, 
cast(0 as bit) as Blokada, 
Rights, case Status when -4 then 0 when -5 then -2 end as Status, 
cast(null as int) as x_IdsStrOrg, 
Nick, Id2, DataZatr, DataUmDo, DataZwol, Nr_Ewid2
from Pracownicy
where Status in (-4,-5)
GO
/****** Object:  View [dbo].[VPrzelozeniShort]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VPrzelozeniShort]
AS
SELECT     Id_Przelozeni, Nazwisko + N' ' + Imie AS Kierownik
FROM         dbo.Przelozeni
GO
/****** Object:  View [dbo].[VPrzelozeniOceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VPrzelozeniOceny]
AS
SELECT     TOP (100) PERCENT K.Nazwisko + ' ' + K.Imie AS Kierownik, P.Nazwisko + ' ' + P.Imie AS Pracownik, O.Ocena, O.DataOceny, O.Uwagi, O.Aktualna, Z.NazwaZadania, 
                      Z.Waga, L.Symb_Jedn AS LiniaSymbol, L.Nazwa_Jedn AS LiniaNazwa, S.Symb_Jedn AS StrSymbol, S.Nazwa_Jedn AS StrNazwa, K.Id_Przelozeni
FROM         dbo.Oceny AS O LEFT OUTER JOIN
                      dbo.Zadania AS Z ON Z.Id_Zadania = O.Id_Zadania LEFT OUTER JOIN
                      dbo.StrOrg AS L ON L.Id_Str_Org = O.IdStruktury LEFT OUTER JOIN
                      dbo.StrOrg AS S ON S.Id_Str_Org = O.IdStrParent LEFT OUTER JOIN
                      dbo.Pracownicy AS P ON P.Id_Pracownicy = O.Id_Pracownicy LEFT OUTER JOIN
                      dbo.Przelozeni AS K ON K.Id_Przelozeni = O.Id_Przelozony
WHERE     (K.Status > - 2) AND (K.Id_Przelozeni IS NOT NULL)
GO
/****** Object:  View [dbo].[VPracownicyAll]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VPracownicyAll] as 
select Id_Przelozeni as Id, Nazwisko, Imie, Imie2, Nr_Ewid, Id_Gr_zatr, Id_Stanowiska, Id_Str_Org, Email, Telefon, Login, Password, Blokada, Rights, Status, Nick, Id2, DataZatr, DataUmDo, DataZwol, Nr_Ewid2, CAST(null as int) as IdStrumienia, CAST(null as int) as IdKierownika, CAST(0 as bit) as APT, CAST(null as datetime) as ScalData, CAST(null as int) as ScalActualId
from Przelozeni
union all
select -Id_Pracownicy as Id, Nazwisko, Imie, Imie2, Nr_Ewid, Id_Gr_Zatr, Id_Stanowiska, Id_Str_OrgM, Email, null as Telefon, Login, Password, 0 as Blokada, Rights, Status, Nick, Id2, DataZatr, DataUmDo, DataZwol, Nr_Ewid2, IdStrumienia, IdKierownika, APT, ScalData, ScalActualId
from Pracownicy
GO
/****** Object:  View [dbo].[VPracOceny]    Script Date: 01.09.2017 13:17:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VPracOceny]
AS
SELECT     P.Nazwisko + ' ' + P.Imie AS Pracownik, P.Nr_Ewid AS [Nr ew.], S.Symb_Jedn AS [Strumień macierzysty], S.Nazwa_Jedn AS StrNazwa, 
                      L.Symb_Jedn AS [Linia macierzysta], L.Nazwa_Jedn AS LiniaNazwa,
                          (SELECT     ISNULL(SUM(Ocena), 0) AS Expr1
                            FROM          dbo.Oceny AS O
                            WHERE      (Id_Pracownicy = P.Id_Pracownicy) AND (Aktualna = 1) AND (Id_Zadania IN
                                                       (SELECT DISTINCT Id_Zadania
                                                         FROM          dbo.LinieZadania AS LZ
                                                         WHERE      (Id_Zadania IS NOT NULL)))) AS [Suma ocen],
                          (SELECT     ISNULL(SUM(O.Ocena * SZ.Waga), 0) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.Zadania AS SZ ON SZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Id_Zadania IN
                                                       (SELECT DISTINCT Id_Zadania
                                                         FROM          dbo.LinieZadania AS LZ
                                                         WHERE      (Id_Zadania IS NOT NULL)))) AS [Wielkość ważona],
                          (SELECT     COUNT(DISTINCT O.Id_Zadania) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.LinieZadania AS LZ ON LZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Ocena = 3) AND (LZ.Id_Zadania IS NOT NULL)) AS [Ocena 3],
                          (SELECT     COUNT(DISTINCT O.Id_Zadania) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.LinieZadania AS LZ ON LZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Ocena = 2) AND (LZ.Id_Zadania IS NOT NULL)) AS [Ocena 2],
                          (SELECT     COUNT(DISTINCT O.Id_Zadania) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.LinieZadania AS LZ ON LZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Ocena = 1) AND (LZ.Id_Zadania IS NOT NULL)) AS [Ocena 1],
                          (SELECT     COUNT(DISTINCT O.Id_Zadania) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.LinieZadania AS LZ ON LZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Ocena = 0) AND (LZ.Id_Zadania IS NOT NULL)) AS [Ocena 0],
                          (SELECT     COUNT(DISTINCT LZ.Id_Zadania) AS Expr1
                            FROM          dbo.LinieZadania AS LZ LEFT OUTER JOIN
                                                   dbo.Oceny AS O ON O.Id_Zadania = LZ.Id_Zadania AND O.Id_Pracownicy = P.Id_Pracownicy
                            WHERE      (LZ.Id_Zadania IS NOT NULL) AND (O.Id_Oceny IS NULL)) AS [Brak oceny],
                          (SELECT     ISNULL(SUM(O.Ocena * SZ.Waga), 0) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.Zadania AS SZ ON SZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Id_Zadania IN
                                                       (SELECT DISTINCT LZ.Id_Zadania
                                                         FROM          dbo.LinieZadania AS LZ LEFT OUTER JOIN
                                                                                dbo.StrOrg AS LL ON LL.Id_Str_Org = LZ.Id_Str_Org
                                                         WHERE      (LZ.Id_Zadania IS NOT NULL) AND (LL.Id_Parent = L.Id_Parent)))) AS [Wielkość ważona Str],
                          (SELECT     COUNT(DISTINCT O.Id_Zadania) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.LinieZadania AS LZ ON LZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Ocena = 3) AND (LZ.Id_Zadania IS NOT NULL) AND (O.Id_Zadania IN
                                                       (SELECT DISTINCT LZ.Id_Zadania
                                                         FROM          dbo.LinieZadania AS LZ LEFT OUTER JOIN
                                                                                dbo.StrOrg AS LL ON LL.Id_Str_Org = LZ.Id_Str_Org
                                                         WHERE      (LZ.Id_Zadania IS NOT NULL) AND (LL.Id_Parent = L.Id_Parent)))) AS [Ocena 3 Str],
                          (SELECT     COUNT(DISTINCT O.Id_Zadania) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.LinieZadania AS LZ ON LZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Ocena = 2) AND (LZ.Id_Zadania IS NOT NULL) AND (O.Id_Zadania IN
                                                       (SELECT DISTINCT LZ.Id_Zadania
                                                         FROM          dbo.LinieZadania AS LZ LEFT OUTER JOIN
                                                                                dbo.StrOrg AS LL ON LL.Id_Str_Org = LZ.Id_Str_Org
                                                         WHERE      (LZ.Id_Zadania IS NOT NULL) AND (LL.Id_Parent = L.Id_Parent)))) AS [Ocena 2 Str],
                          (SELECT     COUNT(DISTINCT O.Id_Zadania) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.LinieZadania AS LZ ON LZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Ocena = 1) AND (LZ.Id_Zadania IS NOT NULL) AND (O.Id_Zadania IN
                                                       (SELECT DISTINCT LZ.Id_Zadania
                                                         FROM          dbo.LinieZadania AS LZ LEFT OUTER JOIN
                                                                                dbo.StrOrg AS LL ON LL.Id_Str_Org = LZ.Id_Str_Org
                                                         WHERE      (LZ.Id_Zadania IS NOT NULL) AND (LL.Id_Parent = L.Id_Parent)))) AS [Ocena 1 Str],
                          (SELECT     COUNT(DISTINCT O.Id_Zadania) AS Expr1
                            FROM          dbo.Oceny AS O LEFT OUTER JOIN
                                                   dbo.LinieZadania AS LZ ON LZ.Id_Zadania = O.Id_Zadania
                            WHERE      (O.Id_Pracownicy = P.Id_Pracownicy) AND (O.Aktualna = 1) AND (O.Ocena = 0) AND (LZ.Id_Zadania IS NOT NULL) AND (O.Id_Zadania IN
                                                       (SELECT DISTINCT LZ.Id_Zadania
                                                         FROM          dbo.LinieZadania AS LZ LEFT OUTER JOIN
                                                                                dbo.StrOrg AS LL ON LL.Id_Str_Org = LZ.Id_Str_Org
                                                         WHERE      (LZ.Id_Zadania IS NOT NULL) AND (LL.Id_Parent = L.Id_Parent)))) AS [Ocena 0 Str], P.Id_Pracownicy, P.APT, P.Status, P.IdKierownika, 
                      S.Id_Str_Org AS StrId, L.Id_Str_Org AS LiniaId
FROM         dbo.Pracownicy AS P LEFT OUTER JOIN
                      dbo.StrOrg AS L ON L.Id_Str_Org = P.Id_Str_OrgM LEFT OUTER JOIN
                      dbo.StrOrg AS S ON S.Id_Str_Org = L.Id_Parent
GO
/****** Object:  View [dbo].[vPracownicy]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPracownicy]
AS
SELECT     TOP (100) PERCENT dbo.Pracownicy.Id_Pracownicy, dbo.Pracownicy.Nazwisko, dbo.Pracownicy.Imie, dbo.Pracownicy.Imie2, dbo.Pracownicy.Nr_Ewid, 
                      dbo.GrZatr.Rodzaj_Umowy, dbo.Stanowiska.Nazwa_Stan, dbo.Pracownicy.Id_Str_OrgM, dbo.Pracownicy.x_Id_Str_OrgA, dbo.Pracownicy.Id_Status, 
                      dbo.Pracownicy.Status, dbo.Pracownicy.IdKierownika, dbo.Pracownicy.APT, dbo.Pracownicy.IdStrumienia, 
                      dbo.Pracownicy.Nazwisko + N' ' + dbo.Pracownicy.Imie AS Pracownik, StrOrg_1.Nazwa_Jedn AS [Jednostka org. macierzysta], 
                      dbo.StatusPrac.Status AS [Status obecności], dbo.Przelozeni.Nazwisko + N' ' + dbo.Przelozeni.Imie AS Kierownik, dbo.VPracOceny.[Ocena 3], 
                      dbo.VPracOceny.[Ocena 2], dbo.VPracOceny.[Ocena 1], dbo.VPracOceny.[Ocena 0], dbo.VPracOceny.[Brak oceny], dbo.VPracOceny.[Wielkość ważona], 
                      dbo.StrOrg.Symb_Jedn AS [Symbol strumienia]
FROM         dbo.StrOrg RIGHT OUTER JOIN
                      dbo.Pracownicy ON dbo.StrOrg.Id_Str_Org = dbo.Pracownicy.IdStrumienia LEFT OUTER JOIN
                      dbo.Przelozeni ON dbo.Pracownicy.IdKierownika = dbo.Przelozeni.Id_Przelozeni LEFT OUTER JOIN
                      dbo.VPracOceny ON dbo.Pracownicy.Id_Pracownicy = dbo.VPracOceny.Id_Pracownicy LEFT OUTER JOIN
                      dbo.StatusPrac ON dbo.Pracownicy.Id_Status = dbo.StatusPrac.Id_Status_Prac LEFT OUTER JOIN
                      dbo.Stanowiska ON dbo.Pracownicy.Id_Stanowiska = dbo.Stanowiska.Id_Stanowiska LEFT OUTER JOIN
                      dbo.GrZatr ON dbo.Pracownicy.Id_Gr_Zatr = dbo.GrZatr.Id_Gr_Zatr LEFT OUTER JOIN
                      dbo.StrOrg AS StrOrg_1 ON dbo.Pracownicy.Id_Str_OrgM = StrOrg_1.Id_Str_Org
ORDER BY Pracownik
GO
/****** Object:  View [dbo].[VPracOddelegowania]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VPracOddelegowania] as
select P.*
,D.Id
,D.IdPracownika
,D.Od
,D.Do
,D.IdStruktury
,D.IdKierownika as IdKierownikaOdd
,D.IdKierownikaRq
,D.DataRq
,D.UwagiRq
,D.IdKierownikaAcc
,D.DataAcc
,D.UwagiAcc
,D.Status as StatusOdd
,D.Typ
from Pracownicy P
left outer join Oddelegowania D on D.IdPracownika = P.Id_Pracownicy
GO
/****** Object:  View [dbo].[VLinieOddelegowania]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VLinieOddelegowania] as
select
S.Symb_Jedn as StrSymbol,
S.Nazwa_Jedn as StrNazwa,
L.Id_Str_Org as LiniaId,
L.Symb_Jedn as LiniaSymbol,
L.Nazwa_Jedn as LiniaNazwa,
P.Nazwisko, P.Imie, P.Nr_Ewid, P.Status, P.StatusOdd,
K.Nazwisko as KierNazwisko, K.Imie as KierImie,
P.APT,
case when P.Id_Str_OrgM = L.Id_Str_Org then 1 else 0 end as Macierzysty,
case when P.IdStruktury = L.Id_Str_Org then 1 else 0 end as Przydelegowany,
case when P.Id_Str_OrgM = L.Id_Str_Org and P.Id is not null then 1 else 0 end as Oddelegowany,
P.Id as IdOdd, P.Od, P.Do, P.IdStruktury,
SD.Symb_Jedn as StrSymbolOdd, SD.Nazwa_Jedn as StrNazwaOdd,
LD.Symb_Jedn as LiniaSymbolOdd, LD.Nazwa_Jedn as LiniaNazwaOdd,
KD.Nazwisko as KierNazwiskoOdd, KD.Imie as KierImieOdd
from StrOrg L
left outer join StrOrg S on S.Id_Str_Org = L.Id_Parent
left outer join VPracOddelegowania P on P.Id_Str_OrgM = L.Id_Str_Org or P.IdStruktury = L.Id_Str_Org
left outer join Przelozeni K on K.Id_Przelozeni = P.IdKierownika

left outer join StrOrg LD on LD.Id_Str_Org = P.IdStruktury
left outer join StrOrg SD on SD.Id_Str_Org = LD.Id_Parent
left outer join Przelozeni KD on KD.Id_Przelozeni = P.IdKierownikaOdd

where S.Id_Str_Org is not null and L.Id_Str_Org not in (select distinct ISNULL(Id_Parent, -1) from StrOrg)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPracOddelegowaniaTest]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetPracOddelegowaniaTest](@data datetime)
RETURNS TABLE
AS RETURN
(
select
	   P.[Id_Pracownicy]
      ,P.[Nazwisko]
      ,P.[Imie]
      ,P.[Imie2]
      ,P.[Nr_Ewid]
      ,P.[Id_Gr_Zatr]
      ,P.[Id_Stanowiska]
      ,P.[Id_Str_OrgM]
      ,P.[x_Id_Str_OrgA]
      ,P.[Id_Status]
      ,P.[Status]
      ,P.[IdKierownika]
      ,P.[APT]
      ,P.[IdStrumienia]
      ,P.[DataZatr]
      ,P.[DataUmDo]
      ,P.[DataZwol]
      ,P.[ScalData]
      ,P.[ScalActualId]

	  ,D.[Id][DId]
      ,D.[IdPracownika]
      ,D.[Od]
      ,D.[Do]
      ,D.[IdStruktury]
      ,D.[IdKierownika][DIdKierownika]
      ,D.[IdKierownikaRq]
      ,D.[DataRq]
      ,D.[UwagiRq]
      ,D.[IdKierownikaAcc]
      ,D.[DataAcc]
      ,D.[UwagiAcc]
      ,D.[Status][DStatus]
      ,D.[Typ]
from Pracownicy P
left join Oddelegowania D with (nolock) on D.IdPracownika = P.Id_Pracownicy and @data between D.Od and D.Do and D.Status = 2 
)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPrzypisaniaRCP]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetPrzypisaniaRCP] 
(	
	@data datetime
)
RETURNS TABLE 
AS
RETURN 
(
select P.Id, P.Id as IdPracownika, dbo.bom(@data) as Od, convert(datetime, null) as Do, P.IdKierownika, null as IdCC, null as IdCommodity, null as IdArea, null as IdPosition, null as IdKierownikaRq, null as DataRq, null as UwagiRq, null as IdKierownikaAcc, null as DataAcc, null as UwagiAcc, 1 as Status, 0 as Typ, null as DoMonit, null as RcpStrefaId, null as IdKierownikaRqZast, null as IdKierownikaAccZast
from dbo.fn_GetPracownicyRCP(@data) P
)
GO
/****** Object:  View [dbo].[VLinieZadania]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VLinieZadania]
AS
SELECT     dbo.LinieZadania.Id_Str_Org, dbo.LinieZadania.Id_Zadania, dbo.Zadania.NazwaZadania, dbo.Zadania.Waga
FROM         dbo.LinieZadania INNER JOIN
                      dbo.Zadania ON dbo.LinieZadania.Id_Zadania = dbo.Zadania.Id_Zadania
GO
/****** Object:  View [dbo].[VLinieZadania3]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VLinieZadania3] as 
select
ISNULL(LZ.Id, -Z.Id_Zadania) as Id,
ISNULL(LZ.Id_Str_Org, 0) as Id_Str_Org,
ISNULL(LZ.Id_Zadania, Z.Id_Zadania) as Id_Zadania2, 
Z.Id_Zadania, Z.Id_Gr_Oper, Z.NazwaZadania, Z.NazwaZadaniaEN, Z.Waga, Z.Sumowane, Z.APT, Z.Global, Z.Typ, 
LZ.Id_Obszary, LZ.Id_Podobszary, LZ.Id_Maszyny, LZ.Id_Task, LZ.Id_Dzialanie, LZ.Id_Narzedzie, LZ.Id_Rodzaj, LZ.Id_Poziom
--,LZ.Id_Director, LZ.ProdAdm, LZ.Dyr, LZ.Lp, LZ.StrOrg, LZ.IdZadania1
,T.Aktywny, T.Kolejnosc, T.TypNazwa, T.TypNazwaEN, T.Dodatkowe, T.Wybor
,Z.Onboarding
from Zadania Z
left join LinieZadania LZ with (nolock) on LZ.Id_Zadania = Z.Id_Zadania
left join ZadaniaTypy T on T.Id = Z.Typ
GO
/****** Object:  View [dbo].[VMaszynyZadania]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VMaszynyZadania] as 
select distinct M.*, Z.*, T.Id as IdTypu, T.TypNazwa, T.TypNazwaEN, T.Kolejnosc, T.Aktywny, T.Wybor, T.Dodatkowe from MMaszyny M
left join LinieZadania LZ on LZ.Id_Maszyny = M.Id
left join Zadania Z on Z.Id_Zadania = LZ.Id_Zadania
left join ZadaniaTypy T on T.Id = Z.Typ
GO
/****** Object:  View [dbo].[VOddelegowaniaNaDzis]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VOddelegowaniaNaDzis] as
select
	   P.[Id_Pracownicy]
      ,P.[Nazwisko]
      ,P.[Imie]
      ,P.[Imie2]
      ,P.[Nr_Ewid]
      ,P.[Id_Gr_Zatr]
      ,P.[Id_Stanowiska]
      ,P.[Id_Str_OrgM]
      ,P.[x_Id_Str_OrgA]
      ,P.[Id_Status]
      ,P.[Status]
      ,P.[IdKierownika]
      ,P.[APT]
      ,P.[IdStrumienia]
      ,P.[DataZatr]
      ,P.[DataUmDo]
      ,P.[DataZwol]
      ,P.[ScalData]
      ,P.[ScalActualId]

	  ,D.[Id][DId]
      ,D.[IdPracownika]
      ,D.[Od]
      ,D.[Do]
      ,D.[IdStruktury]
      ,D.[IdKierownika][DIdKierownika]
      ,D.[IdKierownikaRq]
      ,D.[DataRq]
      ,D.[UwagiRq]
      ,D.[IdKierownikaAcc]
      ,D.[DataAcc]
      ,D.[UwagiAcc]
      ,D.[Status][DStatus]
      ,D.[Typ]
from Pracownicy P
left join Oddelegowania D on D.IdPracownika = P.Id_Pracownicy and GETDATE() between D.Od and D.Do and D.Status = 2
GO
/****** Object:  View [dbo].[VPracOcenyLinia]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VPracOcenyLinia] as
select
	P.Nazwisko + ' ' + P.Imie as Pracownik, 
	P.Nr_Ewid as [Nr ew.], 
	S.Symb_Jedn as [Strumień macierzysty], 
	S.Nazwa_Jedn as StrNazwa , 
	L.Symb_Jedn as [Linia macierzysta], 
	L.Nazwa_Jedn as LiniaNazwa,
	
	(select ISNULL(sum(O.Ocena), 0) from Oceny O 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1
		and O.Id_Zadania in (select distinct LZ.Id_Zadania from LinieZadania LZ where LZ.Id_Zadania is not null and LZ.Id_Str_Org = P.Id_Str_OrgM)) 
		as [Suma ocen],
	--
	(select ISNULL(sum(O.Ocena * SZ.Waga), 0) from Oceny O 
	left outer join Zadania SZ on SZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1
		and O.Id_Zadania in (select distinct LZ.Id_Zadania from LinieZadania LZ where LZ.Id_Zadania is not null and LZ.Id_Str_Org = P.Id_Str_OrgM)) 
		as [Wielkość ważona],
	--
	(select count(distinct O.Id_Zadania) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and LZ.Id_Zadania is not null
        and O.Id_Zadania in (select distinct LZ.Id_Zadania from LinieZadania LZ where LZ.Id_Zadania is not null and LZ.Id_Str_Org = P.Id_Str_OrgM) 
		and O.Ocena = 3) as [Ocena 3],
	--
	(select count(distinct O.Id_Zadania) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and LZ.Id_Zadania is not null
        and O.Id_Zadania in (select distinct LZ.Id_Zadania from LinieZadania LZ where LZ.Id_Zadania is not null and LZ.Id_Str_Org = P.Id_Str_OrgM) 
		and O.Ocena = 2) as [Ocena 2],
	--
	(select count(distinct O.Id_Zadania) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and LZ.Id_Zadania is not null
        and O.Id_Zadania in (select distinct LZ.Id_Zadania from LinieZadania LZ where LZ.Id_Zadania is not null and LZ.Id_Str_Org = P.Id_Str_OrgM) 
		and O.Ocena = 1) as [Ocena 1],
	--
	(select count(distinct O.Id_Zadania) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and LZ.Id_Zadania is not null
        and O.Id_Zadania in (select distinct LZ.Id_Zadania from LinieZadania LZ where LZ.Id_Zadania is not null and LZ.Id_Str_Org = P.Id_Str_OrgM) 
		and O.Ocena = 0) as [Ocena 0],
	--
	(select count(distinct LZ.Id_Zadania) from LinieZadania LZ
	left outer join Oceny O on O.Id_Zadania = LZ.Id_Zadania and O.Id_Pracownicy = P.Id_Pracownicy
	where LZ.Id_Zadania is not null and O.Id_Oceny is null
		and LZ.Id_Str_Org = P.Id_Str_OrgM) as [Brak oceny],

	-- ilość czynności (bez dodatkowych)
	(select count(distinct LZ.Id_Zadania) from LinieZadania LZ
	where LZ.Id_Zadania is not null
		and LZ.Id_Str_Org = P.Id_Str_OrgM) as [Ilość czynności],
	-- dodatkowe informacje
	P.Id_Pracownicy, 
	p.APT, P.Status,
	P.IdKierownika, 
	S.Id_Str_Org as StrId, L.Id_Str_Org as LiniaId		
from Pracownicy P
left outer join StrOrg L on L.Id_Str_Org = P.Id_Str_OrgM
left outer join StrOrg S on S.Id_Str_Org = L.Id_Parent
GO
/****** Object:  View [dbo].[VPracOcenyLinia_v1]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VPracOcenyLinia_v1] as
select 
	P.Nazwisko + ' ' + P.Imie as Pracownik, 
	P.Nr_Ewid as [Nr ew.], 
	S.Symb_Jedn as [Strumień macierzysty], 
	S.Nazwa_Jedn as StrNazwa , 
	L.Symb_Jedn as [Linia macierzysta], 
	L.Nazwa_Jedn as LiniaNazwa,
	
	(select ISNULL(sum(O.Ocena), 0) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania		
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and LZ.Id_Str_Org = P.Id_Str_OrgM
	) as [Suma ocen],

	(select ISNULL(sum(O.Ocena * SZ.Waga), 0) from Oceny O 
	left outer join Zadania SZ on SZ.Id_Zadania = O.Id_Zadania 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania		
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and LZ.Id_Str_Org = P.Id_Str_OrgM
	) as [wielkość ważona],

	(select count(*) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania		
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and O.Ocena = 3 and LZ.Id_Str_Org = P.Id_Str_OrgM 
	) as [Ocena 3],

	(select count(*) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania		
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and O.Ocena = 2 and LZ.Id_Str_Org = P.Id_Str_OrgM 
	) as [Ocena 2],

	(select count(*) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania		
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and O.Ocena = 1 and LZ.Id_Str_Org = P.Id_Str_OrgM 
	) as [Ocena 1],

	(select count(*) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania		
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and O.Ocena = 0 and LZ.Id_Str_Org = P.Id_Str_OrgM 
	) as [Ocena 0],

	(select count(distinct LZ.Id_Zadania) from LinieZadania LZ
	left outer join Oceny O on O.Id_Zadania = LZ.Id_Zadania and O.Id_Pracownicy = P.Id_Pracownicy
	where LZ.Id_Str_Org = P.Id_Str_OrgM and O.Id_Oceny is null
	) as [Brak oceny],

	-- ilość czynności (bez dodatkowych)
	(select count(distinct LZ.Id_Zadania) from LinieZadania LZ
	where LZ.Id_Str_Org = P.Id_Str_OrgM
	) as [Ilość czynności],

	-- dodatkowe informacje
	P.Id_Pracownicy, 
	p.APT, P.Status,
	P.IdKierownika, 
	S.Id_Str_Org as StrId, L.Id_Str_Org as LiniaId		
from Pracownicy P
left outer join StrOrg L on L.Id_Str_Org = P.Id_Str_OrgM
left outer join StrOrg S on S.Id_Str_Org = L.Id_Parent
GO
/****** Object:  View [dbo].[VPracOcenyStr]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VPracOcenyStr] as
select 
	P.Nazwisko + ' ' + P.Imie as Pracownik, 
	P.Nr_Ewid as [Nr ew.], 
	S.Symb_Jedn as [Strumień macierzysty], 
	S.Nazwa_Jedn as StrNazwa , 
	L.Symb_Jedn as [Linia macierzysta], 
	L.Nazwa_Jedn as LiniaNazwa,
	
	(select ISNULL(sum(O.Ocena), 0) from Oceny O 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1
		and O.Id_Zadania in 
		   (select distinct LZ.Id_Zadania from LinieZadania LZ 
			left outer join StrOrg LL on LL.Id_Str_Org = LZ.Id_Str_Org
			where LZ.Id_Zadania is not null and LL.Id_Parent = L.Id_Parent)) 
		as [Suma ocen],
	--
	(select ISNULL(sum(O.Ocena * SZ.Waga), 0) from Oceny O 
	left outer join Zadania SZ on SZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1
		and O.Id_Zadania in 
			(select distinct LZ.Id_Zadania from LinieZadania LZ 
			left outer join StrOrg LL on LL.Id_Str_Org = LZ.Id_Str_Org
			where LZ.Id_Zadania is not null and LL.Id_Parent = L.Id_Parent)) 
		as [Wielkość ważona],
	--
	(select count(distinct O.Id_Zadania) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and O.Ocena = 3 and LZ.Id_Zadania is not null
        and O.Id_Zadania in 
			(select distinct LZ.Id_Zadania from LinieZadania LZ 
			left outer join StrOrg LL on LL.Id_Str_Org = LZ.Id_Str_Org
			where LZ.Id_Zadania is not null and LL.Id_Parent = L.Id_Parent))         
        as [Ocena 3],
	--
	(select count(distinct O.Id_Zadania) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and O.Ocena = 2 and LZ.Id_Zadania is not null
        and O.Id_Zadania in 
			(select distinct LZ.Id_Zadania from LinieZadania LZ 
			left outer join StrOrg LL on LL.Id_Str_Org = LZ.Id_Str_Org
			where LZ.Id_Zadania is not null and LL.Id_Parent = L.Id_Parent))         
        as [Ocena 2],
	--
	(select count(distinct O.Id_Zadania) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and O.Ocena = 1 and LZ.Id_Zadania is not null
        and O.Id_Zadania in 
			(select distinct LZ.Id_Zadania from LinieZadania LZ 
			left outer join StrOrg LL on LL.Id_Str_Org = LZ.Id_Str_Org
			where LZ.Id_Zadania is not null and LL.Id_Parent = L.Id_Parent))         
        as [Ocena 1],
	--
	(select count(distinct O.Id_Zadania) from Oceny O 
	left outer join LinieZadania LZ on LZ.Id_Zadania = O.Id_Zadania 
	where O.Id_Pracownicy = P.Id_Pracownicy and O.Aktualna = 1 and O.Ocena = 0 and LZ.Id_Zadania is not null
        and O.Id_Zadania in 
			(select distinct LZ.Id_Zadania from LinieZadania LZ 
			left outer join StrOrg LL on LL.Id_Str_Org = LZ.Id_Str_Org
			where LZ.Id_Zadania is not null and LL.Id_Parent = L.Id_Parent))         
        as [Ocena 0],
	--
	(select count(distinct LZ.Id_Zadania) from LinieZadania LZ
	left outer join Oceny O on O.Id_Zadania = LZ.Id_Zadania and O.Id_Pracownicy = P.Id_Pracownicy
	where LZ.Id_Zadania is not null and O.Id_Oceny is null
		and LZ.Id_Str_Org in 
			(select Id_Str_Org from StrOrg where Id_Parent = L.Id_Parent)) 
		as [Brak oceny],
	-- ilość czynności (bez dodatkowych)
	(select count(distinct LZ.Id_Zadania) from LinieZadania LZ
	where LZ.Id_Zadania is not null
		and LZ.Id_Str_Org in 
			(select Id_Str_Org from StrOrg where Id_Parent = L.Id_Parent)) 		
		as [Ilość czynności],
	-- dodatkowe informacje
	P.Id_Pracownicy, 
	p.APT, P.Status,
	P.IdKierownika, 
	S.Id_Str_Org as StrId, L.Id_Str_Org as LiniaId		
from Pracownicy P
left outer join StrOrg L on L.Id_Str_Org = P.Id_Str_OrgM
left outer join StrOrg S on S.Id_Str_Org = L.Id_Parent
GO
/****** Object:  View [dbo].[VPrzelozeniLinie]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VPrzelozeniLinie] as 
select distinct 
--SP.IdStruktury, 
SP.IdPrzelozonego, 
L.Id_Str_Org as LiniaId, 
L.Id_Parent as StrId, 
L.Symb_Jedn as LiniaSymbol, 
L.Nazwa_Jedn as LiniaNazwa
from StrukturaPrzelozeni SP 
cross apply dbo.fn_GetSubLinie(SP.IdStruktury, null) L
GO
/****** Object:  View [dbo].[VPrzelozeniStr]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VPrzelozeniStr] as 
select distinct 
--SP.IdStruktury, 
SP.IdPrzelozonego, 
S.Id_Str_Org as StrId, 
S.Id_Parent as StrParentId, 
S.Symb_Jedn as StrSymbol, 
S.Nazwa_Jedn as StrNazwa
from StrukturaPrzelozeni SP 
cross apply dbo.fn_GetSubLinie(SP.IdStruktury, null) L
left outer join StrOrg S on S.Id_Str_Org = L.Id_Parent
GO
/****** Object:  View [dbo].[VPrzelozeniStrLinie]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VPrzelozeniStrLinie] as 
select distinct 
--SP.IdStruktury, 
SP.IdPrzelozonego, 
L.Id_Str_Org as LiniaId, 
L.Id_Parent as StrId, 
L.Symb_Jedn as LiniaSymbol, 
L.Nazwa_Jedn as LiniaNazwa,
S.Id_Parent as StrParentId, 
S.Symb_Jedn as StrSymbol, 
S.Nazwa_Jedn as StrNazwa
from StrukturaPrzelozeni SP 
cross apply dbo.fn_GetSubLinie(SP.IdStruktury, null) L
left outer join StrOrg S on S.Id_Str_Org = L.Id_Parent
GO
/****** Object:  View [dbo].[vrand]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vrand]
AS
 SELECT RAND() rand
GO
/****** Object:  View [dbo].[VSlownikBadania]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VSlownikBadania]
AS
SELECT        TOP (100) PERCENT Typ, Nazwa, Kolejnosc
FROM            dbo.Kody
WHERE        (Typ = 'BadaniaLekarskie')
ORDER BY Kolejnosc

GO
/****** Object:  View [dbo].[VSlownikBSH]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VSlownikBSH]
AS
SELECT        TOP (100) PERCENT Typ, Nazwa, Kolejnosc
FROM            dbo.Kody
WHERE        (Typ = 'BSH')
ORDER BY Kolejnosc

GO
/****** Object:  View [dbo].[VSlownikManufactur]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VSlownikManufactur]
AS
SELECT        TOP (100) PERCENT Typ, Nazwa, Kolejnosc
FROM            dbo.Kody
WHERE        (Typ = 'Manufactur')
ORDER BY Kolejnosc

GO
/****** Object:  View [dbo].[VSlownikPracownik]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VSlownikPracownik]
AS
SELECT        TOP (100) PERCENT Typ, Nazwa, Kolejnosc
FROM            dbo.Kody
WHERE        (Typ = 'PracownikTyp')
ORDER BY Kolejnosc

GO
/****** Object:  View [dbo].[VSlownikRole]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VSlownikRole]
AS
SELECT        TOP (100) PERCENT Typ, Nazwa, Kolejnosc
FROM            dbo.Kody
WHERE        (Typ = 'Role')
ORDER BY Kolejnosc

GO
/****** Object:  View [dbo].[VZadaniaPracownicy]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VZadaniaPracownicy] as 
select * from Pracownicy P 
inner join LinieZadania LZ on LZ.Id_Str_Org = P.Id_Str_OrgM
where P.Status >= 0 and P.Id_Str_OrgM is not null
GO
/****** Object:  View [dbo].[VZadaniaTyp]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VZadaniaTyp] as 
select * from Zadania Z 
left join ZadaniaTypy T on T.Id = Z.Typ
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbsencjaKod]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AbsencjaKod] ON [dbo].[Absencja]
(
	[NR_EW] ASC,
	[Kod] ASC,
	[Id] ASC
)
INCLUDE ( 	[DataOd],
	[DataDo]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbsPracData]    Script Date: 01.09.2017 13:17:42 ******/
CREATE NONCLUSTERED INDEX [IX_AbsPracData] ON [dbo].[Absencja]
(
	[IdPracownika] ASC,
	[DataOd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbsDl_PracDo]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AbsDl_PracDo] ON [dbo].[AbsencjeDlugotrwale]
(
	[IdPracownika] ASC,
	[Do] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbsDl_PracOd]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AbsDl_PracOd] ON [dbo].[AbsencjeDlugotrwale]
(
	[IdPracownika] ASC,
	[Od] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CmdStatus]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CmdStatus] ON [dbo].[Cmd]
(
	[Status] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Kody]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Kody] ON [dbo].[Kody]
(
	[Typ] ASC,
	[Kod] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_LangMsg]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LangMsg] ON [dbo].[Lang]
(
	[Lang] ASC,
	[MsgHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KlasyfikacjeDzialania]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KlasyfikacjeDzialania] ON [dbo].[LinieZadania]
(
	[Id_Dzialanie] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KlasyfikacjeMaszyny]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KlasyfikacjeMaszyny] ON [dbo].[LinieZadania]
(
	[Id_Maszyny] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KlasyfikacjeNarzedzia]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KlasyfikacjeNarzedzia] ON [dbo].[LinieZadania]
(
	[Id_Narzedzie] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KlasyfikacjePodobszar]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KlasyfikacjePodobszar] ON [dbo].[LinieZadania]
(
	[Id_Podobszary] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KlasyfikacjePoziom]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KlasyfikacjePoziom] ON [dbo].[LinieZadania]
(
	[Id_Poziom] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KlasyfikacjeRodzaje]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KlasyfikacjeRodzaje] ON [dbo].[LinieZadania]
(
	[Id_Rodzaj] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KlasyfikacjeZadania]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KlasyfikacjeZadania] ON [dbo].[LinieZadania]
(
	[Id_Task] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LinieZadania_LZ]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LinieZadania_LZ] ON [dbo].[LinieZadania]
(
	[Id_Str_Org] ASC,
	[Id_Zadania] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LinieZadania_ZL]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LinieZadania_ZL] ON [dbo].[LinieZadania]
(
	[Id_Zadania] ASC,
	[Id_Str_Org] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LZ_Dzialania]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LZ_Dzialania] ON [dbo].[LinieZadania]
(
	[Id_Dzialanie] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LZ_Klasyfikacje]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LZ_Klasyfikacje] ON [dbo].[LinieZadania]
(
	[Id_Zadania] ASC,
	[Id_Str_Org] ASC,
	[Id_Obszary] ASC,
	[Id_Podobszary] ASC,
	[Id_Maszyny] ASC,
	[Id_Task] ASC,
	[Id_Dzialanie] ASC,
	[Id_Narzedzie] ASC,
	[Id_Rodzaj] ASC,
	[Id_Poziom] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LZ_Maszyny]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LZ_Maszyny] ON [dbo].[LinieZadania]
(
	[Id_Maszyny] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LZ_Narzedzia]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LZ_Narzedzia] ON [dbo].[LinieZadania]
(
	[Id_Narzedzie] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LZ_Obszar]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LZ_Obszar] ON [dbo].[LinieZadania]
(
	[Id_Obszary] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LZ_Podobszar]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LZ_Podobszar] ON [dbo].[LinieZadania]
(
	[Id_Podobszary] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LZ_Poziom]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LZ_Poziom] ON [dbo].[LinieZadania]
(
	[Id_Poziom] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LZ_Rodzaje]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LZ_Rodzaje] ON [dbo].[LinieZadania]
(
	[Id_Rodzaj] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LZ_Zadania]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LZ_Zadania] ON [dbo].[LinieZadania]
(
	[Id_Task] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Oceny]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Oceny] ON [dbo].[Oceny]
(
	[Aktualna] ASC,
	[Id_Zadania] ASC,
	[Id_Pracownicy] ASC,
	[Id_Oceny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Oceny_Prac]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Oceny_Prac] ON [dbo].[Oceny]
(
	[Aktualna] ASC,
	[Id_Pracownicy] ASC,
	[Id_Zadania] ASC,
	[Id_Oceny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Oceny_Zadania]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Oceny_Zadania] ON [dbo].[Oceny]
(
	[Aktualna] ASC,
	[Id_Zadania] ASC,
	[Ocena] ASC,
	[Id_Oceny] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OddelegowaniaDo]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OddelegowaniaDo] ON [dbo].[Oddelegowania]
(
	[Status] ASC,
	[Do] ASC,
	[IdPracownika] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OddelegowaniaOd]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OddelegowaniaOd] ON [dbo].[Oddelegowania]
(
	[Status] ASC,
	[Od] ASC,
	[IdPracownika] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PracownicyHistoriaPracDo]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PracownicyHistoriaPracDo] ON [dbo].[PracownicyHistoria]
(
	[IdPracownika] ASC,
	[Do] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PracownicyHistoriaPracOd]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PracownicyHistoriaPracOd] ON [dbo].[PracownicyHistoria]
(
	[IdPracownika] ASC,
	[Od] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServerCommandsStatus]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ServerCommandsStatus] ON [dbo].[ServerCommands]
(
	[Status] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StrOrg_SymbJedn]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StrOrg_SymbJedn] ON [dbo].[StrOrg]
(
	[Symb_Jedn] ASC,
	[Id_Str_Org] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaDzialania]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaDzialania] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Id_Dzialanie1] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaMaszyny]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaMaszyny] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Id_Maszyny1] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaNarzedzia]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaNarzedzia] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Id_Narzedzie1] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaObszar]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaObszar] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Id_Obszary1] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaOnbTyp]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaOnbTyp] ON [dbo].[Zadania]
(
	[Onboarding] ASC,
	[Typ] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaPodobszar]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaPodobszar] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Id_Podobszary1] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaPoziom]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaPoziom] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Id_Poziom1] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaRodzaje]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaRodzaje] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Id_Rodzaj1] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaTyp]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaTyp] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaTypWaga]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaTypWaga] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Waga] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaZadania]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaZadania] ON [dbo].[Zadania]
(
	[Typ] ASC,
	[Id_Task1] ASC,
	[Id_Zadania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZG_GZDo]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZG_GZDo] ON [dbo].[ZadaniaGrupyZadania]
(
	[IdGrupy] ASC,
	[IdZadania] ASC,
	[Do] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZG_GZOd]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZG_GZOd] ON [dbo].[ZadaniaGrupyZadania]
(
	[IdGrupy] ASC,
	[IdZadania] ASC,
	[Od] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ZadaniaUprawnienia]    Script Date: 01.09.2017 13:17:42 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ZadaniaUprawnienia] ON [dbo].[ZadaniaUprawnienia]
(
	[IdZadania] ASC,
	[IdUprawnienia] ASC,
	[Od] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AbsencjeDlugotrwale] ADD  CONSTRAINT [DF_AbsencjeDlugotrwale_DataWpisu]  DEFAULT (getdate()) FOR [DataWpisu]
GO
ALTER TABLE [dbo].[Certyfikaty] ADD  CONSTRAINT [DF_Certyfikaty_UmowaLojalnosciowa]  DEFAULT ((0)) FOR [UmowaLojalnosciowa]
GO
ALTER TABLE [dbo].[Certyfikaty] ADD  CONSTRAINT [DF__Certyfika__DataZ__2B0A656D]  DEFAULT ((0)) FOR [DataZdobyciaUprawnienOk]
GO
ALTER TABLE [dbo].[Certyfikaty] ADD  CONSTRAINT [DF__Certyfika__DataW__2BFE89A6]  DEFAULT ((0)) FOR [DataWaznosciPsychotestowOk]
GO
ALTER TABLE [dbo].[Certyfikaty] ADD  CONSTRAINT [DF__Certyfika__DataW__2CF2ADDF]  DEFAULT ((0)) FOR [DataWaznosciBadanLekarskichOk]
GO
ALTER TABLE [dbo].[Certyfikaty] ADD  CONSTRAINT [DF__Certyfika__Umowa__2DE6D218]  DEFAULT ((0)) FOR [UmowaLojalnosciowaOk]
GO
ALTER TABLE [dbo].[Certyfikaty] ADD  CONSTRAINT [DF__Certyfika__DataW__3E1D39E1]  DEFAULT ((0)) FOR [DataWaznosciSet]
GO
ALTER TABLE [dbo].[Certyfikaty] ADD  CONSTRAINT [DF__Certyfika__Aktua__607251E5]  DEFAULT ((1)) FOR [Aktualny]
GO
ALTER TABLE [dbo].[CertyfikatySpaw] ADD  CONSTRAINT [DF_CertyfikatySpaw_Aktualny]  DEFAULT ((1)) FOR [Aktualny]
GO
ALTER TABLE [dbo].[Cmd] ADD  CONSTRAINT [DF_Cmd_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[ImportData] ADD  CONSTRAINT [DF_ImportData_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Kody] ADD  CONSTRAINT [DF__Kody__Aktywny__0C70CFB4]  DEFAULT ((1)) FOR [Aktywny]
GO
ALTER TABLE [dbo].[Komp] ADD  CONSTRAINT [DF_Komp_ShowHeader]  DEFAULT ((1)) FOR [ShowHeader]
GO
ALTER TABLE [dbo].[Lang] ADD  CONSTRAINT [DF_Lang_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Oceny] ADD  DEFAULT ((0)) FOR [Aktualna]
GO
ALTER TABLE [dbo].[OcenyNazwy] ADD  CONSTRAINT [DF_OcenyNazwy_Wybor]  DEFAULT ((1)) FOR [Wybor]
GO
ALTER TABLE [dbo].[Oddelegowania] ADD  CONSTRAINT [DF_Oddelegowania_Status_1]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Oddelegowania] ADD  DEFAULT ((0)) FOR [Typ]
GO
ALTER TABLE [dbo].[Oddelegowania] ADD  DEFAULT ((0)) FOR [MailingKadry]
GO
ALTER TABLE [dbo].[ONBKarty] ADD  CONSTRAINT [DF_ONBKarty_DataZalozenia]  DEFAULT (getdate()) FOR [DataZalozenia]
GO
ALTER TABLE [dbo].[ONBSzkoleniaTerminy] ADD  CONSTRAINT [DF_ONBSzkoleniaTerminy_Data]  DEFAULT (getdate()) FOR [Data]
GO
ALTER TABLE [dbo].[ONBSzkoleniaTrenerzy] ADD  CONSTRAINT [DF_ONBSzkoleniaTrenerzy_IdTrenera]  DEFAULT ((0)) FOR [IdTrenera]
GO
ALTER TABLE [dbo].[ONBSzkoleniaTypy] ADD  CONSTRAINT [DF_ONBSzkoleniaTypy_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[PassSkills] ADD  CONSTRAINT [DF_PassSkils_Aktywny]  DEFAULT ((1)) FOR [Aktywny]
GO
ALTER TABLE [dbo].[Pracownicy] ADD  CONSTRAINT [DF__Pracownicy__APT__17C286CF]  DEFAULT ((0)) FOR [APT]
GO
ALTER TABLE [dbo].[Pracownicy_] ADD  CONSTRAINT [DF_Pracownicy_Mailing]  DEFAULT ((1)) FOR [Mailing]
GO
ALTER TABLE [dbo].[Pracownicy_] ADD  CONSTRAINT [DF_Pracownicy_Admin]  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[Pracownicy_] ADD  CONSTRAINT [DF_Pracownicy_Kierownik]  DEFAULT ((0)) FOR [Kierownik]
GO
ALTER TABLE [dbo].[Pracownicy_] ADD  CONSTRAINT [DF_Pracownicy_Raporty]  DEFAULT ((0)) FOR [Raporty]
GO
ALTER TABLE [dbo].[Pracownicy_] ADD  CONSTRAINT [DF_Pracownicy_Created_1]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PracownicyStrOrg] ADD  CONSTRAINT [DF_PracownicyStrOrg_Data]  DEFAULT (getdate()) FOR [Data]
GO
ALTER TABLE [dbo].[Przelozeni_x] ADD  CONSTRAINT [DF_Tbl_PrzelożeniN_Blokada]  DEFAULT ((0)) FOR [Blokada]
GO
ALTER TABLE [dbo].[RaportyScheduler] ADD  CONSTRAINT [DF_RaportyScheduler_Typ]  DEFAULT ((0)) FOR [Typ]
GO
ALTER TABLE [dbo].[RaportyScheduler] ADD  CONSTRAINT [DF_RaportyScheduler_Aktywny]  DEFAULT ((0)) FOR [Aktywny]
GO
ALTER TABLE [dbo].[Scheduler] ADD  CONSTRAINT [DF__Scheduler__Aktyw__5F691F13]  DEFAULT ((1)) FOR [Aktywny]
GO
ALTER TABLE [dbo].[ServerCommands] ADD  CONSTRAINT [DF_ServerCommands_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[SqlContent] ADD  CONSTRAINT [DF_SqlContent_Aktywny]  DEFAULT ((1)) FOR [Aktywny]
GO
ALTER TABLE [dbo].[SqlMenu] ADD  CONSTRAINT [DF_SqlMenu_Aktywny]  DEFAULT ((1)) FOR [Aktywny]
GO
ALTER TABLE [dbo].[tmpImportData] ADD  CONSTRAINT [DF_tmpImportData_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Uprawnienia] ADD  CONSTRAINT [DF_Uprawnienia_Aktywne]  DEFAULT ((1)) FOR [Aktywne]
GO
ALTER TABLE [dbo].[Uprawnienia] ADD  CONSTRAINT [DF__Uprawnien__Produ__3F115E1A]  DEFAULT ((0)) FOR [Produkcyjne]
GO
ALTER TABLE [dbo].[Uprawnienia] ADD  CONSTRAINT [DF__Uprawnien__Niepr__40058253]  DEFAULT ((0)) FOR [Nieprodukcyjne]
GO
ALTER TABLE [dbo].[Uprawnienia] ADD  CONSTRAINT [DF__Uprawnien__Paszp__40F9A68C]  DEFAULT ((0)) FOR [PaszportSpawacza]
GO
ALTER TABLE [dbo].[Uprawnienia] ADD  CONSTRAINT [DF_Uprawnienia_Grupa]  DEFAULT ((0)) FOR [Grupa]
GO
ALTER TABLE [dbo].[Uprawnienia] ADD  CONSTRAINT [DF_Uprawnienia_Wymagane]  DEFAULT ((0)) FOR [Wymagane]
GO
ALTER TABLE [dbo].[Uprawnienia] ADD  CONSTRAINT [DF_Uprawnienia_Zablokowane]  DEFAULT ((0)) FOR [Zablokowane]
GO
ALTER TABLE [dbo].[UprawnieniaKwalifikacje] ADD  CONSTRAINT [DF_UprawnieniaKwalifikacje_Aktywna]  DEFAULT ((1)) FOR [Aktywna]
GO
ALTER TABLE [dbo].[UprawnieniaTypy] ADD  CONSTRAINT [DF_UprawnieniaTypy_Aktywne]  DEFAULT ((1)) FOR [Aktywny]
GO
ALTER TABLE [dbo].[UprawnieniaTypy] ADD  CONSTRAINT [DF_UprawnieniaTypy_Wybor]  DEFAULT ((1)) FOR [Wybor]
GO
ALTER TABLE [dbo].[UserParams] ADD  DEFAULT ((0)) FOR [Bool1]
GO
ALTER TABLE [dbo].[UserParams] ADD  DEFAULT ((0)) FOR [Bool2]
GO
ALTER TABLE [dbo].[Ustawienia] ADD  CONSTRAINT [DF_Ustawienia_Id]  DEFAULT ((1)) FOR [Id]
GO
ALTER TABLE [dbo].[Zadania] ADD  CONSTRAINT [DF_Zadania_Sumowane]  DEFAULT ((1)) FOR [Sumowane]
GO
ALTER TABLE [dbo].[Zadania] ADD  CONSTRAINT [DF__Zadania__APT__3C69FB99]  DEFAULT ((1)) FOR [APT]
GO
ALTER TABLE [dbo].[Zadania] ADD  CONSTRAINT [DF_Zadania_Onboarding]  DEFAULT ((0)) FOR [Onboarding]
GO
ALTER TABLE [dbo].[ZadaniaGrupy] ADD  CONSTRAINT [DF_ZadaniaGrupy_Aktywna]  DEFAULT ((1)) FOR [Aktywna]
GO
ALTER TABLE [dbo].[ZadaniaGrupyTypy] ADD  CONSTRAINT [DF_ZadaniaGrupyTypy_Wybor]  DEFAULT ((1)) FOR [Wybor]
GO
ALTER TABLE [dbo].[ZadaniaTypy] ADD  CONSTRAINT [DF_ZadaniaTypy_Aktywne]  DEFAULT ((1)) FOR [Aktywny]
GO
ALTER TABLE [dbo].[ZadaniaTypy] ADD  CONSTRAINT [DF_ZadaniaTypy_Wybor]  DEFAULT ((1)) FOR [Wybor]
GO
ALTER TABLE [dbo].[ZadaniaTypy] ADD  DEFAULT ((0)) FOR [Dodatkowe]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_PracownicyN_Tbl_Gr_ZatrN] FOREIGN KEY([Id_Gr_Zatr])
REFERENCES [dbo].[GrZatr] ([Id_Gr_Zatr])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Tbl_PracownicyN_Tbl_Gr_ZatrN]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_PracownicyN_Tbl_StanowiskaN] FOREIGN KEY([Id_Stanowiska])
REFERENCES [dbo].[Stanowiska] ([Id_Stanowiska])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Tbl_PracownicyN_Tbl_StanowiskaN]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_PracownicyN_Tbl_Status_PracN] FOREIGN KEY([Id_Status])
REFERENCES [dbo].[StatusPrac] ([Id_Status_Prac])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Tbl_PracownicyN_Tbl_Status_PracN]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_PracownicyN_Tbl_Str_OrgN] FOREIGN KEY([Id_Str_OrgM])
REFERENCES [dbo].[StrOrg] ([Id_Str_Org])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Tbl_PracownicyN_Tbl_Str_OrgN]
GO
ALTER TABLE [dbo].[Przelozeni_x]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_PrzelożeniN_Tbl_Gr_ZatrN] FOREIGN KEY([Id_Gr_zatr])
REFERENCES [dbo].[GrZatr] ([Id_Gr_Zatr])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Przelozeni_x] CHECK CONSTRAINT [FK_Tbl_PrzelożeniN_Tbl_Gr_ZatrN]
GO
ALTER TABLE [dbo].[Przelozeni_x]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_PrzelożeniN_Tbl_StanowiskaN] FOREIGN KEY([Id_Stanowiska])
REFERENCES [dbo].[Stanowiska] ([Id_Stanowiska])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Przelozeni_x] CHECK CONSTRAINT [FK_Tbl_PrzelożeniN_Tbl_StanowiskaN]
GO
ALTER TABLE [dbo].[Przelozeni_x]  WITH NOCHECK ADD  CONSTRAINT [FK_Tbl_PrzelożeniN_Tbl_Str_OrgN] FOREIGN KEY([Id_Str_Org])
REFERENCES [dbo].[StrOrg] ([Id_Str_Org])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Przelozeni_x] CHECK CONSTRAINT [FK_Tbl_PrzelożeniN_Tbl_Str_OrgN]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMatrycaPracownicy1]    Script Date: 01.09.2017 13:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetMatrycaPracownicy1]
	@tmptable varchar(20), 
	@strorg varchar(max), 
	@pracId int, 
	@status varchar(10), 
	@data datetime, 
	@count int OUTPUT
AS BEGIN
	declare @cnt int
	declare @stmtDec nvarchar(max)
	declare @stmtPrac nvarchar(max)

	if @pracId is not null
		set @stmtPrac = '
			select P.*, D.IdStruktury 
			into ' + @tmptable + '
			from Pracownicy P
			left join Oddelegowania D on D.IdPracownika = P.Id_Pracownicy and @data between D.Od and D.Do and D.Status = 2 
			where P.Id_Pracownicy = @pracId
			'
	else if @status = 'd'
		set @stmtPrac = '
			select P.*, -9 as IdStruktury
			into ' + @tmptable + '
			from Pracownicy P where P.Id_Pracownicy in 
			(
				select distinct IdPracownika from Oddelegowania D 
				where 
					D.IdStruktury in (' + @strorg + ') 
				and D.Status = 2 
			)        
		'   
	else
		set @stmtPrac = '
			select P.*, D.IdStruktury 
			into ' + @tmptable + '
			from Pracownicy P
			left join Oddelegowania D on D.IdPracownika = P.Id_Pracownicy and @data between D.Od and D.Do and D.Status = 2 
			where 
				(P.Id_Str_OrgM in (' + @strorg + ') or D.IdStruktury in (' + @strorg + ')) 
			and (
				@status = ''p'' and P.Status >= 0 or
				@status = ''z'' and P.Status = -1 or
				@status = ''all'' and P.Status >= -1 or
				@status = ''arch'' and P.Status = -3
				)
		'
	set @stmtDec = '
		declare @pracId int
		declare @status varchar(10)
		declare @data datetime
		set @pracId = ' + ISNULL(convert(varchar, @pracId), 'null') + '
		set @status = ''' + @status + '''
		set @data = ''' + CONVERT(nvarchar(10), @data, 20) + '''
	'
	declare @stmt nvarchar(max)
	set @stmt = @stmtDec + @stmtPrac 
	exec (@stmt)
	set @count = 0
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cmd', @level2type=N'COLUMN',@level2name=N'Created'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-link,1-csv,2-pdf' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RaportyScheduler', @level2type=N'COLUMN',@level2name=N'Typ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ServerCommands', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 6
               Left = 229
               Bottom = 114
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2295
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VPracOceny'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VPracOceny'
GO
USE [master]
GO
ALTER DATABASE [DM_Matryca] SET  READ_WRITE 
GO

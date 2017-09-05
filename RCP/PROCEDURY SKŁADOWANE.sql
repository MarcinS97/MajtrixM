USE [HR_DB]
GO
/****** Object:  UserDefinedFunction [dbo].[ToTimeHMM]    Script Date: 01/15/2012 17:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ToTimeHMM](@seconds INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @m INT;
	DECLARE @h INT;
	DECLARE @mm VARCHAR(2);
	DECLARE @hh VARCHAR(10);
	
	SET @m = FLOOR((@seconds / 60) % 60);
	SET @h = FLOOR(@seconds / 3600);
	
	IF (@m < 10) SET @mm = '0' + CONVERT(VARCHAR, @m, 1);
	ELSE SET @mm = CONVERT(VARCHAR, @m, 1);
	SET @hh = CONVERT(VARCHAR, @h, 1);
	
	RETURN @hh + ':' + @mm;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[ToTimeH]    Script Date: 01/15/2012 17:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ToTimeH](@seconds INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @h INT;
	DECLARE @hh VARCHAR(10);
	
	SET @h = FLOOR(@seconds / 3600);
	
	SET @hh = CONVERT(VARCHAR, @h, 1);
	
	RETURN @hh;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[ToTime]    Script Date: 01/15/2012 17:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ToTime](@seconds INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @s INT;
	DECLARE @m INT;
	DECLARE @h INT;
	DECLARE @ss VARCHAR(2);
	DECLARE @mm VARCHAR(2);
	DECLARE @hh VARCHAR(10);
	
	SET @s = @seconds % 60;
	SET @m = FLOOR((@seconds / 60) % 60);
	SET @h = FLOOR(@seconds / 3600);
	
	IF (@s < 10) SET @ss = '0' + CONVERT(VARCHAR, @s, 1);
	ELSE SET @ss = CONVERT(VARCHAR, @s, 1);
	IF (@m < 10) SET @mm = '0' + CONVERT(VARCHAR, @m, 1);
	ELSE SET @mm = CONVERT(VARCHAR, @m, 1);
	SET @hh = CONVERT(VARCHAR, @h, 1);
	
	RETURN @hh + ':' + @mm + ':' + @ss;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[test]    Script Date: 01/15/2012 17:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[test](@cnt int) RETURNS @tb TABLE(lp  int)
AS
BEGIN
	DECLARE @count INT 

	SET @count = 0 
	WHILE (@count < 40) 

	BEGIN 
		SET @count = (@count + 1) 
		INSERT INTO @tb ([lp]) VALUES (@count)
	END 
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetDates2]    Script Date: 01/15/2012 17:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  UserDefinedFunction [dbo].[GetDates]    Script Date: 01/15/2012 17:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetDates](@startdate datetime, @enddate datetime) 
returns table 
as 
return 
( 
	with   
		N0 as (SELECT 1 as n UNION ALL SELECT 1),
		N1 as (SELECT 1 as n FROM N0 t1, N0 t2),
		N2 as (SELECT 1 as n FROM N1 t1, N1 t2),
		N3 as (SELECT 1 as n FROM N2 t1, N2 t2),
		N4 as (SELECT 1 as n FROM N3 t1, N3 t2),
		N5 as (SELECT 1 as n FROM N4 t1, N4 t2),
		N6 as (SELECT 1 as n FROM N5 t1, N5 t2),
		nums as (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) as num FROM N6) 
		
		SELECT DATEADD(day,num-1,@startdate) as Data 
		FROM nums 
		WHERE num <= DATEDIFF(day,@startdate,@enddate) + 1
);
GO
/****** Object:  UserDefinedFunction [dbo].[RoundSec]    Script Date: 01/15/2012 17:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
0 - bez 
1 - minut
30 - 1/2h
60 - 1h
*/
CREATE FUNCTION [dbo].[RoundSec](@seconds INT, @round INT)
RETURNS INT
AS
BEGIN
	DECLARE @s INT;
	IF (@round = 0)
		SET @s = @seconds;
	ELSE BEGIN
		DECLARE @r INT;
		SET @r = 60 * @round;
		SET @s = ROUND((@seconds + (30 * @round)) / @r, 0) * @r;
	END;
	RETURN @s;
END;
GO

USE [HR_DB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetRcpData]    Script Date: 01/15/2012 20:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetRcpData](@sesId varchar(100)) 
	RETURNS @rcp TABLE (ECUniqueId int, 
					   TimeBefore datetime null, 
					   TimeIn datetime null, 
					   TimeOut datetime null, 
					   TimeAfter datetime null, 
					   beforetime int null,
					   worktime int null,
					   aftertime int null
					   )
AS 
BEGIN
	declare @uid int
	declare @czas datetime
	declare @inout bit

	--declare @to1 int, @ti1 int, @to2 int, @ti2 int

	declare @uid2 int
	declare @tbefore datetime = NULL
	declare @tin datetime = NULL
	declare @tout datetime = NULL
	declare @tafter datetime = NULL
	declare @bt int = NULL
	declare @wt int = NULL
	declare @at int = NULL
	
	declare @step int = 0
	declare @cnt int = 0
	
	declare cur cursor for
		select ECUniqueId, Czas, InOut2 
		from tmpRCP1 
		where sesId = @sesId 
		order by ECUniqueId
	OPEN cur
	FETCH NEXT FROM cur INTO @uid, @czas, @inout
	WHILE @@FETCH_STATUS = 0
	BEGIN	
		set @cnt = @cnt + 1
		if @step = 0 begin			-- >> czekam na timein/timebefore(out)
			if @inout = 0 begin		-- in
				set @uid2 = @uid
				set @tin = @czas		
				set @step = 1			-- czakam na timeout
			end
			else begin				-- out
				set @uid2 = @uid
				set @tbefore = NULL
				set @tin = NULL
				set @tout = @czas		-- czekam na timeafter
				set @step = 2	
				/*
				if @tbefore = 0
					set @tbefore = @czas -- ustawiam time before i dalej czekam na timein, przy zalozeniu ze 1 dzien wczesniej startuje
				else begin
					set @tin = NULL
					set @tout = @czas
					set @step = 2		-- czekam na timeafter
				end
				*/
			end
		end
		else if @step = 1 begin		-- >> czekam na timeout
			if @inout = 0 begin		-- in
				set @tout = NULL
				set @tafter = @czas
				set @step = 3			-- komplet - zapis
			end
			else begin				-- out
				set @tout = @czas		
				set @step = 2			-- czekam na in after
			end
		end
		else if @step = 2 begin		-- >> czekam na timeafter(in)
			if @inout = 0 begin		-- in
				set @tafter = @czas
				set @step = 3			-- komplet - zapis
			end
			else begin				-- out
				set @tafter = NULL
				set @step = 4			-- komplet zapis z podstawieniem
			end
		end
	
		if @step >= 3 begin			-- >> zapis
			set @bt = datediff(second,'1900-01-01',@tin - @tbefore)
			set @wt = datediff(second,'1900-01-01',@tout - @tin)
			set @at = datediff(second,'1900-01-01',@tafter - @tout)
			insert into @rcp values (@uid2, @tbefore, @tin, @tout, @tafter, @bt, @wt, @at)
			set @tbefore = @tout
			set @tin = @tafter
			if @step = 4 begin
				set @tout = @czas
				set @step = 2			-- czekam na timeafter
			end
			else begin
				set @tout = NULL
				set @step = 1			-- czekam na timeout
			end
			set @tafter = NULL
			set @uid2 = @uid
		end
		
		FETCH NEXT FROM cur INTO @uid, @czas, @inout
	END

	if @cnt > 0 begin
		set @bt = datediff(second,'1900-01-01',@tin - @tbefore)
		set @wt = datediff(second,'1900-01-01',@tout - @tin)
		set @at = datediff(second,'1900-01-01',@tafter - @tout)
		insert into @rcp values (@uid2, @tbefore, @tin, @tout, @tafter, @bt, @wt, @at)
		
		
		update @rcp set 
			beforetime = ISNULL(datediff(second,'1900-01-01',
				TimeIn - (select top 1 R.Czas 
					      from tmpRCP1 R 
					      where R.sesId = @sesId and R.ECUniqueId < [@rcp].ECUniqueId 
					      order by R.ECUniqueId desc)), 86400)
		where beforetime is NULL and TimeIn is not NULL
		update @rcp set 
			aftertime = ISNULL(datediff(second,'1900-01-01',
				(select top 1 R.Czas 
				 from tmpRCP1 R 
				 where R.sesId = @sesId
				 R.ECUniqueId > [@rcp].ECUniqueId 
				 order by R.ECUniqueId) - TimeOut), 86400)
		where aftertime is NULL and TimeOut is not NULL
		<<< uaktualnić !!!
	end
	
	CLOSE cur
	DEALLOCATE cur
	RETURN
END

/****** Object:  UserDefinedFunction [dbo].[RoundTime]    Script Date: 01/15/2012 17:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[RoundTime](@seconds INT, @round INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @s INT;	
	DECLARE @ret VARCHAR(100);
	SET @s = dbo.RoundSec(@seconds, @round);
	IF      (@round >= 60) SET @ret = dbo.ToTimeH(@s)
	ELSE IF (@round <= 1)  SET @ret = dbo.ToTime(@s)
	ELSE				   SET @ret = dbo.ToTimeHMM(@s);  -- 15,30
	RETURN @ret;
END;
GO

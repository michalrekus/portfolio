DECLARE @e varchar(16) = LEFT('2016-05-07 17-58-00.xlsx',16)
DECLARE @tab0 table (Id int identity(1,1), Match int, Book smallint, [Date] varchar(max), Odds1 varchar(max), Odds0 varchar(max), Odds2 varchar(max), num1 int, num0 int, num2 int)  
INSERT INTO @tab0
SELECT null, null, CASE WHEN CHARINDEX('deep link.',REPLACE(F2,' (Please disable the pop-up blocker in order to make it work.)','')) > 0 THEN RIGHT(REPLACE(F2,' (Please disable the pop-up blocker in order to make it work.)',''),LEN(REPLACE(F2,' (Please disable the pop-up blocker in order to make it work.)',''))-CHARINDEX('deep link.',REPLACE(F2,' (Please disable the pop-up blocker in order to make it work.)',''))-9) ELSE F2 END,
REPLACE(REPLACE(F3,',','.'),'---',-1), REPLACE(REPLACE(REPLACE(F5,',','.'),'---',-1),'X','0'), 
REPLACE(REPLACE(F7,',','.'),'---',-1), NULL, NULL, NULL   FROM OPENROWSET
('Microsoft.ACE.OLEDB.15.0', 'Excel 12.0;HDR=NO;Database=D:\hobby\bukmacherstwo\kwiecien_2015\downloaded_odds3\2016-05-07 17-58-00.xlsx;;HDR=NO;IMEX=1', [win_7$])
--SELECT * FROM @tab0
DECLARE @tab1 table (BookName varchar(32))
--SELECT * FROM @tab1

DECLARE @year varchar(4)= '2016'
DECLARE @prevyear varchar(4) = '2016'
DECLARE @c int = (SELECT Id FROM @tab0 WHERE Date LIKE 'Result%')
DECLARE @d bit = 0
IF @c IS NULL 
	BEGIN
	SET @c = (SELECT Id FROM @tab0 WHERE Date Like '%View%')-1
	SET @d = 1
	END

--SELECT LEFT((SELECT [Date] FROM @tab0 WHERE Id = @c - 3),CHARINDEX('?',(SELECT [Date] FROM @tab0 WHERE Id = @c - 3))-2)
DECLARE @tab3 TABLE (Host VARCHAR(64), Guest VARCHAR(64))
--INSERT INTO @tab3
--SELECT 
--LEFT((SELECT [Date] FROM @tab0 WHERE Id = @c - 3),CHARINDEX('?',(SELECT [Date] FROM @tab0 WHERE Id = @c - 3))-2),
--RIGHT((SELECT [Date] FROM @tab0 WHERE Id = @c - 3), LEN((SELECT [Date] FROM @tab0 WHERE Id = @c - 3)) - CHARINDEX('?',(SELECT [Date] FROM @tab0 WHERE Id = @c - 3)) - 1)

INSERT INTO @tab3
VALUES (
(SELECT ClubName2 FROM Clubs WHERE ClubName1a = LEFT((SELECT [Date] FROM @tab0 WHERE Id = @c - 3),CHARINDEX('?',(SELECT [Date] FROM @tab0 WHERE Id = @c - 3))-2) OR ClubName1b = LEFT((SELECT [Date] FROM @tab0 WHERE Id = @c - 3),CHARINDEX('?',(SELECT [Date] FROM @tab0 WHERE Id = @c - 3))-2)),
(SELECT ClubName2 FROM Clubs WHERE ClubName1a = RIGHT((SELECT [Date] FROM @tab0 WHERE Id = @c - 3), LEN((SELECT [Date] FROM @tab0 WHERE Id = @c - 3)) - CHARINDEX('?',(SELECT [Date] FROM @tab0 WHERE Id = @c - 3)) - 1) OR ClubName1b = RIGHT((SELECT [Date] FROM @tab0 WHERE Id = @c - 3), LEN((SELECT [Date] FROM @tab0 WHERE Id = @c - 3)) - CHARINDEX('?',(SELECT [Date] FROM @tab0 WHERE Id = @c - 3)) - 1))
)

--SELECT * FROM @tab3
DECLARE @czasmeczu varchar(16) = 
	CASE 
		WHEN (SELECT CHARINDEX('Jan',(SELECT [Date] FROM @tab0 WHERE Id = @c-1))) <> 0
		THEN (SELECT LEFT(CAST(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([Date],')',''),'(',''),'Sun',@year),'Sat',@year),'Fri',@year),'Tue',@year),'Wed',@year),'Thu',@year),'Mon',@year) AS datetime2),16) FROM @tab0 WHERE Id = @c-1)
		ELSE (SELECT LEFT(CAST(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([Date],')',''),'(',''),'Sun',@prevyear),'Sat',@prevyear),'Fri',@prevyear),'Tue',@prevyear),'Wed',@prevyear),'Thu',@prevyear),'Mon',@prevyear) AS datetime2),16) FROM @tab0 WHERE Id = @c-1)
	END
DECLARE @czasmeczu2 varchar(16) = @czasmeczu
DECLARE @wynik varchar(18) = (SELECT [Date] FROM @tab0 WHERE Id = @c)

IF @d = 1
	BEGIN
	SET @czasmeczu = NULL
	END

UPDATE @tab0
SET [Date] = LEFT(@e,10) + ' ' + [Date]
WHERE LEN([Date]) = 5 AND CHARINDEX(':',[Date]) = 3


DECLARE @BookName varchar(32)
DECLARE @a int = 1
DECLARE @wiersz smallint = 0
DECLARE cur1 SCROLL CURSOR FOR
-----------------------
SELECT 
[Date] FROM @tab0
--OPEN cur1
--FETCH NEXT FROM cur1 INTO @BookName
--WHILE @@FETCH_STATUS = 0
--BEGIN
--	IF @BookName = 'Average (%)' SET @wiersz = @a
--	SET @a = @a + 1
--	FETCH NEXT FROM cur1 INTO @BookName
--END
--Close cur1
--Deallocate cur1
---------------------
SET @wiersz = (SELECT Id FROM @tab0 WHERE [Date] = 'Average (%)')

--SELECT @wiersz 
--SELECT * FROM @tab0

DELETE FROM @tab0
WHERE Id < 3 OR Id > @wiersz
UPDATE @tab0
SET Book = 0 
WHERE Id = @wiersz
UPDATE @tab0
SET [Date] = @czasmeczu
WHERE ID = @wiersz
--SELECT * FROM @tab0



OPEN cur1
SET @a = (SELECT MAX(Id) FROM @tab0)
SET @wiersz = 0
DECLARE @Id smallint = 1
DECLARE @czas varchar(16)
DECLARE @nazwa varchar(32)

--SELECT @czasmeczu
FETCH LAST FROM cur1 INTO @BookName
WHILE @@FETCH_STATUS = 0
BEGIN
	IF REPLACE(@BookName,'NEW: ','') IN (SELECT BookName FROM Books) AND REPLACE(@BookName,'NEW: ','') NOT IN (SELECT * FROM @tab1)
	BEGIN 
		UPDATE @tab0 
		SET Book = (SELECT BookId FROM Books WHERE BookName = REPLACE(@BookName,'NEW: ','')) 
		WHERE @a = Id
		UPDATE @tab0
		SET [Date] = @czasmeczu
					--CASE WHEN DATEDIFF(day,@czas,@czasmeczu) = 0 THEN CAST(CAST(@czas AS DATE) AS DATETIME) + CAST(CAST(F10 AS TIME) AS DATETIME) WHEN DATEDIFF(day,@czas,@czasmeczu) = 1 THEN
					--	CASE WHEN CAST(CAST(@czasmeczu AS DATE) AS DATETIME) + CAST(CAST(F10 AS TIME) AS DATETIME) > @czasmeczu THEN CAST(CAST(@czas AS DATE) AS DATETIME) + CAST(CAST(F10 AS TIME) AS DATETIME) ELSE CAST(CAST(@czasmeczu AS DATE) AS DATETIME) + CAST(CAST(F10 AS TIME) AS DATETIME) END 
					--WHEN @nazwa IN (SELECT BookName FROM Books) THEN 
					--	CASE WHEN CAST(F10 AS TIME) <= CAST(@czasmeczu AS TIME) THEN CAST(CAST(@czasmeczu AS DATE) AS DATETIME) + CAST(CAST(F10 AS TIME) AS DATETIME) ELSE CAST(DATEADD(day,-1,CAST(@czasmeczu AS DATE)) AS DATETIME) + CAST(CAST(F10 AS TIME) AS DATETIME) END
					--ELSE null END
		WHERE @a = Id
		INSERT INTO @tab1 
		SELECT REPLACE(@BookName,'NEW: ','')
	END
	ELSE IF REPLACE(@BookName,'NEW: ','') IN (SELECT BookName FROM Books) AND REPLACE(@BookName,'NEW: ','') IN (SELECT * FROM @tab1) OR REPLACE(@BookName,'NEW: ','') = ''
	BEGIN 
		UPDATE @tab0 
		SET Book = -1
		WHERE @a = Id
		INSERT INTO @tab1 
		SELECT REPLACE(@BookName,'NEW: ','')
	END
	ELSE IF REPLACE(@BookName,'NEW: ','') IS NULL
	BEGIN
		UPDATE @tab0
		SET Book = -2
		WHERE @a = Id
	END
	SET @a = @a - 1
	SET @czas = CASE WHEN ISDATE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@BookName,')',''),'  (',''),'Sun',@year),'Sat',@year),'Fri',@year),'Tue',@year),'Wed',@year),'Thu',@year),'Mon',@year)) = 1 THEN LEFT(CAST(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(@BookName,')',''),'(',''),'Sun',@year),'Sat',@year),'Fri',@year),'Tue',@year),'Wed',@year),'Thu',@year),'Mon',@year) AS datetime2),16) ELSE NULL END
	SET @nazwa = @BookName
	FETCH PRIOR FROM cur1 INTO @BookName
END
CLOSE cur1

--SELECT * FROM @tab1
--SELECT * FROM @tab0

UPDATE @tab0
	SET [Date] = 
	CASE 
		WHEN (SELECT CHARINDEX('Dec',[Date])) = 0 
		THEN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([Date],'Sun',@year),'Sat',@year),'Fri',@year),'Tue',@year),'Wed',@year),'Thu',@year),'Mon',@year)
		ELSE REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([Date],'Sun',@prevyear),'Sat',@prevyear),'Fri',@prevyear),'Tue',@prevyear),'Wed',@prevyear),'Thu',@prevyear),'Mon',@prevyear)
	END
	--REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([Date],'Sun',@year),'Sat',@year),'Fri',@year),'Tue',@year),'Wed',@year),'Thu',@year),'Mon',@year)
--SELECT * FROM @tab0

UPDATE @tab0
	SET [Date] = CASE WHEN ISDATE([Date]) = 1 THEN LEFT(CAST([DATE] AS datetime2),16) ELSE NULL END


UPDATE @tab0
	SET Match = (SELECT MatchId FROM dbo.Matches m INNER JOIN @tab3 t3 ON t3.Host = m.Host AND t3.Guest = m.Guest AND m.Season = '15.16' AND m.HostScore IS NULL AND m.[Round] = (SELECT MIN(m2.[Round]) FROM dbo.Matches m2 INNER JOIN @tab3 t3 ON t3.Host = m2.Host AND t3.Guest = m2.Guest AND m2.Season = '15.16' AND m2.HostScore IS NULL))
--SELECT * FROM @tab0
IF (SELECT TOP 1 Match FROM @tab0) IS NULL 
BEGIN
	SELECT 'brak spotkania'
END


DEALLOCATE cur1
DECLARE @nrbooka smallint
DECLARE @b smallint = null
SET @a = 3
DECLARE cur2 SCROLL CURSOR FOR
SELECT 
Book FROM @tab0
OPEN cur2
FETCH NEXT FROM cur2 INTO @nrbooka
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @nrbooka >= -2
	SET @b = @nrbooka
	ELSE 
	BEGIN
		UPDATE @tab0
		SET Book = @b
		WHERE @a = Id 
	END
	SET @a = @a + 1
	FETCH NEXT FROM cur2 INTO @nrbooka
END
Close cur2
DEALLOCATE cur2
--SELECT * FROM @tab0
DECLARE @od1 float, @od0 float, @od2 float
DECLARE @odds1 float, @odds0 float, @odds2 float
SET @a = 1
DECLARE cur3 SCROLL CURSOR FOR
SELECT Id, Book, Odds1, Odds0, Odds2 FROM @tab0
OPEN cur3
FETCH NEXT FROM cur3 INTO @a, @nrbooka, @odds1, @odds0, @odds2
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @nrbooka >= -2 AND @odds1 IS NOT NULL 
		SET @od1 = @odds1
	IF @nrbooka >= -2 AND @odds0 IS NOT NULL 
		SET @od0 = @odds0
	IF @nrbooka >= -2 AND @odds2 IS NOT NULL
		SET @od2 = @odds2
	IF @nrbooka >= -2 AND @odds1 IS NULL
	BEGIN
		UPDATE @tab0
		SET Odds1 = @od1
		WHERE Id = @a
	END
	IF @nrbooka >= -2 AND @odds0 IS NULL
	BEGIN
		UPDATE @tab0
		SET Odds0 = @od0
		WHERE Id = @a
	END
	IF @nrbooka >= -2 AND @odds2 IS NULL
	BEGIN
		UPDATE @tab0
		SET Odds2 = @od2
		WHERE Id = @a
	END
	FETCH NEXT FROM cur3 INTO @a, @nrbooka, @odds1, @odds0, @odds2
END
Close cur3
DEALLOCATE cur3
--SELECT * FROM @tab0
DECLARE @tab2 table (MatchId int, Bet tinyint, Odd1 float, Odd0 float, Odd2 float)
INSERT INTO @tab2
SELECT (SELECT MatchId FROM dbo.Matches m INNER JOIN @tab3 t3 ON t3.Host = m.Host AND t3.Guest = m.Guest WHERE Season = '15.16' AND m.HostScore IS NULL AND m.[Round] = (SELECT MIN(m2.[Round]) FROM dbo.Matches m2 INNER JOIN @tab3 t3 ON t3.Host = m2.Host AND t3.Guest = m2.Guest AND m2.Season = '15.16' AND m2.HostScore IS NULL)), 1, (SELECT Odds1 FROM @tab0 WHERE Book = 0), (SELECT Odds0 FROM @tab0 WHERE Book = 0), (SELECT Odds2 FROM @tab0 WHERE Book = 0)

--select * from @tab0
IF (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) > 1
	BEGIN
	UPDATE @tab2
	SET MatchId = NULL
	UPDATE @tab0
	SET Match = NULL
	SELECT 'brak booka'
	END


IF @d = 0
BEGIN
	INSERT INTO dbo.Odds
	SELECT * FROM @tab2 t
	WHERE NOT EXISTS (SELECT 1 FROM dbo.Odds d WHERE d.MatchId = t.MatchId) AND t.MatchId IS NOT NULL  
END

UPDATE dbo.Matches
	SET Comments = CASE 
					WHEN Comments IS NULL THEN '01'
					WHEN Comments LIKE '01%' THEN REPLACE(Comments,'01','02')
					WHEN Comments LIKE '02%' THEN REPLACE(Comments,'02','03')
					WHEN Comments LIKE '03%' THEN REPLACE(Comments,'03','04')
					WHEN Comments LIKE '04%' THEN REPLACE(Comments,'04','05')
					WHEN Comments LIKE '05%' THEN REPLACE(Comments,'05','06')
					WHEN Comments LIKE '06%' THEN REPLACE(Comments,'06','07')
					WHEN Comments LIKE '07%' THEN REPLACE(Comments,'07','08')
					WHEN Comments LIKE '08%' THEN REPLACE(Comments,'08','09')
					WHEN Comments LIKE '09%' THEN REPLACE(Comments,'09','10')
					WHEN Comments LIKE '10%' THEN REPLACE(Comments,'10','11')
					WHEN Comments LIKE '11%' THEN REPLACE(Comments,'11','12')
					WHEN Comments LIKE '12%' THEN REPLACE(Comments,'12','13')
					WHEN Comments LIKE '13%' THEN REPLACE(Comments,'13','14')
					WHEN Comments LIKE '14%' THEN REPLACE(Comments,'14','15')
					WHEN Comments LIKE '15%' THEN REPLACE(Comments,'15','16')
					WHEN Comments LIKE '16%' THEN REPLACE(Comments,'16','17')
					WHEN Comments LIKE '17%' THEN REPLACE(Comments,'17','18')
					WHEN Comments LIKE '18%' THEN REPLACE(Comments,'18','19')
					WHEN Comments LIKE '19%' THEN REPLACE(Comments,'19','20')
					WHEN Comments LIKE '20%' THEN REPLACE(Comments,'20','21')
					WHEN Comments LIKE '21%' THEN REPLACE(Comments,'21','22')
					WHEN Comments LIKE '22%' THEN REPLACE(Comments,'22','23')
					WHEN Comments LIKE '23%' THEN REPLACE(Comments,'23','24')
					WHEN Comments LIKE '24%' THEN REPLACE(Comments,'24','25')
					WHEN Comments LIKE '25%' THEN REPLACE(Comments,'25','26')
					WHEN Comments LIKE '26%' THEN REPLACE(Comments,'26','27')
					WHEN Comments LIKE '27%' THEN REPLACE(Comments,'27','28')
					WHEN Comments LIKE '28%' THEN REPLACE(Comments,'28','29')
					WHEN Comments LIKE '29%' THEN REPLACE(Comments,'29','30')
					WHEN Comments LIKE '30%' THEN REPLACE(Comments,'30','31')
					WHEN Comments LIKE '31%' THEN REPLACE(Comments,'31','32')
					WHEN Comments LIKE '32%' THEN REPLACE(Comments,'32','33')
					WHEN Comments LIKE '33%' THEN REPLACE(Comments,'33','34')
					WHEN Comments LIKE '34%' THEN REPLACE(Comments,'34','35')
					WHEN Comments LIKE '35%' THEN REPLACE(Comments,'35','36')
					WHEN Comments LIKE '36%' THEN REPLACE(Comments,'36','37')
					WHEN Comments LIKE '37%' THEN REPLACE(Comments,'37','38')
					WHEN Comments LIKE '38%' THEN REPLACE(Comments,'38','39')
					WHEN Comments LIKE '39%' THEN REPLACE(Comments,'39','40')
					WHEN Comments LIKE '40%' THEN REPLACE(Comments,'40','41')
					WHEN Comments LIKE '41%' THEN REPLACE(Comments,'41','42')
					WHEN Comments LIKE '42%' THEN REPLACE(Comments,'42','43')
					WHEN Comments LIKE '43%' THEN REPLACE(Comments,'43','44')
					WHEN Comments LIKE '44%' THEN REPLACE(Comments,'44','45')
					WHEN Comments LIKE '45%' THEN REPLACE(Comments,'45','46')
					WHEN Comments LIKE '46%' THEN REPLACE(Comments,'46','47')
					WHEN Comments LIKE '47%' THEN REPLACE(Comments,'47','48')
					WHEN Comments LIKE '48%' THEN REPLACE(Comments,'48','49')
					WHEN Comments LIKE '49%' THEN REPLACE(Comments,'49','50')
					WHEN Comments LIKE '50%' THEN REPLACE(Comments,'50','51')
					WHEN Comments LIKE '51%' THEN REPLACE(Comments,'51','52')
					WHEN Comments LIKE '52%' THEN REPLACE(Comments,'52','53')
					WHEN Comments LIKE '53%' THEN REPLACE(Comments,'53','54')
					WHEN Comments LIKE '54%' THEN REPLACE(Comments,'54','55')
					WHEN Comments LIKE '55%' THEN REPLACE(Comments,'55','56')
					WHEN Comments LIKE '56%' THEN REPLACE(Comments,'56','57')
					WHEN Comments LIKE '57%' THEN REPLACE(Comments,'57','58')
					WHEN Comments LIKE '58%' THEN REPLACE(Comments,'58','59')
					WHEN Comments LIKE '59%' THEN REPLACE(Comments,'59','60')
					WHEN Comments LIKE '60%' THEN REPLACE(Comments,'60','more')
				   ELSE Comments
				   END
	WHERE (SELECT TOP 1 Match FROM @tab0) = MatchId 
	AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)

IF RIGHT(@e,5) = '17-58' AND CAST(@czasmeczu2 AS DATE) = CAST(LEFT(@e,10) AS DATE)
BEGIN
	UPDATE dbo.Matches
	SET [Date] = @czasmeczu2
	WHERE MatchId = (SELECT TOP 1 Match FROM @tab0) AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)
END

IF RIGHT(@e,5) = '03-58' AND DATEADD(day,1,CAST(@czasmeczu2 AS DATE)) = CAST(LEFT(@e,10) AS DATE) AND
LEN(@wynik) = 17
BEGIN
	UPDATE dbo.Matches
	SET HostScore = SUBSTRING(@wynik,9,1)
	WHERE MatchId = (SELECT TOP 1 Match FROM @tab0) AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)
	UPDATE dbo.Matches
	SET GuestScore = SUBSTRING(@wynik,11,1)
	WHERE MatchId = (SELECT TOP 1 Match FROM @tab0) AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)
	UPDATE dbo.Matches
	SET HostHalfScore = SUBSTRING(@wynik,14,1)
	WHERE MatchId = (SELECT TOP 1 Match FROM @tab0) AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)
	UPDATE dbo.Matches
	SET GuestHalfScore = SUBSTRING(@wynik,16,1)
	WHERE MatchId = (SELECT TOP 1 Match FROM @tab0) AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)
END
IF RIGHT(@e,5) = '03-58' AND DATEADD(day,1,CAST(@czasmeczu2 AS DATE)) = CAST(LEFT(@e,10) AS DATE) AND
LEN(@wynik) = 11 AND RIGHT(@wynik,3) = '0:0'
BEGIN
	UPDATE dbo.Matches
	SET HostScore = 0
	WHERE MatchId = (SELECT TOP 1 Match FROM @tab0) AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)
	UPDATE dbo.Matches
	SET GuestScore = 0
	WHERE MatchId = (SELECT TOP 1 Match FROM @tab0) AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)
	UPDATE dbo.Matches
	SET HostHalfScore = 0
	WHERE MatchId = (SELECT TOP 1 Match FROM @tab0) AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)
	UPDATE dbo.Matches
	SET GuestHalfScore = 0
	WHERE MatchId = (SELECT TOP 1 Match FROM @tab0) AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL AND Book > 0 GROUP BY Book) as [licznik]) IS NULL)
END

--UPDATE @tab0
--SET [Date] = REPLACE([Date],'2014','2015')
--WHERE [Date] LIKE '2014-01-%'
 
DELETE FROM @tab0
WHERE Book IS NULL OR Book <= 0

DECLARE @czas2 smalldatetime
DECLARE @a1 float, @a0 float, @a2 float
DECLARE @b1 int = 0, @b0 int = 0, @b2 int = 0
DECLARE cur4 SCROLL CURSOR FOR
SELECT Id, [Date], Odds1, Odds0, Odds2 FROM @tab0
OPEN cur4
FETCH NEXT FROM cur4 INTO @a, @czas2, @odds1, @odds0, @odds2
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @czas2 IS NULL
	BEGIN
		SET @a1 = @odds1
		SET @b1 = 0
		SET @a0 = @odds0
		SET @b0 = 0
		SET @a2 = @odds2
		SET @b2 = 0
	END
	ELSE
	BEGIN
		IF @a1 <> @odds1
		BEGIN
			SET @b1 = @b1 + 1
			SET @a1 = @odds1
		END
		ELSE IF @a1 = @odds1 AND @b1 = 25
			SET @b1 = 125
		IF @a0 <> @odds0
		BEGIN
			SET @b0 = @b0 + 1
			SET @a0 = @odds0
		END
		ELSE IF @a0 = @odds0 AND @b0 = 25
			SET @b0 = 125
		IF @a2 <> @odds2
		BEGIN 
			SET @b2 = @b2 + 1
			SET @a2 = @odds2
		END
		ELSE IF @a2 = @odds2 AND @b2 = 25
			SET @b2 = 125
	END
	UPDATE @tab0
	SET num1 = @b1
	WHERE @a = Id
	UPDATE @tab0
	SET num0 = @b0
	WHERE @a = Id
	UPDATE @tab0
	SET num2 = @b2
	WHERE @a = Id
	FETCH NEXT FROM cur4 INTO @a, @czas2, @odds1, @odds0, @odds2
END
Close cur4
DEALLOCATE cur4

DECLARE @TabMaxDate TABLE (Book int, MaxWin smalldatetime, MinDate smalldatetime)
INSERT INTO @TabMaxDate
SELECT 
	b.BookId, (SELECT MAX(w.[Date]) FROM dbo.Win w WHERE w.MatchId = (SELECT TOP 1 t.Match FROM @tab0 t) AND w.BookId = b.BookId),
	(SELECT MIN(t.Date) FROM @tab0 t WHERE t.Book = b.BookId AND t.num1 < 100 AND t.num0 < 100 AND t.num2 < 100) 
FROM 
	dbo.Books b

IF EXISTS (SELECT 1 FROM @TabMaxDate tm WHERE tm.MinDate > tm.MaxWin) 
UPDATE dbo.Matches
	SET Comments = Comments + ' (ID)'
WHERE (SELECT TOP 1 Match FROM @tab0) = MatchId 

--SELECT * FROM @TabMaxDate

INSERT INTO dbo.Win
SELECT Match, Book, [Date], Odds1, Odds0, Odds2 FROM @tab0 t
WHERE NOT EXISTS (SELECT 1 FROM dbo.Win w WHERE w.MatchId = t.Match AND t.Book = w.BookId AND t.[Date] = w.[Date]) 
AND t.Match IS NOT NULL AND t.[Date] IS NOT NULL AND ((SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL GROUP BY Book) as [licznik]) <= 1 OR (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL GROUP BY Book) as [licznik]) IS NULL)


--SELECT CAST(CAST('2014-12-10 17:09' AS DATE) AS SMALLDATETIME) + CAST('20:35' AS DATETIME)
--SELECT CAST('2014-12-12 20:45' AS TIME)
-- SELECT DATEDIFF(day,'2014-12-12 20:45','2014-12-12 20:36')

--DECLARE @year varchar(4)= '2014' SELECT LEFT(CAST(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE('  (Fri 12 Dec 20:45)',')',''),'(',''),'Sun',@year),'Sat',@year),'Fri',@year),'Tue',@year),'Wed',@year),'Thu',@year),'Mon',@year) AS datetime2),16)
-- DECLARE @year varchar(4)= '2014' SELECT CASE WHEN ISDATE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE('Fri 12 Dec 20:36',')',''),'  (',''),'Sun',@year),'Sat',@year),'Fri',@year),'Tue',@year),'Wed',@year),'Thu',@year),'Mon',@year)) = 1 THEN LEFT(CAST(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE('Fri 12 Dec 20:36',')',''),'(',''),'Sun',@year),'Sat',@year),'Fri',@year),'Tue',@year),'Wed',@year),'Thu',@year),'Mon',@year) AS datetime2),16) ELSE NULL END
-- SELECT CASE WHEN CAST('20:16' AS TIME) <= CAST('2014-12-12 20:45' AS TIME) THEN CAST(CAST('2014-12-12 20:45' AS DATE) AS DATETIME) + CAST(CAST('20:16' AS TIME) AS DATETIME) ELSE 0 end
SELECT * FROM @tab2
SELECT * FROM @tab0 

--IF (SELECT MAX(licznik) FROM (SELECT COUNT(1) 'licznik' FROM @tab0 WHERE [Date] IS NULL GROUP BY Book) as [licznik]) > 1
--	BEGIN
--	SELECT 'brak booka'
--	END
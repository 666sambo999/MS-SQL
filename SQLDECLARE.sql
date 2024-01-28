--объ€вление переменной 


DECLARE @discipline SMALLINT = (SELECT discipline_id FROM Disciplins WHERE discipline_name LIKE '%Java')
DECLARE @teacher INT = 1
DECLARE @group INT = 2
DECLARE @start_date DATE = '2023-06-07'
DECLARE @date DATE = @start_date
DECLARE @interval INT = 2
DECLARE @time TIME = '18:30'
DECLARE @number_of_lesson TINYINT = (SELECT number_of_lessons FROM dbo.Disciplins WHERE discipline_id = @discipline)

DECLARE @counter INT = 0

WHILE (@counter < @number_of_lesson)
BEGIN 
	INSERT INTO Schedule (discipline, teacher, [date], [time], spent, [group])
	VALUES (@discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1,0), @group);
	SET  @counter = @counter+1;
	
	INSERT INTO Schedule (discipline, teacher, [date], [time], spent, [group])
	VALUES (@discipline, @teacher, @date, DATEADD(mi, 90, CONVERT(TIME, @time)), IIF(@date < GETDATE(), 1,0), @group);
	SET  @counter = @counter+1;

	--SET @date = @date + @interval
	SET @date = DATEADD(dd, @interval, @date);
	SET @interval = IIF(@interval = 2,5,2);
END


--INSERT INTO dbo.Schedule (discipline, teacher, [date], [time], spent, [group])


SELECT 	
	dbo.Disciplins.discipline_name	AS 'дисциплина',
	dbo.Groups.group_name			AS 'группа',	
	dbo.Schedule.[date]				AS 'дата',
	dbo.Schedule.[time]				AS 'врем€',
	dbo.Teacher.last_name + dbo.Teacher.first_name + dbo.Teacher.middle_name AS 'преподаватель'
FROM 
	dbo.Schedule, dbo.Disciplins, dbo.Groups, dbo.Teacher
WHERE 
	dbo.Schedule.discipline = dbo.Disciplins.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teacher.teacher_id;

--SELECT * FROM dbo.Disciplins WHERE discipline_name LIKE '%Java%'
--SELECT * FROM dbo.Disciplins WHERE CONTAINS(discipline_name, '%Java%')
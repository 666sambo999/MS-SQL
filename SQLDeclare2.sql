USE PD212

SET DATEFIRST 1

DECLARE @discipline SMALLINT = (SELECT discipline_id FROM Disciplins WHERE discipline_name LIKE '%MS SQL%')
DECLARE @teacher INT = 3
DECLARE @group INT = 3
DECLARE @start_date DATE = '2023-12-01'
DECLARE @date DATE = @start_date
DECLARE @interval INT = IIF(DATEPART(dw, @date)=5,3,2)
DECLARE @time TIME = '14:30'
DECLARE @number_of_lesson TINYINT = (SELECT number_of_lessons FROM dbo.Disciplins WHERE discipline_id = @discipline)

DECLARE @counter INT = 0

WHILE (@counter < @number_of_lesson)
BEGIN 
	IF(
		SELECT COUNT(*)
		FROM Schedule 
		WHERE [group] = @group AND discipline = @discipline AND [date] = @date AND [time] = @time
	) = 0
	BEGIN 
		INSERT INTO Schedule (discipline, teacher, [date], [time], spent, [group])
		VALUES (@discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1,0), @group);
		
	END
	SET  @counter = @counter+1;

	IF(
		SELECT COUNT(*)
		FROM Schedule 
		WHERE [group] = @group AND discipline = @discipline AND [date] = @date AND [time] = @time
	) = 0
	BEGIN 
		INSERT INTO Schedule (discipline, teacher, [date], [time], spent, [group])
		VALUES (@discipline, @teacher, @date, DATEADD(mi, 90, CONVERT(TIME, @time)), IIF(@date < GETDATE(), 1,0), @group);
		
	END
	SET  @counter = @counter+1;
	--SET @date = @date + @interval
	SET @date = DATEADD(dd, @interval, @date);
	SET @interval = IIF(DATEPART(dw, @date)=5,3,2);
END

--INSERT INTO dbo.Schedule (discipline, teacher, [date], [time], spent, [group])
SELECT COUNT(*)
FROM Schedule
WHERE 
[group] = @group
AND [discipline]= @discipline;

SELECT 	
	dbo.Disciplins.discipline_name	AS 'дисциплина',
	dbo.Groups.group_name			AS 'группа',	
	dbo.Schedule.[date]				AS 'дата',
	dbo.Schedule.[time]				AS 'время',
	dbo.Teacher.last_name + ' ' + dbo.Teacher.first_name + ' '+ dbo.Teacher.middle_name AS 'преподаватель',
	[Статус] = IIF (Schedule.spent = 1, 'Проведено', 'Запланировано') 
FROM 
	dbo.Schedule, dbo.Disciplins, dbo.Groups, dbo.Teacher
WHERE 
	dbo.Schedule.discipline = dbo.Disciplins.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teacher.teacher_id
AND dbo.Schedule.discipline = (SELECT discipline FROM dbo.Disciplins WHERE discipline_name LIKE '%MS SQL%');
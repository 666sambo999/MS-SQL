DELETE FROM Schedule WHERE discipline =15;

SELECT 
	dbo.Disciplins.discipline_name	AS 'дисциплина',
	dbo.Groups.group_name			AS 'группа',
	dbo.Schedule.[date]				AS 'дата',
	dbo.Schedule.[time]				AS 'время',
	dbo.Teacher.last_name + dbo.Teacher.first_name + dbo.Teacher.middle_name AS 'преподаватель'
FROM 
	dbo.Schedule, dbo.Disciplins, dbo.Groups, dbo.Teacher
WHERE 
	dbo.Schedule.discipline = dbo.Disciplins.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teacher.teacher_id;
USE PD212

--INSERT INTO dbo.Schedule VALUES (5,4, '2022-12-14', '14:30',1,2)
--INSERT INTO dbo.Schedule VALUES (2,2, '2022-12-14', '14:30',1,2)
--INSERT INTO dbo.Schedule VALUES (4,7, '2022-12-17', '16:30',1,5)
INSERT INTO dbo.Schedule (discipline, teacher, [date], [time], spent, [group])
VALUES (5,1, '2022-12-19', '16:30',1,1)

SELECT 
	dbo.Disciplins.discipline_name	AS 'дисциплина',
	dbo.Groups.group_name			AS 'группа',
	dbo.Schedule.[date]				AS 'дата',
	dbo.Schedule.[time]				AS 'время',
	dbo.Teacher.last_name + dbo.Teacher.first_name + dbo.Teacher.middle_name AS 'преподаватель'
FROM 
	dbo.Schedule, dbo.Disciplins, dbo.Groups, dbo.Teacher
WHERE 
	dbo.Schedule.discipline = dbo.Disciplins.disciline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teacher.teacher_id;
USE PD212
--SELECT COUNT(*)
--FROM 
--	dbo.Schedule, dbo.Disciplins, dbo.Groups, dbo.Teacher
--WHERE 
--	dbo.Schedule.discipline = dbo.Disciplins.discipline_id
--AND dbo.Schedule.[group] = dbo.Groups.group_id
--AND dbo.Schedule.teacher = dbo.Teacher.teacher_id
--AND dbo.Schedule.discipline = (SELECT discipline_id FROM Disciplins WHERE discipline_name LIKE '%MS SQL%')
--AND dbo.Schedule.[date] = '2024-12-01'

SELECT COUNT(*)
FROM dbo.Schedule 
WHERE 
	[group] = (SELECT group_id FROM Groups WHERE group_name = 'PV_213')
	AND [discipline] = (SELECT discipline_id FROM Disciplins WHERE discipline_name LIKE '%MS SQL%')

SELECT 
	dbo.Disciplins.discipline_name	AS 'дисциплина',
	dbo.Groups.group_name			AS 'группа',
	DATENAME(dw, dbo.Schedule.[date]) AS 'День недели',
	dbo.Schedule.[date]				AS 'дата',
	dbo.Schedule.[time]				AS 'время',
	dbo.Teacher.last_name + ' ' + dbo.Teacher.first_name + ' ' + dbo.Teacher.middle_name AS 'преподаватель',
	[Статус] = IIF (Schedule.spent = 1, 'Проведено', 'Запланировано')
FROM 
	dbo.Schedule, dbo.Disciplins, dbo.Groups, dbo.Teacher
WHERE 
	dbo.Schedule.discipline = dbo.Disciplins.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teacher.teacher_id
AND dbo.Schedule.discipline = (SELECT discipline_id FROM Disciplins WHERE discipline_name LIKE '%MS SQL%')
AND dbo.Schedule.[date] = '2023-12-01'
AND dbo.Schedule.[time] = '14:30'

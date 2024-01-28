DELETE FROM Schedule WHERE discipline =15;

SELECT 
	dbo.Disciplins.discipline_name	AS '����������',
	dbo.Groups.group_name			AS '������',
	dbo.Schedule.[date]				AS '����',
	dbo.Schedule.[time]				AS '�����',
	dbo.Teacher.last_name + dbo.Teacher.first_name + dbo.Teacher.middle_name AS '�������������'
FROM 
	dbo.Schedule, dbo.Disciplins, dbo.Groups, dbo.Teacher
WHERE 
	dbo.Schedule.discipline = dbo.Disciplins.discipline_id
AND dbo.Schedule.[group] = dbo.Groups.group_id
AND dbo.Schedule.teacher = dbo.Teacher.teacher_id;
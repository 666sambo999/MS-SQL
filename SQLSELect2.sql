USE PD212

SELECT 
	lesson_id,
	[����������] = discipline_name,
	Groups.group_name AS '������',
	FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name) AS '�������������',
	[date], [time]
-- ���
FROM Schedule, Teacher, Disciplins, Groups 
-- ������� ������ 
WHERE 
	discipline = discipline_id
AND teacher = teacher_id
AND group_name = 'PD_212'
AND discipline_name LIKE '%MS SQL%'
AND Schedule.spent = 1
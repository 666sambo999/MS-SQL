USE PD212
--����������� �������[�������]
SELECT 
	[����������] = Disciplins.discipline_name,
	[���������� �������] = COUNT (discipline),
	[���������� ����������� �������] = SUM (CASE WHEN spent =1 THEN 1 ELSE 0 END),
	--[���������� ��������������� �������] = SUM (CASE WHEN spent = 1 THEN 0 ELSE 1 END)
	[���������� ��������������� �������] = SUM (CASE WHEN spent = 0 THEN 1 ELSE 0 END)
FROM Schedule, Disciplins
WHERE 
	Schedule.discipline = Disciplins.discipline_id
	GROUP BY Disciplins.discipline_name;

	
	SELECT 
	[�������������] = FORMATMESSAGE (' %s %s %s',  last_name, first_name, middle_name),
	--[�������������] = Teacher.last_name + ' ' + first_name + ' ' + middle_name,
	[���������� ������� � ����������] = COUNT (Schedule.teacher)
	--[���������� ��������������� �������] = SUM (CASE WHEN spent = 1 THEN 0 ELSE 1 END)
FROM Schedule, Teacher
WHERE 
	Schedule.teacher  = Teacher.teacher_id
	--AND date >= '2023-12-01' 
	AND [date] BETWEEN '2023-12-01' AND '2023-12-31'
	GROUP BY Teacher.last_name, Teacher.first_name, Teacher.middle_name;
USE PD212
-- ���������� �������
--ALTER TABLE Teacher  
--ADD rate MONEY   

SELECT 
	[�������������] = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name), 
	[������ �� ����] = FORMAT (Teacher.rate, 'C'),
	[���������� ���] = COUNT(teacher),
	[�����] = FORMAT(COUNT(teacher)*Teacher.rate, 'C')
FROM Schedule, Teacher 
WHERE Schedule.teacher = Teacher.teacher_id
AND [date] BETWEEN '2023-01-01' AND '2023-12-31'

GROUP BY last_name, first_name, middle_name, rate




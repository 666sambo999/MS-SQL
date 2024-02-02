SET DATEFIRST 1
USE PD212

SELECT 
	[�������] = FORMATMESSAGE ('%s %s %s', last_name, first_name, midle_name),
	[������] = Groups.group_name,
	[���� ������] = DATENAME(dw, Schedule.[date]), 
	[����]  = Schedule.date,  
	[�����] = Schedule.time,
	[�����������] = IIF (Attendance.present = 1, '���', '��������'),
	[����������] = Disciplins.discipline_name
FROM	
	Students, Attendance, Groups, Disciplins, Schedule
WHERE 
	Attendance.student = Students.stud_id
AND Attendance.lesson = Schedule.lesson_id
AND Schedule.discipline = Disciplins.discipline_name
AND Schedule.[group] = Groups.group_id
AND Schedule.date BETWEEN '2023-01-01' AND '2023-12-31'
--AND Schedule.[time] = '14.30'
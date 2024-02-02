SET DATEFIRST 1
USE PD212

SELECT 
	[Студент] = FORMATMESSAGE ('%s %s %s', last_name, first_name, midle_name),
	[Группа] = Groups.group_name,
	[День недели] = DATENAME(dw, Schedule.[date]), 
	[Дата]  = Schedule.date,  
	[Время] = Schedule.time,
	[Присутствие] = IIF (Attendance.present = 1, 'Был', 'Прогулял'),
	[Дисциплина] = Disciplins.discipline_name
FROM	
	Students, Attendance, Groups, Disciplins, Schedule
WHERE 
	Attendance.student = Students.stud_id
AND Attendance.lesson = Schedule.lesson_id
AND Schedule.discipline = Disciplins.discipline_name
AND Schedule.[group] = Groups.group_id
AND Schedule.date BETWEEN '2023-01-01' AND '2023-12-31'
--AND Schedule.[time] = '14.30'
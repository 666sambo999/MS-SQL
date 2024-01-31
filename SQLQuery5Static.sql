USE PD212
--статические функции[считаем]
SELECT 
	[Дисциплина] = Disciplins.discipline_name,
	[Количество занятий] = COUNT (discipline),
	[Количество проведенных занятий] = SUM (CASE WHEN spent =1 THEN 1 ELSE 0 END),
	--[Количество запланированных занятий] = SUM (CASE WHEN spent = 1 THEN 0 ELSE 1 END)
	[Количество запланированных занятий] = SUM (CASE WHEN spent = 0 THEN 1 ELSE 0 END)
FROM Schedule, Disciplins
WHERE 
	Schedule.discipline = Disciplins.discipline_id
	GROUP BY Disciplins.discipline_name;

	
	SELECT 
	[Преподаватель] = FORMATMESSAGE (' %s %s %s',  last_name, first_name, middle_name),
	--[Преподаватель] = Teacher.last_name + ' ' + first_name + ' ' + middle_name,
	[Количество занятий в расписании] = COUNT (Schedule.teacher)
	--[Количество запланированных занятий] = SUM (CASE WHEN spent = 1 THEN 0 ELSE 1 END)
FROM Schedule, Teacher
WHERE 
	Schedule.teacher  = Teacher.teacher_id
	--AND date >= '2023-12-01' 
	AND [date] BETWEEN '2023-12-01' AND '2023-12-31'
	GROUP BY Teacher.last_name, Teacher.first_name, Teacher.middle_name;
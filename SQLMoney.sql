USE PD212
-- добавление таблицы
--ALTER TABLE Teacher  
--ADD rate MONEY   

SELECT 
	[Преподаватель] = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name), 
	[Ставка за пару] = FORMAT (Teacher.rate, 'C'),
	[Количество пар] = COUNT(teacher),
	[Итого] = FORMAT(COUNT(teacher)*Teacher.rate, 'C')
FROM Schedule, Teacher 
WHERE Schedule.teacher = Teacher.teacher_id
AND [date] BETWEEN '2023-01-01' AND '2023-12-31'

GROUP BY last_name, first_name, middle_name, rate




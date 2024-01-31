USE PD212

SELECT 
	[преподаватель] = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name),
	[—реднее количество зан€тий в мес€ц] = COUNT (Schedule.teacher)/12.0

FROM Schedule, Teacher
WHERE Schedule.teacher = Teacher.teacher_id
AND [date] BETWEEN '2023-01-01' AND '2023-12-31'

GROUP BY Teacher.last_name, Teacher.first_name,Teacher.middle_name;



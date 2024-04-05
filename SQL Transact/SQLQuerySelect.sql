USE [Acad_PD321(class)]

UPDATE Schudule  SET spent =1 Where number_of_lesson >=23 


EXECUTE my_discipline_from_groups 'PD_321', '%SQL%'

Select 
	[Группа] = group_name,
	[Дисциплина]  = discipline_name
FROM CompleteDiscipline JOIN Groups ON [group] = group_id
JOIN Disciplines ON discipline = disciplin_id
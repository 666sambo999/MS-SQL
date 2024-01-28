USE PD212
SELECT 
	Students.last_name AS 'Фамилия',
	Students.first_name AS 'Имя',
	Students.midle_name AS 'Отчество',
	DATEDIFF (hour, Students.date_of_birth, GETDATE())/8766 AS 'Возраст',
	Groups.group_name AS 'группа',
	Directions.direction_name AS 'Направление'
FROM 
	Students, Groups, Directions
WHERE 
	Students.[group] = Groups.group_id
	AND Groups.group_name = 'PU_211'
AND Groups.direction = Directions.direction_id
--AND Directions.direction_name = 'Разработка программного обеспечения';
ORDER BY 
	Students.last_name DESC;
	--DESC - Descending  обратный порядок (в порядке убывания)
	-- ASC - Ascending (в порядке возрастания)

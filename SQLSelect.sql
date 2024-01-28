USE PD212
SELECT 
	Students.last_name AS '�������',
	Students.first_name AS '���',
	Students.midle_name AS '��������',
	DATEDIFF (hour, Students.date_of_birth, GETDATE())/8766 AS '�������',
	Groups.group_name AS '������',
	Directions.direction_name AS '�����������'
FROM 
	Students, Groups, Directions
WHERE 
	Students.[group] = Groups.group_id
	AND Groups.group_name = 'PU_211'
AND Groups.direction = Directions.direction_id
--AND Directions.direction_name = '���������� ������������ �����������';
ORDER BY 
	Students.last_name DESC;
	--DESC - Descending  �������� ������� (� ������� ��������)
	-- ASC - Ascending (� ������� �����������)

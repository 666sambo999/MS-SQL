SELECT 
	[ID] = Students.stud_id, 
	[�������] = FORMATMESSAGE ('%s %s %s', last_name, first_name, midle_name),
	group_name AS '������' 

FROM Students RIGHT JOIN Groups ON [group]= group_id

WHERE group_name = 'PD_212'


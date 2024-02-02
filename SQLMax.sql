--DELETE FROM Attendance
USE PD212

DECLARE @start_lesson_id BIGINT = 

(SELECT MIN(lesson_id) 
FROM Schedule, Disciplins, Groups
WHERE 
	discipline = discipline_id
	AND group_name = 'PD_212'
	AND discipline_name LIKE '%MS SQL%'
	AND Schedule.spent =1
)
print @start_lesson_id

DECLARE @end_lesson_id BIGINT = 

(SELECT MAX(lesson_id) 
FROM Schedule, Disciplins, Groups
WHERE 
	discipline = discipline_id
	AND group_name = 'PD_212'
	AND discipline_name LIKE '%MS SQL%'
	AND Schedule.spent = 1
)
print @end_lesson_id

DECLARE @lesson_id BIGINT = @start_lesson_id
WHILE (@lesson_id < @end_lesson_id)
BEGIN 
	--DECLARE @student TABLE (student_id INT)
	--SELECT stud_id
	--INTO #Current
	--FROM Students JOIN Groups ON [group] = group_id 
	--WHERE [group_name] = 'PD_212'
	--SELECT * FROM #Current
	--DECLARE @id INT
	--SELECT TOP 3 @id = #Current.stud_id FROM #Current
	--SELECT TOP 3 @id  stud_id FROM (SELECT stud_id FROM Students JOIN Groups ON [group] = group_id WHERE group_name = 'PD_212')	

	DECLARE @iterator INT = 1
	WHILE (@iterator <= (SELECT COUNT(stud_id) FROM Students JOIN Groups ON [group] = group_id WHERE group_name = 'PD_212'))
	BEGIN
		DECLARE @id INT = 
		(SELECT MAX(stud_id) FROM (SELECT TOP (@iterator) Students.stud_id FROM Students, Groups 
		WHERE [group]= group_id AND group_name = 'PD_212')Students)
		print (@id)
		
		DECLARE @is_present BIT = round (rand(@iterator + @lesson_id)*1000,0)
		print(@is_present)
		
		INSERT INTO Attendance (student, lesson, present)
		VALUES (@id, @lesson_id, @is_present)

		SET @iterator +=1
	END 
	SET @lesson_id +=1
END
	


 

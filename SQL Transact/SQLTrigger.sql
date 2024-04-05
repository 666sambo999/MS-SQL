USE [Acad_PD321(class)]
GO

Create Trigger my_trigger_discipline ON dbo.Schudule 
AFTER INSERT, UPDATE 
AS 
Begin
	IF	
		(Select MAX (Schudule.spent) FROM Schudule WHERE spent = 1 GROUP BY discipline, [group])
		= (Select Schudule.number_of_lesson From Disciplines JOIN Schudule ON discipline = disciplin_id) 
	Begin
		INSERT INTO CompleteDiscipline([group], discipline)
		VALUES 
		(
			(Select discipline From Schudule Where spent = 1 AND Schudule.number_of_lesson = (Select Schudule.number_of_lesson FROM Schudule JOIN Disciplines ON discipline = disciplin_id)), 
			(Select [group] From Schudule	 Where spent = 1 AND Schudule.number_of_lesson = (Select Schudule.number_of_lesson FROM Schudule JOIN Disciplines ON discipline = disciplin_id)) 
		)
		
	End 
END

Select 
[Группа] = group_name,
[Дисциплина] = Disciplines.discipline_name,
[Количество проведенных занятий] = Count(Schudule.spent)

From Schudule JOIN Disciplines ON (discipline = disciplin_id)
JOIN Groups ON ([group] = group_id)
Where spent =1 
GROUP BY discipline_name, group_name
Alter PROCEDURE my_sp_stacionar_to_schedule
@group_name			NVARCHAR (10),
@discipline_name	NVARCHAR(150),
@start_date			DATE,
@time				TIME,
@teacher_name		NVARCHAR(100),
@learning_day_1		NVARCHAR(25),
@learning_day_2		NVARCHAR(25),
@learning_day_3		NVARCHAR(25)
AS

DECLARE @discipline SMALLINT = (Select disciplin_id FROM Disciplines WHERE discipline_name LIKE (@discipline_name))
DECLARE @group INT = (SELECT group_id FROM Groups WHERE group_name = @group_name)
Declare @number_of_lessons TINYINT = (Select number_of_lesson FROM Disciplines WHERE discipline_name LIKE (@discipline_name))
DECLARE @number_of_lesson TINYINT  = 0
DECLARE @teacher SMALLINT = (Select teacher_id From Teacher WHERE last_name = @teacher_name)
Declare @date  DATE = @start_date

--Declare @interval_1 TINYINT =  

While @number_of_lesson < @number_of_lessons
Begin 
	IF dbo.isCalebration(@date) = 0
	Begin
		IF NOT EXISTS 
		(Select [date],[time],[group], discipline 
		FROM Schudule 
		WHERE [date] = @date 
		AND [time] = @time 
		AND [group] = @group 
		--AND discipline = @discipline
		)
		Begin
			IF DATENAME(WEEKDAY, @date) IN (@learning_day_1, @learning_day_2,@learning_day_3)
			Begin
				Insert INTO Schudule 
				([group], discipline, teacher, [date], [time], spent, number_of_lesson)
				Values (@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0),@number_of_lesson+1),
				(@group, @discipline, @teacher, @date, DATEADD(MINUTE,95,@time), IIF(@date<GETDATE(),1,0),@number_of_lesson+2)
			SET @number_of_lesson = @number_of_lesson+2
			End
		End
			ELSE 
			Begin
				SET @number_of_lesson = @number_of_lesson+2
			End
	End		
		--SET @date = DATEADD(DAY, IIF (DATENAME(WEEKDAY, @date) in ('�������', '�������'), 2,3), @date)
			--SET @date = DATEADD(DAY, IIF (DATENAME(WEEKDAY, @date) in (Select TOP 2 * FROM string_split(@learning_day, ',')), 2,3), @date)	
			Set @date = DATEADD(DAY, 1, @date)
End
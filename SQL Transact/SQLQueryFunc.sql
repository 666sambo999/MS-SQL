Alter Function isCalebration(@date AS Date) Returns BIT
	AS 
	Begin 
	Declare @celebration BIT =0 
		IF EXISTS (Select * From Calibration Where DATEPART(Day, @date) = holidays_day AND DATEPART(MONTH, @date) = holidays_month)
			Set @celebration = 1
		Return @celebration
	END 
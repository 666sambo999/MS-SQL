USE [Acad_PD321(class)]

Declare @date DATE = '2024-03-08'

--Print (dbo.isCalebration(@date))
--EXECUTE my_select_from_schudule
 
EXECUTE my_sp_stacionar_to_schedule 'PD_212', 'Сетевое програмирование', '2024.02.28', '14:30', 'Ковтун', 'Понедельник', 'Среда', 'Пятница'
EXECUTE my_discipline_from_groups 'PD_212', 'Сетевое програмирование' 
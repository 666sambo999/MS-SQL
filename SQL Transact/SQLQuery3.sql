USE [Acad_PD321(class)]

Declare @date DATE = '2024-03-08'

--Print (dbo.isCalebration(@date))
--EXECUTE my_select_from_schudule
 
EXECUTE my_sp_stacionar_to_schedule 'PD_212', '������� ���������������', '2024.02.28', '14:30', '������', '�����������', '�����', '�������'
EXECUTE my_discipline_from_groups 'PD_212', '������� ���������������' 
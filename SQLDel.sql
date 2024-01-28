USE PD212
DELETE FROM Schedule WHERE discipline = (SELECT discipline_id FROM Disciplins WHERE discipline_name LIKE '%MS SQL%');
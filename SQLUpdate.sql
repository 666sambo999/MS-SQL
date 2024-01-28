-- удаление лишних пробелов в таблице
UPDATE Teacher 
SET last_name = TRIM(last_name),first_name = TRIM(first_name), middle_name = TRIM(middle_name);
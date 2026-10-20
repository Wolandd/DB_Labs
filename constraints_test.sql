-- тест 1 - повтор номера студ. билета
UPDATE students
SET student_number = '0001'
WHERE student_number = '0002';

-- тест 2 - неположительное кол-во часов
UPDATE course_offerings
SET total_hours = 0
WHERE offering_id = 1;

-- тест 3 - конец раньше начала
UPDATE course_offerings
SET end_date = DATE '2025-08-31'
WHERE offering_id = 1;

-- тест 4 - составной PK, повтор пары студент + проведение
UPDATE student_results
SET offering_id = 1
WHERE student_id = 1 AND offering_id = 2;

-- тест 5 - указать на несуществующую группу
UPDATE students
SET group_id = 999
WHERE student_number = '0001';

-- тест 6 - отсутствие обязательной фамилии
UPDATE students
SET last_name = NULL
WHERE student_number = '0001';

-- тест 7 - оценка за пределом числового диапазона
UPDATE student_results
SET grade = 6
WHERE student_id = 1 AND offering_id = 1;

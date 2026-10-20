BEGIN;

INSERT INTO student_groups (group_code)
VALUES
    ('study_group_01'),
    ('study_group_02'),
    ('study_group_03');

INSERT INTO teachers (last_name, first_name, middle_name)
VALUES
    ('Копытова', 'Мария', 'Ивановна'),
    ('Семенов', 'Семен', 'Семенович'),
    ('Журавлев', 'Андрей', 'Игоревич');

INSERT INTO courses (course_code, course_name)
VALUES
    ('db', 'Базы данных'),
    ('ml', 'Машинное обучение'),
    ('math', 'Математический анализ');

INSERT INTO students (student_number, last_name, first_name, middle_name, group_id)
VALUES
    ('0001', 'Иванов', 'Иван', 'Иванович', 1),
    ('0002', 'Игнатьев', 'Артем', 'Андреевич', 1),
    ('0003', 'Бурмакин', 'Михаил', 'Алексеевич', 1),
    ('0004', 'Хан', 'Альберт', 'Олегович', 1),
    ('0005', 'Гудкова', 'Валентина', 'Семеновна', 2),
    ('0006', 'Мухич', 'Игорь', 'Дмитриевич', 2),
    ('0007', 'Кудрявцева', 'Ольга', 'Андреевна', 2),
    ('0008', 'Измайлов', 'Григорий', 'Николаевич', 3),
    ('0009', 'Яковлев', 'Владимир', 'Сергеевич', 3),
    ('0010', 'Смит', 'Джон', NULL, 3);

INSERT INTO course_offerings (course_id, teacher_id, start_date, end_date, total_hours)
VALUES
    (1, 1, DATE '2025-09-01', DATE '2025-12-26', 72),
    (2, 2, DATE '2025-09-01', DATE '2025-12-26', 108),
    (3, 3, DATE '2025-09-01', DATE '2025-12-26', 144),
    (1, 1, DATE '2026-09-01', DATE '2026-12-25', 108);

INSERT INTO student_results (student_id, offering_id, grade)
VALUES
    (1, 1, 5),
    (2, 1, 4),
    (3, 1, 3),
    (4, 1, 2),
    (1, 2, 4),
    (2, 2, 5),
    (3, 2, 4),
    (5, 2, 3),
    (6, 2, 5),
    (7, 2, 4),
    (8, 3, 5),
    (9, 3, 4),
    (10, 3, 3),
    (5, 4, NULL),
    (6, 4, NULL),
    (7, 4, NULL);

COMMIT;

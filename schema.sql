BEGIN;

CREATE TABLE student_groups (
    group_id integer GENERATED ALWAYS AS IDENTITY,
    group_code text NOT NULL,
    CONSTRAINT student_groups_pk PRIMARY KEY (group_id),
    CONSTRAINT student_groups_code_unique UNIQUE (group_code)
);

CREATE TABLE students (
    student_id integer GENERATED ALWAYS AS IDENTITY,
    student_number text NOT NULL,
    last_name text NOT NULL,
    first_name text NOT NULL,
    middle_name text,
    group_id integer NOT NULL,
    CONSTRAINT students_pk PRIMARY KEY (student_id),
    CONSTRAINT students_number_unique UNIQUE (student_number),
    CONSTRAINT students_group_fk FOREIGN KEY (group_id)
        REFERENCES student_groups (group_id) ON DELETE RESTRICT
);

CREATE TABLE teachers (
    teacher_id integer GENERATED ALWAYS AS IDENTITY,
    last_name text NOT NULL,
    first_name text NOT NULL,
    middle_name text,
    CONSTRAINT teachers_pk PRIMARY KEY (teacher_id)
);

CREATE TABLE courses (
    course_id integer GENERATED ALWAYS AS IDENTITY,
    course_code text NOT NULL,
    course_name text NOT NULL,
    CONSTRAINT courses_pk PRIMARY KEY (course_id),
    CONSTRAINT courses_code_unique UNIQUE (course_code)
);

CREATE TABLE course_offerings (
    offering_id integer GENERATED ALWAYS AS IDENTITY,
    course_id integer NOT NULL,
    teacher_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    total_hours integer NOT NULL,
    CONSTRAINT course_offerings_pk PRIMARY KEY (offering_id),
    CONSTRAINT course_offerings_hours_positive CHECK (total_hours > 0),
    CONSTRAINT course_offerings_dates_valid CHECK (end_date >= start_date),
    CONSTRAINT course_offerings_course_fk FOREIGN KEY (course_id)
        REFERENCES courses (course_id) ON DELETE RESTRICT,
    CONSTRAINT course_offerings_teacher_fk FOREIGN KEY (teacher_id)
        REFERENCES teachers (teacher_id) ON DELETE RESTRICT
);

CREATE TABLE student_results (
    student_id integer NOT NULL,
    offering_id integer NOT NULL,
    grade smallint,
    CONSTRAINT student_results_pk PRIMARY KEY (student_id, offering_id),
    CONSTRAINT student_results_grade_valid CHECK (grade BETWEEN 2 AND 5),
    CONSTRAINT student_results_student_fk FOREIGN KEY (student_id)
        REFERENCES students (student_id) ON DELETE RESTRICT,
    CONSTRAINT student_results_offering_fk FOREIGN KEY (offering_id)
        REFERENCES course_offerings (offering_id) ON DELETE RESTRICT
);

COMMIT;

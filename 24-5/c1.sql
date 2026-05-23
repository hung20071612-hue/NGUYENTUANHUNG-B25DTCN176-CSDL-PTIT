CREATE TABLE Class (
    class_id    VARCHAR(10)  NOT NULL,
    class_name  VARCHAR(100) NOT NULL,
    academic_year INT        NOT NULL,
    CONSTRAINT pk_class PRIMARY KEY (class_id)
);

-- Tạo bảng Student với khóa ngoại tới Class
CREATE TABLE Student (
    student_id    VARCHAR(10)  NOT NULL,
    full_name     VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    class_id      VARCHAR(10)  NOT NULL,
    CONSTRAINT pk_student  PRIMARY KEY (student_id),
    CONSTRAINT fk_student_class FOREIGN KEY (class_id)
        REFERENCES Class(class_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
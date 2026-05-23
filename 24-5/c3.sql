CREATE TABLE Enrollment (
    student_id      VARCHAR(10) NOT NULL,
    subject_id      VARCHAR(10) NOT NULL,
    enrollment_date DATE        NOT NULL DEFAULT CURRENT_DATE,

    -- Khóa chính kép: đảm bảo một SV không đăng ký trùng một môn
    CONSTRAINT pk_enrollment PRIMARY KEY (student_id, subject_id),

    CONSTRAINT fk_enrollment_student FOREIGN KEY (student_id)
        REFERENCES Student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_enrollment_subject FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
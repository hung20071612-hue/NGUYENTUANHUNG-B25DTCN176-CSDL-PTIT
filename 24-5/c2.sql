CREATE TABLE Student (
    student_id VARCHAR(10)  NOT NULL,
    full_name  VARCHAR(100) NOT NULL,
    CONSTRAINT pk_student  PRIMARY KEY (student_id),
    CONSTRAINT uq_student_id UNIQUE (student_id)   -- PRIMARY KEY đã đảm bảo UNIQUE
);

CREATE TABLE Subject (
    subject_id   VARCHAR(10)  NOT NULL,
    subject_name VARCHAR(100) NOT NULL,
    credits      INT          NOT NULL,
    CONSTRAINT pk_subject    PRIMARY KEY (subject_id),
    CONSTRAINT uq_subject_id UNIQUE (subject_id),
    CONSTRAINT chk_credits   CHECK (credits > 0)
);
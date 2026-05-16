CREATE DATABASE student_management;
USE student_management;

CREATE TABLE Student (
    ma_sinh_vien VARCHAR(10) PRIMARY KEY,
    ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE NOT NULL
);

CREATE TABLE Course (
    ma_khoa_hoc VARCHAR(10) PRIMARY KEY,
    ten_khoa_hoc VARCHAR(100) NOT NULL,
    gia DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Enrollment (
    ma_sinh_vien VARCHAR(10),
    ma_khoa_hoc VARCHAR(10),
    ngay_dang_ky DATE NOT NULL,
    PRIMARY KEY (ma_sinh_vien, ma_khoa_hoc),
    FOREIGN KEY (ma_sinh_vien) REFERENCES Student(ma_sinh_vien),
    FOREIGN KEY (ma_khoa_hoc) REFERENCES Course(ma_khoa_hoc)
);
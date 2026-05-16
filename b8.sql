CREATE DATABASE IF NOT EXISTS hotel_management;
USE hotel_management;

CREATE TABLE Project (
    MaDuAn VARCHAR(20) PRIMARY KEY,
    TenDuAn VARCHAR(100) NOT NULL,
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NOT NULL,
    NganSach DECIMAL(15, 2) NOT NULL
);

CREATE TABLE Employee (
    MaNhanVien VARCHAR(20) PRIMARY KEY,
    TenNhanVien VARCHAR(100) NOT NULL,
    ChucVu VARCHAR(50) NOT NULL
);

CREATE TABLE Assignment (
    MaPhanCong VARCHAR(20) PRIMARY KEY,
    MaNhanVien VARCHAR(20) NOT NULL,
    MaDuAn VARCHAR(20) NOT NULL,
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NOT NULL,
    FOREIGN KEY (MaNhanVien) REFERENCES Employee(MaNhanVien),
    FOREIGN KEY (MaDuAn) REFERENCES Project(MaDuAn)
);

CREATE TABLE Task (
    MaNhiemVu VARCHAR(20) PRIMARY KEY,
    TenNhiemVu VARCHAR(100) NOT NULL,
    MaDuAn VARCHAR(20) NOT NULL,
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NOT NULL,
    TrangThai VARCHAR(50) NOT NULL,
    FOREIGN KEY (MaDuAn) REFERENCES Project(MaDuAn)
);
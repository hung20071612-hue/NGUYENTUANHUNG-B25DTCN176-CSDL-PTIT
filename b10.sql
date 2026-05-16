CREATE DATABASE IF NOT EXISTS warehouse_management;
USE warehouse_management;

CREATE TABLE Product (
    MaSanPham VARCHAR(20) PRIMARY KEY,
    TenSanPham VARCHAR(100) NOT NULL,
    LoaiSanPham VARCHAR(50),
    GiaSanPham DECIMAL(15, 2) NOT NULL
);

CREATE TABLE Warehouse (
    MaKho VARCHAR(20) PRIMARY KEY,
    TenKho VARCHAR(100) NOT NULL,
    DiaChi VARCHAR(200)
);

CREATE TABLE Stock (
    MaKho VARCHAR(20),
    MaSanPham VARCHAR(20),
    SoLuongTonKho INT DEFAULT 0,
    PRIMARY KEY (MaKho, MaSanPham),
    FOREIGN KEY (MaKho) REFERENCES Warehouse(MaKho),
    FOREIGN KEY (MaSanPham) REFERENCES Product(MaSanPham)
);

CREATE TABLE `Order` (
    MaDonHang VARCHAR(20) PRIMARY KEY,
    NgayDatHang DATE NOT NULL,
    NgayGiaoHang DATE,
    TongGiaTriDonHang DECIMAL(15, 2) DEFAULT 0
);

CREATE TABLE OrderDetail (
    MaDonHang VARCHAR(20),
    MaSanPham VARCHAR(20),
    SoLuong INT NOT NULL,
    DonGia DECIMAL(15, 2) NOT NULL,
    PRIMARY KEY (MaDonHang, MaSanPham),
    FOREIGN KEY (MaDonHang) REFERENCES `Order`(MaDonHang),
    FOREIGN KEY (MaSanPham) REFERENCES Product(MaSanPham)
);

SELECT w.TenKho, p.TenSanPham, s.SoLuongTonKho
FROM Stock s
JOIN Warehouse w ON s.MaKho = w.MaKho
JOIN Product p ON s.MaSanPham = p.MaSanPham
ORDER BY w.TenKho;

SELECT o.MaDonHang, o.NgayDatHang, p.TenSanPham, od.SoLuong, od.DonGia, (od.SoLuong * od.DonGia) AS ThanhTien
FROM OrderDetail od
JOIN `Order` o ON od.MaDonHang = o.MaDonHang
JOIN Product p ON od.MaSanPham = p.MaSanPham;

SELECT p.TenSanPham, SUM(od.SoLuong) AS TongSoLuongDat
FROM OrderDetail od
JOIN Product p ON od.MaSanPham = p.MaSanPham
GROUP BY p.MaSanPham, p.TenSanPham
ORDER BY TongSoLuongDat DESC;
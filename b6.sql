CREATE DATABASE IF NOT EXISTS event_management;
USE event_management;
 
CREATE TABLE Event (
    MaSuKien INT PRIMARY KEY AUTO_INCREMENT,
    TenSuKien VARCHAR(255) NOT NULL,
    NgayDienRa DATE NOT NULL,
    DiaDiem VARCHAR(255) NOT NULL,
    NganSach DECIMAL(15, 2) NOT NULL
);
 
CREATE TABLE Attendee (
    MaKhachMoi INT PRIMARY KEY AUTO_INCREMENT,
    TenKhachMoi VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE
);
 
CREATE TABLE Sponsor (
    MaNhaTaiTro INT PRIMARY KEY AUTO_INCREMENT,
    TenNhaTaiTro VARCHAR(255) NOT NULL,
    SoTienTaiTro DECIMAL(15, 2) NOT NULL
);
 
CREATE TABLE EventAttendee (
    MaSuKien INT NOT NULL,
    MaKhachMoi INT NOT NULL,
    PRIMARY KEY (MaSuKien, MaKhachMoi),
    FOREIGN KEY (MaSuKien) REFERENCES Event(MaSuKien) ON DELETE CASCADE,
    FOREIGN KEY (MaKhachMoi) REFERENCES Attendee(MaKhachMoi) ON DELETE CASCADE
);
 
CREATE TABLE EventSponsor (
    MaSuKien INT NOT NULL,
    MaNhaTaiTro INT NOT NULL,
    PRIMARY KEY (MaSuKien, MaNhaTaiTro),
    FOREIGN KEY (MaSuKien) REFERENCES Event(MaSuKien) ON DELETE CASCADE,
    FOREIGN KEY (MaNhaTaiTro) REFERENCES Sponsor(MaNhaTaiTro) ON DELETE CASCADE
);
 
SELECT e.MaSuKien, e.TenSuKien, a.MaKhachMoi, a.TenKhachMoi, a.Email
FROM Event e
JOIN EventAttendee ea ON e.MaSuKien = ea.MaSuKien
JOIN Attendee a ON ea.MaKhachMoi = a.MaKhachMoi
ORDER BY e.MaSuKien;
 
SELECT e.MaSuKien, e.TenSuKien, s.MaNhaTaiTro, s.TenNhaTaiTro, s.SoTienTaiTro
FROM Event e
JOIN EventSponsor es ON e.MaSuKien = es.MaSuKien
JOIN Sponsor s ON es.MaNhaTaiTro = s.MaNhaTaiTro
ORDER BY e.MaSuKien;
 
SELECT e.MaSuKien, e.TenSuKien, e.NgayDienRa, e.DiaDiem
FROM Event e
JOIN EventAttendee ea ON e.MaSuKien = ea.MaSuKien
JOIN Attendee a ON ea.MaKhachMoi = a.MaKhachMoi
WHERE a.Email = 'nguyenvana@email.com';
 
SELECT e.MaSuKien, e.TenSuKien, s.TenNhaTaiTro, s.SoTienTaiTro
FROM Event e
JOIN EventSponsor es ON e.MaSuKien = es.MaSuKien
JOIN Sponsor s ON es.MaNhaTaiTro = s.MaNhaTaiTro
WHERE e.MaSuKien = 1;
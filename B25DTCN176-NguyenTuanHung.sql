
-- EXERCISE 01
CREATE DATABASE IF NOT EXISTS sql_qlct;
USE sql_qlct;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- BANG ARCHITECT

CREATE TABLE IF NOT EXISTS architect (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT NULL,
  birthday INT(4) DEFAULT NULL,
  sex TINYINT(1) DEFAULT '0' COMMENT '1: Nam - 0: Nu',
  place VARCHAR(255) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=6;

-- THEM DU LIEU VAO BANG ARCHITECT

INSERT INTO architect (id, name, birthday, sex, place, address) VALUES
(1, 'le thanh tung', 1956, 1, 'tp hcm', '25 duong 3/2 tp bien hoa'),
(2, 'le kim dung', 1952, 0, 'ha noi', '18/5 phan van tri tp can tho'),
(3, 'nguyen anh thu', 1970, 0, 'new york', 'khu 2 dhct tp can tho'),
(4, 'nguyen song do quyen', 1970, 0, 'can tho', '73 tran hung dao tp hcm'),
(5, 'truong minh thai', 1950, 1, 'paris france', '12/2/5 tran phu tp hanoi');

-- BANG CONTRACTOR

CREATE TABLE IF NOT EXISTS contractor (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT NULL,
  phone VARCHAR(45) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

-- THEM DU LIEU VAO BANG CONTRACTOR

INSERT INTO contractor (id, name, phone, address) VALUES
(1, 'cty xd so 6', '567456', '5 phan chu trinh'),
(2, 'phong dich vu so xd', '206481', '2 le van sy'),
(3, 'le van son', '028374', '12 tran nhan ton'),
(4, 'tran khai hoan', '658432', '20 nguyen thai hoc');

-- BANG HOST

CREATE TABLE IF NOT EXISTS host (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=8;

-- THEM DU LIEU VAO BANG HOST

INSERT INTO host (id, name, address) VALUES
(1, 'so t mai du lich', '54 xo viet nghe tinh'),
(2, 'so van hoa thong tin', '101 hai ba trung'),
(3, 'so giao duc', '29 duong 3/2'),
(4, 'dai hoc can tho', '56 duong 30/4'),
(5, 'cty bitis', '29 phan dinh phung'),
(6, 'nguyen thanh ha', '45 de tham'),
(7, 'phan thanh liem', '48/6 huynh thuc khan');

-- BANG WORKER

CREATE TABLE IF NOT EXISTS worker (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) DEFAULT NULL,
  birthday INT(4) DEFAULT NULL,
  year INT(4) DEFAULT NULL,
  skill VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=8;

-- THEM DU LIEU VAO BANG WORKER

INSERT INTO worker (id, name, birthday, year, skill) VALUES
(1, 'nguyen thi suu', 1945, 1960, 'ho'),
(2, 'vi chi a', 1966, 1987, 'moc'),
(3, 'le manh quoc', 1956, 1971, 'son'),
(4, 'vo van chin', 1940, 1952, 'dien'),
(5, 'le quyet thang', 1954, 1974, 'han'),
(6, 'nguyen hong van', 1950, 1970, 'dien'),
(7, 'dang van son', 1948, 1965, 'dien');

-- BANG BUILDING

CREATE TABLE IF NOT EXISTS building (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  city VARCHAR(255) DEFAULT NULL,
  cost FLOAT DEFAULT NULL,
  start DATE DEFAULT NULL,
  host_id INT(11) NOT NULL,
  contractor_id INT(11) NOT NULL,

  PRIMARY KEY (id),

  CONSTRAINT fk_building_host
    FOREIGN KEY (host_id)
    REFERENCES host(id),

  CONSTRAINT fk_building_contractor
    FOREIGN KEY (contractor_id)
    REFERENCES contractor(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=9;

-- THEM DU LIEU VAO BANG BUILDING

INSERT INTO building (id, name, address, city, cost, start, host_id, contractor_id) VALUES
(1, 'khach san quoc te', '5 nguyen an ninh', 'can tho', 450, '1994-12-13', 1, 1),
(2, 'cong vien thieu nhi', '100 nguyen thai hoc', 'can tho', 200, '1994-05-08', 2, 1),
(3, 'hoi cho nong nghiep', 'bai cat', 'vinh long', 1000, '1994-06-10', 1, 1),
(4, 'truong mg mang non', '48 cm thang 8', 'can tho', 30, '1994-07-10', 3, 3),
(5, 'khoa trong trot dhct', 'khu ii dhct', 'can tho', 3000, '1994-06-19', 4, 3),
(6, 'van phong bitis', '25 phan dinh phung', 'ha noi', 40, '1994-05-10', 5, 3),
(7, 'nha rieng 1', '124/5 nguyen trai', 'tp hcm', 65, '1994-11-15', 6, 2),
(8, 'nha rieng 2', '76 chau van liem', 'ha noi', 200, '1994-06-09', 7, 4);



CREATE TABLE IF NOT EXISTS design (
  building_id INT(11) NOT NULL,
  architect_id INT(11) NOT NULL,
  benefit FLOAT DEFAULT NULL,

  PRIMARY KEY (building_id, architect_id),

  CONSTRAINT fk_design_building
    FOREIGN KEY (building_id)
    REFERENCES building(id),

  CONSTRAINT fk_design_architect
    FOREIGN KEY (architect_id)
    REFERENCES architect(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- THEM DU LIEU VAO BANG DESIGN

INSERT INTO design (building_id, architect_id, benefit) VALUES
(1, 1, 25),
(1, 5, 12),
(2, 4, 6),
(3, 3, 12),
(4, 2, 20),
(5, 5, 30),
(6, 2, 40),
(6, 5, 27),
(7, 1, 10),
(8, 2, 18);

-- BANG WORK

CREATE TABLE IF NOT EXISTS work (
  building_id INT(11) NOT NULL,
  worker_id INT(11) NOT NULL,
  date DATE DEFAULT NULL,
  total INT(4) DEFAULT NULL,

  PRIMARY KEY (building_id, worker_id),

  CONSTRAINT fk_work_building
    FOREIGN KEY (building_id)
    REFERENCES building(id),

  CONSTRAINT fk_work_worker
    FOREIGN KEY (worker_id)
    REFERENCES worker(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- THEM DU LIEU VAO BANG WORK

INSERT INTO work (building_id, worker_id, date, total) VALUES
(1, 1, '1994-12-15', 5),
(1, 3, '1994-12-18', 6),
(1, 6, '1994-09-14', 7),
(2, 1, '1994-05-08', 20),
(2, 4, '1994-05-10', 10),
(2, 5, '1994-12-16', 5),
(3, 4, '1994-10-06', 10),
(3, 7, '1994-10-06', 18),
(4, 1, '1994-09-07', 20),
(4, 6, '1994-05-12', 7);

-- EXERCISE 02
-- THIET LAP KHOA NGOAI GIUA CAC BANG

-- building.host_id -> host.id
-- building.contractor_id -> contractor.id
-- design.building_id -> building.id
-- design.architect_id -> architect.id
-- work.building_id -> building.id
-- work.worker_id -> worker.id
-- EXERCISE 03
-- CAC CAU LENH TRUY VAN CO BAN

-- 1. Hien thi toan bo noi dung bang architect

SELECT * FROM architect;

-- 2. Hien thi ho ten va gioi tinh cua kien truc su

SELECT name, sex
FROM architect;

-- 3. Hien thi nhung nam sinh khac nhau cua kien truc su

SELECT DISTINCT birthday
FROM architect;

-- 4. Danh sach kien truc su tang dan theo nam sinh

SELECT name, birthday
FROM architect
ORDER BY birthday ASC;

-- 5. Danh sach kien truc su giam dan theo nam sinh

SELECT name, birthday
FROM architect
ORDER BY birthday DESC;

-- 6. Danh sach cong trinh sap xep theo chi phi tang dan
-- Neu trung chi phi thi sap xep theo ten thanh pho

SELECT *
FROM building
ORDER BY cost ASC, city ASC;

-- EXERCISE 04
-- CAC CAU LENH TRUY VAN CO DIEU KIEN


-- 1. Hien thi thong tin kien truc su "le thanh tung"

SELECT *
FROM architect
WHERE name = 'le thanh tung';

-- 2. Hien thi ten va nam sinh cong nhan chuyen mon han hoac dien

SELECT name, birthday
FROM worker
WHERE skill = 'han'
OR skill = 'dien';

-- 3. Hien thi cong nhan chuyen mon han hoac dien
-- va co nam sinh lon hon 1948

SELECT name
FROM worker
WHERE (skill = 'han' OR skill = 'dien')
AND birthday > 1948;

-- 4. Hien thi cong nhan vao nghe truoc 20 tuoi

SELECT *
FROM worker
WHERE birthday + 20 > year;

-- 5. Tim cong nhan sinh nam 1945, 1940, 1948
-- Cach 1: Dung OR

SELECT *
FROM worker
WHERE birthday = 1945
OR birthday = 1940
OR birthday = 1948;

-- 5. Tim cong nhan sinh nam 1945, 1940, 1948
-- Cach 2: Dung IN

SELECT *
FROM worker
WHERE birthday IN (1945, 1940, 1948);

-- 6. Tim cong trinh co chi phi tu 200 den 500
-- Cach 1: Dung AND

SELECT *
FROM building
WHERE cost >= 200
AND cost <= 500;

-- 6. Tim cong trinh co chi phi tu 200 den 500
-- Cach 2: Dung BETWEEN

SELECT *
FROM building
WHERE cost BETWEEN 200 AND 500;

-- 7. Tim kien truc su co ho "nguyen"

SELECT *
FROM architect
WHERE name LIKE 'nguyen%';

-- 8. Tim kien truc su co ten dem la "anh"

SELECT *
FROM architect
WHERE name LIKE '% anh %';

-- 9. Tim kien truc su co ten bat dau bang "th"
-- va co 3 ky tu

SELECT *
FROM architect
WHERE name LIKE 'th_';

-- 10. Tim chu thau khong co phone

SELECT *
FROM contractor
WHERE phone IS NULL;
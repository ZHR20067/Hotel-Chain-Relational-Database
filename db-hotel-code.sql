#Hotel database project by 
# Ezhar - Sarah - aisha - rahaf - ghala
# class 6 




DROP TABLE IF EXISTS BOOKING;
DROP TABLE IF EXISTS CUSTOMER_Phone;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS SERVICE;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS BRANCH;

CREATE TABLE BRANCH (
Branch_ID INT PRIMARY KEY,
Branch_name VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL, 
Street VARCHAR(50) , 
State VARCHAR(50) , 
ZIP_code VARCHAR(50) , 
Opening_year INT
); 

CREATE TABLE EMPLOYEE (
Employee_ID INT PRIMARY KEY,
Employee_name VARCHAR(100),
Position VARCHAR(50), 
Salary DECIMAL(10,2),
Branch_ID INT,
FOREIGN KEY (Branch_ID) REFERENCES BRANCH(Branch_ID)
);

CREATE TABLE SERVICE (
Service_ID INT PRIMARY KEY,
Service_name VARCHAR(100),
Price DECIMAL(10,2),
DurationMinutes INT,
Branch_ID INT,
FOREIGN KEY (Branch_ID) REFERENCES BRANCH(Branch_ID)
);

CREATE TABLE CUSTOMER (
National_ID INT PRIMARY KEY, 
First_name VARCHAR(20) NOT NULL,
Last_name VARCHAR(20) NOT NULL,
Email VARCHAR(100) NOT NULL, 
City VARCHAR(50), 
Street VARCHAR(50), 
State VARCHAR(50), 
ZIP_code VARCHAR(50) 
); 

CREATE TABLE CUSTOMER_Phone (  
National_ID INT,  
Phone VARCHAR(15),
PRIMARY KEY (National_ID, Phone),
FOREIGN KEY (National_ID) REFERENCES CUSTOMER(National_ID)
);

CREATE TABLE BOOKING (
Booking_ID INT PRIMARY KEY,
Room_number INT,
Check_In_Date DATE,
Check_Out_Date DATE,
Branch_ID INT,
National_ID INT, 
FOREIGN KEY (Branch_ID) REFERENCES BRANCH(Branch_ID),
FOREIGN KEY (National_ID) REFERENCES CUSTOMER(National_ID)
);

INSERT INTO BRANCH (Branch_ID, Branch_name, City, Street, State, ZIP_code, Opening_year)
VALUES 
(1, 'Abha Central', 'Abha', 'Main St', 'Asir', '61421', 2018),
(2, 'Riyadh North', 'Riyadh', 'King Fahd Rd', 'Riyadh', '11564', 2015),
(3, 'Jeddah Corniche', 'Jeddah', 'Corniche Rd', 'Makkah', '21442', 2017),
(4, 'Dammam Beach', 'Dammam', 'Beach Rd', 'Eastern', '32415', 2019),
(5, 'Makkah Haram', 'Makkah', 'Al Haram St', 'Makkah', '24231', 2014),
(6, 'Madinah Quba', 'Madinah', 'Quba Rd', 'Madinah', '42334', 2016),
(7, 'Taif Shafa', 'Taif', 'Al Shafa Rd', 'Makkah', '26513', 2020),
(8, 'Tabuk Sultan', 'Tabuk', 'Prince Sultan Rd', 'Tabuk', '47913', 2018),
(9, 'Buraidah Olaya', 'Buraidah', 'Olaya St', 'Qassim', '51432', 2017),
(10, 'Khamis Central', 'Khamis Mushait', 'King Abdullah St', 'Asir', '61961', 2019);

INSERT INTO EMPLOYEE (Employee_ID, Employee_name, Position, Salary, Branch_ID)
VALUES
 (101, 'Sara', 'Receptionist', 5000, 1),
(102, 'Omar', 'Manager', 8000, 2),
(103, 'Noura', 'Housekeeper', 3500, 3),
(104, 'Faisal', 'Chef', 6000, 4),
(105, 'Lina', 'Concierge', 4200, 5),
(106, 'Khalid', 'Security', 3800, 6),
(107, 'Rana', 'Accountant', 5500, 7),
(108, 'Turki', 'Bellboy', 3200, 8),
(109, 'Aisha', 'Waiter', 3400, 9),
(110, 'Majed', 'Maintenance', 3600, 10);

INSERT INTO SERVICE (Service_ID, Service_name, Price, DurationMinutes, Branch_ID)
VALUES
 (201, 'Room Cleaning', 100, 30, 1),
(202, 'Laundry', 80, 60, 2),
(203, 'Breakfast Buffet', 60, 120, 3),
(204, 'Spa Access', 150, 90, 4),
(205, 'Airport Transfer', 120, 45, 5),
(206, 'Room Service', 40, 20, 6),
(207, 'Gym Access', 50, 1440, 7),
(208, 'Parking', 30, 1440, 8),
(209, 'WiFi Premium', 20, 1440, 9),
(210, 'Late Checkout', 70, 180, 10);

INSERT INTO CUSTOMER (National_ID, First_name, Last_name, Email, City, Street, State, ZIP_code)
VALUES 
(1012345678, 'Ahmed', 'Al-Dosari', 'ahmed.aldosari@email.com', 'Abha', 'Main St', 'Asir', '61421'),
(1023456789, 'Fatima', 'Al-Qahtani', 'fatima.alqahtani@email.com', 'Riyadh', 'King Fahd Rd', 'Riyadh', '11564'),
(1034567890, 'Mohammed', 'Al-Otaibi', 'm.alotaibi@email.com', 'Jeddah', 'Corniche Rd', 'Makkah', '21442'),
(1045678901, 'Aisha', 'Al-Ghamdi', 'aisha.alghamdi@email.com', 'Dammam', 'Beach Rd', 'Eastern', '32415'),
(1056789012, 'Omar', 'Al-Zahrani', 'omar.alzahrani@email.com', 'Makkah', 'Al Haram St', 'Makkah', '24231'),
(1067890123, 'Noura', 'Al-Shehri', 'noura.alshehri@email.com', 'Madinah', 'Quba Rd', 'Madinah', '42334'),
(1078901234, 'Faisal', 'Al-Harbi', 'faisal.alharbi@email.com', 'Taif', 'Al Shafa Rd', 'Makkah', '26513'),
(1089012345, 'Lina', 'Al-Anzi', 'lina.alanzi@email.com', 'Tabuk', 'Prince Sultan Rd', 'Tabuk', '47913'),
(1090123456, 'Khalid', 'Al-Mutairi', 'k.almutairee@email.com', 'Buraidah', 'Olaya St', 'Qassim', '51432'),
(1101234567, 'Rana', 'Al-Balawi', 'rana.albalawi@email.com', 'Khamis Mushait', 'King Abdullah St', 'Asir', '61961');

INSERT INTO CUSTOMER_Phone (National_ID, Phone) 
VALUES
 (1012345678, '0501234567'), 
(1012345678, '0559876543'),  
(1023456789, '0561112222'),  
(1023456789, '0582223333'),  
(1034567890, '0543334444'),  
(1034567890, '0574445555'); 

INSERT INTO BOOKING (Booking_ID, Room_number, Check_In_Date, Check_Out_Date, Branch_ID, National_ID)
VALUES
 (401, 101, '2025-11-01', '2025-11-05', 1, 1012345678),
(402, 102, '2025-11-10', '2025-11-12', 2, 1023456789),
(403, 103, '2025-12-01', '2025-12-07', 3, 1034567890),
(404, 104, '2025-12-15', '2025-12-18', 4, 1045678901),
(405, 105, '2026-01-05', '2026-01-10', 5, 1056789012),
(406, 106, '2026-01-20', '2026-01-22', 6, 1067890123),
(407, 107, '2026-02-01', '2026-02-06', 7, 1078901234),
(408, 108, '2026-02-14', '2026-02-16', 8, 1089012345),
(409, 109, '2026-03-01', '2026-03-05', 9, 1090123456),
(410, 110, '2026-03-10', '2026-03-15', 10, 1101234567);

SELECT * FROM EMPLOYEE; 
SELECT * FROM SERVICE; 
SELECT * FROM BOOKING; 

ALTER TABLE BOOKING ADD COLUMN Booking_Type VARCHAR(50);
ALTER TABLE BRANCH RENAME COLUMN ZIP_code TO Postal_Code;
ALTER TABLE CUSTOMER RENAME COLUMN ZIP_code TO Postal_Code;
SELECT * FROM BRANCH; 

UPDATE BOOKING SET Booking_Type = 'VIP' WHERE Booking_ID = 401;
UPDATE CUSTOMER SET Email = 'email00new@gmail.com' WHERE National_ID = 1012345678;
SELECT * FROM CUSTOMER; 
UPDATE SERVICE SET Price = 350 WHERE Service_ID = 201; 

DELETE FROM BOOKING WHERE Booking_ID = 409;
DELETE FROM SERVICE WHERE Service_ID = 210;  

SELECT 
    b.Booking_Type,
    COUNT(*) AS Total_Bookings
FROM BOOKING b
WHERE b.Booking_Type IS NOT NULL  
GROUP BY b.Booking_Type
ORDER BY Total_Bookings DESC;

SELECT * FROM SERVICE ORDER BY Price DESC;

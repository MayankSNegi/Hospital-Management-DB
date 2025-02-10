create database mini_project;
use mini_project;
CREATE TABLE Patient (
    P_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Mob_No VARCHAR(15),
    Age INT
);
INSERT INTO Patient (P_ID, Name, DOB, Gender, Mob_No, Age)
VALUES 
    (1, 'Mayank', '2005-01-29', 'Male', '9876543210', 20),
    (2, 'Anshul', '2004-10-21', 'Male', '8765432109', 21),
    (3, 'Divyansh', '2005-02-05', 'Male', '7654321098', 20);
CREATE TABLE Employee (
    E_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary FLOAT,
    Sex VARCHAR(10),
    Mob_No VARCHAR(15),
    Address VARCHAR(100),
    State VARCHAR(50),
    City VARCHAR(50),
    Pin_No VARCHAR(10)
);
INSERT INTO Employee (E_ID, Name, Salary, Sex, Mob_No, Address, State, City, Pin_No)
VALUES 
    (101, 'Dr. Mayank', 90000, 'Female', '9988776655', 'NIT', 'Faridabad', 'Haryana', '121001'),
    (102, 'Dr. Anshul', 120000, 'Male', '8877665544', 'Sec 1', 'Ballabgarh', 'Haryana', '121001'),
    (103, 'Divyansh', 50000, 'Male', '7766554433', 'Sec 23', 'Faridabad', 'Haryana', '121001');
CREATE TABLE Doctor (
    E_ID INT PRIMARY KEY,
    Department VARCHAR(50),
    Qualification VARCHAR(50),
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);
INSERT INTO Doctor (E_ID, Department, Qualification)
VALUES 
    (101, 'Cardiology', 'MBBS, MD'),
    (102, 'Orthopedics', 'MBBS, MS');
CREATE TABLE Nurse (
    E_ID INT PRIMARY KEY,
    Assigned_Rooms VARCHAR(20),
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);
INSERT INTO Nurse (E_ID, Assigned_Rooms)
VALUES 
    (103, '101, 102');
CREATE TABLE Room (
    R_ID VARCHAR(10) PRIMARY KEY,
    Type VARCHAR(20),
    Capacity INT,
    Availability BOOLEAN
);
INSERT INTO Room (R_ID, Type, Capacity, Availability)
VALUES 
    ('R001', 'Private', 1, TRUE),
    ('R002', 'General', 4, TRUE);
CREATE TABLE Receptionist (
    E_ID INT PRIMARY KEY,
    FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);
INSERT INTO Receptionist (E_ID)
VALUES (103);
CREATE TABLE Test_Report (
    R_ID VARCHAR(10) PRIMARY KEY,
    P_ID INT,
    Test_Type VARCHAR(50),
    Result VARCHAR(100),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);
INSERT INTO Test_Report (R_ID, P_ID, Test_Type, Result)
VALUES 
    ('T001', 1, 'Blood Test', 'Normal'),
    ('T002', 2, 'X-Ray', 'Fracture Detected'),
    ('T003', 3, 'CT Scan', 'Clear');
CREATE TABLE Bill (
    B_ID VARCHAR(10) PRIMARY KEY,
    P_ID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);
INSERT INTO Bill (B_ID, P_ID, Amount)
VALUES 
    ('B001', 1, 2000),
    ('B002', 2, 5000),
    ('B003', 3, 1500);
CREATE TABLE Records (
    Record_No VARCHAR(10) PRIMARY KEY,
    App_No VARCHAR(10)
);
INSERT INTO Records (Record_No, App_No)
VALUES 
    ('R1001', 'A2001'),
    ('R1002', 'A2002');
CREATE TABLE Patient_Doctor (
    P_ID INT,
    E_ID INT,
    PRIMARY KEY (P_ID, E_ID),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (E_ID) REFERENCES Doctor(E_ID)
);
INSERT INTO Patient_Doctor (P_ID, E_ID)
VALUES 
    (1, 101),
    (2, 102),
    (3, 101);
CREATE TABLE Nurse_Room (
    E_ID INT,
    R_ID VARCHAR(10),
    PRIMARY KEY (E_ID, R_ID),
    FOREIGN KEY (E_ID) REFERENCES Nurse(E_ID),
    FOREIGN KEY (R_ID) REFERENCES Room(R_ID)
);
INSERT INTO Nurse_Room (E_ID, R_ID)
VALUES 
    (103, 'R001'),
    (103, 'R002');
CREATE TABLE Receptionist_Records (
    E_ID INT,
    Record_No VARCHAR(10),
    PRIMARY KEY (E_ID, Record_No),
    FOREIGN KEY (E_ID) REFERENCES Receptionist(E_ID),
    FOREIGN KEY (Record_No) REFERENCES Records(Record_No)
);
INSERT INTO Receptionist_Records (E_ID, Record_No)
VALUES 
    (103, 'R1001'),
    (103, 'R1002');
CREATE TABLE Patient_Bill (
    P_ID INT,
    B_ID VARCHAR(10),
    Amount DECIMAL(10, 2),
    PRIMARY KEY (P_ID, B_ID),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (B_ID) REFERENCES Bill(B_ID)
);
INSERT INTO Patient_Bill (P_ID, B_ID, Amount)
VALUES 
    (1, 'B001', 2000),
    (2, 'B002', 5000),
    (3, 'B003', 1500);
CREATE TABLE Patient_Test_Report (
    P_ID INT,
    R_ID VARCHAR(10),
    PRIMARY KEY (P_ID, R_ID),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (R_ID) REFERENCES Test_Report(R_ID)
);
INSERT INTO Patient_Test_Report (P_ID, R_ID)
VALUES 
    (1, 'T001'),
    (2, 'T002'),
    (3, 'T003');

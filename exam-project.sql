----->Create a database

CREATE DATABASE hospital_management;

USE hospital_management;

---->Create the Patients table

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    gender VARCHAR(20),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255),
    registration_date DATE
);



INSERT INTO Patients
(name, dob, gender, phone_number, email, address, registration_date)
VALUES
('Aarav Shah', '2000-05-15', 'Male', '9876543210',
 'aarav@gmail.com', 'Surat', '2025-01-10'),

('Diya Patel', '1998-08-20', 'Female', '9876543211',
 'diya@gmail.com', 'Ahmedabad', '2025-03-15'),

('Rohan Mehta', '1985-11-12', 'Male', '9876543212',
 'rohan@gmail.com', 'Vadodara', '2024-06-20'),

('Priya Desai', '2002-02-25', 'Female', '9876543213',
 'priya@gmail.com', 'Rajkot', '2026-02-05'),

('Karan Joshi', '1975-07-08', 'Male', '9876543214',
 'karan@gmail.com', 'Surat', '2025-07-12'),

('Neha Trivedi', '1995-09-18', 'Female', '9876543215',
 'neha@gmail.com', 'Navsari', '2026-04-10');


------>Create the Doctors table

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    available_days VARCHAR(100),
    consultation_fee DECIMAL(10,2),
    years_of_experience INT
);


INSERT INTO Doctors
(name, specialization, phone_number, email,
 available_days, consultation_fee, years_of_experience)
VALUES
('Dr. Amit Sharma', 'Cardiology', '9000000001',
 'amit@hospital.com', 'Monday, Wednesday, Friday', 1500.00, 20),

('Dr. Sneha Rao', 'Neurology', '9000000002',
 'sneha@hospital.com', 'Tuesday, Thursday', 2000.00, 12),

('Dr. Raj Malhotra', 'Dermatology', '9000000003',
 'raj@hospital.com', 'Monday, Tuesday, Saturday', 1200.00, 8),

('Dr. Pooja Shah', 'Orthopedics', '9000000004',
 'pooja@hospital.com', 'Wednesday, Friday', 1800.00, 4),

('Dr. Kunal Mehta', 'Cardiology', '9000000005',
 'kunal@hospital.com', 'Tuesday, Thursday, Saturday', 1000.00, 2),

('Dr. Nisha Patel', 'General Medicine', '9000000006',
 'nisha@hospital.com', 'Monday, Friday', 800.00, 16);


---->Create the Departments table.


CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);


USE hospital_management;

INSERT INTO Departments (department_name)
VALUES
('Cardiology'),
('Neurology'),
('Dermatology'),
('Orthopedics'),
('General Medicine');





--->Create the Appointments table with Primary Key and Foreign Keys


CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id)
);


INSERT INTO Appointments
(patient_id, doctor_id, appointment_date, status)
VALUES
(1, 1, '2026-01-10', 'Completed'),
(2, 2, '2026-02-15', 'Completed'),
(3, 3, '2026-03-20', 'Completed'),
(4, 4, '2026-05-12', 'Scheduled'),
(5, 1, '2026-06-18', 'Completed'),
(6, 5, '2026-07-25', 'Scheduled'),
(1, 3, '2025-01-10', 'Cancelled'),
(2, 6, '2026-08-15', 'Completed'),
(3, 2, '2026-09-05', 'Scheduled'),
(4, 1, '2026-09-20', 'Completed');


---->Create the Medical_Records table.

CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    diagnosis VARCHAR(255),
    prescription TEXT,
    treatment_date DATE,
    admission_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id)
);


INSERT INTO Medical_Records
(patient_id, doctor_id, diagnosis, prescription,
 treatment_date, admission_date, discharge_date)
VALUES
(1, 1, 'Heart Checkup', 'Prescribed medicines',
 '2026-01-10', '2026-01-09', '2026-01-12'),

(2, 2, 'Migraine', 'Pain relief medicine',
 '2026-02-15', '2026-02-14', '2026-02-16'),

(3, 3, 'Skin Allergy', 'Antiallergic medicine',
 '2026-03-20', '2026-03-20', '2026-03-22'),

(4, 4, 'Bone Pain', 'Pain management',
 '2026-05-12', '2026-05-11', '2026-05-15'),

(5, 1, 'Blood Pressure', 'BP monitoring',
 '2026-06-18', '2026-06-18', '2026-06-20'),

(6, 5, 'Heart Checkup', 'Routine checkup',
 '2026-07-25', '2026-07-25', '2026-07-26'),

(2, 6, 'General Fever', 'Rest and fluids',
 '2026-08-15', '2026-08-15', '2026-08-16'),

(4, 1, 'Heart Consultation', 'Follow-up treatment',
 '2026-09-20', '2026-09-19', '2026-09-21');



----->Create the Billing table.

CREATE TABLE Billing (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_status ENUM('Paid', 'Pending', 'Cancelled'),
    payment_date DATE,
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id)
        REFERENCES Appointments(appointment_id)
);


INSERT INTO Billing
(patient_id, appointment_id, amount, payment_status, payment_date)
VALUES
(1, 1, 5000.00, 'Paid', '2026-01-10'),
(2, 2, 8000.00, 'Paid', '2026-02-15'),
(3, 3, 2500.00, 'Pending', NULL),
(4, 4, 4000.00, 'Pending', NULL),
(5, 5, 12000.00, 'Paid', '2026-06-18'),
(6, 6, 3500.00, 'Paid', '2026-07-25'),
(2, 8, 1500.00, 'Paid', '2026-08-15'),
(4, 10, 6000.00, 'Pending', NULL);


----->Create the Doctor_Department mapping table.


CREATE TABLE Doctor_Department (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id),
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);


INSERT INTO Doctor_Department (doctor_id, department_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 1),
(6, 5);



------>Display all tables

SHOW TABLES;

+-------------------------------+
| Tables_in_hospital_management |
+-------------------------------+
| appointments                  |
| billing                       |
| departments                   |
| doctor_department             |
| doctors                       |
| medical_records               |
| patients                      |
+-------------------------------+

=====================================================================================
------>CRUD Operations

----->Insert a new patient into the database.


INSERT INTO Patients
(name, dob, gender, phone_number, email, address, registration_date)
VALUES
('Rahul Verma', '1999-04-12', 'Male', '9000000010',
 'rahul@gmail.com', 'Surat', '2026-10-01');


---->Insert a new doctor into the database.

INSERT INTO Doctors
(name, specialization, phone_number, email,
 available_days, consultation_fee, years_of_experience)
VALUES
('Dr. Meera Joshi', 'Neurology', '9000000011',
 'meera@hospital.com', 'Monday, Friday', 1600.00, 6);

------>Insert a new appointment into the database.


INSERT INTO Appointments
(patient_id, doctor_id, appointment_date, status)
VALUES
(7, 7, '2026-10-15', 'Scheduled');


---->Update a patient's address.


UPDATE Patients
SET address = 'Mumbai'
WHERE patient_id = 1;


---->Updated value check

SELECT patient_id, name, address
FROM Patients
WHERE patient_id = 1;


----->Delete cancelled appointments older than six months.


DELETE FROM Appointments
WHERE status = 'Cancelled'
AND appointment_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);


----->Verify the final records in all tables.


SELECT * FROM Patients;

+------------+--------------+------------+--------+--------------+-----------------+-----------+-------------------+
| patient_id | name         | dob        | gender | phone_number | email           | address   | registration_date |
+------------+--------------+------------+--------+--------------+-----------------+-----------+-------------------+
|          1 | Aarav Shah   | 2000-05-15 | Male   | 9876543210   | aarav@gmail.com | Surat     | 2025-01-10        |
|          2 | Diya Patel   | 1998-08-20 | Female | 9876543211   | diya@gmail.com  | Ahmedabad | 2025-03-15        |
|          3 | Rohan Mehta  | 1985-11-12 | Male   | 9876543212   | rohan@gmail.com | Vadodara  | 2024-06-20        |
|          4 | Priya Desai  | 2002-02-25 | Female | 9876543213   | priya@gmail.com | Rajkot    | 2026-02-05        |
|          5 | Karan Joshi  | 1975-07-08 | Male   | 9876543214   | karan@gmail.com | Surat     | 2025-07-12        |
|          6 | Neha Trivedi | 1995-09-18 | Female | 9876543215   | neha@gmail.com  | Navsari   | 2026-04-10        |
+------------+--------------+------------+--------+--------------+-----------------+-----------+-------------------+




SELECT * FROM Doctors;
+-----------+------------------+------------------+--------------+--------------------+-----------------------------+------------------+---------------------+
| doctor_id | name             | specialization   | phone_number | email              | available_days              | consultation_fee | years_of_experience |
+-----------+------------------+------------------+--------------+--------------------+-----------------------------+------------------+---------------------+
|         1 | Dr. Amit Sharma  | Cardiology       | 9000000001   | amit@hospital.com  | Monday, Wednesday, Friday   |          1500.00 |                  20 |
|         2 | Dr. Sneha Rao    | Neurology        | 9000000002   | sneha@hospital.com | Tuesday, Thursday           |          2000.00 |                  12 |
|         3 | Dr. Raj Malhotra | Dermatology      | 9000000003   | raj@hospital.com   | Monday, Tuesday, Saturday   |          1200.00 |                   8 |
|         4 | Dr. Pooja Shah   | Orthopedics      | 9000000004   | pooja@hospital.com | Wednesday, Friday           |          1800.00 |                   4 |
|         5 | Dr. Kunal Mehta  | Cardiology       | 9000000005   | kunal@hospital.com | Tuesday, Thursday, Saturday |          1000.00 |                   2 |
|         6 | Dr. Nisha Patel  | General Medicine | 9000000006   | nisha@hospital.com | Monday, Friday              |           800.00 |                  16 |
|         7 | Dr. Meera Joshi  | Neurology        | 9000000011   | meera@hospital.com | Monday, Friday              |          1600.00 |                   6 |
+-----------+------------------+------------------+--------------+--------------------+-----------------------------+------------------+---------------------+

SELECT * FROM Appointments;
+----------------+------------+-----------+------------------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | status    |
+----------------+------------+-----------+------------------+-----------+
|              1 |          1 |         1 | 2026-01-10       | Completed |
|              2 |          2 |         2 | 2026-02-15       | Completed |
|              3 |          3 |         3 | 2026-03-20       | Completed |
|              4 |          4 |         4 | 2026-05-12       | Scheduled |
|              5 |          5 |         1 | 2026-06-18       | Completed |
|              6 |          6 |         5 | 2026-07-25       | Scheduled |
|              8 |          2 |         6 | 2026-08-15       | Completed |
|              9 |          3 |         2 | 2026-09-05       | Scheduled |
|             10 |          4 |         1 | 2026-09-20       | Completed |
|             11 |          7 |         7 | 2026-10-15       | Scheduled |
+----------------+------------+-----------+------------------+-----------+

SELECT * FROM Medical_Records;
+-----------+------------+-----------+--------------------+-----------------------+----------------+----------------+----------------+
| record_id | patient_id | doctor_id | diagnosis          | prescription          | treatment_date | admission_date | discharge_date |
+-----------+------------+-----------+--------------------+-----------------------+----------------+----------------+----------------+
|         1 |          1 |         1 | Heart Checkup      | Prescribed medicines  | 2026-01-10     | 2026-01-09     | 2026-01-12     |
|         2 |          2 |         2 | Migraine           | Pain relief medicine  | 2026-02-15     | 2026-02-14     | 2026-02-16     |
|         3 |          3 |         3 | Skin Allergy       | Antiallergic medicine | 2026-03-20     | 2026-03-20     | 2026-03-22     |
|         4 |          4 |         4 | Bone Pain          | Pain management       | 2026-05-12     | 2026-05-11     | 2026-05-15     |
|         5 |          5 |         1 | Blood Pressure     | BP monitoring         | 2026-06-18     | 2026-06-18     | 2026-06-20     |
|         6 |          6 |         5 | Heart Checkup      | Routine checkup       | 2026-07-25     | 2026-07-25     | 2026-07-26     |
|         7 |          2 |         6 | General Fever      | Rest and fluids       | 2026-08-15     | 2026-08-15     | 2026-08-16     |
|         8 |          4 |         1 | Heart Consultation | Follow-up treatment   | 2026-09-20     | 2026-09-19     | 2026-09-21     |
+-----------+------------+-----------+--------------------+-----------------------+----------------+----------------+----------------+

SELECT * FROM Billing;
+------------+------------+----------------+----------+----------------+--------------+
| invoice_id | patient_id | appointment_id | amount   | payment_status | payment_date |
+------------+------------+----------------+----------+----------------+--------------+
|          1 |          1 |              1 |  5000.00 | Paid           | 2026-01-10   |
|          2 |          2 |              2 |  8000.00 | Paid           | 2026-02-15   |
|          3 |          3 |              3 |  2500.00 | Pending        | NULL         |
|          4 |          4 |              4 |  4000.00 | Pending        | NULL         |
|          5 |          5 |              5 | 12000.00 | Paid           | 2026-06-18   |
|          6 |          6 |              6 |  3500.00 | Paid           | 2026-07-25   |
|          7 |          2 |              8 |  1500.00 | Paid           | 2026-08-15   |
|          8 |          4 |             10 |  6000.00 | Pending        | NULL         |
+------------+------------+----------------+----------+----------------+--------------+

SELECT * FROM Departments;
+---------------+------------------+
| department_id | department_name  |
+---------------+------------------+
|             1 | Cardiology       |
|             2 | Neurology        |
|             3 | Dermatology      |
|             4 | Orthopedics      |
|             5 | General Medicine |
+---------------+------------------+

SELECT * FROM Doctor_Department;
+-----------+---------------+
| doctor_id | department_id |
+-----------+---------------+
|         1 |             1 |
|         5 |             1 |
|         2 |             2 |
|         3 |             3 |
|         4 |             4 |
|         6 |             5 |
+-----------+---------------+

========================================================================================

------>Display patients who registered during the previous calendar year.

SELECT patient_id, name, registration_date
FROM Patients
WHERE registration_date >= MAKEDATE(YEAR(CURDATE()) - 1, 1)
  AND registration_date < MAKEDATE(YEAR(CURDATE()), 1);
+------------+-------------+-------------------+
| patient_id | name        | registration_date |
+------------+-------------+-------------------+
|          1 | Aarav Shah  | 2025-01-10        |
|          2 | Diya Patel  | 2025-03-15        |
|          5 | Karan Joshi | 2025-07-12        |
+------------+-------------+-------------------+

------->Display the top 5 patients with the highest billing amounts


SELECT p.patient_id, p.name, SUM(b.amount) AS total_billing
FROM Patients p
JOIN Billing b ON p.patient_id = b.patient_id
GROUP BY p.patient_id, p.name
ORDER BY total_billing DESC
LIMIT 5;
+------------+--------------+---------------+
| patient_id | name         | total_billing |
+------------+--------------+---------------+
|          5 | Karan Joshi  |      12000.00 |
|          4 | Priya Desai  |      10000.00 |
|          2 | Diya Patel   |       9500.00 |
|          1 | Aarav Shah   |       5000.00 |
|          6 | Neha Trivedi |       3500.00 |
+------------+--------------+---------------+

------>Display doctors whose consultation fee is greater than ₹1,000.


SELECT doctor_id, name, specialization, consultation_fee
FROM Doctors
WHERE consultation_fee > 1000;
+-----------+------------------+----------------+------------------+
| doctor_id | name             | specialization | consultation_fee |
+-----------+------------------+----------------+------------------+
|         1 | Dr. Amit Sharma  | Cardiology     |          1500.00 |
|         2 | Dr. Sneha Rao    | Neurology      |          2000.00 |
|         3 | Dr. Raj Malhotra | Dermatology    |          1200.00 |
|         4 | Dr. Pooja Shah   | Orthopedics    |          1800.00 |
|         7 | Dr. Meera Joshi  | Neurology      |          1600.00 |
+-----------+------------------+----------------+------------------+

----->Display appointments that are completed AND belong to patient 1.


SELECT appointment_id, patient_id, doctor_id,
       appointment_date, status
FROM Appointments
WHERE status = 'Completed'
AND patient_id = 1;
+----------------+------------+-----------+------------------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | status    |
+----------------+------------+-----------+------------------+-----------+
|              1 |          1 |         1 | 2026-01-10       | Completed |
+----------------+------------+-----------+------------------+-----------+

------>Display appointments that are either Scheduled OR Cancelled.


SELECT appointment_id, patient_id, appointment_date, status
FROM Appointments
WHERE status = 'Scheduled'
OR status = 'Cancelled';
+----------------+------------+------------------+-----------+
| appointment_id | patient_id | appointment_date | status    |
+----------------+------------+------------------+-----------+
|              4 |          4 | 2026-05-12       | Scheduled |
|              6 |          6 | 2026-07-25       | Scheduled |
|              9 |          3 | 2026-09-05       | Scheduled |
|             11 |          7 | 2026-10-15       | Scheduled |
+----------------+------------+------------------+-----------+

------>Display appointments that are NOT Cancelled.


SELECT appointment_id, patient_id, appointment_date, status
FROM Appointments
WHERE NOT status = 'Cancelled';
+----------------+------------+------------------+-----------+
| appointment_id | patient_id | appointment_date | status    |
+----------------+------------+------------------+-----------+
|              1 |          1 | 2026-01-10       | Completed |
|              2 |          2 | 2026-02-15       | Completed |
|              3 |          3 | 2026-03-20       | Completed |
|              4 |          4 | 2026-05-12       | Scheduled |
|              5 |          5 | 2026-06-18       | Completed |
|              6 |          6 | 2026-07-25       | Scheduled |
|              8 |          2 | 2026-08-15       | Completed |
|              9 |          3 | 2026-09-05       | Scheduled |
|             10 |          4 | 2026-09-20       | Completed |
|             11 |          7 | 2026-10-15       | Scheduled |
+----------------+------------+------------------+-----------+

----->Display doctors whose consultation fee is greater than ₹1,000 and experience is more than 5 years.


SELECT name, consultation_fee, years_of_experience
FROM Doctors
WHERE consultation_fee > 1000
AND years_of_experience > 5;
+------------------+------------------+---------------------+
| name             | consultation_fee | years_of_experience |
+------------------+------------------+---------------------+
| Dr. Amit Sharma  |          1500.00 |                  20 |
| Dr. Sneha Rao    |          2000.00 |                  12 |
| Dr. Raj Malhotra |          1200.00 |                   8 |
| Dr. Meera Joshi  |          1600.00 |                   6 |
+------------------+------------------+---------------------+

------->Display departments having more than one doctor.


SELECT d.department_name,
       COUNT(dd.doctor_id) AS total_doctors
FROM Departments d
JOIN Doctor_Department dd
    ON d.department_id = dd.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(dd.doctor_id) > 1;
+-----------------+---------------+
| department_name | total_doctors |
+-----------------+---------------+
| Cardiology      |             2 |
+-----------------+---------------+

------>Display the first 3 doctors in descending order of consultation fees.


SELECT name, specialization, consultation_fee
FROM Doctors
ORDER BY consultation_fee DESC
LIMIT 3;
+-----------------+----------------+------------------+
| name            | specialization | consultation_fee |
+-----------------+----------------+------------------+
| Dr. Sneha Rao   | Neurology      |          2000.00 |
| Dr. Pooja Shah  | Orthopedics    |          1800.00 |
| Dr. Meera Joshi | Neurology      |          1600.00 |
+-----------------+----------------+------------------+

===================================================================================

------->Display all doctors in ascending order of their names.


SELECT doctor_id, name, specialization
FROM Doctors
ORDER BY name ASC;
+-----------+------------------+------------------+
| doctor_id | name             | specialization   |
+-----------+------------------+------------------+
|         1 | Dr. Amit Sharma  | Cardiology       |
|         5 | Dr. Kunal Mehta  | Cardiology       |
|         7 | Dr. Meera Joshi  | Neurology        |
|         6 | Dr. Nisha Patel  | General Medicine |
|         4 | Dr. Pooja Shah   | Orthopedics      |
|         3 | Dr. Raj Malhotra | Dermatology      |
|         2 | Dr. Sneha Rao    | Neurology        |
+-----------+------------------+------------------+


------->Display all doctors in descending order of consultation fees.


SELECT name, specialization, consultation_fee
FROM Doctors
ORDER BY consultation_fee DESC;
+------------------+------------------+------------------+
| name             | specialization   | consultation_fee |
+------------------+------------------+------------------+
| Dr. Sneha Rao    | Neurology        |          2000.00 |
| Dr. Pooja Shah   | Orthopedics      |          1800.00 |
| Dr. Meera Joshi  | Neurology        |          1600.00 |
| Dr. Amit Sharma  | Cardiology       |          1500.00 |
| Dr. Raj Malhotra | Dermatology      |          1200.00 |
| Dr. Kunal Mehta  | Cardiology       |          1000.00 |
| Dr. Nisha Patel  | General Medicine |           800.00 |
+------------------+------------------+------------------+

-------> count the total number of patients in the hospital.

SELECT COUNT(*) AS total_patients
FROM Patients;
+----------------+
| total_patients |
+----------------+
|              7 |
+----------------+

------->Count the total number of appointments for each doctor.


SELECT d.name,
       COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name
ORDER BY total_appointments DESC;
+------------------+--------------------+
| name             | total_appointments |
+------------------+--------------------+
| Dr. Amit Sharma  |                  3 |
| Dr. Sneha Rao    |                  2 |
| Dr. Raj Malhotra |                  1 |
| Dr. Pooja Shah   |                  1 |
| Dr. Kunal Mehta  |                  1 |
| Dr. Nisha Patel  |                  1 |
| Dr. Meera Joshi  |                  1 |
+------------------+--------------------+


------->Calculate the total revenue generated by the hospital.


SELECT SUM(amount) AS total_revenue
FROM Billing;
+---------------+
| total_revenue |
+---------------+
|      42500.00 |
+---------------+


------->Calculate the average billing amount.

SELECT AVG(amount) AS average_billing
FROM Billing;
+-----------------+
| average_billing |
+-----------------+
|     5312.500000 |
+-----------------+

----->Find the maximum and minimum billing amounts.


SELECT
    MAX(amount) AS highest_bill,
    MIN(amount) AS lowest_bill
FROM Billing;
+--------------+-------------+
| highest_bill | lowest_bill |
+--------------+-------------+
|     12000.00 |     1500.00 |
+--------------+-------------+

------->Count the number of doctors in each department.


SELECT dep.department_name,
       COUNT(dd.doctor_id) AS total_doctors
FROM Departments dep
LEFT JOIN Doctor_Department dd
    ON dep.department_id = dd.department_id
GROUP BY dep.department_id, dep.department_name
ORDER BY total_doctors DESC;
+------------------+---------------+
| department_name  | total_doctors |
+------------------+---------------+
| Cardiology       |             2 |
| Neurology        |             1 |
| Dermatology      |             1 |
| Orthopedics      |             1 |
| General Medicine |             1 |
+------------------+---------------+


------->Calculate total billing amount for each patient.

SELECT p.patient_id, p.name,
       SUM(b.amount) AS total_billing
FROM Patients p
LEFT JOIN Billing b
    ON p.patient_id = b.patient_id
GROUP BY p.patient_id, p.name
ORDER BY total_billing DESC;
+------------+--------------+---------------+
| patient_id | name         | total_billing |
+------------+--------------+---------------+
|          5 | Karan Joshi  |      12000.00 |
|          4 | Priya Desai  |      10000.00 |
|          2 | Diya Patel   |       9500.00 |
|          1 | Aarav Shah   |       5000.00 |
|          6 | Neha Trivedi |       3500.00 |
|          3 | Rohan Mehta  |       2500.00 |
|          7 | Rahul Verma  |          NULL |
+------------+--------------+---------------+

----->Display departments having more than one doctor.


SELECT dep.department_name,
       COUNT(dd.doctor_id) AS total_doctors
FROM Departments dep
JOIN Doctor_Department dd
    ON dep.department_id = dd.department_id
GROUP BY dep.department_id, dep.department_name
HAVING COUNT(dd.doctor_id) > 1;
+-----------------+---------------+
| department_name | total_doctors |
+-----------------+---------------+
| Cardiology      |             2 |
+-----------------+---------------+


----->Display appointments with patient names and doctor names using INNER JOIN.


SELECT
    a.appointment_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    a.appointment_date,
    a.status
FROM Appointments a
INNER JOIN Patients p
    ON a.patient_id = p.patient_id
INNER JOIN Doctors d
    ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_id;
+----------------+--------------+------------------+------------------+-----------+
| appointment_id | patient_name | doctor_name      | appointment_date | status    |
+----------------+--------------+------------------+------------------+-----------+
|              1 | Aarav Shah   | Dr. Amit Sharma  | 2026-01-10       | Completed |
|              2 | Diya Patel   | Dr. Sneha Rao    | 2026-02-15       | Completed |
|              3 | Rohan Mehta  | Dr. Raj Malhotra | 2026-03-20       | Completed |
|              4 | Priya Desai  | Dr. Pooja Shah   | 2026-05-12       | Scheduled |
|              5 | Karan Joshi  | Dr. Amit Sharma  | 2026-06-18       | Completed |
|              6 | Neha Trivedi | Dr. Kunal Mehta  | 2026-07-25       | Scheduled |
|              8 | Diya Patel   | Dr. Nisha Patel  | 2026-08-15       | Completed |
|              9 | Rohan Mehta  | Dr. Sneha Rao    | 2026-09-05       | Scheduled |
|             10 | Priya Desai  | Dr. Amit Sharma  | 2026-09-20       | Completed |
|             11 | Rahul Verma  | Dr. Meera Joshi  | 2026-10-15       | Scheduled |
+----------------+--------------+------------------+------------------+-----------+

----->Display all patients, including those who have never booked an appointment, using LEFT JOIN.


SELECT
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id,
    a.appointment_date,
    a.status
FROM Patients p
LEFT JOIN Appointments a
    ON p.patient_id = a.patient_id
ORDER BY p.patient_id;
+------------+--------------+----------------+------------------+-----------+
| patient_id | patient_name | appointment_id | appointment_date | status    |
+------------+--------------+----------------+------------------+-----------+
|          1 | Aarav Shah   |              1 | 2026-01-10       | Completed |
|          2 | Diya Patel   |              2 | 2026-02-15       | Completed |
|          2 | Diya Patel   |              8 | 2026-08-15       | Completed |
|          3 | Rohan Mehta  |              3 | 2026-03-20       | Completed |
|          3 | Rohan Mehta  |              9 | 2026-09-05       | Scheduled |
|          4 | Priya Desai  |              4 | 2026-05-12       | Scheduled |
|          4 | Priya Desai  |             10 | 2026-09-20       | Completed |
|          5 | Karan Joshi  |              5 | 2026-06-18       | Completed |
|          6 | Neha Trivedi |              6 | 2026-07-25       | Scheduled |
|          7 | Rahul Verma  |             11 | 2026-10-15       | Scheduled |
+------------+--------------+----------------+------------------+-----------+

--->Display all doctors, including those who have no appointments, using RIGHT JOIN.


SELECT
    d.doctor_id,
    d.name AS doctor_name,
    a.appointment_id,
    a.appointment_date
FROM Appointments a
RIGHT JOIN Doctors d
    ON a.doctor_id = d.doctor_id
ORDER BY d.doctor_id;
+-----------+------------------+----------------+------------------+
| doctor_id | doctor_name      | appointment_id | appointment_date |
+-----------+------------------+----------------+------------------+
|         1 | Dr. Amit Sharma  |              1 | 2026-01-10       |
|         1 | Dr. Amit Sharma  |              5 | 2026-06-18       |
|         1 | Dr. Amit Sharma  |             10 | 2026-09-20       |
|         2 | Dr. Sneha Rao    |              2 | 2026-02-15       |
|         2 | Dr. Sneha Rao    |              9 | 2026-09-05       |
|         3 | Dr. Raj Malhotra |              3 | 2026-03-20       |
|         4 | Dr. Pooja Shah   |              4 | 2026-05-12       |
|         5 | Dr. Kunal Mehta  |              6 | 2026-07-25       |
|         6 | Dr. Nisha Patel  |              8 | 2026-08-15       |
|         7 | Dr. Meera Joshi  |             11 | 2026-10-15       |
+-----------+------------------+----------------+------------------+

------>Display all departments and their doctors, including departments without doctors.


SELECT
    dep.department_name,
    d.name AS doctor_name
FROM Departments dep
LEFT JOIN Doctor_Department dd
    ON dep.department_id = dd.department_id
LEFT JOIN Doctors d
    ON dd.doctor_id = d.doctor_id
ORDER BY dep.department_id;
+------------------+------------------+
| department_name  | doctor_name      |
+------------------+------------------+
| Cardiology       | Dr. Amit Sharma  |
| Cardiology       | Dr. Kunal Mehta  |
| Neurology        | Dr. Sneha Rao    |
| Dermatology      | Dr. Raj Malhotra |
| Orthopedics      | Dr. Pooja Shah   |
| General Medicine | Dr. Nisha Patel  |
+------------------+------------------+


------->Display all patients and appointments using FULL OUTER JOIN equivalent in MySQL.


SELECT
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id,
    a.appointment_date
FROM Patients p
LEFT JOIN Appointments a
    ON p.patient_id = a.patient_id

UNION

SELECT
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id,
    a.appointment_date
FROM Patients p
RIGHT JOIN Appointments a
    ON p.patient_id = a.patient_id;
+------------+--------------+----------------+------------------+
| patient_id | patient_name | appointment_id | appointment_date |
+------------+--------------+----------------+------------------+
|          1 | Aarav Shah   |              1 | 2026-01-10       |
|          2 | Diya Patel   |              2 | 2026-02-15       |
|          2 | Diya Patel   |              8 | 2026-08-15       |
|          3 | Rohan Mehta  |              3 | 2026-03-20       |
|          3 | Rohan Mehta  |              9 | 2026-09-05       |
|          4 | Priya Desai  |              4 | 2026-05-12       |
|          4 | Priya Desai  |             10 | 2026-09-20       |
|          5 | Karan Joshi  |              5 | 2026-06-18       |
|          6 | Neha Trivedi |              6 | 2026-07-25       |
|          7 | Rahul Verma  |             11 | 2026-10-15       |
+------------+--------------+----------------+------------------+

------->Display patients, their doctors and their billing amounts.


SELECT
    p.name AS patient_name,
    d.name AS doctor_name,
    a.appointment_date,
    b.amount,
    b.payment_status
FROM Appointments a
INNER JOIN Patients p
    ON a.patient_id = p.patient_id
INNER JOIN Doctors d
    ON a.doctor_id = d.doctor_id
LEFT JOIN Billing b
    ON a.appointment_id = b.appointment_id
ORDER BY a.appointment_id;
+--------------+------------------+------------------+----------+----------------+
| patient_name | doctor_name      | appointment_date | amount   | payment_status |
+--------------+------------------+------------------+----------+----------------+
| Aarav Shah   | Dr. Amit Sharma  | 2026-01-10       |  5000.00 | Paid           |
| Diya Patel   | Dr. Sneha Rao    | 2026-02-15       |  8000.00 | Paid           |
| Rohan Mehta  | Dr. Raj Malhotra | 2026-03-20       |  2500.00 | Pending        |
| Priya Desai  | Dr. Pooja Shah   | 2026-05-12       |  4000.00 | Pending        |
| Karan Joshi  | Dr. Amit Sharma  | 2026-06-18       | 12000.00 | Paid           |
| Neha Trivedi | Dr. Kunal Mehta  | 2026-07-25       |  3500.00 | Paid           |
| Diya Patel   | Dr. Nisha Patel  | 2026-08-15       |  1500.00 | Paid           |
| Rohan Mehta  | Dr. Sneha Rao    | 2026-09-05       |     NULL | NULL           |
| Priya Desai  | Dr. Amit Sharma  | 2026-09-20       |  6000.00 | Pending        |
| Rahul Verma  | Dr. Meera Joshi  | 2026-10-15       |     NULL | NULL           |
+--------------+------------------+------------------+----------+----------------+

------>Display patients who have completed appointments.


SELECT DISTINCT
    p.patient_id,
    p.name AS patient_name
FROM Patients p
INNER JOIN Appointments a
    ON p.patient_id = a.patient_id
WHERE a.status = 'Completed';
+------------+--------------+
| patient_id | patient_name |
+------------+--------------+
|          1 | Aarav Shah   |
|          2 | Diya Patel   |
|          3 | Rohan Mehta  |
|          5 | Karan Joshi  |
|          4 | Priya Desai  |
+------------+--------------+

------>Find doctors who have handled more than 50 patients.

SELECT doctor_id, name
FROM Doctors
WHERE doctor_id IN (
    SELECT doctor_id
    FROM Appointments
    GROUP BY doctor_id
    HAVING COUNT(DISTINCT patient_id) > 50
);

Empty set

--------->Find the patient who has spent the highest amount on treatment.

SELECT
    p.patient_id,
    p.name,
    SUM(b.amount) AS total_spent
FROM Patients p
JOIN Billing b
    ON p.patient_id = b.patient_id
GROUP BY p.patient_id, p.name
HAVING SUM(b.amount) = (
    SELECT MAX(patient_total)
    FROM (
        SELECT SUM(amount) AS patient_total
        FROM Billing
        GROUP BY patient_id
    ) AS spending
);

------>Find appointments for doctors who specialize in Dermatology.

SELECT
    appointment_id,
    patient_id,
    doctor_id,
    appointment_date,
    status
FROM Appointments
WHERE doctor_id IN (
    SELECT doctor_id
    FROM Doctors
    WHERE specialization = 'Dermatology'
);
+----------------+------------+-----------+------------------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | status    |
+----------------+------------+-----------+------------------+-----------+
|              3 |          3 |         3 | 2026-03-20       | Completed |
+----------------+------------+-----------+------------------+-----------+

------>Display monthly visits according to the appointment month.


SELECT
    MONTH(appointment_date) AS month_number,
    MONTHNAME(appointment_date) AS month_name,
    COUNT(*) AS total_visits
FROM Appointments
GROUP BY MONTH(appointment_date), MONTHNAME(appointment_date)
ORDER BY month_number;

+--------------+------------+--------------+
| month_number | month_name | total_visits |
+--------------+------------+--------------+
|            1 | January    |            1 |
|            2 | February   |            1 |
|            3 | March      |            1 |
|            5 | May        |            1 |
|            6 | June       |            1 |
|            7 | July       |            1 |
|            8 | August     |            1 |
|            9 | September  |            2 |
|           10 | October    |            1 |
+--------------+------------+--------------+

------>Calculate the hospital stay duration between admission date and discharge date.

SELECT
    record_id,
    patient_id,
    admission_date,
    discharge_date,
    DATEDIFF(discharge_date, admission_date) AS stay_duration_days
FROM Medical_Records;
+-----------+------------+----------------+----------------+--------------------+
| record_id | patient_id | admission_date | discharge_date | stay_duration_days |
+-----------+------------+----------------+----------------+--------------------+
|         1 |          1 | 2026-01-09     | 2026-01-12     |                  3 |
|         2 |          2 | 2026-02-14     | 2026-02-16     |                  2 |
|         3 |          3 | 2026-03-20     | 2026-03-22     |                  2 |
|         4 |          4 | 2026-05-11     | 2026-05-15     |                  4 |
|         5 |          5 | 2026-06-18     | 2026-06-20     |                  2 |
|         6 |          6 | 2026-07-25     | 2026-07-26     |                  1 |
|         7 |          2 | 2026-08-15     | 2026-08-16     |                  1 |
|         8 |          4 | 2026-09-19     | 2026-09-21     |                  2 |
+-----------+------------+----------------+----------------+--------------------+

----->Display treatment dates in DD-MM-YYYY format.

SELECT
    record_id,
    patient_id,
    diagnosis,
    DATE_FORMAT(treatment_date, '%d-%m-%Y') AS formatted_treatment_date
FROM Medical_Records;
+-----------+------------+--------------------+--------------------------+
| record_id | patient_id | diagnosis          | formatted_treatment_date |
+-----------+------------+--------------------+--------------------------+
|         1 |          1 | Heart Checkup      | 10-01-2026               |
|         2 |          2 | Migraine           | 15-02-2026               |
|         3 |          3 | Skin Allergy       | 20-03-2026               |
|         4 |          4 | Bone Pain          | 12-05-2026               |
|         5 |          5 | Blood Pressure     | 18-06-2026               |
|         6 |          6 | Heart Checkup      | 25-07-2026               |
|         7 |          2 | General Fever      | 15-08-2026               |
|         8 |          4 | Heart Consultation | 20-09-2026               |
+-----------+------------+--------------------+--------------------------+

------->Display patient names in uppercase.

SELECT
    patient_id,
    UPPER(name) AS patient_name_uppercase
FROM Patients;
+------------+------------------------+
| patient_id | patient_name_uppercase |
+------------+------------------------+
|          1 | AARAV SHAH             |
|          2 | DIYA PATEL             |
|          3 | ROHAN MEHTA            |
|          4 | PRIYA DESAI            |
|          5 | KARAN JOSHI            |
|          6 | NEHA TRIVEDI           |
|          7 | RAHUL VERMA            |
+------------+------------------------+

------>Remove extra spaces from doctor names.

SELECT
    doctor_id,
    TRIM(name) AS doctor_name
FROM Doctors;
+-----------+------------------+
| doctor_id | doctor_name      |
+-----------+------------------+
|         1 | Dr. Amit Sharma  |
|         2 | Dr. Sneha Rao    |
|         3 | Dr. Raj Malhotra |
|         4 | Dr. Pooja Shah   |
|         5 | Dr. Kunal Mehta  |
|         6 | Dr. Nisha Patel  |
|         7 | Dr. Meera Joshi  |
+-----------+------------------+

------->Display “Not Available” when a patient’s phone number is missing.

SELECT
    patient_id,
    name,
    COALESCE(NULLIF(TRIM(phone_number), ''), 'Not Available') AS phone_number
FROM Patients;
+------------+--------------+--------------+
| patient_id | name         | phone_number |
+------------+--------------+--------------+
|          1 | Aarav Shah   | 9876543210   |
|          2 | Diya Patel   | 9876543211   |
|          3 | Rohan Mehta  | 9876543212   |
|          4 | Priya Desai  | 9876543213   |
|          5 | Karan Joshi  | 9876543214   |
|          6 | Neha Trivedi | 9876543215   |
|          7 | Rahul Verma  | 9000000010   |
+------------+--------------+--------------+

------>Rank doctors according to the number of patients treated.

SELECT
    doctor_id,
    doctor_name,
    total_patients,
    RANK() OVER (
        ORDER BY total_patients DESC
    ) AS doctor_rank
FROM (
    SELECT
        d.doctor_id,
        d.name AS doctor_name,
        COUNT(DISTINCT a.patient_id) AS total_patients
    FROM Doctors d
    LEFT JOIN Appointments a
        ON d.doctor_id = a.doctor_id
    GROUP BY d.doctor_id, d.name
) AS doctor_summary;

+-----------+------------------+----------------+-------------+
| doctor_id | doctor_name      | total_patients | doctor_rank |
+-----------+------------------+----------------+-------------+
|         1 | Dr. Amit Sharma  |              3 |           1 |
|         2 | Dr. Sneha Rao    |              2 |           2 |
|         3 | Dr. Raj Malhotra |              1 |           3 |
|         4 | Dr. Pooja Shah   |              1 |           3 |
|         5 | Dr. Kunal Mehta  |              1 |           3 |
|         6 | Dr. Nisha Patel  |              1 |           3 |
|         7 | Dr. Meera Joshi  |              1 |           3 |
+-----------+------------------+----------------+-------------

------>Calculate cumulative monthly revenue.

SELECT
    revenue_month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        ORDER BY revenue_month
    ) AS cumulative_revenue
FROM (
    SELECT
        DATE_FORMAT(payment_date, '%Y-%m') AS revenue_month,
        SUM(amount) AS monthly_revenue
    FROM Billing
    WHERE payment_date IS NOT NULL
    GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
) AS monthly_summary
ORDER BY revenue_month;
+---------------+-----------------+--------------------+
| revenue_month | monthly_revenue | cumulative_revenue |
+---------------+-----------------+--------------------+
| 2026-01       |         5000.00 |            5000.00 |
| 2026-02       |         8000.00 |           13000.00 |
| 2026-06       |        12000.00 |           25000.00 |
| 2026-07       |         3500.00 |           28500.00 |
| 2026-08       |         1500.00 |           30000.00 |
+---------------+-----------------+--------------------+


------>Calculate a running total of appointments.

SELECT
    appointment_id,
    appointment_date,
    COUNT(*) OVER (
        ORDER BY appointment_date, appointment_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_appointments
FROM Appointments
ORDER BY appointment_date, appointment_id;
+----------------+------------------+----------------------------+
| appointment_id | appointment_date | running_total_appointments |
+----------------+------------------+----------------------------+
|              1 | 2026-01-10       |                          1 |
|              2 | 2026-02-15       |                          2 |
|              3 | 2026-03-20       |                          3 |
|              4 | 2026-05-12       |                          4 |
|              5 | 2026-06-18       |                          5 |
|              6 | 2026-07-25       |                          6 |
|              8 | 2026-08-15       |                          7 |
|              9 | 2026-09-05       |                          8 |
|             10 | 2026-09-20       |                          9 |
|             11 | 2026-10-15       |                         10 |
+----------------+------------------+----------------------------+

------>Display Patient Risk Level.

SELECT
    patient_id,
    name,
    dob,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, dob, CURDATE()) >= 60
            THEN 'High Risk'
        WHEN TIMESTAMPDIFF(YEAR, dob, CURDATE()) >= 40
            THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS patient_risk_level
FROM Patients;
+------------+--------------+------------+--------------------+
| patient_id | name         | dob        | patient_risk_level |
+------------+--------------+------------+--------------------+
|          1 | Aarav Shah   | 2000-05-15 | Low Risk           |
|          2 | Diya Patel   | 1998-08-20 | Low Risk           |
|          3 | Rohan Mehta  | 1985-11-12 | Medium Risk        |
|          4 | Priya Desai  | 2002-02-25 | Low Risk           |
|          5 | Karan Joshi  | 1975-07-08 | Medium Risk        |
|          6 | Neha Trivedi | 1995-09-18 | Low Risk           |
|          7 | Rahul Verma  | 1999-04-12 | Low Risk           |
+------------+--------------+------------+--------------------+

------>Categorize doctors according to their years of experience.

SELECT
    doctor_id,
    name,
    years_of_experience,
    CASE
        WHEN years_of_experience >= 15
            THEN 'Senior Doctor'
        WHEN years_of_experience >= 5
            THEN 'Experienced Doctor'
        ELSE 'Junior Doctor'
    END AS doctor_category
FROM Doctors;
+-----------+------------------+---------------------+--------------------+
| doctor_id | name             | years_of_experience | doctor_category    |
+-----------+------------------+---------------------+--------------------+
|         1 | Dr. Amit Sharma  |                  20 | Senior Doctor      |
|         2 | Dr. Sneha Rao    |                  12 | Experienced Doctor |
|         3 | Dr. Raj Malhotra |                   8 | Experienced Doctor |
|         4 | Dr. Pooja Shah   |                   4 | Junior Doctor      |
|         5 | Dr. Kunal Mehta  |                   2 | Junior Doctor      |
|         6 | Dr. Nisha Patel  |                  16 | Senior Doctor      |
|         7 | Dr. Meera Joshi  |                   6 | Experienced Doctor |
+-----------+------------------+---------------------+--------------------+






















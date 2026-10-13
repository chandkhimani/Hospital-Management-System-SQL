# 🏥 Hospital Management System — SQL

### An Advanced MySQL Project for Hospital Records, Appointments, Billing & Data Analysis

<p align="center">
  <img src="https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
  <img src="https://img.shields.io/badge/Language-SQL-336791?style=for-the-badge&logo=mysql&logoColor=white" alt="SQL">
  <img src="https://img.shields.io/badge/Domain-Hospital%20Management-2E8B57?style=for-the-badge" alt="Hospital Management">
  <img src="https://img.shields.io/badge/Project-Academic-F39C12?style=for-the-badge" alt="Academic Project">
</p>

<p align="center">
  <strong>📚 BCA Final Year</strong> •
  <strong>📊 Data Analysis Course</strong> •
  <strong>👨‍💻 Developed by Chand Khimani</strong>
</p>

<p align="center">
  <strong>🎓 Guided by Prof. Girish Gondaliya</strong>
</p>

---

## 📌 Table of Contents

- [🌟 Project Overview](#-project-overview)
- [🎯 Project Objectives](#-project-objectives)
- [🏗️ Database Architecture](#️-database-architecture)
- [🔗 Relationship Flow](#-relationship-flow)
- [🧩 Database Schema](#-database-schema)
- [🧠 SQL Concepts Demonstrated](#-sql-concepts-demonstrated)
- [📋 Assignment Query Coverage](#-assignment-query-coverage)
- [📊 Dataset Overview](#-dataset-overview)
- [🛠️ Technologies Used](#️-technologies-used)
- [🚀 How to Run](#-how-to-run)
- [📁 Repository Structure](#-repository-structure)
- [🧠 Learning Outcomes](#-learning-outcomes)
- [✨ Key Highlights](#-key-highlights)
- [🎓 Academic Information](#-academic-information)
- [🙏 Acknowledgement](#-acknowledgement)

---

## 🌟 Project Overview

**Hospital Management System — SQL** is a practical relational-database project designed to organize and analyze essential hospital information. It uses MySQL to manage patient records, doctors, departments, appointments, medical records, and billing details.

The project demonstrates SQL from database creation and CRUD operations through filtering, sorting, aggregate analysis, joins, subqueries, date and string functions, window functions, and conditional `CASE` expressions.

### 🧱 Core Tables

| # | Table | Purpose |
|---|---|---|
| 01 | 🧑‍⚕️ `Patients` | Stores patient details, contact information, date of birth, address, and registration date |
| 02 | 👨‍⚕️ `Doctors` | Stores doctor details, specialization, availability, consultation fee, and experience |
| 03 | 🏢 `Departments` | Stores the hospital's department names |
| 04 | 📅 `Appointments` | Connects patients and doctors with appointment dates and status |
| 05 | 🩺 `Medical_Records` | Stores diagnosis, prescription, treatment date, admission date, and discharge date |
| 06 | 💳 `Billing` | Stores invoice amounts, payment status, and payment dates |
| 07 | 🔗 `Doctor_Department` | Maps doctors to departments using a composite primary key |

> 🎯 **Project Goal:** Build practical SQL skills by working with connected hospital data, retrieving useful records, and producing meaningful summaries from appointments, treatment, and billing information.

---

## 🎯 Project Objectives

| Area | Concepts Covered |
|---|---|
| 🗄️ Database Setup | `CREATE DATABASE`, `USE`, `CREATE TABLE`, `SHOW TABLES` |
| ✍️ Data Management | `INSERT`, `UPDATE`, `DELETE`, `SELECT` |
| 🔎 Filtering | `WHERE`, `AND`, `OR`, `NOT`, date conditions |
| ↕️ Sorting & Limits | `ORDER BY`, `ASC`, `DESC`, `LIMIT` |
| 📊 Aggregation | `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()` |
| 🧮 Group Analysis | `GROUP BY`, `HAVING` |
| 🔑 Data Integrity | Primary keys, foreign keys, composite primary key |
| 🔗 Table Relationships | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, full-outer-join equivalent |
| 🧩 Nested Queries | Subqueries for patient spending, doctor workload, and specialization-based appointments |
| 📅 Date & Time | `YEAR()`, `MONTH()`, `MONTHNAME()`, `DATEDIFF()`, `DATE_FORMAT()`, date conditions |
| 🔤 String & NULL Handling | `UPPER()`, `TRIM()`, `COALESCE()` |
| 📈 Window Functions | `RANK()`, cumulative monthly revenue, running appointment totals |
| 🧠 Conditional Logic | `CASE` expressions for patient risk level and doctor category |

---

## 🏗️ Database Architecture

```text
                     ┌────────────────────────────────┐
                     │   HOSPITAL MANAGEMENT SYSTEM   │
                     │           MySQL DB             │
                     └────────────────┬───────────────┘
                                      │
            ┌─────────────────────────┼─────────────────────────┐
            │                         │                         │
            ▼                         ▼                         ▼
      ┌────────────┐            ┌────────────┐            ┌────────────┐
      │  PATIENTS  │            │  DOCTORS   │            │ DEPARTMENTS│
      └─────┬──────┘            └─────┬──────┘            └─────┬──────┘
            │                         │                         │
            └──────────────┐   ┌──────┘                         │
                           ▼   ▼                                ▼
                       ┌──────────────┐                ┌─────────────────┐
                       │ APPOINTMENTS │                │DOCTOR_DEPARTMENT│
                       └──────┬───────┘                └─────────────────┘
                              │
                 ┌────────────┴────────────┐
                 ▼                         ▼
          ┌───────────────┐          ┌─────────┐
          │ MEDICAL_RECORDS│          │ BILLING │
          └───────────────┘          └─────────┘
```

### 🔑 Relationship Logic

- `Patients.patient_id` is the primary key for patient records.
- `Doctors.doctor_id` is the primary key for doctor records.
- `Appointments.patient_id` references `Patients.patient_id`.
- `Appointments.doctor_id` references `Doctors.doctor_id`.
- `Medical_Records` links each record to a patient and a doctor.
- `Billing.patient_id` references a patient, while `Billing.appointment_id` references an appointment.
- `Doctor_Department` uses `(doctor_id, department_id)` as a composite primary key and connects doctors with departments.

The sample database is designed for SQL practice and academic analysis. It is not a production-ready hospital application and does not implement authentication, privacy controls, or real-world clinical workflows.

---

## 🧩 Database Schema

### 1️⃣ `Patients`

| Field | Data Type | Key / Purpose |
|---|---|---|
| `patient_id` | `INT` | 🔑 Primary key, auto-increment |
| `name` | `VARCHAR(100)` | Patient name |
| `dob` | `DATE` | Date of birth |
| `gender` | `VARCHAR(20)` | Gender |
| `phone_number` | `VARCHAR(15)` | Contact number |
| `email` | `VARCHAR(100)` | Email address |
| `address` | `VARCHAR(255)` | City / address |
| `registration_date` | `DATE` | Registration date |

### 2️⃣ `Doctors`

| Field | Data Type | Key / Purpose |
|---|---|---|
| `doctor_id` | `INT` | 🔑 Primary key, auto-increment |
| `name` | `VARCHAR(100)` | Doctor name |
| `specialization` | `VARCHAR(100)` | Medical specialization |
| `phone_number` | `VARCHAR(15)` | Contact number |
| `email` | `VARCHAR(100)` | Work email |
| `available_days` | `VARCHAR(100)` | Listed available days |
| `consultation_fee` | `DECIMAL(10,2)` | Consultation fee |
| `years_of_experience` | `INT` | Years of experience |

### 3️⃣ `Departments`

| Field | Data Type | Key / Purpose |
|---|---|---|
| `department_id` | `INT` | 🔑 Primary key, auto-increment |
| `department_name` | `VARCHAR(100)` | Department name |

### 4️⃣ `Appointments`

| Field | Data Type | Key / Purpose |
|---|---|---|
| `appointment_id` | `INT` | 🔑 Primary key, auto-increment |
| `patient_id` | `INT` | 🔗 Foreign key to `Patients` |
| `doctor_id` | `INT` | 🔗 Foreign key to `Doctors` |
| `appointment_date` | `DATE` | Appointment date |
| `status` | `ENUM` | `Scheduled`, `Completed`, or `Cancelled` |

### 5️⃣ `Medical_Records`

| Field | Data Type | Key / Purpose |
|---|---|---|
| `record_id` | `INT` | 🔑 Primary key, auto-increment |
| `patient_id` | `INT` | 🔗 Foreign key to `Patients` |
| `doctor_id` | `INT` | 🔗 Foreign key to `Doctors` |
| `diagnosis` | `VARCHAR(255)` | Diagnosis / visit reason |
| `prescription` | `TEXT` | Prescription or treatment notes |
| `treatment_date` | `DATE` | Treatment date |
| `admission_date` | `DATE` | Admission date |
| `discharge_date` | `DATE` | Discharge date |

### 6️⃣ `Billing`

| Field | Data Type | Key / Purpose |
|---|---|---|
| `invoice_id` | `INT` | 🔑 Primary key, auto-increment |
| `patient_id` | `INT` | 🔗 Foreign key to `Patients` |
| `appointment_id` | `INT` | 🔗 Foreign key to `Appointments` |
| `amount` | `DECIMAL(10,2)` | Invoice amount |
| `payment_status` | `ENUM` | `Paid`, `Pending`, or `Cancelled` |
| `payment_date` | `DATE` | Payment date; may be `NULL` for pending payment |

### 7️⃣ `Doctor_Department`

| Field | Data Type | Key / Purpose |
|---|---|---|
| `doctor_id` | `INT` | Part of composite primary key; foreign key to `Doctors` |
| `department_id` | `INT` | Part of composite primary key; foreign key to `Departments` |

---

## 🧠 SQL Concepts Demonstrated

### ✍️ CRUD Operations

- **Create:** Insert new patients, doctors, and appointments.
- **Read:** Retrieve records from individual tables or joined tables.
- **Update:** Change a patient's address and verify the updated value.
- **Delete:** Remove cancelled appointments older than six months using a date condition.

> ⚠️ The `UPDATE` and `DELETE` statements change data. Run them only when you intend to modify your local practice database.

### 🔎 Filtering, Sorting & Limits

The project filters records using date ranges, consultation-fee thresholds, appointment status, and combined conditions. It also demonstrates ascending/descending sorting and limiting results to a requested number of rows.

### 📊 Aggregate Functions

- `COUNT()` counts patients, appointments, and doctors.
- `SUM()` calculates revenue and patient-level billing totals.
- `AVG()` calculates average billing and consultation-fee values.
- `MAX()` and `MIN()` identify the highest and lowest billing amounts.
- `GROUP BY` produces department-, doctor-, and patient-level summaries.
- `HAVING` filters grouped results, such as departments with more than one doctor.

### 🔗 JOIN Operations

- **INNER JOIN:** Shows matching appointment, patient, and doctor records.
- **LEFT JOIN:** Includes every patient even if there is no matching appointment.
- **RIGHT JOIN:** Includes the doctor side of a relationship, including doctors without matching appointments when the join is written appropriately.
- **FULL OUTER JOIN equivalent:** MySQL does not directly support `FULL OUTER JOIN`; a similar result can be built by combining left- and right-join results with `UNION`.

### 🧩 Subqueries

Subqueries are used to explore questions such as:
- Which doctors have handled more than 50 patients?
- Which patient has spent the highest amount on treatment?
- Which appointments belong to doctors in Dermatology?

The supplied sample data is small, so some threshold-based questions may return no rows. That is a valid query result and should not be interpreted as a SQL error.

### 📅 Date & Time Functions

- `YEAR()` and `MONTH()` extract date parts.
- `MONTHNAME()` returns a readable month name.
- `DATEDIFF()` calculates the number of days between two dates.
- `DATE_FORMAT()` displays treatment dates as `DD-MM-YYYY`.
- Date conditions can identify registrations from the previous calendar year.
- Monthly appointment counts help summarize visit patterns.

### 🔤 String & NULL Functions

- `UPPER()` converts patient names to uppercase.
- `TRIM()` removes leading and trailing spaces from doctor names.
- `COALESCE()` can display a fallback such as `Not Available` when a phone number is `NULL`.

### 📈 Window Functions

- `RANK() OVER (...)` ranks doctors based on patient or appointment counts.
- `SUM() OVER (...)` calculates cumulative monthly revenue.
- A running-total expression counts appointments in date order.

These examples require a MySQL version that supports window functions.

### 🧠 CASE Expressions

- **Patient Risk Level:** Applies the age-based conditions defined in the SQL assignment to label sample patients.
- **Doctor Category:** Classifies doctors according to the experience thresholds defined in the SQL assignment.

These are educational labels based on query rules, not medical risk assessments or professional clinical recommendations.

---

## 📋 Assignment Query Coverage

The SQL file groups the assignment into practical sections. The table below summarizes the major question types covered by the supplied project.

| # | Assignment Question / Task | SQL Concept |
|---:|---|---|
| 01 | Create the database and all seven tables | `CREATE DATABASE`, `CREATE TABLE` |
| 02 | Insert sample patient, doctor, department, appointment, medical-record, billing, and mapping data | `INSERT` |
| 03 | Display all database tables | `SHOW TABLES` |
| 04 | Insert a patient, doctor, and appointment | CRUD — Create |
| 05 | Update a patient's address and verify the change | CRUD — Update |
| 06 | Delete cancelled appointments older than six months | CRUD — Delete, `DATE_SUB()` |
| 07 | Find patients registered in the previous calendar year | Date filtering |
| 08 | Display the five patients with the highest billing totals | `SUM()`, `GROUP BY`, `ORDER BY`, `LIMIT` |
| 09 | Find doctors whose consultation fee exceeds ₹1,000 | `WHERE` |
| 10 | Filter completed appointments for a specified patient | `AND` |
| 11 | Find appointments that are scheduled or cancelled | `OR` |
| 12 | Display appointments that are not cancelled | `NOT` |
| 13 | Filter doctors by consultation fee and experience | `AND` |
| 14 | Find departments with more than one doctor | `GROUP BY`, `HAVING` |
| 15 | Sort doctors by name or consultation fee | `ORDER BY` |
| 16 | Count patients and appointments | `COUNT()` |
| 17 | Calculate total revenue, average billing, and maximum/minimum bills | `SUM()`, `AVG()`, `MAX()`, `MIN()` |
| 18 | Calculate doctor counts by department | `JOIN`, `COUNT()`, `GROUP BY` |
| 19 | Calculate total billing amount for each patient | `LEFT JOIN`, `SUM()` |
| 20 | Display appointments with patient and doctor names | `INNER JOIN` |
| 21 | Include patients even when they have no appointments | `LEFT JOIN` |
| 22 | Include doctors on the doctor side of an appointment join | `RIGHT JOIN` |
| 23 | Display departments and their doctors | `LEFT JOIN` |
| 24 | Show patients and appointments using a full-outer-join equivalent | `UNION` with outer joins |
| 25 | Display patient, doctor, appointment, and billing information | Multiple `JOIN` operations |
| 26 | Find patients with completed appointments | Join / filtering |
| 27 | Find doctors who have handled more than 50 patients | Subquery / aggregate condition |
| 28 | Find the patient with the highest treatment spending | Subquery / aggregate analysis |
| 29 | Find appointments for Dermatology doctors | Subquery or join filtering |
| 30 | Summarize monthly visits | `MONTH()`, `MONTHNAME()`, `COUNT()` |
| 31 | Calculate hospital-stay duration | `DATEDIFF()` |
| 32 | Format treatment dates as `DD-MM-YYYY` | `DATE_FORMAT()` |
| 33 | Display uppercase patient names and trim doctor names | `UPPER()`, `TRIM()` |
| 34 | Display `Not Available` for missing phone numbers | `COALESCE()` |
| 35 | Rank doctors by patient count | `RANK() OVER()` |
| 36 | Calculate cumulative monthly revenue | `SUM() OVER()` |
| 37 | Calculate a running total of appointments | Windowed `COUNT()` or `SUM()` |
| 38 | Display patient risk labels and doctor experience categories | `CASE` |

> 📌 **Assignment scope:** This README documents the SQL topics represented in the provided Hospital Management System material. Check the actual `.sql` file before submission to ensure every listed query is present and runs in your MySQL environment.

---

## 📊 Dataset Overview

The project uses a small, manually inserted sample dataset for practice.

| Data Area | Sample Records / Details |
|---|---|
| 🧑‍⚕️ Patients | 7 patient records after the new patient is inserted |
| 👨‍⚕️ Doctors | 7 doctor records after the new doctor is inserted |
| 🏢 Departments | 5 departments |
| 📅 Appointments | Appointment records with `Scheduled`, `Completed`, and `Cancelled` statuses; the CRUD section deletes qualifying old cancelled appointments |
| 🩺 Medical Records | 8 sample treatment records |
| 💳 Billing | 8 sample invoices |
| 🔗 Doctor–Department Mapping | Doctor-to-department mapping records |

### 📌 Example Analytical Questions

- How many patients are registered in the database?
- Which doctor has the most appointments in the sample records?
- What is the total amount recorded in the billing table?
- Which departments have multiple doctors?
- How does appointment activity vary by month?
- How long did each recorded hospital stay last?
- What is the cumulative revenue over time?

> ℹ️ **Important:** Results depend on the exact order in which the SQL script is run. Because the script includes `UPDATE` and `DELETE` operations, later results may differ from the initial inserted data. Date-based queries using `CURDATE()` also change over time.

---

## 🛠️ Technologies Used

| Technology / Concept | Purpose |
|---|---|
| 🐬 **MySQL** | Relational database management system |
| 💻 **SQL** | Creating, retrieving, updating, deleting, and analyzing records |
| 🔑 **Primary & Foreign Keys** | Maintaining relationships between tables |
| 🔗 **JOIN Operations** | Combining patient, doctor, appointment, and billing information |
| 📊 **Aggregate Functions** | Summarizing counts and financial values |
| 📅 **Date Functions** | Analyzing dates, months, and stay durations |
| 🔤 **String Functions** | Formatting names and handling missing values |
| 📈 **Window Functions** | Ranking and cumulative calculations |
| 🧠 **CASE Expressions** | Rule-based categories |

---

## 🚀 How to Run

### 1. 🐬 Open MySQL

Use a MySQL-compatible environment such as:

- MySQL Workbench
- MySQL Command Line Client

### 2. 📄 Open the SQL Script

Open the project SQL file in your editor. If the file is named `hospital_management.sql`, use that exact filename; otherwise, select the actual filename in your repository.

### 3. 🗄️ Create and Select the Database

The setup section uses:

```sql
CREATE DATABASE hospital_management;
USE hospital_management;
```

If the database already exists, MySQL may report that it exists. For a fresh practice run, use a clean database or follow the setup statements appropriate to your environment.

### 4. ▶️ Execute the Setup Statements

Run the database creation, table definitions, and `INSERT` statements in order. Foreign-key dependencies mean that parent tables must exist before records that reference them are inserted.

### 5. 🔍 Verify the Tables

```sql
USE hospital_management;
SHOW TABLES;
```

The project is designed around these tables:

```text
appointments
billing
departments
doctor_department
doctors
medical_records
patients
```

### 6. ✅ Execute the Queries in Order

Run the SQL sections sequentially and review the returned result sets. If you rerun the full script, consider that inserts may duplicate data unless the setup is designed to reset the tables. Execute destructive `UPDATE` or `DELETE` statements only in a practice database.

### 7. ⚙️ MySQL Compatibility

Use **MySQL 8.0 or later** for the window-function examples. MySQL does not directly implement `FULL OUTER JOIN`, so use the `UNION`-based equivalent shown in the project.

---

## 📁 Repository Structure

```text
📦 Hospital-Management-System-SQL
│
├── 📄 README.md
└── 🗄️ hospital_management.sql
```

- `README.md` — project overview, database design, SQL topic coverage, and execution instructions.
- `hospital_management.sql` — database setup, table definitions, sample records, and assignment queries.

If your actual SQL script uses a different filename, keep the README filename description consistent with the file you upload to GitHub.

---

## 🧠 Learning Outcomes

By completing this project, the following practical skills are exercised:

- ✅ Creating a relational database and defining structured tables
- ✅ Applying primary keys, foreign keys, and a composite primary key
- ✅ Performing CRUD operations
- ✅ Filtering and sorting records with SQL conditions
- ✅ Summarizing information with aggregate functions
- ✅ Grouping results and filtering groups with `HAVING`
- ✅ Combining related tables with joins
- ✅ Using subqueries to answer data questions
- ✅ Extracting, comparing, and formatting dates
- ✅ Transforming strings and handling `NULL` values
- ✅ Applying window functions for rankings and running totals
- ✅ Building conditional labels with `CASE`
- ✅ Reading query outputs and checking whether results match the sample data

---

## ✨ Key Highlights

```text
┌──────────────────────────────────────────────────────────┐
│             HOSPITAL MANAGEMENT SYSTEM — SQL             │
├──────────────────────────────────────────────────────────┤
│ 🧑‍⚕️  Patient and doctor record management                │
│ 📅  Appointment scheduling and status analysis           │
│ 🩺  Medical records and hospital-stay duration           │
│ 💳  Billing totals, payment status, and revenue analysis │
│ 🔗  Seven related tables with key relationships          │
│ 📊  Aggregates, GROUP BY, HAVING, ORDER BY, and LIMIT    │
│ 🧩  Joins, subqueries, and MySQL outer-join equivalent   │
│ 📅  Date functions and monthly visit summaries           │
│ 📈  Ranking, cumulative revenue, and running totals      │
│ 🧠  CASE-based patient and doctor categories             │
└──────────────────────────────────────────────────────────┘
```

---

## 🎓 Academic Information

| Detail | Information |
|---|---|
| 👨‍💻 Student | **Chand Khimani** |
| 🎓 Program | **BCA — Final Year** |
| 📊 Course | **Data Analysis** |
| 👨‍🏫 Guide | **Prof. Girish Gondaliya** |
| 🗂️ Project | **Hospital Management System — SQL** |
| 🐬 Database | **MySQL** |
| 🧱 Tables | **7 relational tables** |

---

## 🌱 What This Project Represents

> **Hospital Management System — SQL is a practical exercise in organizing relational data and turning it into useful information.**

The project demonstrates a simple data workflow:

**Store → Relate → Retrieve → Filter → Summarize → Analyze**

The skills practiced here provide a foundation for:

- 📊 Data Analysis and Reporting
- 🗄️ Database Management
- 💻 SQL-based Backend Development
- 📈 Operational and Financial Data Analysis

---

## 🙏 Acknowledgement

I sincerely thank **Prof. Girish Gondaliya** for the guidance and support provided throughout this academic project.

This project helped strengthen my practical understanding of:

**SQL • MySQL • Relational Databases • Data Integrity • Joins • Aggregation • Data Analysis**

---

## 💬 Project Philosophy

> **Every record represents information.**  
> **Every query reveals a useful detail.**  
> **Every result builds stronger analytical thinking.**

<p align="center">
  <strong>💻 Built with SQL & Curiosity</strong><br>
  <strong>🏥 Organized Around Hospital Data</strong><br>
  <strong>🚀 Created by Chand Khimani</strong>
</p>

<p align="center">
  ⭐ <strong>Thank you for visiting Hospital Management System — SQL!</strong> ⭐
</p>

<p align="center">
  🌱 <em>Learn • Query • Analyze • Improve • Grow</em> 🌱
</p>

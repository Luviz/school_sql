USE dv1454_ht13_5
--
-- Create the Register table
--
DROP TABLE Register
CREATE TABLE Register
(
    courseRegister CHAR(6) NOT NULL,
    termRegister CHAR(5) NOT NULL,
    starttermRegister CHAR(5) NOT NULL,
    instRegister VARCHAR(4) NOT NULL,
    utbomrRegister CHAR(2) NOT NULL,
    progRegister CHAR(5) NULL,
    konRegister CHAR(1) NOT NULL,
    nivaRegister CHAR(1) NOT NULL,
    hstkRegister DECIMAL(10,6) NOT NULL,
    hprkRegister DECIMAL(10,6) NOT NULL
);

--
-- Insert bulk data into Register table
-- File must be on same machine as databaseserver
--
BULK INSERT Register
    FROM 'E:\DatabaseTechnique\register.txt'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t',
        ROWTERMINATOR = '\n'
    )
;

SELECT * FROM Register;

--
SELECT * FROM Register WHERE courseRegister = 'DV1219';

--
SELECT *
FROM Register AS R
    INNER JOIN Course AS C
        ON R.courseRegister = C.codeCourse;

--

--
-- Create the FK
--
ALTER TABLE Register ADD CONSTRAINT fk_course
  FOREIGN KEY (courseRegister) REFERENCES Course (codeCourse);

--
-- Verify that it exists
--
exec sp_fkeys Course;

--
-- Drop the constraint if needed
--
ALTER TABLE Course DROP CONSTRAINT fk_course;

--
-- Create the index
--
CREATE INDEX i_courseRegister ON Register (courseRegister);

--
-- Verify that it exists
--
exec sp_helpindex Register;

--
-- Drop and re-create the index
--
DROP INDEX Register.i_courseRegister;
CREATE CLUSTERED INDEX i_courseRegister ON Register (courseRegister);

--
-- Verify that it exists and what type it is
--
exec sp_helpindex Register;
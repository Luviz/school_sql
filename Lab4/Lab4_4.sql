--
-- Create the Program table
--
DROP TABLE Program
go
CREATE TABLE Program
(
	
    kodProgram CHAR(5) NOT NULL,
    benamnProgram VARCHAR(120) NOT NULL
);

--
-- Insert bulk data into Program table
-- File must be on same machine as databaseserver
--
BULK INSERT Program
    FROM 'E:\DatabaseTechnique\eduprogram.txt'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t',
        ROWTERMINATOR = '\n',
        CODEPAGE = 'ACP'        -- Coding of character set
    )
;

DROP INDEX register.i_courseRegister
CREATE CLUSTERED INDEX i_progReg ON Program (kodProgram)
CREATE CLUSTERED INDEX i_pRegister ON Register (progRegister)

SELECT * FROM Program;


------------------
SELECT *
FROM Register AS R
    INNER JOIN Course AS C
        ON R.courseRegister = C.codeCourse
    INNER JOIN Program AS P
        ON R.progRegister = P.kodProgram
WHERE
    progRegister IN ('TSWEH', 'TSWEK');

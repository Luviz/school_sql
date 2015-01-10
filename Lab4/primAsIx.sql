--
-- For BULK command
--
sp_addsrvrolemember dv1219_09_0,  bulkadmin;

--
-- For viewing the execution plan
--
use dv1219_09_0 grant SHOWPLAN to dv1219_09_0;

use dv1454_ht13_5
--
-- Create the Course table
--
DROP TABLE Course
go
CREATE TABLE Course
(
    codeCourse CHAR(6) NOT NULL,
    nameCourse VARCHAR(200) NOT NULL,
    pointsCourse DECIMAL(3,1) NOT NULL
);

--
-- Insert bulk data into Course table
-- File must be on same machine as databaseserver
--
BULK INSERT Course
    FROM 'E:\DatabaseTechnique\course.txt'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = '\t',
        ROWTERMINATOR = '\n',
        CODEPAGE = 'ACP'        -- Coding of character set
            )
;

SELECT * FROM Course;
SELECT * FROM Course WHERE codeCourse = 'DV1219';

--cearte a PK
ALTER TABLE Course ADD CONSTRAINT pk_codeCourse PRIMARY KEY (codeCourse);

SELECT * FROM Course WHERE codeCourse = 'DV1219';

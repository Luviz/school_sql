CREATE VIEW vRegister
AS
SELECT *
FROM Register AS R
    INNER JOIN Course AS C
        ON R.courseRegister = C.codeCourse
    INNER JOIN Program AS P
        ON R.progRegister = P.kodProgram;

SELECT * FROM vRegister;


-- 1
SELECT * FROM vRegister;
--0,593082
--59%
-- 2
SELECT codeCourse
FROM vRegister
WHERE instRegister = 'TAPS'
;

--0,192689
--19%

-- 3
SELECT progRegister, codeCourse, SUM(hstkRegister) AS hstk
FROM vRegister
WHERE instRegister = 'TAPS'
GROUP BY progRegister, codeCourse
ORDER BY progRegister
;
--0,215251
--22 %

----------------------

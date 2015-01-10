SELECT *
FROM Register AS R
    INNER JOIN Course AS C
        ON R.courseRegister = C.codeCourse
WHERE
    courseRegister = 'DV1219'
;
DROP INDEX register.i_courseRegister
CREATE CLUSTERED INDEX i_courseRegister ON Register(courseRegister)
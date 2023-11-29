	SELECT
    Student_ID,
    Group_ID,
    COUNT(*) AS TimesTaken,
    ROUND(AVG(Record_Average), 2) AS  WeightedAverage 
FROM
    People.TB_StudentRecord
WHERE
    Student_ID = 'A00013'
    AND Erased = 0 -- We consider only active records
GROUP BY
    Student_ID,
    Group_ID;

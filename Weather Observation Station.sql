/* 
Weather Observation Station 14: Hacker Rank
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to  decimal places.
*/
SELECT ROUND(MAX(LAT_N),4)
FROM STATION
WHERE LAT_N < 137.2345


/*
Weather Observation Station 15: Hacker Rank
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than  137.2345. Round your answer to  decimal places.
*/
SELECT ROUND(LONG_W, 4) AS LONG_W
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

/*
Weather Observation Station 16: Hacker Rank
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.
*/
SELECT ROUND(MIN(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7780

/*
Weather Observation Station 17: Hacker Rank
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.
*/
SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;

/*
Weather Observation Station 18: Hacker Rank
Consider P_1(a,b)and P_2(c,d) to be two points on a 2D plane.

 'a' happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 'b' happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 'c' happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 'd' happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P_1(a,b)and P_2(c,d) and round it to a scale of  decimal places.
*/
WITH manhattan AS (
    SELECT 
        MIN(LAT_N) AS a,
        MIN(LONG_W) AS b,
        MAX(LAT_N) AS c,
        MAX(LONG_W) AS d
    FROM STATION
)
SELECT ROUND(ABS(c - a) + ABS(d - b), 4) AS manhattan_distance
FROM manhattan;

/*
Weather Observation Station 19: Hacker Rank
Consider P_1(a,d) and P_2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and
(c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P_1 and P_2  and format your answer to display 4 decimal digits.
*/
WITH EUCLIDIAN AS (
    SELECT 
        MIN(LAT_N) AS a,
        MIN(LONG_W) AS b,
        MAX(LAT_N) AS c,
        MAX(LONG_W) AS d
    FROM STATION
)
SELECT ROUND(SQRT(POWER((c - a), 2) + POWER((d - b), 2)), 4) AS EUCLIDIAN_DISTANCE
FROM EUCLIDIAN;

/*
Weather Observation Station 20: Hacker Rack
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/
WITH OrderedData AS (
    SELECT
        LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM STATION
)
SELECT ROUND(AVG(LAT_N), 4) AS median
FROM OrderedData
WHERE row_num IN (FLOOR((total_count + 1) / 2.0), CEIL((total_count + 1) / 2.0));



/*
Write a query to print all prime numbers less than or equal to 1000 . Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).
*/
WITH RECURSIVE numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 1001
),
is_prime AS (
    SELECT 
        n.num,
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM numbers d 
                WHERE d.num < n.num AND n.num % d.num = 0 AND d.num > 1
            ) THEN 0 
            ELSE 1 
        END AS prime_flag
    FROM numbers n
)
SELECT GROUP_CONCAT(num SEPARATOR '&') AS primes
FROM is_prime
WHERE prime_flag = 1;

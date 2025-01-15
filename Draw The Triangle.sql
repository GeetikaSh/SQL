/*
Draw The Triangle 1: Hacker Rank
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20).
*/
CREATE TEMPORARY TABLE numbers (n INT);

INSERT INTO numbers VALUES (20), (19), (18), (17), (16), (15), (14), (13), (12), (11),
                            (10), (9), (8), (7), (6), (5), (4), (3), (2), (1);

SELECT REPEAT('* ', n) AS row_pattern
FROM numbers
ORDER BY n DESC;

/*
Draw The Triangle 2 : Hacker Rnak
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).
*/
CREATE TEMPORARY TABLE numbers (n INT);

INSERT INTO numbers VALUES (20), (19), (18), (17), (16), (15), (14), (13), (12), (11),
                            (10), (9), (8), (7), (6), (5), (4), (3), (2), (1);

SELECT REPEAT('* ', n) AS row_pattern
FROM numbers
ORDER BY n ASC;

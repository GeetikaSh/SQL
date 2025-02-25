/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges.
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score.
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.
*/
SELECT 
    h.hacker_id,
    h.name,
    SUM(t.max_score) AS total_score
FROM 
    hackers h
JOIN (
    SELECT 
        s.hacker_id,
        s.challenge_id,
        MAX(s.score) AS max_score
    FROM 
        submissions s
    GROUP BY 
        s.hacker_id, s.challenge_id
) t ON h.hacker_id = t.hacker_id
GROUP BY 
    h.hacker_id, h.name
HAVING 
    total_score > 0
ORDER BY 
    total_score DESC,
    h.hacker_id ASC;

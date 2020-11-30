-- ФИО
SELECT 'ФИО: Чувашов Владислав Максимович';

-- 1.1
SELECT * FROM movie.ratings LIMIT 10;
-- 1.2
SELECT
    *
FROM movie.links
WHERE
    imdbid LIKE "%42"
    AND movieid > 100
    AND movieid < 1000
LIMIT 10;

-- 2.1

SELECT
    DISTINCT(ml.imdbid)
FROM movie.links ml
INNER JOIN movie.ratings mr
    ON mr.movieid = ml.movieid
WHERE mr.rating = 5
LIMIT 10;

-- 3.1

SELECT
    COUNT(DISTINCT(ml.movieid))
FROM movie.links ml
LEFT JOIN movie.ratings mr
    ON ml.movieid = mr.movieid
WHERE mr.movieid is NULL;

-- 3.2

SELECT
    userid, avg(rating) as avg_rating
FROM movie.ratings
GROUP BY userid
HAVING avg(rating) > 3.5
LIMIT 10;

-- 4.1
SELECT
    ml.imdbid
FROM movie.links ml
WHERE ml.movieid IN (
    SELECT
        movieid
    FROM movie.ratings
    GROUP BY movieid
    HAVING avg(rating) > 3.5
)
LIMIT 10;


-- 4.2
WITH avg_user_ratings AS (
    SELECT
        userid, avg(rating) AS avg_user_rating
    FROM movie.ratings
    GROUP BY userid
    HAVING count(rating) > 10
)
SELECT avg(avg_user_rating) FROM avg_user_ratings;
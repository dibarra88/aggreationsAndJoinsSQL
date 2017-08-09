-- 
-- Get the average rating for a movie
SELECT 
    m.movieid, m.title, AVG(r.rating) AS averageRating
FROM
    movies m
        JOIN
    ratings r ON m.movieid = r.movieid
GROUP BY m.movieid
ORDER BY averageRating DESC;

-- Get the total ratings for a movie
SELECT 
    m.movieid, m.title, count(r.rating) AS totalRating
FROM
    movies m
        JOIN
    ratings r ON m.movieid = r.movieid
GROUP BY m.movieid
ORDER BY totalRating DESC;

-- Get the total movies for a genre
SELECT 
    mg.genre_id, COUNT(mg.genre_id) AS totalMovies
FROM
    movie_genre mg
GROUP BY mg.genre_id
ORDER BY mg.genre_id;

-- Get the average rating for a user
SELECT 
    userid, AVG(rating) AS averageRatingPerUser
FROM
    ratings
GROUP BY userid
ORDER BY averageRatingPerUser DESC;

-- Find the user with the most ratings
SELECT 
    userid, COUNT(userid) AS timesUserHadRated
FROM
    ratings
GROUP BY userid
ORDER BY timesUserHadRated DESC;

-- Find the user with the highest average rating
SELECT 
    userid,
    COUNT(userid) AS timesUserHadRated,
    AVG(rating) AS averageRating
FROM
    ratings
GROUP BY userid
ORDER BY timesUserHadRated DESC , averageRating DESC;

-- Find the user with the highest average rating with more than 50 reviews
SELECT 
    userid, COUNT(userid) AS timesUserHadRated
FROM
    ratings
GROUP BY userid
HAVING timesUserHadRated >= 50
ORDER BY timesUserHadRated DESC;

-- Find the movies with an average rating over 4
SELECT 
    *, AVG(rating) AS averageRating
FROM
    ratings
GROUP BY movieid
HAVING averageRating > 4
ORDER BY averageRating DESC;

-- For each genre find the total number of reviews as well as the average review sort by highest average review.
SELECT 
    g.genres,
    COUNT(r.rating) AS totalRatings,
    AVG(r.rating) AS averageRating
FROM
    genre g
        INNER JOIN
    movie_genre mg ON g.id = mg.genre_id
        INNER JOIN
    movies m ON mg.movieid = m.movieid
        INNER JOIN
    ratings r ON r.movieid = m.movieid
GROUP BY g.id
ORDER BY averageRating DESC;

-- Find all comedies
SELECT 
    m.title, m.genres
FROM
    movie_genre mg
        JOIN
    movies m ON mg.movieid = m.movieid
WHERE
    mg.genre_id = 2;
    
-- Find all comedies in the year 2000
SELECT 
    m.title, m.genres
FROM
    movie_genre mg
        JOIN
    movies m ON mg.movieid = m.movieid
WHERE
    mg.genre_id = 2
        AND m.title LIKE '%(2000)%';
        
 --  Find any movies that are about death and are a comedy      
SELECT 
    *
FROM
    movies m
        JOIN
    tags t ON m.movieid = t.movieid
WHERE
    genres LIKE '%comedy%'
        AND t.tag LIKE '%death%';
        
-- Find any movies from either 2001 or 2002 with a title containing super
SELECT 
    *
FROM
    movies
WHERE
    title LIKE '%super%'
        AND (title LIKE '%(2001)%'
        OR title LIKE '%(2002)%');
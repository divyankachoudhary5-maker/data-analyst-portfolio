select * from amazon_prime.credits;
select * from amazon_prime.titles;
-- Ques.1  List all movies released after 1925. 
SELECT 
    title, release_year
FROM
    titles
WHERE
    release_year > 1925;
    -- Find all TV shows with 26 seasons. 
    SELECT 
    title, seasons
FROM
    titles
WHERE
    seasons > 26;
    -- 3. Top 10 movies by IMDb score. 
    SELECT 
    title, imdb_score
FROM
    titles
WHERE
    type = 'Movie'
ORDER BY imdb_score DESC
LIMIT 10;
-- 4. Count of movies and TV shows by type. 
SELECT type, COUNT(*) AS total
FROM titles
GROUP BY type;
-- 5. Average IMDb score of movies released each year. 
SELECT release_year, ROUND(AVG(imdb_score),2) AS avg_imdb_score
FROM  titles
WHERE type = 'Movie'
GROUP BY release_year
ORDER BY release_year;
 -- 6. List all actors who acted in more than 5 movies. 
 SELECT name, COUNT(*) AS movie_count
FROM credits
WHERE role = 'Actor'
GROUP BY name
HAVING movie_count > 5
ORDER BY movie_count DESC;
-- 7. Join movies with cast to show actors per movie. 
SELECT name, COUNT(*) AS movie_count
FROM credits
WHERE role = 'Actor'
GROUP BY name
HAVING movie_count > 5
ORDER BY movie_count DESC;
-- 8. Find movies/TV shows in a specific genre (e.g., Comedy). 
SELECT title, genres
FROM titles
WHERE genres LIKE '%Comedy%';

-- 9. Count of movies per age certification**

SELECT age_certification, COUNT(*) AS total
FROM titles
GROUP BY age_certification;
-- 10. Longest movie runtime. 

SELECT title, runtime
FROM titles
WHERE type = 'Movie'
ORDER BY runtime DESC
LIMIT 1;
-- 11. Most popular TV show by TMDB popularity.

SELECT title, tmdb_popularity
FROM titles
WHERE type = 'TV Show'
ORDER BY tmdb_popularity DESC
LIMIT 1;
--  12. Actors who appeared in a movie released in 1940.

SELECT DISTINCT c.name
FROM credits c
JOIN titles t ON c.id = t.id
WHERE t.release_year = 1940 AND c.role = 'Actor';

 -- 13. Average IMDb score per genre.
SELECT genres, ROUND(AVG(imdb_score),2) AS avg_score
FROM titles
GROUP BY genres
ORDER BY avg_score DESC;

-- 14. Movies with more than 100,000 IMDb votes

SELECT title, imdb_votes, imdb_score
FROM titles
WHERE imdb_votes > 100000
ORDER BY imdb_votes DESC;

-- 15. List movies with no cast listed
SELECT t.title
FROM titles t
LEFT JOIN credits c ON t.id = c.id
WHERE c.id IS NULL;

--  16. Count movies by production country. 
SELECT production_countries, COUNT(*) AS total
FROM titles
GROUP BY production_countries
ORDER BY total DESC;


-- 17. Find movies with “Adventure” or “Action” genre. 
SELECT title, genres
FROM titles
WHERE genres LIKE '%Adventure%' OR genres LIKE '%Action%';

-- 18. Top 5 most prolific actors by number of roles. 
SELECT name, COUNT(*) AS total_roles
FROM credits
GROUP BY name
ORDER BY total_roles DESC
LIMIT 5;






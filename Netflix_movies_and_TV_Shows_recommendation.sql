-- Netflix Project

create table netflix (
	show_id varchar(50),
	type varchar(100),
	title varchar(200),
	director varchar(300),
	casts varchar(1000),
	country varchar(200),
	date_added varchar(100),
	release_year int,
	rating varchar(50),
	duration varchar(50),
	listed_in varchar(100),
	description varchar(300)


);

select * from netflix;

-- 1. count the number of Movies vs TV shows.

SELECT
	TYPE,
	COUNT(*) AS TOTAL_COUNT
FROM
	NETFLIX
GROUP BY
	TYPE;

--2. find the most common rating for movies and tv shows.

SELECT
	TYPE,
	RATING,
	COUNT(*) AS TOTAL_COUNT
FROM
	NETFLIX
GROUP BY
	TYPE,
	RATING
ORDER BY
	TYPE,
	TOTAL_COUNT DESC;
	
--3. find the top 5 countries with the most content on Netflix.

SELECT
	TRIM(UNNEST(STRING_TO_ARRAY(COUNTRY, ','))) AS COUNTRY_NAME,
	COUNT(*) AS TOTAL_CONTENT
FROM
	NETFLIX
WHERE
	COUNTRY IS NOT NULL
GROUP BY
	COUNTRY_NAME
ORDER BY
	TOTAL_CONTENT DESC
LIMIT
	5;
	
--4. list all movies released in a specific year (e.g., 2020).

SELECT
	TITLE,
	DIRECTOR,
	RELEASE_YEAR,
	RATING,
	DURATION
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND RELEASE_YEAR = 2020;
	

--5. find content added in the last 5 years.

SELECT
	TITLE,
	TYPE,
	DATE_ADDED
FROM
	NETFLIX
WHERE
	TO_DATE(DATE_ADDED, 'Month DD YYYY') >= CURRENT_DATE - INTERVAL '5 years'
ORDER BY
	TO_DATE(DATE_ADDED, 'Month DD YYYY') DESC;
	
--6. find all the movies/tv shows by director 'Rajiv Chilaka'.

SELECT
	SHOW_ID,
	TYPE,
	TITLE,
	DIRECTOR,
	RELEASE_YEAR
FROM
	NETFLIX
WHERE
	DIRECTOR LIKE '%Rajiv Chilaka%';
	
--7. list all tv shows with more than 5 seasons.

SELECT
	TITLE,
	DURATION
FROM
	NETFLIX
WHERE
	TYPE = 'TV show'
	AND CAST(SPLIT_PART(DURATION, '', 1) AS INTEGER) > 5
ORDER BY
	CAST(SPLIT_PART(DURATION, '', 1) AS INTEGER) DESC;
	
--8. count the number of content items in each genre.

SELECT
	TRIM(UNNEST(STRING_TO_ARRAY(LISTED_IN, ','))) AS GENRE_NAME,
	COUNT(*) AS TOTAL_CONTENT
FROM
	NETFLIX
GROUP BY
	GENRE_NAME
ORDER BY
	TOTAL_CONTENT DESC;
	
--9. find the average release year for content product in a specific country.

SELECT
	ROUND(AVG(RELEASE_YEAR), 0) AS AVERAGE_RELEASE_YEAR
FROM
	NETFLIX
WHERE
	COUNTRY LIKE '%India%';
	
--10. list all movies that are documentaries.

SELECT
	SHOW_ID,
	TYPE,
	TITLE,
	LISTED_IN
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND LISTED_IN LIKE '%Documentaries%';
	
--11. find all content without a director.

SELECT
	SHOW_ID,
	TYPE,
	TITLE,
	DIRECTOR
FROM
	NETFLIX
WHERE
	DIRECTOR IS NULL;
	
--12. find how many movies actor 'Salman Khan' appeared in last 10 years.

SELECT
	COUNT(*) AS MOVIE_COUNT
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND CASTS LIKE '%Salman Khan%'
	AND RELEASE_YEAR >= 2016;
	
--13. find the top 10 actors who have appeared in the highest number of movies produced in India.

SELECT
	TRIM(UNNEST(STRING_TO_ARRAY(CASTS, ','))) AS ACTOR_NAME,
	COUNT(*) AS TOTAL_APPERANCES
FROM
	NETFLIX
WHERE
	COUNTRY LIKE '&India%'
	AND TYPE = 'Movie'
GROUP BY
	ACTOR_NAME
ORDER BY
	TOTAL_APPERANCES DESC
LIMIT
	10;
	
/* 14. categories the content based on the production on the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. count how many items fall into each category. */

SELECT
	CASE
		WHEN DESCRIPTION LIKE '%kill%'
		OR DESCRIPTION LIKE '%violence%' THEN 'bad'
		ELSE 'good'
	END AS CATEGORY,
	COUNT(*) AS TOTAL_COUNT
FROM
	NETFLIX
GROUP BY
	CATEGORY;
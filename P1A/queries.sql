-- Returns the names of all the actors in the movie ‘Die Another Day’.

SELECT CONCAT(A.first, " ", A.last) AS ActorName
FROM Actor A, Movie M, MovieActor MA
WHERE MA.aid = A.id
AND MA.mid = M.id
AND M.title = 'Die Another Day';

-- Returns the count of all the actors who acted in multiple movies.

SELECT COUNT(*) AS NumActors
FROM (
     SELECT COUNT(*)
     FROM MovieActor MA
     GROUP BY MA.aid
     HAVING COUNT(*) > 1) ActorsCount;

-- Returns the title of movies that sold more than 1,000,000 tickets.

SELECT M.title AS title
FROM Movie M, Sales S
WHERE M.id = S.mid
AND S.ticketsSold > 1000000;

-- Returns all movie titles with actor “George Clooney” made before the year 2000.

SELECT M.title AS title
FROM MovieActor MA, Movie M, Actor A
WHERE MA.mid = M.id
AND MA.aid = A.id
AND A.first = 'George'
AND A.last = 'Clooney'
AND M.year < 2000;

-- Returns total amount of income by each movie genre in descending order

SELECT genre, SUM(totalIncome) AS totalSales
FROM (
	SELECT MG.genre AS genre, S.totalIncome AS totalIncome
	FROM MovieGenre MG, Sales S
	WHERE MG.mid = S.mid) GenreIncome
GROUP BY genre
ORDER BY totalSales DESC;

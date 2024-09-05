-- List all movies with their genres and average ratings:
SELECT title, genre, average_rating
FROM Movies
ORDER BY average_rating DESC;

-- Find users who have subscribed to the Premium subscription plan:
SELECT username, email
FROM Users
WHERE subscription_type = 'Premium';

-- Retrieve all reviews for a specific movie ordered by date:
SELECT u.username, r.review_text, r.reviewed_at
FROM Reviews r
JOIN Users u ON r.user_id = u.user_id
WHERE r.movie_id = 1  -- Movie ID for 'Inception'
ORDER BY r.reviewed_at DESC;

-- Find the top 5 most-watched movies in the last 30 days:
SELECT m.title, COUNT(v.viewing_id) AS view_count
FROM ViewingHistory v
JOIN Movies m ON v.movie_id = m.movie_id
WHERE v.watched_at >= CURDATE() - INTERVAL 30 DAY
GROUP BY m.title
ORDER BY view_count DESC
LIMIT 5;

-- Calculate the average rating for each genre:
SELECT genre, AVG(r.rating) AS average_genre_rating
FROM Movies m
JOIN Ratings r ON m.movie_id = r.movie_id
GROUP BY genre
ORDER BY average_genre_rating DESC;

-- Identify users who have watched at least 3 different genres in the past month:
SELECT v.user_id, u.username, COUNT(DISTINCT m.genre) AS genre_count
FROM ViewingHistory v
JOIN Movies m ON v.movie_id = m.movie_id
JOIN Users u ON v.user_id = u.user_id
WHERE v.watched_at >= CURDATE() - INTERVAL 30 DAY
GROUP BY v.user_id
HAVING genre_count >= 3;

-- Calculate the churn rate of users (percentage of users who did not renew their subscription):
SLECT (COUNT(*) FILTER(WHERE end_date < CURDATE()) * 100.0 / COUNT(*)) AS churn_rate
FROM Subscriptions;

-- Stored Procedure to Add a New Movie:




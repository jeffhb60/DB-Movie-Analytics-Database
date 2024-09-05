-- Popular Movies View
CREATE VIEW PopularMovies AS
SELECT title, genre, average_rating
FROM Movies
WHERE average_rating >= 4.0;

-- User Viewing Stats View
CREATE VIEW UserViewingStats AS
SELECT 
    u.user_id, 
    u.username,
    COUNT(v.viewing_id) AS total_movies_watched,
    AVG(v.duration_watched) AS average_duration_watched
FROM Users u
LEFT JOIN ViewingHistory v ON u.user_id = v.user_id
GROUP BY u.user_id;

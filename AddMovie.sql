-- Stored Procedure to Add a New Movie:
DELIMITER //
CREATE PROCEDURE AddMovie(
    IN title VARCHAR(150),
    IN release_date DATE,
    IN genre VARCHAR(50),
    IN language VARCHAR(50),
    IN duration INT,
    IN director_id INT
)
BEGIN
    INSERT INTO Movies (title, release_date, genre, language, duration, director_id)
    VALUES (title, release_date, genre, language, duration, director_id);
END //
DELIMITER ;

-- Function to Calculate Average Rating for a Movie:
DELIMITER //
CREATE FUNCTION GetAverageRating(movieId INT) RETURNS DECIMAL(3, 2)
BEGIN
    DECLARE avgRating DECIMAL(3, 2);
    SELECT AVG(rating) INTO avgRating
    FROM Ratings
    WHERE movie_id = movieId;
    RETURN avgRating;
END //
DELIMITER ;


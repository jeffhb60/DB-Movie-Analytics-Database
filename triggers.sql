-- Trigger to Update the average_rating in the Movies Table
DELIMITER //
CREATE TRIGGER UpdateAverageRating
AFTER INSERT ON Ratings
FOR EACH ROW
BEGIN
    DECLARE new_avg_rating DECIMAL(3, 2);
    SELECT AVG(rating) INTO new_avg_rating
    FROM Ratings
    WHERE movie_id = NEW.movie_id;
    
    UPDATE Movies
    SET average_rating = new_avg_rating
    WHERE movie_id = NEW.movie_id;
END //
DELIMITER ;

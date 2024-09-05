-- Insert data into Directors
INSERT INTO Directors (name, birth_date, nationality) VALUES 
('Steven Spielberg', '1946-12-18', 'American'),
('Christopher Nolan', '1970-07-30', 'British-American'),
('Martin Scorsese', '1942-11-17', 'American');

-- Insert data into Movies
INSERT INTO Movies (title, release_date, genre, language, duration, director_id) VALUES
('Inception', '2010-07-16', 'Sci-Fi', 'English', 148, 2),
('Jurassic Park', '1993-06-11', 'Adventure', 'English', 127, 1),
('The Irishman', '2019-11-27', 'Crime', 'English', 209, 3);

-- Insert data into Users
INSERT INTO Users (username, email, password, subscription_type) VALUES 
('john_doe', 'john@example.com', 'hashed_password1', 'Premium'),
('jane_smith', 'jane@example.com', 'hashed_password2', 'Basic'),
('alice_wonder', 'alice@example.com', 'hashed_password3', 'Free');

-- Insert data into Ratings
INSERT INTO Ratings (user_id, movie_id, rating) VALUES
(1, 1, 4.5),
(2, 1, 5.0),
(1, 2, 4.0),
(3, 3, 3.5);

-- Insert data into Reviews
INSERT INTO Reviews (user_id, movie_id, review_text) VALUES
(1, 1, 'Amazing movie with mind-bending plot twists!'),
(2, 2, 'Classic adventure with groundbreaking visual effects.'),
(3, 3, 'A bit long, but great performances by the cast.');

-- Insert data into Subscriptions
INSERT INTO Subscriptions (user_id, start_date, end_date, subscription_type) VALUES
(1, '2024-01-01', '2025-01-01', 'Premium'),
(2, '2024-03-15', '2025-03-15', 'Basic');

-- Insert data into ViewingHistory
INSERT INTO ViewingHistory (user_id, movie_id, watched_at, duration_watched) VALUES
(1, 1, '2024-08-01 14:30:00', 148),
(2, 2, '2024-08-02 19:00:00', 127),
(3, 3, '2024-08-03 21:15:00', 120);

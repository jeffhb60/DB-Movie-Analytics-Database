# Movie Analytics Database
## Project Overview
The **Movie Analytics Database** project is a comprehensive SQL-based project that simulates a movie streaming platform's database system. This project involves creating a well-structured relational database to store and analyze data related to movies, users, ratings, reviews, subscriptions, and viewing history. The project demonstrates various SQL skills, including schema design, data manipulation, complex querying, stored procedures, functions, views, triggers, and performance optimization.
## Table of Contents
1. [Project Features](#project-features)
2. [Database Schema](#database-schema)
3. [Data Ingestion](#data-ingestion)
4. [SQL Queries](#sql-queries)
5. [Stored Procedures and Functions](#stored-procedures-and-functions)
6. [Views](#views)
7. [Triggers](#triggers)
8. [Performance Optimization](#performance-optimization)
9. [Setup Instructions](#setup-instructions)
10. [Data Insights and Visualizations](#data-insights-and-visualizations)

## Project Features
- **Relational Database Schema**: Design of a normalized database schema with tables for `Movies`, `Users`, `Directors`, `Ratings`, `Reviews`, `Subscriptions`, and `ViewingHistory`.
- **Data Ingestion**: Scripts to populate tables with realistic sample data.
- **Complex SQL Queries**: A variety of SQL queries to analyze data, such as finding the most popular movies, calculating user engagement, and determining subscription trends.
- **Stored Procedures and Functions**: Automated tasks using stored procedures and functions, including inserting new movies and calculating average ratings.
- **Views**: Creation of views for commonly used queries and data aggregation.
- **Triggers**: Automated updates and data integrity checks using triggers.
- **Performance Optimization**: Use of indexes, query optimization techniques, and analysis of query execution plans.

## Database Schema
The database consists of the following tables:
- **Directors**: Stores information about movie directors.
- **Movies**: Stores movie details, including title, genre, release date, and average rating.
- **Users**: Stores user information, including username, email, and subscription type.
- **Ratings**: Stores user ratings for movies.
- **Reviews**: Stores user reviews for movies.
- **Subscriptions**: Stores subscription details for users.
- **ViewingHistory**: Stores users' movie-watching history.

### ER Diagram
![ER Diagram](er_diagram.png)  <!-- You can replace this with an actual ER diagram image file if available. -->

## Data Ingestion
Sample data is provided for each table to simulate a real-world scenario:

```sql
-- Sample data for Movies table
INSERT INTO Movies (title, release_date, genre, language, duration, director_id) VALUES
('Inception', '2010-07-16', 'Sci-Fi', 'English', 148, 2),
('Jurassic Park', '1993-06-11', 'Adventure', 'English', 127, 1),
('The Irishman', '2019-11-27', 'Crime', 'English', 209, 3);
```
Additional sample data is available in the `data_ingestion.sql` file.

## SQL Queries
The project includes several complex SQL queries to analyze data:
1. **Find the Top 5 Most-Watched Movies in the Last 30 Days:**
      ```sql
      SELECT m.title, COUNT(v.viewing_id) AS view_count
      FROM ViewingHistory v
      JOIN Movies m ON v.movie_id = m.movie_id
      WHERE v.watched_at >= CURDATE() - INTERVAL 30 DAY
      GROUP BY m.title
      ORDER BY view_count DESC
      LIMIT 5;
      ```  
2. **Calculate the Average Rating for Each Genre:**
     ```sql
     SELECT genre, AVG(r.rating) AS average_genre_rating
     FROM Movies m
     JOIN Ratings r ON m.movie_id = r.movie_id
     GROUP BY genre
     ORDER BY average_genre_rating DESC;
     ```
Additional SQL queries can be found in the `queries.sql` file.

## Stored Procedures and Functions

1. **Stored Procedure to Add a New Movie:**
   
      ```sql
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
    
      ```
2. **Function to Calculate Average Rating for a Movie**
   
      ```sql
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
      ```
## Views
1. **Popular Movie Views**
   
    ```sql
    CREATE VIEW PopularMovies AS
    SELECT title, genre, average_rating
    FROM Movies
    WHERE average_rating >= 4.0;
    ```
    
2. **User Viewing Stats View**
   
    ```sql
    CREATE VIEW UserViewingStats AS
    SELECT 
        u.user_id, 
        u.username,
        COUNT(v.viewing_id) AS total_movies_watched,
        AVG(v.duration_watched) AS average_duration_watched
    FROM Users u
    LEFT JOIN ViewingHistory v ON u.user_id = v.user_id
    GROUP BY u.user_id;
    ```
## Triggers
1. **Trigger to Update the `average_rating` in the `Movies` Table:**

    ```sql
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
    ```
## Performance Optimization

### Indexes
> Indexes are added to columns that are frequently used in `WHERE` clauses and joins, such as `movie_id`, `user_id`, and `genre`.

### Query Optimization
> Queries are optimized using the `EXPLAIN` command to analyze execution plans and improve performance.


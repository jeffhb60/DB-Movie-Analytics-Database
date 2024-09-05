-- Add Indexes: Ensure indexes are on columns frequently used in WHERE clauses or joins
CREATE INDEX idx_movies_genre ON Movies(genre);
CREATE INDEX idx_viewing_history_user_movie ON ViewingHistory(user_id, movie_id);

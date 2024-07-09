use Spotify

SELECT TOP 50 *
FROM [spotify-2023];



--streams and artists names not to be null, but let's check--

SELECT COUNT(*)
FROM [spotify-2023]
WHERE streams IS NULL OR artist_s_name IS NULL;

DELETE FROM [spotify-2023]
WHERE streams IS NULL OR artist_s_name IS NULL;

--Top 10 Songs by Streams--

SELECT TOP 10 track_name, artist_s_name, streams
FROM [spotify-2023]
ORDER BY streams DESC;

--Number of Songs Released per Year--

SELECT released_year, COUNT(*) AS song_count
FROM [Spotify-2023]
GROUP BY released_year
ORDER BY released_year;

--Average Streams per Song per Year--

SELECT released_year, AVG(streams) AS avg_streams
FROM [Spotify-2023]
GROUP BY released_year
ORDER BY released_year;

--Average Danceability, Energy, and Valence by Year--

SELECT released_year,
       AVG(danceability) AS avg_danceability,
       AVG(energy) AS avg_energy,
       AVG(valence) AS avg_valence
FROM [Spotify-2023]
GROUP BY released_year
ORDER BY released_year;

--Distribution of Songs Across Playlists and Charts--

SELECT 
    SUM(in_spotify_playlists) AS total_spotify_playlists,
    SUM(in_spotify_charts) AS total_spotify_charts,
    SUM(in_apple_playlists) AS total_apple_playlists,
    SUM(in_apple_charts) AS total_apple_charts,
    SUM(in_deezer_playlists) AS total_deezer_playlists,
    SUM(in_deezer_charts) AS total_deezer_charts
FROM [Spotify-2023];


--Songs with the Highest Danceability--

SELECT TOP 10 track_name, artist_s_name, danceability
FROM [Spotify-2023]
ORDER BY danceability DESC;

--Artists with the Most Songs in the Dataset--

SELECT artist_s_name, COUNT(*) AS song_count
FROM [Spotify-2023]
GROUP BY artist_s_name
ORDER BY song_count DESC;

--Percentage of Songs Released in 2023--

WITH SongCounts AS (
  SELECT
    COUNT(*) AS total_count,
    SUM(CASE WHEN released_year = 2023 THEN 1 ELSE 0 END) AS count_2023
  FROM [Spotify-2023]
)
SELECT
  (count_2023 * 100.0 / total_count) AS percentage_released_in_2023
FROM SongCounts;

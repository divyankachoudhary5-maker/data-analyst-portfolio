SELECT 
    *
FROM
    spotify_data_analysis.spotify_data;
    
-- 1.Total number of tracks, artists, and albums in the dataset.

SELECT 
    COUNT(DISTINCT track) AS total_tracks,
    COUNT(DISTINCT artist) AS total_artists,
    COUNT(DISTINCT album) AS total_albums
FROM
    spotify_data;  
  
  --  2.List the top 10 most viewed tracks along with their artists and total views.
SELECT 
    artist, track, Views
FROM
    spotify_data
ORDER BY views DESC
LIMIT 10;

-- 3. Find the average energy, danceability, and valence for each album type.
SELECT 
    ROUND(AVG(energy), 2) AS avg_energy,
    ROUND(AVG(danceability),2) AS avg_danceability,
    ROUND(AVG(valence), 2) AS avg_valence
FROM
    spotify_data
GROUP BY Album_type;
  
-- 4. Which artist has uploaded the most tracks?
SELECT 
    artist, COUNT(*) AS total_tracks
FROM
    spotify_data
GROUP BY artist
ORDER BY total_tracks DESC
LIMIT 1;

-- 5. Find the total views and likes for official vs. non-official videos.alter.
SELECT 
    official_video,
    SUM(views) AS total_views,
    SUM(likes) AS toatl_likes
FROM
    spotify_data
GROUP BY official_video;

-- 6. Top 5 artists with the highest total streams.

SELECT 
    artist, COUNT(stream) AS total_streams
FROM
    spotify_data
GROUP BY artist
ORDER BY total_streams DESC
LIMIT 5;

-- 7. Find the track with the highest likes-to-views ratio.
select track, 
round((cast(likes as float)/ views)*100,2) as like_percentage

   from
   
       spotify_data
   where views > 0
   order by like_percentage desc
   limit 1;
   
   -- 8. Average track duration per artist (in minutes)
   SELECT 
    artist, ROUND(AVG(duration_min), 2) AS avg_duration
FROM
    spotify_data
GROUP BY artist
ORDER BY avg_duration;
-- 9. Most engaging songs — top 10 by (likes + comments) per minute.
SELECT 
    track,
    artist,
   round((likes + comments) / duration_min,2) AS engagment_per_min
FROM
    spotify_data
WHERE
    Duration_min > 0
ORDER BY engagment_per_min
LIMIT 10;

-- 10. Which platform (`most_playedon`) contributes the highest total streams?
select most_playedon,
 sum(stream) as total_streams from spotify_data
 group by most_playedon
 order by total_streams desc
 limit 1;
 
 




    
    
    
    
    
    
    
    
    
    
    
    
    
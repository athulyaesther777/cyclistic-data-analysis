-- =========================================================
-- Cyclistic Bike Share Analysis
-- Author: Esther
-- Description: Analysis of user behavior (casual vs member)
-- =========================================================


-- ==============================
-- 1. DATA PREVIEW
-- ==============================
SELECT *
FROM cyclist_info
LIMIT 10;


-- ==============================
-- 2. TOTAL RIDES BY USER TYPE
-- ==============================
SELECT 
    member_casual, 
    COUNT(*) AS total_rides
FROM cyclist_info
GROUP BY member_casual
ORDER BY total_rides DESC;


-- ==============================
-- 3. AVERAGE RIDE LENGTH
-- ==============================
SELECT 
    member_casual, 
    AVG(ride_length) AS avg_ride_length
FROM cyclist_info
GROUP BY member_casual
ORDER BY avg_ride_length DESC;


-- ==============================
-- 4. RIDES BY DAY OF WEEK
-- ==============================
SELECT 
    day_of_week, 
    COUNT(*) AS total_rides
FROM cyclist_info
GROUP BY day_of_week
ORDER BY total_rides DESC;


-- ==============================
-- 5. RIDES BY DAY + USER TYPE
-- ==============================
SELECT 
    member_casual,
    day_of_week,
    COUNT(*) AS total_rides
FROM cyclist_info
GROUP BY member_casual, day_of_week
ORDER BY total_rides DESC;


-- ==============================
-- 6. TOP 10 START STATIONS
-- ==============================
SELECT 
    start_station_name,
    COUNT(*) AS total_rides
FROM cyclist_info
WHERE start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;


-- ==============================
-- 7. TOP STATION PER USER TYPE
-- ==============================
SELECT *
FROM (
    SELECT 
        member_casual,
        start_station_name,
        COUNT(*) AS total_rides,
        RANK() OVER (
            PARTITION BY member_casual 
            ORDER BY COUNT(*) DESC
        ) AS rank
    FROM cyclist_info
    WHERE start_station_name IS NOT NULL
    GROUP BY member_casual, start_station_name
) t
WHERE rank = 1;


-- ==============================
-- 8. MOST PREFERRED DAY PER USER TYPE
-- ==============================
SELECT *
FROM (
    SELECT 
        member_casual,
        day_of_week,
        COUNT(*) AS total_rides,
        RANK() OVER (
            PARTITION BY member_casual 
            ORDER BY COUNT(*) DESC
        ) AS rank
    FROM cyclist_info
    GROUP BY member_casual, day_of_week
) t
WHERE rank = 1;


-- ==============================
-- 9. LEAST PREFERRED DAY PER USER TYPE
-- ==============================
SELECT *
FROM (
    SELECT 
        member_casual,
        day_of_week,
        COUNT(*) AS total_rides,
        RANK() OVER (
            PARTITION BY member_casual 
            ORDER BY COUNT(*) ASC
        ) AS rank
    FROM cyclist_info
    GROUP BY member_casual, day_of_week
) t
WHERE rank = 1;


-- ==============================
-- 10. STATION + DAY ANALYSIS
-- ==============================
SELECT 
    start_station_name,
    day_of_week,
    COUNT(*) AS total_rides
FROM cyclist_info
WHERE start_station_name IS NOT NULL
GROUP BY start_station_name, day_of_week
ORDER BY total_rides DESC
LIMIT 10;

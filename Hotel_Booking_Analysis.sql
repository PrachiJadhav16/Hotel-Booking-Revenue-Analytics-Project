CREATE DATABASE hotel_analytics;
USE hotel_analytics;

SHOW DATABASES;

SELECT COUNT(*) AS total_bookings
FROM Hotel_bookings;

SHOW COLUMNS FROM Hotel_bookings;
USE hotel_analytics;

# Check duplicate id's 
SELECT
    COUNT(*) AS total_rows,
    COUNT(Booking_ID) AS ids_present,
    COUNT(DISTINCT Booking_ID) AS unique_ids
FROM hotel_bookings;

# Revenue analysis
SELECT
    SUM(Net_Revenue) AS total_revenue,
    AVG(Net_Revenue) AS average_revenue
FROM hotel_bookings;

# City-wise Revenue 
SELECT
    City,
    SUM(`Revenue After Discount`) AS total_revenue
FROM Hotel_Booking_Final
GROUP BY City
ORDER BY total_revenue DESC;

# Hotel Type-wise Bookings
SELECT
    Hotel_Type,
    COUNT(Booking_ID) AS total_bookings
FROM Hotel_bookings
GROUP BY Hotel_Type
ORDER BY total_bookings DESC;

# Booking Channel Analysis
SELECT
    Booking_Channel,
    COUNT(Booking_ID) AS total_bookings
FROM Hotel_bookings
GROUP BY Booking_Channel
ORDER BY total_bookings DESC;

# Booking Status Analysis
SELECT
    Booking_Status,
    COUNT(Booking_ID) AS total_bookings
FROM Hotel_bookings
GROUP BY Booking_Status
ORDER BY total_bookings DESC;

# Customer Type Analysis
SELECT
    Customer_Type,
    COUNT(Booking_ID) AS total_bookings
FROM Hotel_bookings
GROUP BY Customer_Type
ORDER BY total_bookings DESC;

# Monthly Revenue Analysis
SELECT
    DATE_FORMAT(Booking_Date, '%Y-%m') AS booking_month,
    SUM(`Revenue After Discount`) AS monthly_revenue
FROM Hotel_bookings
GROUP BY DATE_FORMAT(Booking_Date, '%Y-%m')
ORDER BY booking_month;

# Top 5 Cities by Revenue
SELECT
    City,
    SUM(`Revenue After Discount`) AS total_revenue
FROM Hotel_bookings
GROUP BY City
ORDER BY total_revenue DESC
LIMIT 5;

# Average Booking Revenue
SELECT
    SUM(`Revenue After Discount`) /
    COUNT(DISTINCT Booking_ID) AS avg_booking_revenue
FROM Hotel_bookings;

# City-wise Total Bookings and Average Revenue
SELECT
    City,
    COUNT(DISTINCT Booking_ID) AS total_bookings,
    SUM(`Revenue After Discount`) AS total_revenue,
    AVG(`Revenue After Discount`) AS avg_revenue_per_row
FROM Hotel_bookings
GROUP BY City
ORDER BY total_revenue DESC;

# Canacellation Rate (%)
SELECT
    COUNT(CASE
        WHEN Booking_Status = 'Cancelled' THEN 1
    END) * 100.0 / COUNT(*) AS cancellation_rate
FROM Hotel_bookings;

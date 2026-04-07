# 🚴 Cyclistic Bike Share Case Study

## 1. Business Task

Cyclistic wants to increase the number of annual memberships because annual members are more profitable than casual riders.  
The business task is to understand how casual riders and annual members use Cyclistic bikes differently so the marketing team can design strategies that encourage casual riders to become annual members.

## 2. Stakeholders

- Lily Moreno — Director of Marketing
- Cyclistic Marketing Analytics Team
- Cyclistic Executive Team
- Data Analytics Team

## 3. Data Source

The analysis uses Cyclistic’s historical trip data covering the previous 12 months.  
This is structured transactional data, where each row represents one bike trip.

### Main fields used
- Ride ID
- Start and end timestamps
- Ride duration
- Start station and end station
- User type (`casual` or `member`)

### Data limitations
- No personal or demographic data
- No way to identify individual riders across multiple trips
- No external context such as weather, events, or holidays
- Privacy restrictions prevent linking rides to specific people

## 4. Data Cleaning & Processing

I used SQL in DuckDB to clean and prepare the data for analysis.

### Cleaning steps
- Checked for missing values and duplicate records
- Standardized date and time fields
- Converted timestamp text into usable datetime values
- Created a `ride_length` column to measure trip duration
- Created a `day_of_week` column to identify the day each ride started
- Fixed inconsistent values in day names
- Removed invalid ride durations such as negative or unrealistic values
- Verified that station names and user types were consistent

### Validation steps
- Checked data types
- Reviewed distinct values in important columns
- Confirmed that ride duration and day-of-week calculations were correct
- Ensured the cleaned dataset was ready for aggregation and visualization

## 5. Analysis Summary

I performed a comparative analysis between casual riders and annual members.  
The goal was to identify differences in ride duration, ride frequency, day-of-week behavior, and station usage.

### Metrics analyzed
- Average ride duration
- Total number of rides
- Rides by day of week
- Rides by user type
- Top stations used by each user type
- Location-based ride patterns

## 6. Key Findings

### Ride duration
Casual riders have much longer average ride durations than annual members.

### Ride frequency
Annual members ride more frequently than casual riders.

### Day-of-week patterns
- Casual riders are most active on weekends, especially Sunday
- Annual members are more active during weekdays, especially Monday to Friday
- Both groups show lower activity in the middle of the week

### Station usage
- High ride density is concentrated in central Chicago
- Some stations, such as Clark St & Elm St, show consistently high usage
- The most active stations are useful targets for campaign planning

### Overall behavior
- Casual riders appear to use bikes for leisure or recreation
- Annual members appear to use bikes for regular commuting or routine travel

## 7. Supporting Visualizations

The dashboard includes:
- Ride distribution by user type
- Average ride length by user type
- Ride count by day of week
- Top stations by usage
- Map of ride density and station concentration

## 8. Recommendations

### 1. Target casual riders on weekends
Weekend campaigns should focus on casual riders because that is when they are most active.

### 2. Highlight cost savings
Show casual riders how much they could save by switching to annual membership if they ride often.

### 3. Use location-based marketing
Focus promotions on high-traffic stations in central Chicago where ride activity is strongest.

## 9. Conclusion

The analysis shows a clear difference between casual riders and annual members.  
Casual riders take longer and less frequent rides, mostly on weekends.  
Annual members take shorter but more frequent rides, mostly during weekdays.

These findings suggest that Cyclistic can increase annual memberships by targeting casual riders with weekend-focused campaigns, cost-saving messages, and location-based promotions at high-traffic stations.

## 10. Portfolio Summary

This project used SQL and Tableau to analyze Cyclistic bike-share data and identify behavioral differences between casual riders and annual members.  
The analysis showed that casual riders are more leisure-focused, while members are more routine-focused.  
Based on these insights, I recommended targeted marketing strategies to improve membership conversion and support business growth.

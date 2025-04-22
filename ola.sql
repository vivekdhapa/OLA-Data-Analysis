Create Database Ola;
Use Ola;
#1 .retrive data of all successful bookings
Create View Successful_Bookings As
select * From Bookings 
where Booking_Status = 'Success';


select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type
Create View ride_distance_for_each_vehicleType As
select Vehicle_Type, AVG(Ride_Distance)
as avg_distance From Bookings
Group by Vehicle_Type;

select * from ride_distance_for_each_vehicleType;


#3. get the total number of canceled rides by customers:
create view Canceled_by_customers as 
Select count(*) From Bookings 
where Booking_Status = 'Canceled by Customer';
 
 select * from Canceled_by_customers;
 
 
 #4. list the top 5 customers who booked the highest numner of rides:
 create view Top_5_customers as 
 select Customer_ID , count(Booking_ID) as total_rides
 From Bookings
 group by Customer_ID
 order by total_rides Desc Limit 5;
 
 select * from Top_5_customers;
 
# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_driver as
select count(*) from Bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from cancelled_by_driver;


-#- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view min_max_rating_of_prime_sadan_drivers as
select MAX(Driver_Ratings) as max_ratings,
MIN(Driver_Ratings) as min_ratings from Bookings 
where Vehicle_Type = 'Prime Sedan';

select * from min_max_rating_of_prime_sadan_drivers;


#-- 7. Retrieve all rides where payment was made using UPI:
select * from Bookings where Payment_Method = 'UPI';

#-- 8. Find the average customer rating per vehicle type:
select Vehicle_Type , AVG(Customer_Rating) as avg_customer_rating
from Bookings group by Vehicle_Type;
 
#-- 9. Calculate the total booking value of rides completed successfully:
select SUM(Booking_Value) as total_successful_value
from Bookings where Booking_Status = 'Success';

#-- 10. List all incomplete rides along with the reason:
select Booking_ID , Incomplete_Rides_Reason 
from Bookings 
where Incomplete_Rides = 'Yes';


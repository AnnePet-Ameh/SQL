select *
from "taxi_trip"
limit 10;
--Q1 AVERAGE NUMBER OF TRIPS ON SATURDAYS
select "week_days", avg("num_trip") as "ave_num_trip"
from 

(select  count("trip_distance") as "num_trip", to_char("tpep_dropoff_datetime", 'day') as "week_days"
from "taxi_trip"
group by "week_days"
order by "num_trip" desc) as "tab1"

where "week_days" like '%atur%'
group by "week_days"
limit 10;


--Q2 AVERAGE NUMBER FARE_AMOUNT PER TRIP ON SATURDAY
select avg("fare_amount") as "ave_fare_amt", "week_days"
from

(select "fare_amount", to_char("tpep_dropoff_datetime",'day') as "week_days"
from "taxi_trip"
group by "week_days", "fare_amount") as "tab3"

where "week_days" like '%atur%'
group by "week_days"
order by "ave_fare_amt";

--Q3 AVERAGE DURATION PER TRIP ON SATURDAY
select avg("duration") as "ave_duration", "week_days"
from
(select  extract(minute from "diff_time") as "duration", "week_days"
from
(select "diff_time", to_char("tpep_dropoff_datetime",'day') as "week_days"
from
(select "trip_distance", "tpep_dropoff_datetime", ("tpep_dropoff_datetime" - "tpep_pickup_datetime") as "diff_time" 
from "taxi_trip")as "tab4"
group by "week_days", "diff_time") as "tab5"
where "week_days" like '%atur%') as "tab6"
group by "week_days"
order by  "ave_duration"
limit 10;

--Q4 AVERAGE NUMBER OF TRIPS ON SUNDAYS
select "week_day", avg("trip_dist") as "ave_num_trip"
from 

(select count("trip_distance") as  "trip_dist", to_char("tpep_dropoff_datetime", 'day') as "week_day"
from "taxi_trip"
group by "week_day"
order by "trip_dist") as "tab7"

where "week_day" like '%und%'
group by "week_day";

--Q5 AVERAGE NUMBER FARE_AMOUNT PER TRIP ON SUNDAY
select avg("fare_amount") as "ave_fare_amt", "week_day"
from

(select "fare_amount", to_char("tpep_dropoff_datetime", 'day') as "week_day"
from "taxi_trip"
group by "fare_amount", "week_day") as "tab8"

where "week_day" like '%und%'
group by "week_day"
order by "ave_fare_amt";

--Q6 AVERAGE DURATION PER TRIP ON SUNDAY
select avg("duration"), "week_day"
from
(select extract(minute from "diff_time") as "duration", to_char("tpep_dropoff_datetime",'day')as "week_day"
from

(select "trip_distance", "tpep_dropoff_datetime", ("tpep_dropoff_datetime" - "tpep_pickup_datetime") as "diff_time"
from "taxi_trip") as "tab9"
group by "week_day", "duration") as "tab10"

where "week_day" like '%und%'
group by 2
order by 1;

 




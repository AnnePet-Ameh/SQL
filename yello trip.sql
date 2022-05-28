select *
from "taxi_trip"
limit 10;

select "week_days", avg("num_trip") as "ave_num_trip"
from 

(select  count("trip_distance") as "num_trip", to_char("tpep_dropoff_datetime", 'day') as "week_days"
from "taxi_trip"
group by "week_days"
order by "num_trip" desc) as "tab1"

where "week_days" like '%atur%'
group by "week_days"
limit 10;



select avg("fare_amount") as "ave_fare_amt", "week_days"
from

(select "fare_amount", to_char("tpep_dropoff_datetime",'day') as "week_days"
from "taxi_trip"
group by "week_days", "fare_amount") as "tab3"

where "week_days" like '%atur%'
group by "week_days"
order by "ave_fare_amt";


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

select "week_day", avg("trip_dist") as "ave_num_trip"
from 

(select count("trip_distance") as  "trip_dist", to_char("tpep_dropoff_datetime", 'day') as "week_day"
from "taxi_trip"
group by "week_day"
order by "trip_dist") as "tab7"

where "week_day" like '%und%'
group by "week_day";


select avg("fare_amount") as "ave_fare_amt", "week_day"
from

(select "fare_amount", to_char("tpep_dropoff_datetime", 'day') as "week_day"
from "taxi_trip"
group by "fare_amount", "week_day") as "tab8"

where "week_day" like '%und%'
group by "week_day"
order by "ave_fare_amt";


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

 




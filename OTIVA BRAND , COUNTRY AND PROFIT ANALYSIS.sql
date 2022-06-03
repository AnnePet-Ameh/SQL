select *
from "Brewery_data"
limit 10;

-- BRAND ANALYSIS
-- Q1 TOP THREE BRANDS CONSUMED IN FRANCOPHNE COUNTRIES

select "BRANDS", "COUNTRIES", sum("QUANTITY") as "QUANTITIES", "YEARS"
from "Brewery_data"
where  "COUNTRIES" in ('Benin', 'Togo', 'Senegal')
and "YEARS" in ('2018', '2019')
group by "BRANDS", "COUNTRIES", "YEARS"
order by "QUANTITIES" desc
limit 3;

-- Q2 TOP TWO CHOICES OF CONSUMER BRANDS IN GHANA

Select "BRANDS", sum("QUANTITY") as "QUANTITIES", "COUNTRIES"
from "Brewery_data"
where "COUNTRIES" = 'Ghana'
group by "BRANDS", "COUNTRIES"
order by "QUANTITIES" desc
limit 2;

-- Q3 DETAILS OF BEERS CONSUMED IN LAST THREE YEARS IN THE MOST OIL RICH COUNTRY IN WEST AFRICA

select "BRANDS", "SALES_REP", sum("QUANTITY") as "QUANTITIES", "YEARS"
from "Brewery_data"
where "BRANDS" in ('trophy', 'hero', 'budweiser', 'eagle lager', 'castle lite')
and "COUNTRIES" = 'Nigeria'
and "YEARS" in ('2017', '2018', '2019')
group by "BRANDS", "SALES_REP", "YEARS"
order by "QUANTITIES" desc
limit 20;

-- Q5 BRAND THAT SOLD THE HIGHEST IN NIGERIA IN 2019

select "BRANDS", sum("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "COUNTRIES" = 'Nigeria'
and "YEARS" ='2019'
group by "BRANDS"
order by "QUANTITIES" desc
limit 1;

-- Q7 BEER CONSUMPTION IN NIGERIA
select "BRANDS", sum("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "BRANDS" not in ('beta malt', 'grand malt')
and "COUNTRIES" = 'Nigeria'
group by "BRANDS"
order by "QUANTITIES" desc
limit 20;


-- Q6 FAVOURITE BRANDS IN SOUTH_SOUTH REGION IN NIGERIA
select "BRANDS", "COUNTRIES", "REGION ", sum("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "COUNTRIES" = 'Nigeria'
and "REGION " = 'southsouth' 
group by "BRANDS", "COUNTRIES", "REGION "
order by "QUANTITIES" desc
limit 20;

--Q8 LEVEL OF CONSUMPTION OF BUDWEISER IN THE REGIONS IN NIGERIA
select "BRANDS", "REGION ", "COUNTRIES", sum("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "BRANDS" = 'budweiser'
and "COUNTRIES" = 'Nigeria'
group by "BRANDS", "REGION ", "COUNTRIES"
order by "QUANTITIES" desc
limit 10;

-- Q9 LEVEL OF CONSUMPTION OF BUDWEISER IN THE REGIONS OF NIGERIA IN 2019
select "BRANDS", "REGION ", "COUNTRIES", sum("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "BRANDS" = 'budweiser'
and "COUNTRIES" = 'Nigeria'
and "YEARS" = 2019
group by "BRANDS", "REGION ", "COUNTRIES"
order by "QUANTITIES" desc
limit 10;

--Q4 FAVOURITE MALT BRAND IN ANGLOPHONE REGION BETWEEN 2018 AND 2019
select "TERRITORY", "BRANDS", "YEARS", sum ("QUANTITY") as "QUANTITIES"
from

(select *,
case when "COUNTRIES" in ('Nigeria', 'Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORY"
from "Brewery_data") as "tab_1"
where "TERRITORY" = 'Anglophone'
and "BRANDS" in ('beta malt', 'grand malt')
and "YEARS" in (2018, 2019)
group by "TERRITORY", "BRANDS", "YEARS"
order by "QUANTITIES" desc
limit 1;


--COUNTRIES ANALYSIS
--Q1 COUNTRY WITH THE HIGHEST CONSUMPTION OF BEER
select "COUNTRIES", sum("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "BRANDS" not in ('beta malt', 'grand malt')
group by "COUNTRIES"
order by "QUANTITIES" desc
limit 1;


-- Q2 HIGHEST SALES PERSONNEL OF BUDWEISER IN SENEGAL
select "SALES_REP", "EMAILS", sum("PROFIT") as "PROFITS"
from "Brewery_data"
where "BRANDS" = 'budweiser'
and "COUNTRIES" = 'Senegal'
group by "SALES_REP", "EMAILS"
order by "PROFITS" desc
limit 1;

-- Q3 COUNTRY WITH THE HIGHEST PROFIT OF FORTH QUARTER IN 2019
select "COUNTRIES", sum("PROFIT") as "PROFITS"
from "Brewery_data"
where "MONTHS" in ('October', 'November', 'December')
and "YEARS" = 2019
group by "COUNTRIES"
order by "PROFITS" desc
limit 1;

-- --PROFIT ANALYSIS 

--Q1 PROFIT FOR THE LAST THREE YEARS
select "YEARS", sum("PROFIT") as "TOTAL_PROFIT"
from "Brewery_data"
where "YEARS" in (2017, 2018, 2019)
group by "YEARS"
order by "TOTAL_PROFIT"

--Q2 TOTAL PROFIT OF THE TERRITORY
select "TERRITORY", sum("PROFIT") as "TERRITORIAL_PROFIT"
from

(select *,
case when "COUNTRIES" in ('Nigeria', 'Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORY"
from "Brewery_data") as "tab2"
group by "TERRITORY"
order by "TERRITORIAL_PROFIT";
 
 
-- Q3 COUNTRY THAT GENERATED THE HIGHEST PROFIT IN 2019
select "COUNTRIES", sum("PROFIT") as "PROFITS", "YEARS"
from "Brewery_data"
where "YEARS" = 2019
group by "COUNTRIES", "YEARS"
order by "PROFITS" desc
limit 1;

--Q4 YEAR WITH THE HIGHEST PROFIT
select "YEARS", sum("PROFIT") as "PROFITS"
from "Brewery_data"
group by "YEARS"
order by "PROFITS" desc
limit 1;

-- Q5 MONTH WITH THE LEAST PROFIT GENERATED IN THE LAST THREE YEARS
select "MONTHS", "YEARS", sum("PROFIT") as "PROFITS"
from "Brewery_data"
group by "MONTHS", "YEARS"
order by "PROFITS" asc
limit 1;

-- Q6 MINIMUM PROFIT IN THE MONTH OF DECEMBER 2018
select "MONTHS", "YEARS", "BRANDS", sum("PROFIT") as "PROFITS"
from "Brewery_data"
where "MONTHS" = 'December'
and "YEARS" = 2018
group by "MONTHS", "YEARS", "BRANDS"
order by "PROFITS" asc
limit 10;

--Q7 PROFIT IN PERCENTAGE FOR EACH MONTH IN 2019
select "MONTHS", (sum("PROFIT")/sum("COST")* 100) as "PERCENTAGE_PROFIT"
from "Brewery_data"
where "YEARS" = 2019
group by "MONTHS"
order by "PERCENTAGE_PROFIT" desc;

-- Q8 BRAND THAT GENERATED THE HIGHEST PROFIT IN SENEGAL
select "BRANDS", "YEARS", sum("PROFIT") as "PROFITS"
from "Brewery_data"
where "COUNTRIES" = 'Senegal'
group by "BRANDS", "YEARS"
order by "PROFITS" desc
limit 1;



--Find the average playtime by genre
select
    avg(playtime), "Genre"
from playtime_steam
group by "Genre";

--Find the max average playtime by genre
select
    avg(playtime) as average, "Genre"
from playtime_steam
group by "Genre" order by average desc
limit 5;

--Find the min average playtime by genre
select
    avg(playtime) as average, "Genre"
from playtime_steam
group by "Genre" order by average asc
limit 3;

--Find some influential points

--Find the highest playtime in the dataset by genre
select
    max(playtime) as maximum,"Genre"
from playtime_steam
group by "Genre" order by maximum desc
limit 3;

--Find the lowest playtime in the dataset by genre
select
    min(playtime) as minimum, "Genre"
from playtime_steam
group by "Genre" order by minimum asc
limit 3;

-- lets do this again, but for publisher

--Find the average playtime by publisher
select
    avg(playtime), "Publisher"
from reduced_publishers_steam
group by "Publisher";

--Find the max average playtime by publisher
select
    avg(playtime) as average, "Publisher"
from reduced_publishers_steam
group by "Publisher" order by average desc
limit 5;

--Find the min average playtime by publisher
select
    avg(playtime) as average, "Publisher"
from reduced_publishers_steam
group by "Publisher" order by average asc
limit 3;

--Find some influential points

--Find the highest played game by publisher
select
    max(playtime) as maximum,"Publisher"
from reduced_publishers_steam
group by "Publisher" order by maximum desc
limit 3;

--Find the least played game by publisher
select
    min(playtime) as minimum, "Publisher"
from reduced_publishers_steam
group by "Publisher" order by minimum asc
limit 3;

-- Now lets do this for Sales

--Find the average sales by genre
select
    avg("Global_Sales"), "Genre"
from pc_sales
group by "Genre";

--Find the max average sales by genre
select
    avg("Global_Sales") as average, "Genre"
from pc_sales
group by "Genre" order by average desc
limit 5;

--Find the min average sales by genre
select
    avg("Global_Sales") as average, "Genre"
from pc_sales
group by "Genre" order by average asc
limit 3;

--Find some influential points

--Find the highest sales in the dataset by genre
select
    max("Global_Sales") as maximum,"Genre"
from pc_sales
group by "Genre" order by maximum desc
limit 3;

--Find the lowest sales in the dataset by genre
select
    min("Global_Sales") as minimum, "Genre"
from pc_sales
group by "Genre" order by minimum asc
limit 3;

-- Now lets do this for publisher

--Find the average sales by publisher
select
    avg("Global_Sales"), "Publisher"
from reduced_publishers_pc
group by "Publisher";

--Find the max average sales by publisher
select
    avg("Global_Sales") as average, "Publisher"
from reduced_publishers_pc
group by "Publisher" order by average desc
limit 3;

--Find the min average sales publisher
select
    avg("Global_Sales") as average, "Publisher"
from reduced_publishers_pc
group by "Publisher" order by average asc
limit 3;

--Find some influential points

--Find the highest sales in the dataset by genre
select
    max("Global_Sales") as maximum,"Publisher"
from reduced_publishers_pc
group by "Publisher" order by maximum desc
limit 3;

--Find the lowest sales in the dataset by genre
select
    min("Global_Sales") as minimum, "Publisher"
from reduced_publishers_pc
group by "Publisher" order by minimum asc
limit 3;

--keep the original table by creating a view that maintains the original data set
create view vg_sales as select * from games natural join sales;

-- see how many games we have for each genre
select count("Genre"),"Genre" from vg_sales group by "Genre";

-- see how many titles violate title being the primary key
with h as(
select count("Title") as counter,"Title" as title from vg_sales group by "Title")
select counter,title from h where counter > 1;

-- create a smaller table from vgsales that only has the data we need for analysis

create view unique_games as
select distinct * from (select "Title", "Genre", "Publisher" from vg_sales ) as p
                  where "Title" not in (select title from (select count("Title") as counter,"Title" as title
                                                           from (select distinct * from (select "Title", "Genre",
                                                                                                "Publisher" from vg_sales ) as p) as t group by "Title") as h where counter > 1);
-- see how many games violate title being the primary key
with h as(
select count("Title") as counter,"Title" as title from unique_games group by "Title")
select counter,title from h where counter > 1;

select * from vg_sales where "Title" = 'Fallout 4';


-- check the new count of genres to see its still large after transformations
select * from unique_games;
select count("Genre"),"Genre" from unique_games group by "Genre";

-- finds all of the titles in steam-200k that have a title in console games
select
    user_id,
    steam_behavior.title,behavior,playtime
from
    steam_behavior,unique_games
where
    steam_behavior.title = unique_games."Title";

--create a table called steam_playtime so that every title has a matching title in console games
-- this table will not have both purchase and playtime
create view playtime_steam as (
select
    user_id, steam_behavior.title, playtime, "Genre", "Publisher"
from
    steam_behavior, unique_games
where
    steam_behavior.title = unique_games."Title" and playtime != 1);

select * from playtime_steam;

-- lets see if we can make a smaller sales table for just xbox
select * from sales;
create view PC_sales as
    (select
         "Title", "Platform","Genre","Publisher","Year","Global_Sales"
        from vg_sales
        where "Platform" = 'PC' and "Title" != 'Need for Speed: Most Wanted'
         );


select * from PC_sales;

--lets check out this table

select count("Genre"),"Genre" from PC_sales group by "Genre";
select count("Publisher"),"Publisher" from PC_sales group by "Publisher";

-- see how many games violate title being the primary key
with h as(
select count("Title") as counter,"Title" as title from PC_sales group by "Title")
select counter,title from h where counter > 1;

--when running analysis on R, there are too many publishers and some that don't make enough games
-- so we will want to pick the publishers we have the most data on

create view reduced_publishers_steam as
    select * from playtime_steam
where "Publisher" in (with h as(
select count("Publisher") as counter, "Publisher" as publisher from playtime_steam  group by "Publisher")
select publisher
    from h
where counter > 100);



create view reduced_publishers_PC as
    select * from PC_sales
    where "Publisher" in (
with h as(
select count("Publisher") as counter, "Publisher" as publisher from PC_sales  group by "Publisher")
select publisher
from h
where
    counter > 20);


create database assignment_7;
use assignment_7;

create table country (id int primary key,
country_name varchar(50),
population varchar(50),
area_sqkm varchar(50));
desc country;
insert into country(id, country_name, population, area_sqkm)
values(1, 'India', '90000000', '32 lakhs'),
(2, 'China', '90000000', '97 lakhs'),
(3, 'USA', '80000000', '93 lakhs'),
(4, 'UK', '70000000', '2 lakhs'),
(5, 'Canada', '60000000', '99 lakhs'),
(6, 'Australia', '50000000', '50 lakhs'),
(7, 'Netherlands', '40000000', '32 lakhs'),
(8, 'Sweden', '30000000', '4 lakhs'),
(9, 'Austria', '20000000', '3 lakhs'),
(10, 'Switzerland', '10000000', '2 lakhs');
select*from country;

create table persons (id int primary key,
first_name varchar(50),
last_name varchar(50),
population varchar(50),
rating int,
country_id int,
country_name varchar(50));
desc persons;
insert into persons(id, first_name, last_name, population,rating,country_id,country_name)
values(1, 'Lisha', 'Thomas', '90000000', 1, 1, 'India'),
(2, 'Chaang', 'Yaang', '90000000', 2, 2, 'China'),
(3, 'Thomas', 'Cook', '80000000', 3, 3, 'USA'),
(4, 'Diana', 'Xavier', '90000000', 1, 1, 'India'),
(5, 'Freddy', 'Dainz', '60000000', 5, 5, 'Canada'),
(6, 'Hari', 'Sharma', '90000000', 1, 1, 'India'),
(7, 'william', 'Blake', '40000000', 7, 7, 'Netherlands'),
(8, 'Right', 'Thomas', '30000000',8, 8, 'Sweden'),
(9, 'Cindrella', 'John', '20000000', 9, 9, 'Austria'),
(10, 'Irene', 'Dizooza', '10000000', 10, 10, 'Iceland');
select*from persons;

#Add a new column called DOB in Persons table with data type as Date
alter table persons add column DOB DATE;
select*from persons;

update persons set DOB='2000-12-01' where id=1;
update persons set DOB='1985-11-08' where id=2;
update persons set DOB='2010-07-14' where id=3;
update persons set DOB='2001-06-21' where id=4;
update persons set DOB='2004-05-07' where id=5;
update persons set DOB='1995-01-12' where id=6;
update persons set DOB='1998-04-30' where id=7;
update persons set DOB='1986-01-10' where id=8;
update persons set DOB='2003-03-09' where id=9;
update persons set DOB='2005-02-28' where id=10;
select*from persons;

#user-defined function to calculate age using DOB
DELIMITER $$

CREATE FUNCTION age_cal(DOB DATE)
RETURNS int
DETERMINISTIC
BEGIN
    RETURN datediff(yy,DOB,getdate());
END $$

DELIMITER ;
SELECT age_cal(1990);

#select query to fetch the Age of all persons using the function that has been created
select concat(first_name,' ',last_name) as NAME, DOB as AGE from persons;

#length of each country name in the Country table
select country_name, length(country_name) as COUNTRYNAME_LENGTH from country;

# first three characters of each country's name in the Country table
select country_name, substr(country_name,1,3) as FIRST_THREE_CHAR from country ;

#Convert all country names to uppercase and lowercase in the Country table
select country_name, upper(country_name) as COUNTRY_NAME_UPPER from country;
select country_name, lower(country_name) as COUNTRY_NAME_LOWER from country;






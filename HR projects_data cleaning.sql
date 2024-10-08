### creating new  Schemas, adding new table in csv file
create database projects;

### selecting the Schemas, can choose it by double clicking it in Schemas tab as well
use projects;


select *
from hr
;


##### Data Cleaning #####
# renaming column name from 癤퓁d to emp_id  
-- No.1
alter table hr
change column 癤퓁d emp_id varchar(20) null;  -- changed emp_id date type from text (default) to varchar(20)

-- No.2
-- right click the table you want to make changes, click 'Alter Table...' and change column names when needed


# checking data types
describe hr;


# birthdate has multiple formats and we need to adjust it to make it easier to work with
select birthdate
from hr;

update hr
set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;
-- Got an error code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. To disable safe mode, toggle the option in Preferences
-- This is a common error when using 'UPDATE'. To disable safe mode, you can use 'SET sql_safe_updates = 0;' To enable, use 1 instead of 0.
-- Other way you can disable is, go to Edit, Preferences..., click SQL Editor, and uncheck Safe Updates <- this requires restarting MySQL


# Changing birthdate data type from text (default) to date 
alter table hr
modify column birthdate date;

update hr
set hire_date = case
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;


update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')) #Ymd H:i:s, minute is 'i' because m is for numeric month and M is for month abbreviation
where termdate is not null and termdate != '';


# Adding a new column called 'age' and setting date type as integer (int)
alter table hr add column age int;


# Adding values in newly created age  column
update hr
set age = timestampdiff(year, birthdate, curdate());


select
min(age) as youngest,
max(age) as oldest
from hr;


# First imported csv file was not 100% imported. The original file should have more thank 20,000 rows but it only had about 2,000 rows.
# I had to re-import the csv file, then re-do the data cleaning process before performing any data analysis.



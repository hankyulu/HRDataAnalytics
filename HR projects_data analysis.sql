select *
from hr
;

#1. What is the gender breakdown of employees in the company? (V)
select gender, count(*) as count
from hr where age >= 18 and termdate = ''
group by gender
;

#2. What is the race/ethnicity breakdown of employees in the company? (V)
select race, count(*) as count
from hr where age >= 18 and termdate = ''
group by race order by count desc
;

#3. What is the age distribution of employees in the company? (V)
select 
min(age) as youngest,
max(age) as oldest
from hr where age >= 18 and termdate = '';

select 
	case
		when age >= 18 and age <=24 then '18-24'
        when age >= 25 and age <= 34 then '25-34'
        when age >= 35 and age <= 44 then '35-44'
        when age >= 45 and age <= 54 then '45-54'
        when age >= 55 and age <= 64 then '55-64'
        else '65+'
	end as age_group, gender,
    count(*) as count

from hr where age >= 18 and termdate = ''
group by age_group, gender
order by age_group asc
;

#4. How many employees work at headquarters versus remote locations? (V)
select location, count(*) as count
from hr where age >= 18 and termdate = ''
group by location;

#5. How does the gender distribution vary across departments and job titles? (V)
select department, gender, count(*) as count
from hr where age >= 18 and termdate = ''
group by gender, department order by department;

#6. What is the distribution of employees across locations by state? (V)
select location_state, count(*) as count
from hr where age >= 18 and termdate = ''
group by location_state order by count desc;

#7. What is the average length of employment for employees who have been terminated? (V)
select 
	avg(dateDIFF(termdate, hire_date)) / 365 as avg_length_employment
from hr
where termdate <= curdate() and termdate <> '' and age >= 18 ;

#8. Which department has the highest turnover rate? (V)
select department, total_count, term_count,
term_count/total_count as term_rate
from (
select department, count(*) as total_count,
sum(case when termdate <> '' and termdate <= curdate() then 1 else 0 end) as term_count
from hr
where age >= 18 group by department
) as subquery
order by term_rate desc;

-- Questions ended up not used on dashboard --

#9. What is the tenure distribution for each department?
select department, round(avg(datediff(termdate, hire_date)/365),0) as avg_tenure
from hr
where termdate <= curdate() and termdate <> '' and age >= 18
group by department order by avg_tenure desc;

#10. What is the distribution of job titles across the company?
select jobtitle, count(*) as count
from hr where age >= 18 and termdate = ''
group by jobtitle order by jobtitle;
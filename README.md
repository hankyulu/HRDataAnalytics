# HR-Dashboard-MySQL-Power BI
![image](https://github.com/user-attachments/assets/bd14133c-8357-4bd1-9855-b1a385b82f4c)
![image](https://github.com/user-attachments/assets/58fb7ee3-745c-480b-a175-4c6cfbb6cb36)

# Data Used
Data - HR Data with over 22,000 rows from the year 2000 to 2020.

Data Cleaning & Analysis - MySQL

Data Visualization - Power BI

# Questions
1. What is the gender breakdown of employees in the company?

2. What is the race/ethnicity breakdown of employees in the company?

3. What is the age distribution of employees in the company?

4. How many employees work at headquarters versus remote locations?

5. How does the gender distribution vary across departments and job titles?

6. What is the distribution of employees across locations by state?

7. What is the average length of employment for employees who have been terminated?

8. Which department has the highest turnover rate?

# Summary of Findings
* There are more male employees than female employees.
* The White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
* The youngest employee is 22 years old and the oldest is 58 years old.
* Five age groups were created (18-24, 25-34, 35-44, 45-54, 55-64). A large number of employees were between 25-34 followed by 35-44, while the smallest group was 55-64.
* About 75% of employees work at the headquarters and 25% work remotely. 
* The gender distribution across departments is fairly balanced, but there are generally more male than female employees.
* A large number of employees come from the state of Ohio.
* The average length of employment for terminated employees is around 8 years.
* The Auditing and Legal departments have the highest termination rates (0.180 and 0.141), and the Marketing department has the lowest termination rate (0.096).


# Limitations
* Some records had negative ages and these were excluded during querying (967 records). Ages used were 18 years and above.
* Some termination dates were far into the future so they were excluded in the analysis (1599 records). The only termination dates used were those less than or equal to the current date.

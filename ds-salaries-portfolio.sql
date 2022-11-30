use Excel_File;

select *
from Salary;

-- Find the average United State salary of entry level jobs
Select distinct job_title as jt, avg(salary) asal, salary_currency, experience_level
from Salary
where salary_currency = 'USD' and experience_level = 'EN'
group by jt
order by asal asc;

-- Find the Max salary of each jobs 
Select distinct job_title, max(salary) as max_salary
from Salary
group by job_title;

-- Find the entry level jobs that located in United States that make over $65,000 in 2022
Select distinct job_title, salary, company_location,work_year,experience_level
from Salary
having salary >'65000' and company_location = 'US' and work_year = '2022' and experience_level = 'EN'
order by salary asc;



-- Find the top 10 jobs that has the highest average salary
Select distinct job_title, avg(salary) as avg_salary
from Salary
group by job_title 
order by avg_salary desc limit 10;


-- Find the top five job titles that appear the most
Select job_title,count(job_title) as countjt
from Salary
group by job_title 
order by countjt desc limit 5;

-- Select only the jobs that was in the year 2021-2022
Select distinct job_title, work_year
from Salary
where work_year not in('2020');




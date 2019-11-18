--challenge.sql

--list of employees eligible for retirement

--create retirement eligible table
SELECT e.emp_no, e.first_name, e.last_name
into retirement_eligible
FROM employees as e
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');



--current employees eligible for retirement with titles using right join ; create csv of this table
select re.emp_no,
re.first_name, 
re.last_name, 
de.to_date, t.title, t.from_date, s.salary
into retirement_with_titles
from dept_emp as de
right join retirement_eligible as re
on re.emp_no = de.emp_no
right join titles as t
on re.emp_no = t.emp_no
right join salaries as s
on re.emp_no = s.emp_no
where de.to_date = ('9999-01-01');

--select * from retirement_with_titles

--without duplicate titles and most recent

select emp_no, first_name, last_name, to_date, title, from_date, salary 
 into retirement_without_duplicates
from
(select emp_no, first_name, last_name, to_date, title, from_date, salary, row_number() over
 (partition by (title, emp_no) order by from_date desc) rn
 from retirement_with_titles) tmp
 where rn=1;

--select * from retirement_without_duplicates

-- Frequency count of titles; create csv of this table

select * 
into title_count
from (select title, from_date, count(*)
			   over (partition by title) as count
			   from retirement_without_duplicates) tablewithcount
			   where tablewithcount.count > 1
			   order by from_date DESC;
			   

select * from title_count

--Identify the mentors

--create hiring eligibility table

SELECT e.emp_no, e.first_name, e.last_name
into hiring_eligible
FROM employees as e
where (hire_date BETWEEN '1985-01-01' AND '1985-12-31');

--create mentor table; create csv of this table

select he.emp_no,
he.first_name, 
he.last_name, 
de.to_date, t.title, t.from_date, e.birth_date
into ready_for_mentor
from dept_emp as de
right join hiring_eligible as he
on he.emp_no = de.emp_no
right join titles as t
on he.emp_no = t.emp_no
right join employees as e
on he.emp_no = e.emp_no
where de.to_date = ('9999-01-01');

select * from ready_for_mentor
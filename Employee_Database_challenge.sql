-- Get all retirement employee titles
SELECT e.emp_no,
       e.first_name,
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO deliverable_1
FROM employees as e
JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952.1.1' AND '1955.12.31')
ORDER BY e.emp_no;



-- Use Dictinct with Orderby to remove duplicate rows
-- Get the up-to-date title from each employee
-- Count the number of retiring employees by titles
SELECT DISTINCT ON (emp_no) emp_no,
                   first_name,
                   last_name,
                   title
INTO unique_titles
FROM deliverable_1
ORDER BY emp_no, from_date DESC;

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;



-- Find employees who are eligible to join mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	               e.first_name,
	               e.last_name,
	               e.birth_date,
	               d.from_date,
	               d.to_date,
	               ti.title
INTO mentorship_eligibilty
FROM employees AS e
	JOIN dept_emp AS d
		ON (e.emp_no = d.emp_no)
	JOIN titles AS ti
		ON (e.emp_no = ti.emp_no)
	WHERE (d.to_date = '9999-01-01')
	AND (birth_date BETWEEN '1965.1.1' AND '1965.12.31')
ORDER BY e.emp_no, ti.from_date DESC;








	   
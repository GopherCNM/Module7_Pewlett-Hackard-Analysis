-- Deliverable 1:

-- Join tables, filter by birth date, and order by employee number
-- Create a new table called retirement_titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
	JOIN titles AS t
	ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct On with Orderby to remove duplicate rows
-- Create a new table called unique_titles
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Find list of distinct titles in unique_titles table
SELECT DISTINCT title
FROM unique_titles;

-- Count retiring employees by title
-- Create a new table called retiring_titles
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

--Deliverable 2:

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
	JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	JOIN titles AS t
		ON (t.emp_no = e.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, t.to_date DESC;

-- Deliverable 3:

-- Total active employees at Pewlett-Hackard
SELECT DISTINCT COUNT(emp_no)
FROM dept_emp
WHERE to_date = '9999-01-01';

-- Mentorship eligible employee counts by title
SELECT COUNT(emp_no), title
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

-- Retirees by year
SELECT COUNT(ut.emp_no), EXTRACT (YEAR FROM(e.birth_date))
INTO retirees_by_birth_date
FROM unique_titles AS ut
	LEFT JOIN employees AS e
	ON (ut.emp_no = e.emp_no)
GROUP BY EXTRACT (YEAR FROM(e.birth_date));

-- Expanded mentorship eligibility (1962 to 1965 birth dates)
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO expanded_mentorship_eligibility
FROM employees AS e
	JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	JOIN titles AS t
		ON (t.emp_no = e.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
ORDER BY e.emp_no, t.to_date DESC;

-- Expanded mentorship eligibility counts by title
SELECT COUNT(emp_no), title
INTO expanded_mentorship_counts
FROM expanded_mentorship_eligibility
GROUP BY title
ORDER BY COUNT(emp_no) DESC;
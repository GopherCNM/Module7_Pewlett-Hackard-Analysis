# Employee Database with SQL

## Overview of the analysis

For this analysis, we are assisting an HR Analyst named Bobby as he looks to understand the impending employee retirement impact at a large company named Pewlett-Hackard. Using SQL queries, we will leverage 6 tables that provide various insights into the workforce population. We are looking to understand the scale of this retirement impact, referred to as the “silver tsunami”, to understand how many roles will need to be filled in the coming years. We will also help the company to prepare for the future by recommending a mentorship program to develop younger talent, and to help get ahead of this and future retirement waves.

## Results

Our querying helped to develop some valuable insights for Pewlett-Hackard management:  

- There are 240,124 current employees working for Pewlett-Hackard. 72,458 of them (30%) are in the age range that we’ve defined as retirement-eligible – those born between 1/1/52 and 12/31/55.  
![current employee count](/Screenshots/current_employee_count.PNG)

- Senior Engineer and Senior Staff roles make up 50,842 of the 72,458 retirement-eligible positions (70%). Below is a screenshot from the retiring_titles table:  
![retiring employees by title](/Screenshots/retirement_eligible_by_title.PNG)

- Of the 240,124 current employees working for Pewlett-Hackard, 1,549 are in the age band (born in 1965) defined as eligible to serve as mentors for younger employees.  

- Of the 1,549 employees identified as eligible for the mentorship program, 569 have Senior Staff titles and 529 have Senior Engineer titles. This makes up 71% of the mentorship-eligible population.  
![mentorship eligible by title](/Screenshots/mentorship_eligible_by_title.PNG)  

## Summary

Our research helped to further our understanding of the upcoming retirement impact, and provide recommendations for Pewlett-Hackard management to plan for the future.  

- How many roles will need to be filled as the “silver tsunami” begins to make an impact?

Based on the unique_titles table, we know that 72,458 employees are set to retire as the “silver tsunami” begins to hit. I wrote a query that joins the unique_titles table and the employees table to tell us how this impact might spread across a few years. If we assume that employees will begin to retire based on their birth year, we can see that this 72,458 is spread evenly across 4 years. This view helps to visualize the approximate number of roles that will need to be filled each year.  
![retirees by birth year query](/Screenshots/retirees_by_birth_year_query.PNG)
![retirees by birth year counts](/Screenshots/retirees_by_birth_date_counts.PNG)  

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of PH employees?  

In the second deliverable, we looked only at current employees born in the year 1965 to determine eligibility for the mentorship program. The resulting list was 1,549 employees, which seems light given the number of employees who are nearing retirement. I wrote another query to see how many employees would be eligible for the mentorship program if we were to expand the birth date range to 4 years, 1962 to 1965. This produced a list of 56,859 employees, of which 20,314 are Senior Engineers and 19,583 are Senior Staff. It would be prudent to expand program eligibility criteria to catch a broader range of birth dates, to tap into the experience of these employees before they begin retiring.  
![expanded program query](/Screenshots/expanded_mentorship_program_query.PNG)
![expanded program counts](/Screenshots/expanded_mentorship_program_counts.PNG)

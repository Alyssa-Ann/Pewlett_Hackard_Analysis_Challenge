# Pewlett_Hackard_Analysis_Challenge
## Project Overview

1. Analysis of the number of retiring employees by title
2. Analysis of te employees eligible for the mentorship programs

In addition to Original Module tasks:
1. Designing and ERD for given data
2. Create and use SQL databases
3. Import and Export large CSV datasets using pgAdmin
4. Create joins to make new tables in pgAdmin
5. Writing out SQL statements and conditionals

## Purpose of Analysis
After being given multiple data sets about the employees of Pewlett Hackard, a ERD, or entity relationship diagram, was created to organize key elements between the data tables. This ERD will be used as a quick reference guide to help navigate the large data sets and create joins between those sets. SQL queries were then written to create data tables as well as establishing primary and foreign keys. The data was imported using postgres and pgAdmin to fill the newly created tables. Upper management of Pewlett Hackard is concerned that there will be a mass retirement of employees coming up. Using pgAdmin, the data will be cleaned and sorted to determine the number of employees with retirement potential, and then be separated into retiring employees by tite. A secondary table will then be created to determine which employees are eligable for a mentorship program. Finally, analysis will be done to determine if there are enough mentors and people for them to mentor into the next generation of leadership, and how steep the effects of this retirement surge will be on the workforce for Pewlett Hackard.  

## Resources
* Data source: departments.csv, dept_empy.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
* Software: Quick Database Diagrams, PostgreSql, pgAdmin, VS Code, GitHub, GitBash

 
## Analysis Overview
This analysis was initiated to determine how many Pewlett Hackard employees are eligible for retirement and how many of those employees could participate in a mentorship program. SQL was used to aggregate data using pgAdmin as a database to analyze this data. It was determined that there are a potential 90,398 retirees at Pewlett Hackard. This truely brings new meaning to the term "Silver Tsnuami" which the management team is concerned about. Of these potential retirees, only 1,549 are eligible to be mentors. 

The following employee relationship database diagram was used to help keep the numerous cvs files ordered, clear, and help when joining multile files. 

*****insert flow chart here

## Results 
### Retirement Analysis
* There are a potential 90,398 emloyees who are eligible for retirement at Pewlett Hackard. This number was determined by creating a query that pulled all employees who were born between 1952 and 1955. The following table shows the output of this query. 

 *****insert retirement titles image

*This table had duplicate employees who held multiple job titles with the company. A second table was cleaned and created to limit each potentially retiring employee to their most current job title. 

****insert unique titles image

* The potentially retiring employees were then further sorted to determine which departments would be impacted the hardest. The senior engineers and senior staff could potentially lose ~30,000 employees each. The managers only have a potential fallout of 2 retiring employees. Ther will suffer the least amount of impact. 

***insert retiring titles. 

### Mentorship Eligibilty Analysis
* There are 1,549 employees who are mentorship eligible. The table that includes these employees names is displayed below.

********insert mentoship_eligibilty image


## Summary
* To summarize the data, if every employee who was eligble for retirement retired, there would be 90,398 job vacancies that Pewlett Hackard would have to fill. This would create the "silver tsunami" that upper management is worried about. Unfortunately, there are only 1,549 employees eligible to be mentees to the 90,398 mentors looking to retire. There are not enough qualified mentees to be paired with and take over for every mentor who could be retiring. There are plenty of qualified mentors, though. Taking a deeper dive into the mentors/mentees lists can show which departments will be impacted the most severly.  

* While going through the employee data, it is clear that many of the employees would not be eligible to be mentors. By sorting the employee data to employees who were at least 30 or older when they started their current job title, it is determined that 5553 people would be eligible to mentor. A sample of this list can be seen below. 

********insert unique potential mentors 

* As mentioned above, there are many potential employees retiring, but not many qualified to take their place. By breaking it down by department, one can see what departments are the most effected, and what departments have the most potential from mentors to mentees. Many of the departments have more potential mentors than the do mentees, so there is a good chance of employees being matched up to bring in a new wave of replacements. There is a concern that while there are 2 mentorship eligible managers, there are no potential mentees for that department. 

******insert retiring titles
********* insert mentee by title

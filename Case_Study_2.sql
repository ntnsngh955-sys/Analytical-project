--CASE_STUDY 2

CREATE TABLE Locations
(
Location_Id INT PRIMARY KEY,
City VARCHAR(100)
)

INSERT INTO Locations(Location_Id, City) VALUES(122, 'New York')
INSERT INTO Locations(Location_Id, City) VALUES(123,'Dallas')
INSERT INTO Locations(Location_Id, City) VALUES(124,'Chicago')
INSERT INTO Locations(Location_Id, City) VALUES(167,'Boston')

SELECT * From Locations

CREATE TABLE Department
(
 Department_Id INT PRIMARY KEY,
 Name VARCHAR(100),
 Location_Id INT,
 FOREIGN KEY (Location_Id) REFERENCES Locations(Location_Id)
)

INSERT INTO Department(Department_Id, Name, Location_Id) VALUES(10, 'Accounting', 122)
INSERT INTO Department(Department_Id, Name, Location_Id) VALUES(20, 'Sales', 124)
INSERT INTO Department(Department_Id, Name, Location_Id) VALUES(30, 'Research', 123)
INSERT INTO Department(Department_Id, Name, Location_Id) VALUES(40, 'Operations', 167)

SELECT * FROM Department


CREATE TABLE Job
(
Job_Id INT PRIMARY KEY,
Designation VARCHAR(100),
)

INSERT INTO Job(Job_Id, Designation) VALUES(667, 'Clerk')
INSERT INTO Job(Job_Id, Designation) VALUES(668, 'Staff')
INSERT INTO Job(Job_Id, Designation) VALUES(669, 'Analyst')
INSERT INTO Job(Job_Id, Designation) VALUES(670, 'Sales Person')
INSERT INTO Job(Job_Id, Designation) VALUES(671, 'Manager')
INSERT INTO Job(Job_Id, Designation) VALUES(672, 'President')

SELECT * FROM Job

SELECT * FROM Employee
CREATE TABLE Employee
(
Employee_Id INT PRIMARY KEY,
Last_Name VARCHAR(100),
First_Name VARCHAR(100),
Middle_Name VARCHAR(100),
Job_Id INT,
HireDate DATE,
Salary INT,
Commission INT,
Department_Id INt,
FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id),
FOREIGN KEY (Job_Id) REFERENCES Job(Job_Id)
)

INSERT INTO Employee(Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, HireDate, Salary, Commission, Department_Id) 
VALUES(7369, 'Smith','John', 'Q', 667, '17-Dec-84', 800, NULL, 20)
INSERT INTO Employee(Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, HireDate, Salary, Commission, Department_Id) 
VALUES(7499, 'Allen','Kevin', 'J', 670, '20-Feb-85', 1600, 300, 30)
INSERT INTO Employee(Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, HireDate, Salary, Commission, Department_Id) 
VALUES(755, 'Doyle','Jean', 'K', 671, '04-Apr-85', 2850, NULL, 30)
INSERT INTO Employee(Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, HireDate, Salary, Commission, Department_Id) 
VALUES(756, 'Dennis','Lynn', 'S', 671, '15-May-85', 2750, NULL, 30)
INSERT INTO Employee(Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, HireDate, Salary, Commission, Department_Id) 
VALUES(757, 'Baker','Leslie', 'D', 671, '10-Jun-85', 2200, NULL, 40)
INSERT INTO Employee(Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, HireDate, Salary, Commission, Department_Id) 
VALUES(7521, 'Wark','Cynthia', 'D', 670, '22-Feb-85', 1250, 50, 30)


--Simple Queries:

--1. List all the employee details.

SELECT * FROM Employee

--2. List all the department details.

SELECT * FROM Department


--3. List all job details.

SELECT * FROM Job


--4. List all the locations.

SELECT * FROM Locations


--5. List out the First Name, Last Name, Salary, Commission for all Employees.

SELECT First_Name, Last_Name, Salary, Commission FROM Employee


--6. List out the Employee ID, Last Name, Department ID for all employees and alias

Employee ID as "ID of the Employee", Last Name as "Name of the
Employee", Department ID as "Dep_id".

SELECT Employee_Id AS 'ID of the Employee', Last_Name AS 'Name of the Employee', Department_Id AS Dep_id
FROM Employee

--7. List out the annual salary of the employees with their names only.

SELECT First_Name, Middle_Name, Last_Name, Salary FROM Employee 



--WHERE Condition:

--1. List the details about "Smith".

SELECT * FROM Employee
WHERE Last_Name='Smith'

--2. List out the employees who are working in department 20.

SELECT * FROM Employee
WHERE Department_Id=20

--3. List out the employees who are earning salaries between 3000 and4500.

SELECT * FROM Employee
WHERE Salary BETWEEN 3000 AND 4500


--4. List out the employees who are working in department 10 or 20.

SELECT * FROM Employee
WHERE Department_Id IN(10,20)


--5. Find out the employees who are not working in department 10 or 30.

SELECT * FROM Employee
WHERE Department_Id NOT IN (10, 30)


--6. List out the employees whose name starts with 'S'.

SELECT * FROM Employee WHERE Last_Name LIKE 'S%'


--7. List out the employees whose name starts with 'S' and ends with 'H'.

SELECT * FROM Employee WHERE Last_Name LIKE 'S%H'


--8. List out the employees whose name length is 4 and start with 'S'.


SELECT * FROM Employee WHERE LEN(Last_Name)=4 AND Last_Name LIKE 'S%'


--9. List out employees who are working in department 10 and draw salaries more than 3500.

SELECT * FROM Employee WHERE Department_Id=10 AND Salary>3500


--10. List out the employees who are not receiving commission.

SELECT * FROM Employee WHERE Commission IS NULL




--ORDER BY Clause:

--1. List out the Employee ID and Last Name in ascending order based on the
Employee ID.

SELECT Employee_Id, Last_Name FROM Employee
ORDER BY Employee_Id ASC


--2. List out the Employee ID and Name in descending order based on salary.

SELECT Employee_Id, Last_Name, Salary FROM Employee
ORDER BY Salary DESC


--3. List out the employee details according to their Last Name in ascending-order.

SELECT Last_Name FROM Employee
ORDER BY Last_Name ASC


--4. List out the employee details according to their Last Name in ascending
order and then Department ID in descending order.

SELECT * FROM Employee
ORDER BY Last_Name ASC

SELECT * FROM Employee
ORDER BY Department_Id DESC




--GROUP BY and HAVING Clause:


--1. How many employees are in different departments in the organization?

SELECT Department_Id, 
COUNT (*) AS EmployeeCount FROM Employee 
GROUP BY Department_Id


--2. List out the department wise maximum salary, minimum salary and
average salary of the employees.

SELECT Department_Id,
MAX(Salary) AS MaxSalary
FROM Employee
GROUP BY Department_Id

SELECT Department_Id,
MIN(Salary) AS MinSalary
FROM Employee
GROUP BY Department_Id

SELECT Department_Id,
AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Department_Id

--3. List out the job wise maximum salary, minimum salary and average salary of the employees.

SELECT Job_Id,
MAX(Salary) AS MaxSalary
FROM Employee
GROUP BY Job_Id

SELECT Job_Id,
MIN(Salary) AS MinSalary
FROM Employee
GROUP BY Job_Id

SELECT Job_Id,
AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Job_Id


--4. List out the number of employees who joined each month in ascendingorder.

SELECT MONTH(HireDate) AS JoiningMonth, YEAR(HireDate) AS Year,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY MONTH(HireDate), YEAR(HireDate)

--5. List out the number of employees for each month and year in ascending order based on the year and month.

SELECT MONTH(HireDate) AS JoiningMonth, YEAR(HireDate) AS Year,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY MONTH(HireDate), YEAR(HireDate)

SELECT YEAR(HireDate) AS Year,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY YEAR(HireDate)


--6. List out the Department ID having at least four employees.

SELECT Department_Id,
COUNT(*) AS EmployeeCount FROM Employee 
GROUP BY Department_Id
HAVING COUNT(*)>=4


--7. How many employees joined in the month of January?

SELECT MONTH(HireDate) AS JoiningMonth,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY MONTH(HireDate)
HAVING MONTH(HireDate)=1

--8. How many employees joined in the month of January or September?

SELECT MONTH(HireDate) AS JoiningMonth,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY MONTH(HireDate)
HAVING MONTH(HireDate)=1 OR MONTH(HireDate)=9

--9. How many employees joined in 1985?

SELECT YEAR(HireDate) AS Year,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY YEAR(HireDate)
HAVING YEAR(HireDate)=1985


--10. How many employees joined each month in 1985?

SELECT MONTH(HireDate) AS JoiningMonth, YEAR(HireDate) AS Year,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY MONTH(HireDate), YEAR(HireDate)
HAVING YEAR(HireDate)=1985


--11. How many employees joined in March 1985?

SELECT MONTH(HireDate) AS JoiningMonth, YEAR(HireDate) AS Year,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY MONTH(HireDate), YEAR(HireDate)
HAVING MONTH(HireDate)=3 AND YEAR(HireDate)=1985


--12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?

SELECT Department_Id, MONTH(HireDate) AS JoiningMonth, YEAR(HireDate) AS Year,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY Department_Id, MONTH(HireDate), YEAR(HireDate)
HAVING MONTH(HireDate)=4 AND YEAR(HireDate)=1985 AND COUNT(*)>=3




--Joins:
--1. List out employees with their department names.

SELECT E.Employee_Id, E.Department_Id, D.Name
FROM Employee AS E
JOIN Department AS D ON E.Department_Id=D.Department_Id


--2. Display employees with their designations.

SELECT E.Employee_Id, E.Job_Id, J.Designation
FROM Employee AS E
JOIN Job AS J ON E.Job_Id=J.Job_Id


--3. Display the employees with their department names and regional groups.

SELECT E.Employee_Id, D.Name, L.City
FROM Employee AS E
JOIN Department AS D ON E.Department_Id=D.Department_Id
JOIN Locations AS L ON D.Location_Id=L.Location_Id



--4. How many employees are working in different departments? Display with
department names.

SELECT D.Department_Id, D.Name,
COUNT (E.Employee_Id) AS EmployeeCount FROM Department AS D
LEFT JOIN Employee AS E ON D.Department_Id=E.Department_Id
GROUP BY D.Department_Id, D.Name


--5. How many employees are working in the sales department?

SELECT D.Department_Id, D.Name,
COUNT (E.Employee_Id) AS EmployeeCount FROM Department AS D
LEFT JOIN Employee AS E ON D.Department_Id=E.Department_Id
GROUP BY D.Department_Id, D.Name
HAVING D.Name='Sales'


--6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.

SELECT D.Department_Id, D.Name,
COUNT (*) AS EmployeeCount FROM Department AS D
LEFT JOIN Employee AS E ON D.Department_Id=E.Department_Id
GROUP BY D.Department_Id, D.Name
HAVING COUNT (*)>=5


--7. How many jobs are there in the organization? Display with designations.

SELECT Designation,
COUNT(*) AS JobCount FROM Job
GROUP BY Designation


--8. How many employees are working in "New York"?

SELECT L.City,
COUNT(*) AS EmployeeCount FROM Employee AS E
JOIN Department AS D ON E.Department_Id=D.Department_Id
JOIN Locations AS L ON D.Location_Id=L.Location_Id
GROUP BY L.City
HAVING L.City='NewYork'


--9. Display the employee details with salary grades. Use conditional statement to create a grade column.

SELECT *,
CASE
WHEN Salary >= 2500 THEN 'A'
WHEN Salary >= 1500 THEN 'B'
WHEN Salary >= 1000 THEN 'C'
ELSE 'D'
END 
AS Grade FROM Employee


--10. List out the number of employees grade wise. Use conditional statement to create a grade column.

SELECT
CASE
 WHEN Salary >= 2500 THEN 'A'
 WHEN Salary >= 1500 THEN 'B'
 WHEN Salary >= 1000 THEN 'C'
ELSE 'D'
END 
AS Grade,
COUNT(*) AS EmployeeCount FROM Employee
GROUP BY CASE
 WHEN Salary >= 2500 THEN 'A'
 WHEN Salary >= 1500 THEN 'B'
 WHEN Salary >= 1000 THEN 'C'
ELSE 'D'
END



--11. Display the employee salary grades and the number of employees
between 2000 to 5000 range of salary.

SELECT
CASE
 WHEN Salary >= 2500 THEN 'A'
 WHEN Salary >= 1500 THEN 'B'
 WHEN Salary >= 1000 THEN 'C'
ELSE 'D'
END 
AS Grade,
COUNT(*) AS EmployeeCount FROM Employee
WHERE Salary BETWEEN 2000 AND 5000
GROUP BY CASE
 WHEN Salary >= 2500 THEN 'A'
 WHEN Salary >= 1500 THEN 'B'
 WHEN Salary >= 1000 THEN 'C'
ELSE 'D'
END


--12. Display all employees in sales or operation departments.

SELECT * FROM Employee AS E
JOIN Department AS D ON E.Department_Id=D.Department_Id
WHERE D.Name IN('Sales','Operations')




--SET Operators:

--1. List out the distinct jobs in sales and accounting departments.

SELECT J.Designation
FROM Employee AS E
JOIN Job AS J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Sales'

UNION

SELECT J.Designation
FROM Employee AS E
JOIN Job AS J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Accounting'

-- using Distinct

SELECT DISTINCT J.Designation
FROM Employee AS E
JOIN Job AS J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_id=D.Department_id
WHERE D.Name IN ('sales', 'accounting')




--2. List out all the jobs in sales and accounting departments.


SELECT J.Designation
FROM Employee AS E
JOIN Job AS J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Sales'

UNION ALL

SELECT J.Designation
FROM Employee AS E
JOIN Job AS J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Accounting'


--3. List out the common jobs in research and accounting departments in ascending order.

SELECT J.Designation
FROM Employee AS E
JOIN Job AS J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
GROUP BY Designation, D.Name
HAVING D.Name= 'Research'

INTERSECT

SELECT J.Designation
FROM Employee AS E
JOIN Job AS J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
GROUP BY Designation, D.Name
HAVING D.Name='Accounting'



--Subqueries:

--1. Display the employees list who got the maximum salary.

SELECT * FROM Employee 
WHERE Salary=(SELECT MAX(Salary) From Employee)

--2. Display the employees who are working in the sales department.

SELECT * FROM Employee
WHERE Department_Id = (
    SELECT Department_Id
    FROM Department AS D
    WHERE D.Name = 'Sales'
)


--3. Display the employees who are working as 'Clerk'.

SELECT * FROM Employee
WHERE Job_Id = (
    SELECT Job_Id
    FROM Job AS J
    WHERE J.Designation = 'Clerk'
)



--4. Display the list of employees who are living in "New York".

SELECT * FROM Employee
WHERE Department_Id = (
    SELECT D.Department_Id
	FROM Department AS D
	JOIN Locations AS L ON D.Location_Id=L.Location_Id
    WHERE L.City='New York'
)


--5. Find out the number of employees working in the sales department.

SELECT COUNT(*) FROM Employee
WHERE Department_Id = (
    SELECT Department_Id
    FROM Department AS D
    WHERE D.Name = 'Sales'
)


--6. Update the salaries of employees who are working as clerks on the basis of 10%.

SELECT Salary, SALARY + (SALARY*0.10) AS NewSalary FROM Employee
WHERE Job_Id = (
    SELECT Job_Id
    FROM Job AS J
    WHERE J.Designation = 'Clerk'
)


--7. Delete the employees who are working in the accounting department.

DELETE FROM Employee
WHERE Department_Id = (
    SELECT Department_Id
    FROM Department AS D
    WHERE D.Name = 'Accounting'
)


--8. Display the second highest salary drawing employee details.

SELECT * FROM Employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employee
    )
)


--9. Display the nth highest salary drawing employee details.

SELECT Salary AS RankedSalary
FROM (
    SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS salary_rank
    FROM Employee
) ranked_salary
WHERE salary_rank = 2;


--10. List out the employees who earn more than every employee in department 30.

SELECT *
FROM Employee
WHERE Salary > (
    SELECT MAX(Salary)
    FROM Employee
    WHERE Department_Id = 30
)


--11. List out the employees who earn more than the lowest salary in department.Find out whose department has no employees.

SELECT *
FROM Employee
WHERE Salary > (
    SELECT MIN(Salary)
    FROM Employee
)


--12. Find out which department has no employees.

SELECT Department_Id, Name
FROM Department
WHERE Department_Id NOT IN (
    SELECT DISTINCT Department_Id
    FROM Employee
)


--13. Find out the employees who earn greater than the average salary for their department.

SELECT *
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
)
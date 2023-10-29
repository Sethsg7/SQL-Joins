/* joins: select all the computers from the products table:
SELECT * FROM products WHERE Price >= 1400;
using the products table and the categories table, return the product name and the category name */
SELECT products.name AS Product, categories.Name AS Category
FROM products
INNER JOIN categories
ON products.CategoryID = categories.CategoryID
WHERE categories.Name = "Computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name AS Product, products.Price AS Price, reviews.Rating AS Rating
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS Units_Sold
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY Units_Sold DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
-- Appliances = 1, Games = 3;
SELECT categories.Name AS Category, departments.Name AS Department
FROM categories
INNER JOIN departments
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Name = "Games";



/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.ProductID AS ID, products.Name AS Name, SUM(sales.Quantity) AS Units_Sold, SUM(sales.Quantity * sales.PricePerUnit) AS GROSS
FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.ProductID = 97
GROUP BY products.ProductID;
-- HAVING products.Name LIKE "%Eagles: Hotel California%";


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.ProductID, products.Name,  reviews.Rating, reviews.Reviewer, reviews.Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating < 3 AND reviews.ProductID = 857;
-- WHERE products.Name LIKE "%Visio TV%"
-- ORDER BY reviews.Rating
-- LIMIT 1;




-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

-- SELECT * FROM sales;

SELECT sales.EmployeeID AS EmployeeID, employees.FirstName AS FirstName, employees.LastName AS LastName, products.Name AS Product_Name, sales.Quantity AS Sold
FROM sales
INNER JOIN employees
ON sales.EmployeeID = employees.EmployeeID
INNER JOIN products
ON sales.ProductID = products.ProductID
WHERE employees.EmployeeID = 33421;
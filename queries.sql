-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName, c.CategoryName
FROM [Product] as p
  JOIN [Category] as c
  ON p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT Id, ShipName
FROM [Order]
WHERE OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, od.Quantity
FROM [OrderDetail] as od
  JOIN [Product] as p
  ON od.ProductId = p.Id
WHERE od.OrderId = 10251
ORDER BY p.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id as OrderId, c.CompanyName, e.LastName
FROM [Order] as o
  JOIN [Customer] as c
  ON o.CustomerId = c.Id
  JOIN [Employee] as e
  ON o.EmployeeId = e.Id

-- Stretch 

-- #1 Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT c.CategoryName as category, count(p.ProductName)as [number of products]
FROM [Product] as p
  JOIN [Category] as c
  ON p.CategoryId = c.id
GROUP BY c.CategoryName
ORDER BY category;

-- #2 Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT 
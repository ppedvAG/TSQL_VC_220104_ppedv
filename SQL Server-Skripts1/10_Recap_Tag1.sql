--Aufgabe 1
SELECT COUNT(DISTINCT ProductID) FROM Products

--Aufgabe 2
SELECT COUNT(DISTINCT Country) AS Länderzahl FROM Customers

--Aufgabe 3
select AVG(od.UnitPrice) as Durschnittspreis_Anbieter, SupplierID, CompanyName from Orders o
Join [Order Details] od ON o.orderID =od.orderID
JOIN products p ON p.productID = od.productID
JOIN customers c ON o.CustomerID = c.CustomerID
Group by SupplierID, CompanyName
Order BY Durschnittspreis_Anbieter asc


SELECT AVG(p.UnitPrice) as Durchschnittspreis, CompanyName, s.SupplierID FROM Suppliers s
JOIN Products p ON p.SupplierID = s.SupplierID
GROUP BY CompanyName, s.SupplierID 
ORDER BY Durchschnittspreis ASC


--Aufgabe 4
SELECT SUM(Freight) as SummeFracht, CustomerID, ShipCountry FROM orders o
WHERE YEAR(ShippedDate) = '1996' OR YEAR(ShippedDate) = '2013'
GROUP BY CustomerID, ShipCountry
ORDER BY SummeFracht DESC

SELECT SUM(Freight) as SummeFracht, CustomerID, ShipCountry FROM orders o
WHERE (ShippedDate BETWEEN '19960101' AND '19961231') OR YEAR(ShippedDate) = '1997'
GROUP BY CustomerID, ShipCountry
ORDER BY SummeFracht DESC

SELECT SUM(Freight) as SummeFracht, CustomerID, ShipCountry FROM orders o
WHERE YEAR(ShippedDate) IN ('1992', '1994', '1996') 
GROUP BY CustomerID, ShipCountry
ORDER BY SummeFracht DESC

SELECT SUM(Freight) as SummeFracht, CustomerID, ShipCountry FROM orders o
WHERE ShippedDate >= '19960101' AND ShippedDate <= '19961231'
GROUP BY CustomerID, ShipCountry
ORDER BY SummeFracht DESC


--Aufgabe 5


SELECT Count(distinct c.CustomerID) as customerCount, Country FROM customers c
GROUP BY Country
HAVING Count(distinct c.CustomerID) > 5
ORDER BY customerCount desc


--Aufgabe 6 

select CONCAT(firstname,' ', lastname) as Fullname, count(Orderid) as numberoforders from employees
join Orders on Employees.EmployeeID = orders.EmployeeID
group by  employees.employeeid, firstname, lastname
Having count(Orderid) > 70
order by numberoforders, Fullname

SELECT CONCAT(lastname, ' ', firstname), e.EmployeeID, Count (orderID) as Number_orders from Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY  lastname, firstname, e.EmployeeID 
HAVING Count (orderID)>70
ORDER BY Number_orders asc

SELECT (lastname + firstname), e.EmployeeID, Count (orderID) as Number_orders from Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY  lastname, firstname, e.EmployeeID 
HAVING Count (orderID)>70
ORDER BY Number_orders asc


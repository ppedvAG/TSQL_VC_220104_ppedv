SELECT Count(distinct c.CustomerID) as customerCount, Country FROM customers c
GROUP BY Country
ORDER BY customerCount desc


--CTE Common Table Expression

WITH CteTest
AS
(
SELECT Count(distinct c.CustomerID) as customerCount, Country FROM customers c
GROUP BY Country
)

SELECT MAX(CustomerCount) FROM CteTest


--Temp Tables
--SELECT x INTO #tempname
--Ist nur innerhalb der Session/des Tabs verfügbar

SELECT * INTO #Temptablename FROM Customers

SELECT * FROM #Temptablename


SELECT Count(distinct c.CustomerID) as customerCount, Country INTO  #Zwischenergebnis FROM customers c
GROUP BY Country
ORDER BY customerCount desc

SELECT MAX(customerCount) FROM #Zwischenergebnis


--Temporal Tables ##
--"Selbe" wie Temp Table, allerdings Global, für alle User auf dem Server

SELECT Count(distinct c.CustomerID) as customerCount, Country INTO  ##TemporalTableName FROM customers c
GROUP BY Country
ORDER BY customerCount desc

--VIEWS/Sichten

CREATE VIEW vwCustomerByCountries
AS

SELECT Count(distinct c.CustomerID) as customerCount, Country FROM customers c
GROUP BY Country

SELECT * FROM vwCustomerByCountries
-- GO

--Master Table für Bestellpositionen als View speichern:


CREATE VIEW vwKunden
AS
SELECT	c.customerid, c.companyname, c.city, c.country, 
		o.orderid, o.freight, o.orderdate, 
		p.unitprice, p.productname,  
		od.quantity, od.productid, 
		e.lastname
FROM customers c
	INNER JOIN orders o ON c.customerid = o.customerid
	INNER JOIN [Order Details] od ON od.orderid = o.OrderID
	INNER JOIN products p ON p.productid = od.ProductID
	INNER JOIN employees e ON e.EmployeeID = o.EmployeeID


SELECT * FROM vwKunden

--ALTER VIEW

ALTER VIEW vwKunden
AS
SELECT	c.customerid, c.companyname, c.city, c.country, 
		o.orderid, o.freight, o.orderdate, 
		p.unitprice, p.productname,  
		od.quantity, od.productid, 
		e.lastname,
		(Quantity*od.UnitPrice) AS PosSumme

FROM customers c
	INNER JOIN orders o ON c.customerid = o.customerid
	INNER JOIN [Order Details] od ON od.orderid = o.OrderID
	INNER JOIN products p ON p.productid = od.ProductID
	INNER JOIN employees e ON e.EmployeeID = o.EmployeeID


--DROP VIEW - löscht die angegebene Sicht/View
DROP VIEW vwKunden



--Alle Bestellungen (orders) ausgeben, deren Frachtkosten höher sind als die durchschnittlichen Frachtkosten AVG(freight)

SELECT AVG(Freight) FROM orders



--Unterabfragen oder Subqueries/nested Query

SELECT OrderID, Freight
FROM orders
WHERE Freight > (SELECT AVG(Freight) FROM orders)

--Unterabfrage im FROM Statement MUSS ein ALIAS haben

SELECT * FROM 
(SELECT CompanyName FROM customers
WHERE Country = 'Germany') t



--Aufgabe:
•	Geben Sie die Namen und das Einstellungsdatum der Mitarbeiter aus, die im selben Jahr eingestellt wurden wie Mr. Robert King.
•	Titel, Vorname und Nachname sollen überprüft werden.

Table:Employees YEAR()

SELECT LastName, FirstName, HireDate FROM Employees e
WHERE YEAR(HireDate) = (SELECT YEAR(Hiredate) FROM employees WHERE EmployeeID = 7) AND EmployeeID != 7


SELECT * FROM employees


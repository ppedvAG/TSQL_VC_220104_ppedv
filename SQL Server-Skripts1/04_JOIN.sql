/* 
JOIN Keyword: Verbinden von Tabellen

Syntax: 
SELECT column FROM table1
JOIN table2 ON table1.KeyColumn = table2.KeyColumn
*/


SELECT customers.CustomerID, CompanyName, Freight FROM Customers 
JOIN Orders ON customers.CustomerID = Orders.CustomerID


--Aufgabe: Alle Kunden aus Brasilien und deren Frachtkosten (Freight)

SELECT c.CustomerID, CompanyName, Freight FROM Customers c 
JOIN Orders o ON c.customerID = o.CustomerID 
WHERE Country = 'Brazil'
--TABLE ALIAS: Wir können nach jedem genannten Table/Tabelle ein Alias vergeben (Bsp: FROM Customers c)
--Im weiteren Skript können wir den Table mit unserem Alias verwenden (spart viel Schreibarbeit)


-- Alle Angestellten die Bestellungen mit Frachtkosten > 100 bearbeitet haben


SELECT e.EmployeeID, LastName, Firstname FROM Employees e
Join Orders o ON e.EmployeeID = o.EmployeeID
Join Customers c ON c.CustomerID = o.CustomerID
WHERE Freight > 100



-- Kompletter Umsatz aka MasterTable:
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







SELECT * FROM Customers blablabla
JOIN Orders  ON blablabla.CustomerID = Orders.CustomerID
WHERE Country = 'Germany' AND Freight > 100
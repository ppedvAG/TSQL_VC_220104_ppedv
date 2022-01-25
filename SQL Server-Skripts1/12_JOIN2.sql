/*
SELECT * FROM table1
JOIN table2 ON table1.key = table2.key

= INNER JOIN; vergleicht tabellen anhand übereinstimmendem Schlüssel
*/

SELECT * FROM customers c
INNER JOIN orders o ON c.customerid = o.customerid

/*
OUTER JOINS
LEFT & RIGHT JOIN
*/

SELECT * FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid

--LEFT = ALLES aus der Tabelle die "zuerst" genannt ist, bzw. "links" vom Keyword LEFT
SELECT DISTINCT CompanyName FROM orders o LEFT JOIN Customers c ON c.customerid = o.customerid

--RIGHT = ALLES aus der Tabelle die "zuletzt" genannt ist, bzw. "rechts" vom Keyword RIGHT
SELECT DISTINCT CompanyName FROM orders o LEFT JOIN Customers c ON c.customerid = o.customerid



SELECT DISTINCT CompanyName, o.* FROM orders o RIGHT JOIN Customers c ON c.customerid = o.customerid
-- = das selbe
SELECT DISTINCT CompanyName FROM Customers c LEFT JOIN orders o ON c.customerid = o.customerid


--FULL OUTER JOIN: Kombination aus LEFT & RIGHT


--INVERSE LEFT/RIGHT JOIN mit WHERE a/b.key IS NULL

SELECT DISTINCT CompanyName, o.* FROM orders o RIGHT JOIN Customers c ON c.customerid = o.customerid
WHERE o.customerid IS NULL


--INVERSE FULL OUTER JOIN mit WHERE a.key IS NULL OR b.key IS NULL

SELECT DISTINCT CompanyName, o.* FROM orders o FULL OUTER JOIN Customers c ON c.customerid = o.customerid
WHERE o.customerid IS NULL OR c.customerID IS NULL



--CROSS JOIN = karthesisches Produkt zweier Tabellen AxB
--Generiert alle möglichen Kombination
SELECT * FROM orders CROSS JOIN customers


--SELF JOIN = Join einer Tabelle mit sich selbst

SELECT A.Lastname as Lastname1, B.Firstname AS firstname1 FROM employees A, employees B
WHERE a.employeeid = b.employeeid


SELECT employeeID, LAstname, Firstname, ReportsTO FROM Employees e


SELECT A.Lastname as Lastname1, B.Lastname AS Lastname2 FROM employees A, employees B
WHERE a.employeeid = b.reportsto
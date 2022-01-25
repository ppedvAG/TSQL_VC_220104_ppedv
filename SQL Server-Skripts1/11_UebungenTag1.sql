--Für Jede Bestellnummer (OrderID) die zugehörige Rechnungssumme (UnitPrice * Quantity) ausgeben (OrderID + ReSumme)

SELECT o.OrderID, SUM(Quantity*UnitPrice) AS ReSumme FROM orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID



--(Gesamt)Umsatz jedes Kunden aus Deutschland ausgeben (CompanyName + Umsatz)

SELECT CompanyName, SUM(Quantity*UnitPrice) AS ReSumme FROM Customers c
JOIN orders o ON c.customerID = o.CustomerID
JOIN [Order Details] od ON od.orderid = o.OrderId
WHERE Country = 'Germany'
GROUP BY CompanyName


--Welcher Angestellte hat den höchsten Umsatz generiert? (Nachname Employee + Umsatz)

SELECT TOP 1 with ties Lastname, SUM(Quantity*UnitPrice) AS UmsatzSumme FROM employees e
JOIN orders o ON o.employeeID = e.Employeeid
JOIN [Order Details] od ON od.orderID = o.orderid
GROUP BY Lastname
ORDER BY UmsatzSumme DESC

SELECT TOP 15 PERCENT Lastname, SUM(Quantity*UnitPrice) AS UmsatzSumme FROM employees e
JOIN orders o ON o.employeeID = e.Employeeid
JOIN [Order Details] od ON od.orderID = o.orderid
GROUP BY Lastname
ORDER BY UmsatzSumme DESC

--In welcher deutschen Stadt wurden die meisten Frachtkosten bezahlt? (Land(DE) + Stadt + SummeFrachtkosten)



--Welches Produkt (Productname) ist das meistverkaufte (Quantity) nach/in Deutschland?

SELECT ProductName, SUM(Quantity) as Anzahl FROM [Order Details] od
JOIN orders o ON od.orderid = o.orderid
JOIN customers c ON c.customerid = o.customerid
JOIN Products p ON p.productid = od.ProductID

WHERE Country = 'Germany'
GROUP BY ProductName
ORDER BY Anzahl DESC





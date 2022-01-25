--GROUP BY Keyword
--Gruppiert die Ergebnisse nach angegebenen Spalten

SELECT customers.CustomerID, CompanyName, COUNT(*) AS AnzahlBest FROM orders
JOIN Customers ON customers.customerID = orders.customerID
GROUP BY customers.CustomerID, CompanyName
ORDER BY AnzahlBest ASC

--GROUP BY Klausel: ALLES was keine Aggregatfunktion ist, einfach nach Group by copy paste


--GROUP BY Filtern:
--mit HAVING; funktioniert genauso wie WHERE

SELECT customers.CustomerID, CompanyName, COUNT(*) AS AnzahlBest FROM orders
JOIN Customers ON customers.customerID = orders.customerID
GROUP BY customers.CustomerID, CompanyName
HAVING COUNT(*) > 10
ORDER BY AnzahlBest DESC

-- Auch mit Wildcards und LIKE:
SELECT customers.CustomerID, CompanyName, COUNT(*) AS AnzahlBest FROM orders
JOIN Customers ON customers.customerID = orders.customerID
GROUP BY customers.CustomerID, CompanyName
HAVING CompanyName LIKE 'a%'
ORDER BY AnzahlBest DESC


--GROUP nach PLZ (haben wir mehrere Kunden mit der selben PLZ?)
SELECT PostalCode, City, COUNT(PostalCode) FROM Customers
GROUP BY PostalCode, City
ORDER BY COUNT(PostalCode) DESC





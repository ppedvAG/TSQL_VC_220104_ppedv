-- UNION Keyword: Vereint 2 Tabellen miteinandern, allerdings vertikal

SELECT 100
UNION
SELECT 200

-- UNION brauchen wir die selbe Anzahl an Spalten in allen Tabellen
SELECT * FROM Customers
UNION
SELECT * FROM orders

--UNION fürht automatisch ein "DISTINCT" durch --> Duplikate werden gelöscht:

SELECT * FROM Customers
UNION
SELECT * FROM Customers


-- Aufgabe: ABC Analyse Kunden nach Umsatz
-- A = 20.000 oder mehr Umsatz; B = Zwischen 5000 & 20.000 Umsatz; C = unter 5000 Umsatz
--Ziel: Wir möchten EINE Liste, mit allen Kunden, sortiert in die Kategorien A/B/C
--Ausgabe: CompanyName, GesamtUmsatz, Kategorie

SELECT * FROM vwKunden  

SELECT 'Hallo ich bins' as Kategorie FROM customers

Tipp: Wir erstellen 3 Tabellen und fügen diese mit UNION zusammen


--Gesamtumsatz der Kunden:
SELECT SUM(Unitprice*Quantity) as Gesammtumsatz, CustomerID FROM [Order Details] od
JOIN orders o ON o.orderID = od.orderID
Group by CustomerID


--Lösung mit Kategorien:
select companyname, sum(posSumme) as Umsatz, 'A'  as Kategorie from vwkunden
Group by companyname
having sum(posSumme) > 20000
union
select companyname, sum(posSumme) as Umsatz, 'B'  as Kategorie from vwkunden
Group by companyname
having sum(posSumme) between 5000 and 20000
union
select companyname, sum(posSumme) as Umsatz, 'C'  as Kategorie from vwkunden
Group by companyname
having sum(posSumme) < 5000
order by Kategorie, Umsatz DESC


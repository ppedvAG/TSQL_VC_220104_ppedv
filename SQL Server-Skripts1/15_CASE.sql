--CASE Keyword: 

SELECT OrderID, Quantity, 
CASE 
	WHEN Quantity > 30 THEN 'Achtung: Mehr als 30 Stück!'
	WHEN Quantity = 30 THEN 'Genau 30 Stück.'
	ELSE 'Kein Problem, unter 30 Stück'
END AS Warnung
, UnitPrice
FROM [Order Details]

--Soviele WHEN - THEN Bedingungen wie gewollt, als "letztes" Statement immer ELSE ("Notausgang")
--CASE Block wird mit END abgeschlossen


--Vorige Lösung mit UNION:
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

--Lösung mit CASE:
SELECT Companyname, sum(PosSumme) as Umsatz,
CASE
When sum(PosSumme) > 20000 THEN 'A'
When sum(PosSumme) between 5000 and 20000 THEN 'B'
ELSE 'C'
END as Kategorie
FROM vwKunden
GROUP BY Companyname
ORDER BY Kategorie, Umsatz DESC


--Aufgabe: Welche Altersgruppe unserer Angestellten, wieviel Umsatz mit Alkoholika gemacht hat
--Altersgruppen: U30, 30-40; 41-50, 51-60, Ü60
--Categorie 1 (Beverages); ProductID 1, 24, 43 sind kein Alkohol
--Hilfe zu Alter der Angestellten: "BirthDate" & "OrderDate"

datediff(yy, birthdate, orderdate)


SELECT 
CASE
	WHEN datediff(yy, birthdate, orderdate) BETWEEN 30 AND 40 THEN '30-40'
	WHEN datediff(yy, birthdate, orderdate) BETWEEN 41 AND 50 THEN '41-50'
	WHEN datediff(yy, birthdate, orderdate) BETWEEN 51 AND 60 THEN '51-60'
	WHEN datediff(yy, birthdate, orderdate) > 60 THEN 'Ü60'
	ELSE 'U30'
END AS Altersgruppe
,SUM(quantity*od.unitprice) AS UmsatzSumme FROM employees e
JOIN orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON od.orderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Categories cat ON cat.CategoryID = p.CategoryID
WHERE cat.CategoryID = 1 AND p.ProductID NOT IN ('1', '24', '43')
GROUP BY 
CASE
	WHEN datediff(yy, birthdate, orderdate) BETWEEN 30 AND 40 THEN '30-40'
	WHEN datediff(yy, birthdate, orderdate) BETWEEN 41 AND 50 THEN '41-50'
	WHEN datediff(yy, birthdate, orderdate) BETWEEN 51 AND 60 THEN '51-60'
	WHEN datediff(yy, birthdate, orderdate) > 60 THEN 'Ü60'
	ELSE 'U30'
END




SELECT 
e.EmployeeID
,SUM(quantity*od.unitprice) AS UmsatzSumme FROM employees e
JOIN orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON od.orderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Categories cat ON cat.CategoryID = p.CategoryID
WHERE cat.CategoryID = 1 AND p.ProductID NOT IN ('1', '24', '43')
GROUP BY 
e.EmployeeID






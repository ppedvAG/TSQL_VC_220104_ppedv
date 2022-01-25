--DISTINCT Keyword

SELECT DISTINCT City FROM Customers

--COUNT() zählt Ergebnisse

SELECT  Count(DISTINCT City) AS AnzahlStädte FROM Customers

--TOP(x) zeigt die obersten (oder untersten, je nach ORDER BY Sortierung) x Zeilen

SELECT TOP 10 * FROM Orders
ORDER BY Freight DESC


--Alle Frachtkosten (netto) anzeigen + brutto + MwSt (19%) 

select freight, freight*1.19 as brutto, freight*0.19 as mwst from orders

--SUM() Summe einer Spalte

SELECT SUM(Freight) FROM orders


--AVG() Durchschnitt

SELECT AVG(Freight) FROM orders

--MAX() bzw. MIN()

SELECT MAX(Freight) FROM orders
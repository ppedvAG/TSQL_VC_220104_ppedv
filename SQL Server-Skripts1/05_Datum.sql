--DATUM
--Datetime yy:mm:dd hh:mm:ss:ms

SELECT getdate() --Jetziges Datum / Timestamp

SELECT Datename(DW, '19930224') -- Wochentag zu Datum x

SELECT datediff(dd, '19930224', getdate()) -- Differenz zwischen 2 Datum

SELECT dateadd(yy, -10, getdate()) -- Addiert/Subtrahiert von Datum


--Aufgabe: Orders Table: Alle Bestellungen mit Lieferverzögerung unsererseits 
-- + Lieferverzögerung in Tagen als extra Spalte (RequiredDate, ShippedDate)


select datediff(dd,RequiredDate,ShippedDate) as LieferverzögerungInTagen, OrderId, ShippedDate AS Lieferdatum, RequiredDate  from orders
where datediff(dd,RequiredDate,ShippedDate) > 0
ORDER BY LieferverzögerungInTagen DESC

--ORDER BY Keyword // sortiert nach ORDER BY Spaltenname; automatisch Aufsteigend (ASC), mit DESC (descending) absteigend
--AS ALIAS 


select datediff(dd,RequiredDate,ShippedDate) as LieferverzögerungInTagen, OrderId, ShippedDate AS Lieferdatum, RequiredDate  from orders
where datediff(dd,RequiredDate,ShippedDate) <= 0
ORDER BY LieferverzögerungInTagen DESC


SELECT * FROM Orders
WHERE ShippedDate IS NULL



--Aufgabe: Zusätzlich Ergebnins mit noch nicht gelieferten Bestellungen ISNULL(Spalte, Ersatzwert falls NULL)

select datediff(dd,RequiredDate,ISNULL(ShippedDate, getdate())) as LieferverzögerungInTagen, OrderId, ShippedDate AS Lieferdatum, RequiredDate  from orders
where datediff(dd,RequiredDate,ShippedDate) > 0 OR ShippedDate IS NULL
ORDER BY LieferverzögerungInTagen DESC
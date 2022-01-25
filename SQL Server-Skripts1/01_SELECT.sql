USE Northwind
GO
--USE Datenbank GO; Anweisung, die angibt in welcher Datenbank auf dem Server abgefragt werden soll (GO beendet den Befehl)

/*
SELECT Keyword:
- steht immer am Anfang der Abfrage/des Skripts
- gibt Spalten an, die abgerufen werden sollen; getrennt durch Komma ','
- '*' Stern = Alle Spalten der Tabelle
- ALIAS (also "Eigenname" f�r Spalte) durch AS Keyword nach der jeweiligen Spalte
*/


SELECT * FROM Customers  -- STRG + E markierte Zeilen werden ausgef�hrt 

/* FROM Keyword:
- "Woher" sollen die Daten genommen werden?
- Kommt immer direkt nach dem SELECT Befehl
- Gibt die Tabelle an, die aufgerufen werden soll */


/* Kommentar
�ber mehrere Zeilen
solange ich m�chte 
zwischen diesen Symbolen 
*/

-- Mit zwei "Minuszeichen" ist der Kommentar nur 
f�r eine Zeile
-- Kommentare werden beim Ausf�hren des Skripts NICHT interpretiert

select * frOm cuStomers

-- Gro�/Kleinschreibung egal; Zeileneinzug und Leerzeichen ebenfalls

SELECT CompanyName,		[Address], 
				
				City, Country 
	FROM Customers

--Spaltennamen mit Leerzeichen (oder SQL-reservierten Keywords) durch [] einbinden

SELECT * FROM Order Details --funktioniert nicht
SELECT * FROM [Order Details]


USE Northwind
GO
--USE Datenbank GO; Anweisung, die angibt in welcher Datenbank auf dem Server abgefragt werden soll (GO beendet den Befehl)

/*
SELECT Keyword:
- steht immer am Anfang der Abfrage/des Skripts
- gibt Spalten an, die abgerufen werden sollen; getrennt durch Komma ','
- '*' Stern = Alle Spalten der Tabelle
- ALIAS (also "Eigenname" für Spalte) durch AS Keyword nach der jeweiligen Spalte
*/


SELECT * FROM Customers  -- STRG + E markierte Zeilen werden ausgeführt 

/* FROM Keyword:
- "Woher" sollen die Daten genommen werden?
- Kommt immer direkt nach dem SELECT Befehl
- Gibt die Tabelle an, die aufgerufen werden soll */


/* Kommentar
über mehrere Zeilen
solange ich möchte 
zwischen diesen Symbolen 
*/

-- Mit zwei "Minuszeichen" ist der Kommentar nur 
für eine Zeile
-- Kommentare werden beim Ausführen des Skripts NICHT interpretiert

select * frOm cuStomers

-- Groß/Kleinschreibung egal; Zeileneinzug und Leerzeichen ebenfalls

SELECT CompanyName,		[Address], 
				
				City, Country 
	FROM Customers

--Spaltennamen mit Leerzeichen (oder SQL-reservierten Keywords) durch [] einbinden

SELECT * FROM Order Details --funktioniert nicht
SELECT * FROM [Order Details]


--WHERE Keyword --> Filter Funktion nach angegebenen Kriterien
--(Weitere Filtermöglichkeiten unter "Wildcards")

SELECT * FROM Customers
WHERE Country = 'Germany'

SELECT * FROM Customers
WHERE City = 'Berlin'

SELECT * FROM Customers
WHERE Country = 'USA' OR Country = 'UK'

-- Funktioniert mit sämtlichen Vergleichsoperatoren: '<' '>' '=>' '!='(ungleich) etc.


--Aufgabe: Alle Orders mit Freight größer 50

SELECT * FROM Orders
WHERE Freight > 50

--Verbindung mehrerer WHERE Filter durch AND (=und) / OR (=oder)
--Spaltenname muss jedesmal neu angegeben werden, auch wenn der Filter sich auf die selbe Spalte bezieht


--Aufgabe: Kunden aus USA, UK und Berlin, Paris, Bonn, oder Wien, Rom

SELECT * FROM Customers
WHERE Country = 'USA' OR Country = 'UK' OR City = 'Berlin' OR City = 'Paris' -- USW...

-- IN Keyword --> Mehrere "OR/AND" Bedingungen zusammengefasst in einer Klammer, getrennt durch Komma:

SELECT * FROM Customers
WHERE Country IN ('USA', 'UK') OR City IN ('Bonn', 'Rom')


-- AND ist immer stärker bindent; Im Zweifelsfall Klammern setzen
SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Köln')


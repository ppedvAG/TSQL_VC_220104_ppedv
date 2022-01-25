-- WILDCARDS
-- Suche mit WHERE column LIKE 'Wildcards'

--'%' steht für jedes beliebige Zeichen, und egal wieviele davon

SELECT * FROM Customers
WHERE CompanyName LIKE 'a%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%a'

SELECT * FROM Customers
WHERE CompanyName LIKE '%ab%'

--'_' steht für EIN beliebiges Zeichen

SELECT * FROM Customers
WHERE CompanyName LIKE '_a%'

--'[xyz]' steht für EIN Zeichen aus der Auswahl in den Klammern

SELECT * FROM Customers
WHERE PostalCode LIKE '0[1234]%'

--'[^xyz]' steht für EIN Zeichen NICHT aus der Auswahl in den Klammern

SELECT * FROM Customers
WHERE PostalCode LIKE '0[^1234]%'

--'[a-m]' steht für EIN Zeichen innerhalb der angegebenen Menge
--'[4-8]'

SELECT * FROM Customers
WHERE City LIKE '[a-f]%'

--Wir suchen einen Herrn Meier/Maier/Meyer/Mayer

'M[ea][iy]er'


UPDATE Customers SET CompanyName = 'Alfred´s Futterkiste' WHERE Companyname = 'Alfreds Futterkiste'


--Falls man nach ' sucht, folgenden Ausdruck verwenden:
SELECT * FROM Customers
WHERE CompanyName LIKE '%''%'

--Suche nach '%' Zeichen
SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'
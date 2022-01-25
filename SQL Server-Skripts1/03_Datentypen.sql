-- DATENTYPEN (Siehe PowerPoint Slides)
/*
F�r Zahlen:

int = integer  = (Ganzzahl) 
decimal(5, 10)
binary (1,0)
money

char(5); --> MUSS genau 5 Zeichen besitzen
varchar(50); --> BIS ZU 5 Zeichen
nvarchar(50); --> L�sst "ALLE" Zeichen zu

date = yy:mm:dd
datetime = yy:mm:dd hh:ss:ms
*/

SELECT Orderdate FROM Orders


/*
DatenBank B�cherhandel

*Produkte*
BuchID --> PK Primary Key
ISBN 
Artikelname
Gewicht
Gr��e
Autor
Sprache
Seitenanzahl
Preis

*Kunden*
KundenID --> PK
Name
Vorname
Firma
Stra�e
(Hausnummer)
PLZ
Stadt
Land

*Bestellungen*
BestellID --> PK
KundenID
BestellDatum
Lieferdatum


*BestellDetails*
BestellDetID --> PK
BestellID
BuchID
Anzahl: 10 --> 8

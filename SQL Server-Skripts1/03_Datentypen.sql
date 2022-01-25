-- DATENTYPEN (Siehe PowerPoint Slides)
/*
Für Zahlen:

int = integer  = (Ganzzahl) 
decimal(5, 10)
binary (1,0)
money

char(5); --> MUSS genau 5 Zeichen besitzen
varchar(50); --> BIS ZU 5 Zeichen
nvarchar(50); --> Lässt "ALLE" Zeichen zu

date = yy:mm:dd
datetime = yy:mm:dd hh:ss:ms
*/

SELECT Orderdate FROM Orders


/*
DatenBank Bücherhandel

*Produkte*
BuchID --> PK Primary Key
ISBN 
Artikelname
Gewicht
Größe
Autor
Sprache
Seitenanzahl
Preis

*Kunden*
KundenID --> PK
Name
Vorname
Firma
Straße
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

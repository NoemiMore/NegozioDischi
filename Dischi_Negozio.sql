/*
Ho 2 tabelle Tabella1 e Tabella2. Se scrivo Tabella1 left join Tabella2 che risultati produce?  B


2) L’associazione “molti a molti” tra 2 tabelle come si traduce nel database? CON LA CREAZIONE DI UNA TABELLA CAST CHE COMPRENDE GLI ID DI COLLEGAMENTO TRA 2 TABELLE
3) L’istruzione UPDATE è un comando di tipo:  B


4) La funzione "SUM(attributo)" restituisce:  B

5) È possibile scrivere una condizione del tipo “where Id= null”? B



*/


CREATE  DATABASE DischiNegozio;


CREATE TABLE Band (
	IdBand INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
	
	Nome NVARCHAR(20) NOT NULL,
	NumeroComponenti NVARCHAR(20) NOT NULL,
	);




	CREATE TABLE Album (
	IdAlbum INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
	IdBand INTEGER NOT NULL,
	Titolo NVARCHAR(50) NOT NULL ,
	AnnoUscita DATE NOT NULL ,
	CasaDiscografica NVARCHAR(20) NOT NULL ,
	Genere NVARCHAR(20) NOT NULL ,
	
	SupportoDistribuzione NVARCHAR(20) NOT NULL ,
	
	 CONSTRAINT CHK_Genere CHECK (Genere ='classico' or Genere='pop' OR Genere ='rock' OR Genere ='metal'),
	  CONSTRAINT CHK_Supporto CHECK(SupportoDistribuzione = 'vinile' OR SupportoDistribuzione ='CD' OR SupportoDistribuzione ='streaming'),
CONSTRAINT FK_Band FOREIGN KEY(IdBand) REFERENCES Band(IdBand),
);




CREATE TABLE Brano (
	IdBrano INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Titolo NVARCHAR(50) NOT NULL,
	Durata TIME NOT NULL,
	
);


CREATE TABLE Album_Brano (
	IdAlbum INTEGER NOT NULL,
	IdBrano INTEGER NOT NULL,
	
    CONSTRAINT FK_Album FOREIGN KEY(IdAlbum)  REFERENCES Album(IdAlbum),
	CONSTRAINT FK_Brano FOREIGN KEY(IdBrano)  REFERENCES Brano(IdBrano)
);
	



	--INSERIMENTO DATI

	INSERT INTO Band VALUES ('Maneskin', 5);
INSERT INTO Band VALUES ('883', 4);
INSERT INTO Band VALUES ('BGKO', 6);
INSERT INTO Band VALUES ('JOHN', 3);
INSERT INTO Band VALUES ('Giornalist',2);




INSERT INTO Album VALUES (1, 'A casa', '2020', 'Sony Music', 'Classico', 'streaming');
INSERT INTO Album VALUES (5, 'Rossi', '2020-12-03', 'nfmfkkf', 'Rock', 'vinile');
INSERT INTO Album VALUES (3,'Sao Cantado', '2017-09-12', 'Tanta Roba', 'Pop', 'streaming');
INSERT INTO Album VALUES (4,'Immajfnnfj', '2021-05-13', 'BestSound', 'Pop', 'CD');
INSERT INTO Album VALUES (5,'Sara', '2018', 'Sony Music', 'Metal', 'CD');
INSERT INTO Album VALUES (2,'Come mai', '2020-06-23', 'Sony Music', 'Pop', 'vinile');
INSERT INTO Album VALUES (2,'tiitnnd', '2020-07-23', 'Sony Music', 'Pop', 'CD');
INSERT INTO Album VALUES (1, 'A casa', '2018-03-12', 'Sony Music', 'Classico', 'CD');
INSERT INTO Album VALUES (1, 'Angkkkgma', '2018-02-22', 'Sony Music', 'Classico', 'Vinile');

INSERT INTO Album VALUES (4, 'Anfhkldn', '2020-02-22', 'Sony Music', 'Classico', 'Vinile');
INSERT INTO Album VALUES (4, 'fffAngkkkgma', '2008-02-22', 'Sony Music', 'Pop', 'Vinile');





	INSERT INTO Brano VALUES ('A casa', '03:00');
INSERT INTO Brano VALUES ('Ci sarò','02:00');
INSERT INTO Brano VALUES ('Ederlezi','05:00');
INSERT INTO Brano VALUES ('Image', '02:00');
INSERT INTO Brano VALUES ('Ciao','04:00');
INSERT INTO Brano VALUES ('San galo','05:00');
INSERT INTO Brano VALUES ('mfjsnnjf', '03:00');
INSERT INTO Brano VALUES ('Cnfjnso','05:00');
INSERT INTO Brano VALUES ('Cnfjjfso','02:00');
INSERT INTO Brano VALUES ('nfdjdso','02:00');

INSERT INTO Brano VALUES ('Imagine', '02:00');
INSERT INTO Brano VALUES ('Imagine', '02:00');


INSERT INTO Album_Brano VALUES (1,3);
INSERT INTO Album_Brano VALUES (1,2);
INSERT INTO Album_Brano VALUES (1,1);
INSERT INTO Album_Brano VALUES (3,6);
INSERT INTO Album_Brano VALUES (4,8);
INSERT INTO Album_Brano VALUES (6,8);
INSERT INTO Album_Brano VALUES (3,7);
INSERT INTO Album_Brano VALUES (5,8);
INSERT INTO Album_Brano VALUES (8,8);
INSERT INTO Album_Brano VALUES (9,9);

INSERT INTO Album_Brano VALUES (10,11);
INSERT INTO Album_Brano VALUES (11,12);



SELECT * FROM Band;
SELECT * FROM Brano;
SELECT * FROM Album;
SELECT * FROM Album_Brano;



 --1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;

 SELECT a.Titolo
 FROM Band b  JOIN Album a ON b.IdBand=a.IdBand
 WHERE b.Nome = '883'
 ORDER BY a.Titolo


 --2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;

 SELECT *
 FROM Album a
 WHERE a.CasaDiscografica= 'Sony Music' AND  a.AnnoUscita  between '2020-01-01' and '2020-12-31'


 --3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti
--ad album pubblicati prima del 2019;

SELECT br.Titolo 
FROM BAND b JOIN Album a ON b.IdBand= a.IdBand
JOIN Album_Brano ab ON ab.IdAlbum=a.IdAlbum
JOIN Brano br ON ab.IdBrano=br.IdBrano
WHERE b.Nome= 'Maneskin' AND a.AnnoUscita<'2019-01-01'

 

 --4)  4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;

 SELECT a.Titolo
 FROM Album a JOIN Album_Brano ab ON a.IdAlbum=ab.IdAlbum
 JOIN Brano br ON ab.IdBrano= br.IdBrano
 WHERE br.Titolo= 'Imagine'
 
 

-- 5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;
-- trovare le canzoni della band giornalist inserirle in una tabella con  somma
SELECT 
FROM  ( SELECT br.Titolo
         FROM Band b JOIN Album a ON b.IdBand= a.IdBand
		 JOIN Album_Brano ab ON a.IdAlbum=ab.IdAlbum
		 JOIN Brano br ON ab.IdBrano=br.IdBrano
         WHERE  b.Nome= 'Giornalist') AS TabellaCanzoni 


WHERE
;


--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i
-- secondi quindi 180 s).

SELECT DISTINCT br.Titolo 
FROM Band b JOIN Album a ON b.IdBand= a.IdBand
            JOIN Album_Brano ab ON ab.IdAlbum=a.IdAlbum
            JOIN Brano br ON ab.IdBrano=br.IdBrano
WHERE b.Nome = '883' AND br.Durata> '03:00'
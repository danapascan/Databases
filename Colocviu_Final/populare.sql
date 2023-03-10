create database if not exists scoala_soferi;
use scoala_soferi;


CREATE TABLE Intrebare(
ID_I DOUBLE  NOT NULL,
INTREBARE VARCHAR(200) NOT NULL,
POZA VARCHAR(10),
SECTIUNE VARCHAR(50) NOT NULL,
CATEGORIE VARCHAR(50) NOT NULL
);


CREATE TABLE Raspuns(
ID_I DOUBLE NOT NULL,
ID_R CHAR (1) NOT NULL,
RASPUNS VARCHAR (100) NOT NULL,
CORECT CHAR(1) NOT NULL 
);

 
CREATE TABLE Chestionar(
ID_C DOUBLE  NOT NULL,
DENUMIRE CHAR(10) NOT NULL,
PUNCTAJ_MAX DOUBLE  NOT NULL
);

 
CREATE TABLE Intrebari_Chestionar(
ID_C DOUBLE NOT NULL,
ID_I DOUBLE  NOT NULL,
NR_ORDINE DOUBLE NOT NULL
);

 
CREATE TABLE Test(
ID_T DOUBLE NOT NULL,
DATA DATETIME NOT NULL,
PUNCTAJ DOUBLE NOT NULL,
ID_C DOUBLE NOT NULL
);

 
CREATE TABLE Raspuns_Test(
ID_T DOUBLE NOT NULL,
ID_R CHAR(1) NOT NULL,
ID_I DOUBLE NOT NULL,
CORECT CHAR(1) NOT NULL
);

ALTER TABLE Intrebare ADD PRIMARY KEY (ID_I);
ALTER TABLE Raspuns ADD PRIMARY KEY (ID_I, ID_R);
ALTER TABLE Raspuns ADD FOREIGN KEY(ID_I) REFERENCES Intrebare(ID_I);
ALTER TABLE Chestionar ADD PRIMARY KEY (ID_C);
ALTER TABLE Intrebari_Chestionar ADD FOREIGN KEY(ID_C) REFERENCES Chestionar (ID_C);
ALTER TABLE Intrebari_Chestionar ADD FOREIGN KEY(ID_I) REFERENCES Intrebare(ID_i);
ALTER TABLE Test ADD PRIMARY KEY (ID_T);
ALTER TABLE Raspuns_Test ADD FOREIGN KEY(ID_T) REFERENCES Test (ID_T);
ALTER TABLE Raspuns_Test ADD FOREIGN KEY(ID_I) REFERENCES Intrebare (ID_I);
ALTER TABLE Raspuns_Test ADD FOREIGN KEY(ID_I,ID_R) REFERENCES Raspuns (ID_I, ID_R);

ALTER TABLE Raspuns ADD CONSTRAINT ID_R CHECK(ID_R IN ('a','b','c','d'));
ALTER TABLE Raspuns ADD CONSTRAINT CORECT CHECK (CORECT IN ('D','N'));
ALTER TABLE Raspuns_Test ADD CONSTRAINT CORECT2 CHECK (CORECT IN ('D','N'));
ALTER TABLE Intrebare MODIFY CATEGORIE VARCHAR(50);
ALTER TABLE Intrebari_Chestionar ADD CONSTRAINT NR_ORDINE CHECK (NR_ORDINE BETWEEN 1 AND 26); 
ALTER TABLE Intrebare ADD CONSTRAINT SECTIUNE CHECK( POZA IS NOT NULL OR SECTIUNE <> 'Indicatoare si marcaje'); 


INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('1','Schimbarea directiei de mers la dreapta sau la stanga nu este permisa la intalnirea:','Da','Indicatoare si marcaje','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('2','Panoul de sub indicator permite:','Da','Indicatoare si marcaje','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('3','Cum este corect sa procedati daca semafoarele functioneaza cu lumina galbena intermitenta?','Da','Semnale luminoase','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('4','Ce semnificatie are lumina de culoare rosie a semaforului, atat pentru conducatorii de vehicule, cat si pentru pietoni',NULL,'Semnale luminoase','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('5','Este corect sa depasesti motocicleta din fata ta?','Da','Depasirea','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('6','In care din situatile de mai jos e interzisa intoarcerea?',NULL,'Manevre','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('7','In care dintre situatiile de mai jos se ssuspenda exercitarea dreptului de a conduce?',NULL,'Sanctiuni si infractiuni','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('8','In ce ordine vor trece autovehiculele prin intersectia prezentata?','Da','Prioritate de trecere','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('9','Va puteti apropia de vehiculul din fata?','Da','Reguli generale','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('10','In cazul unui accident in care victima si-a pierdut cunostinta, prima masura va fi',NULL,'Masuri de prim ajutor','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('11','Hemoragia nazala se poate opri daca accidentatul',NULL,'Masuri de prim ajutor','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('12','Neeliberarea completa a franei de stationare determina',NULL,'Notiuni de mecanica','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('13','Cum trebuie sa fie nivelul corect al uleiului din baie?',NULL,'Notiuni de mecanica','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('14','Comportamentul ecologic in conducerea unui autovehicul presupune:',NULL,'Conducerea ecologica','B,B1');
 
INSERT INTO Intrebare(ID_I, INTREBARE,POZA,SECTIUNE,CATEGORIE) VALUES('15','Precizati daca presiunea din pneuri are efect asupra consumului de carburant:','Da','Conducerea ecologica','B,B1');


 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('1','a','Indicatorul 1','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('1','b','Indicatorul 2','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('1','c','Ambele indicatoare','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('2','a','Stationarea mijloacelor de transport public de persoane in intervalul mentionat','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('2','b','Stationarea in timpul orelor mentionate','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('2','c','Stationarea in afara intervalului orar mentionat','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('3','a','Reduceti viteza si traversati intersectia','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('3','b','Reduceti viteza si cedati trecerea','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('3','c','Opriti si cedati trecerea','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('4','a','Ii obliga atat pe conducatori, cat si pe pietoni sa se opreasca ','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('4','b','Ii obliga pe conducatori sa opreasca, iar pe pietoni sa ttraverseze cu prudenta','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('4','c','Permite vehiculelor sa vireze la dreapta, cu respectarea prioritatii','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('5','a','Da','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('5','b','Nu, deoarece astfel vei depasi axul drumului','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('5','c','Nu, deoarece nu respecti semnificatia indicatorului','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('6','a','In curbe cu vizibilitate redusa sub 50 m','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('6','b','La intalnitrea indicatorului "Drum cu prioritate'' ','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('6','c','La intalnirea indicatorului "Drum ingustat" ','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('7','a','Depasirea vitezei maxime admise cu peste 20 km/h','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('7','b','Nerespectarea regulilor privind depasirea','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('7','c','Nefolosirea luminilor de ceata dupa lasarea serii','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('8','a','Tramvaiul 1,tramvaiul 2, autotorismul','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('8','b','Tramvaiul 2, tramvaiul 1, autotorismul','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('8','c','Tramvaiul 1, autotorismul, tramvaiul 2','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('9','a','Da','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('9','b','Nu, pentru ca blocati intersectia','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('9','c','Legea nu prevede obligatii in aceasta situatie.','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('10','a','Sa administrati medicamente din trusa de prim ajutor','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('10','b','Sa imobilizati eventualele fracturi','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('10','c','Sa controlati respiratia si bataile inimii','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('11','a','Sta culcat cu capul pe spate','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('11','b','Sta in picioaree si isi strange ambele nari timp de aprox 10 min','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('11','c','Ridica mana dreapta','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('12','a','Zgomote in zona manetei franei de mana','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('12','b','Un consum suplimentar de carburant','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('12','c','Incalzirea excesiva a butucilor rotilor din spate','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('13','a','Cu aprox 1 cm sub reperul MIN','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('13','b','Intre reperele MIN-MAX','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('13','c','Cu aproximativ 1 cm deasupra reperului MAX','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('14','a','Planificarea traseului pt a economisi timp si combustibil','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('14','b','Evitarea zonelor cu circulatie densa','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('14','c','Viteza si acceleratie mari','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('15','a','Da','D');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('15','b','Nu','N');
 
INSERT INTO Raspuns(ID_I,ID_R,RASPUNS,CORECT) VALUES('15','c','Numai in cazul vehiculelor de mare tonaj','N');


 
INSERT INTO Chestionar(ID_C,DENUMIRE, PUNCTAJ_MAX) VALUES('1','Chest 1','26');
 
INSERT INTO Chestionar(ID_C,DENUMIRE, PUNCTAJ_MAX) VALUES('2','Chest 2','26');
 
INSERT INTO Chestionar(ID_C,DENUMIRE, PUNCTAJ_MAX) VALUES('3','Chest 3','26');
 
INSERT INTO Chestionar(ID_C,DENUMIRE, PUNCTAJ_MAX) VALUES('4','Chest 4','26');
 
INSERT INTO Chestionar(ID_C,DENUMIRE, PUNCTAJ_MAX) VALUES('5','Chest 5','26');
 
INSERT INTO Chestionar(ID_C,DENUMIRE, PUNCTAJ_MAX) VALUES('6','Chest 6','26');
 
INSERT INTO Chestionar(ID_C,DENUMIRE, PUNCTAJ_MAX) VALUES('7','Chest 7','26');
 
INSERT INTO Chestionar(ID_C,DENUMIRE, PUNCTAJ_MAX) VALUES('8','Chest 8','26');


 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('1','1','1');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('1','4','2');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('1','7','3');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('1','14','4');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('1','12','5');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('1','3','6');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('1','8','7');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('1','11','8');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('2','2','1');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('2','3','2');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('2','4','3');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('2','15','4');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('2','11','5');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('3','2','1');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('3','3','2');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('3','4','3');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('3','15','4');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('3','11','5');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('4','1','1');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('4','4','2');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('4','7','3');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('5','6','1');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('5','8','2');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('5','9','3');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('5','10','4');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('5','2','5');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('5','5','6');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('5','11','7');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('6','1','1');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('6','4','2');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('6','7','3');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('6','14','4');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('6','12','5');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('6','3','6');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('6','8','7');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('6','11','8');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('7','5','1');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('7','10','2');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('7','12','3');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('7','14','4');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('8','12','1');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('8','6','2');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('8','8','3');
 
INSERT INTO Intrebari_Chestionar(ID_C,ID_I,NR_ORDINE) VALUES('8','7','4');


 
INSERT INTO Test(ID_T,DATA, PUNCTAJ, ID_C) VALUES('1','2021-12-25','23','1');
 
INSERT INTO Test(ID_T,DATA, PUNCTAJ, ID_C) VALUES('2','2021-12-26','21','2');
 
INSERT INTO Test(ID_T,DATA, PUNCTAJ, ID_C) VALUES('3','2021-12-27','25','3');
 
INSERT INTO Test(ID_T,DATA, PUNCTAJ, ID_C) VALUES('4','2021-12-28','20','4');
 
INSERT INTO Test(ID_T,DATA, PUNCTAJ, ID_C) VALUES('5','2021-12-29','21','5');
 
INSERT INTO Test(ID_T,DATA, PUNCTAJ, ID_C) VALUES('6','2021-12-28','22','6');
 
INSERT INTO Test(ID_T,DATA, PUNCTAJ, ID_C) VALUES('7','2021-12-28','22','7');


 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('1','1','a','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('1','2','b','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('1','3','a','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('1','4','a','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('1','5','c','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('1','6','c','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('2','6','c','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('2','7','c','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('2','3','b','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('2','4','a','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('3','3','c','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('3','4','c','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('3','5','a','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('3','7','b','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','1','a','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','2','a','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','3','a','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','4','b','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','5','c','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','6','b','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','7','c','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','8','a','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','9','a','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','10','b','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','11','c','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','12','c','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','13','a','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','14','a','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('4','15','b','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('5','4','b','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('5','13','a','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('5','12','a','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('5','11','c','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('5','9','a','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('6','1','b','D');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('6','10','c','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('6','14','a','N');
 
INSERT INTO Raspuns_Test(ID_T,ID_I,ID_R,CORECT) VALUES('6','3','b','D');

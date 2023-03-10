
SELECT NR_ORDINE,ID_I
FROM Intrebari_Chestionar
WHERE ID_C=1
ORDER BY NR_ORDINE DESC;

SELECT ID_I, ID_R, CORECT 
FROM Raspuns_Test
WHERE ID_T=1
ORDER BY ID_I,ID_R ASC;

SELECT Test.PUNCTAJ, Raspuns_Test.ID_R AS "Raspuns dat utilizator", Raspuns.ID_R AS "Raspuns model"
FROM Raspuns_Test 
 JOIN Raspuns USING(ID_I)
 JOIN Test ON(Raspuns_Test.ID_T=Test.ID_T)
WHERE Test.PUNCTAJ BETWEEN 22 AND 26;

SELECT DISTINCT LEAST(c1.ID_C, c2.ID_C) AS `Chestionar1` , GREATEST(c1.ID_C, c2.ID_C) AS `Chestionar2`
FROM  Intrebari_Chestionar  c1 JOIN  Intrebari_Chestionar c2 ON (c1.ID_I=c2.ID_I)
WHERE c1.ID_C <> c2. ID_C AND c1.ID_I=c2.ID_I AND c1.NR_ORDINE=c2.NR_ORDINE;

SELECT Raspuns_Test.ID_I, Raspuns_Test.ID_R, Raspuns_Test.CORECT
FROM Raspuns_Test
WHERE ID_T=1 AND (SELECT CORECT
FROM Raspuns WHERE Raspuns.ID_I=Raspuns_Test.ID_I AND Raspuns.ID_R=Raspuns_Test.ID_R)!=Raspuns_Test.CORECT;

SELECT ID_T
FROM Test
WHERE PUNCTAJ>= ALL( SELECT PUNCTAJ 
FROM Test);

SELECT COUNT( ID_C) 
FROM Chestionar
WHERE PUNCTAJ_MAX=(SELECT MIN(PUNCTAJ_MAX) FROM Chestionar);
 
SELECT COUNT(DISTINCT(Intrebare.ID_I)) AS `Numar intrebari`
FROM Intrebare
 JOIN Raspuns ON( Intrebare.ID_I=Raspuns.ID_I)
WHERE Raspuns.CORECT='D' ;


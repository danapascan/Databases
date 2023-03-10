drop procedure if exists proc1;
delimiter $$
create procedure proc1(numar1 INTEGER, numar2 INTEGER)
begin
	SELECT Test.PUNCTAJ, Raspuns_Test.ID_R AS "Raspuns dat utilizator", Raspuns.ID_R AS "Raspuns model"
FROM Raspuns_Test 
 JOIN Raspuns USING(ID_I)
 JOIN Test ON(Raspuns_Test.ID_T=Test.ID_T)
WHERE Test.PUNCTAJ BETWEEN numar1 AND numar2
ORDER BY Test.PUNCTAJ;
end $$

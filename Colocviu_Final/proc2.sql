drop procedure if exists proc2;
delimiter $$
create procedure proc2(numar INTEGER)
begin
	SELECT ID_I, ID_R, CORECT 
FROM Raspuns_Test
WHERE ID_T=numar
ORDER BY ID_I,ID_R ASC;
end $$

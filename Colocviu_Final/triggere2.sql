DROP TRIGGER IF EXISTS trigger_eliminare_intrebare;
DELIMITER $$
CREATE TRIGGER trigger_eliminare_intrebare
AFTER DELETE ON Intrebari_Chestionar
FOR EACH ROW
BEGIN 
UPDATE Chestionar c
 SET c.PUNCTAJ_MAX=c.PUNCTAJ_MAX-1
 WHERE c.ID_C= OLD.ID_C;
END $$
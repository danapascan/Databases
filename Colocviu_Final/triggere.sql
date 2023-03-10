use scoala_soferi;

DROP TRIGGER IF EXISTS trigger_adaugare_intrebare;
DELIMITER $$

CREATE TRIGGER trigger_adaugare_intrebare
AFTER INSERT ON Intrebari_Chestionar
FOR EACH ROW
BEGIN
UPDATE Chestionar c
 SET c.PUNCTAJ_MAX=c.PUNCTAJ_MAX+1
WHERE c.ID_C= NEW.ID_C;
END $$



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



DROP TRIGGER IF EXISTS trigger_punctaj_test;
DELIMITER $$
CREATE TRIGGER trigger_punctaj_test
BEFORE UPDATE ON Test
FOR EACH ROW
BEGIN
DECLARE punct_max DOUBLE;
SELECT PUNCTAJ_MAX INTO punct_max
FROM Chestionar 
WHERE ID_C= NEW.ID_C;
IF  NEW.PUNCTAJ<0 OR  NEW.PUNCTAJ> punct_max THEN 
SIGNAL SQLSTATE '20500' SET MESSAGE_TEXT = 'Error';
END IF;
END $$

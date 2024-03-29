
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

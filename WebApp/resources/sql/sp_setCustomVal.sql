USE `agri_tadka`;
DROP procedure IF EXISTS `sp_setCustomVal`;

DELIMITER $$
USE `agri_tadka`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_setCustomVal`(sSeqName VARCHAR(50),  
              nVal INT UNSIGNED)
BEGIN
DECLARE newname VARCHAR(50);
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y') INTO newname;

    IF (SELECT COUNT(*) FROM _sequence  
            WHERE seq_name = newname) = 0 THEN
        INSERT INTO _sequence (seq_name,seq_val)
        VALUES (newname,nVal);
    ELSE
        UPDATE _sequence SET seq_val = nVal
        WHERE seq_name = newname ;
    END IF;
END$$

DELIMITER ;


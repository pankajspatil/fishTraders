USE `agri_tadka`;
DROP function IF EXISTS `getNextCustomSeq`;

DELIMITER $$
USE `agri_tadka`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getNextCustomSeq`(
   
) RETURNS varchar(20) CHARSET utf8
BEGIN
    DECLARE nLast_val INT; 
   DECLARE newname VARCHAR(50);

	SELECT DATE_FORMAT(NOW(),'%d-%m-%Y') into newname;
 
    SET nLast_val =  (SELECT seq_val
                          FROM _sequence
                          WHERE seq_name = newname);
    IF nLast_val IS NULL THEN
        SET nLast_val = 1;
        INSERT INTO _sequence (seq_name,seq_val)
        VALUES (newname,nLast_Val);
    ELSE
        SET nLast_val = nLast_val + 1;
        UPDATE _sequence SET seq_val = nLast_val
        WHERE seq_name = newname;
    END IF; 
 
    SET @ret = (SELECT concat(newname,'-',lpad(nLast_val,6,'0')));
    RETURN @ret;
END$$

DELIMITER ;


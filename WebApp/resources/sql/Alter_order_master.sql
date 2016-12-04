ALTER TABLE `agri_tadka`.`order_master` 
ADD COLUMN `order_sequence` VARCHAR(50) NULL DEFAULT 0 AFTER `advance_amt`;


ALTER TABLE `agri_tadka`.`order_master` 
CHANGE COLUMN `order_sequence` `order_sequence` VARCHAR(50) NULL DEFAULT '0' AFTER `order_id`;

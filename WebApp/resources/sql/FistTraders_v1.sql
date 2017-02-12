ALTER TABLE `fishtrader`.`boat_master` 
DROP FOREIGN KEY `vendoridfk`;
ALTER TABLE `fishtrader`.`boat_master` 
CHANGE COLUMN `vendorid` `vendor_id` INT(11) NULL DEFAULT NULL ;
ALTER TABLE `fishtrader`.`boat_master` 
ADD CONSTRAINT `vendoridfk`
  FOREIGN KEY (`vendor_id`)
  REFERENCES `fishtrader`.`vendor_master` (`vendor_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
ALTER TABLE `fishtrader`.`fish_master` 
CHANGE COLUMN `fish_name` `fish_name` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `is_active` `is_active` CHAR(1) NOT NULL DEFAULT '1' ,
CHANGE COLUMN `created_date` `created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE COLUMN `created_by` `created_by` INT NOT NULL ;


INSERT INTO `fishtrader`.`fish_master` (`fish_code`, `fish_name`, `created_by`) VALUES ('BOMBIL', 'Bombil', '1');
INSERT INTO `fishtrader`.`fish_master` (`fish_code`, `fish_name`, `created_by`) VALUES ('SURMAI', 'Surmai', '1');
INSERT INTO `fishtrader`.`fish_master` (`fish_code`, `fish_name`, `created_by`) VALUES ('HALWA', 'Halwa', '1');
INSERT INTO `fishtrader`.`fish_master` (`fish_code`, `fish_name`, `created_by`) VALUES ('PRAWNS', 'Prawns', '1');


CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `boat_id` int(11) NOT NULL,
  `fish_id` int(11) NOT NULL,
  `expense_amount` double NOT NULL,
  `expense_remark` varchar(45) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `invoice_master` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  `expense_exist` char(1) NOT NULL DEFAULT '1',
  `amount` double NOT NULL DEFAULT '0',
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `invoice_expense_map` (
  `invoice_expense_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `expense_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_expense_map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



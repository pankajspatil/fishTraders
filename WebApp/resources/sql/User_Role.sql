
CREATE TABLE `user_menu_master` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_description` varchar(45) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `role_master` (
  `role_id` int(11) NOT NULL,
  `role_description` varchar(45) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` char(1) DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `role_menu_map` (
  `role_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  PRIMARY KEY (`role_menu_id`),
  KEY `RoleId_idx` (`role_id`),
  KEY `MenuId_idx` (`menu_id`),
  CONSTRAINT `Role_Menu_Menu_FK` FOREIGN KEY (`menu_id`) REFERENCES `user_menu_master` (`menu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;



INSERT INTO `agri_tadka`.`user_menu_master` (`menu_description`, `created_by`, `created_date`, `is_active`) VALUES ('Home', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`user_menu_master` (`menu_description`, `created_by`, `created_date`, `is_active`) VALUES ('Order', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`user_menu_master` (`menu_description`, `created_by`, `created_date`, `is_active`) VALUES ('Master', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`user_menu_master` (`menu_description`, `created_by`, `created_date`, `is_active`) VALUES ('Cooking', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`user_menu_master` (`menu_description`, `created_by`, `created_date`, `is_active`) VALUES ('Parcel', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`user_menu_master` (`menu_description`, `created_by`, `created_date`, `is_active`) VALUES ('Report', '1', '2016-10-29 20:36:11', '1');

INSERT INTO `agri_tadka`.`role_master` (`role_id`, `role_description`, `created_by`, `created_date`, `is_active`) VALUES ('1', 'Admin', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_master` (`role_id`, `role_description`, `created_by`, `created_date`, `is_active`) VALUES ('2', 'Reception', '1', '2016-10-29 20:36:11', '1');

UPDATE `agri_tadka`.`user_menu_master` SET `menu_id`='1' WHERE `menu_id`='14';
UPDATE `agri_tadka`.`user_menu_master` SET `menu_id`='2' WHERE `menu_id`='15';
UPDATE `agri_tadka`.`user_menu_master` SET `menu_id`='3' WHERE `menu_id`='16';
UPDATE `agri_tadka`.`user_menu_master` SET `menu_id`='4' WHERE `menu_id`='17';
UPDATE `agri_tadka`.`user_menu_master` SET `menu_id`='5' WHERE `menu_id`='18';
UPDATE `agri_tadka`.`user_menu_master` SET `menu_id`='6' WHERE `menu_id`='19';

INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('1', '1', '1', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('2', '1', '2', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('3', '1', '3', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('4', '1', '4', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('5', '1', '5', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('6', '1', '6', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('7', '2', '1', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('8', '2', '2', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('9', '2', '4', '1', '2016-10-29 20:36:11', '1');
INSERT INTO `agri_tadka`.`role_menu_map` (`role_menu_id`, `role_id`, `menu_id`, `created_by`, `created_date`, `is_active`) VALUES ('10', '2', '5', '1', '2016-10-29 20:36:11', '1');





ALTER TABLE `agri_tadka`.`user_master` 
ADD COLUMN `role_id` INT(11) NULL DEFAULT 1 AFTER `created_on`;


INSERT INTO `agri_tadka`.`user_master` (`first_name`, `last_name`, `email`, `user_name`, `password`, `is_active`, `created_by`, `created_on`, `role_id`) VALUES ('yadnesh', 'patil', 'kadav.kiran@gmail.com', 'yadnesh', 'yadnesh123', '1', '1', '2016-10-29 20:36:11', '2');
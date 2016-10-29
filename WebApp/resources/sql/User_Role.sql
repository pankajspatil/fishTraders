
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

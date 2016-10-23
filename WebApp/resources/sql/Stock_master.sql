CREATE TABLE `agri_tadka`.`stock_master` (
  `stock_id` INT NOT NULL AUTO_INCREMENT,
  `stock_real_qty` INT NULL DEFAULT 0,
  `stock_theoretical_qty` INT NULL,
  `stock_description` VARCHAR(45) NULL,
  `sub_menu_id` INT NULL,
  PRIMARY KEY (`stock_id`),
  INDEX `sub_menu_id_fk_idx` (`sub_menu_id` ASC),
  CONSTRAINT `sub_menu_id_fk`
    FOREIGN KEY (`sub_menu_id`)
    REFERENCES `agri_tadka`.`sub_menu_master` (`sub_menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

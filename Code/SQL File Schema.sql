-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hospitalmanagementsystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospitalmanagementsystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospitalmanagementsystem` DEFAULT CHARACTER SET utf8 ;
USE `hospitalmanagementsystem` ;

-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`person_personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`person_personal` (
  `idPerson` INT(11) NOT NULL AUTO_INCREMENT,
  `person_FName` VARCHAR(45) NULL DEFAULT NULL,
  `person_LName` VARCHAR(45) NULL DEFAULT NULL,
  `person_age` INT(22) NULL DEFAULT NULL,
  `person_gender` VARCHAR(1) NULL DEFAULT NULL,
  `person_insuranceID` INT(11) NULL DEFAULT NULL,
  `person_contactNo` INT(11) NULL DEFAULT NULL,
  `person_email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPerson`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8
COMMENT = '																				';


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`address` (
  `person_id` INT(11) NOT NULL,
  `address_line_2` VARCHAR(45) NULL DEFAULT NULL,
  `address_line_3` VARCHAR(45) NULL DEFAULT NULL,
  `address_line_1` VARCHAR(45) NULL DEFAULT NULL,
  `ZIPCode` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE INDEX `person_id_UNIQUE` (`person_id` ASC),
  INDEX `person address_idx` (`person_id` ASC),
  CONSTRAINT `person address`
    FOREIGN KEY (`person_id`)
    REFERENCES `hospitalmanagementsystem`.`person_personal` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`bill` (
  `Amount` INT(40) NULL DEFAULT NULL,
  `date_of_event` DATETIME NULL DEFAULT NULL,
  `bill_ID` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bill_ID`),
  UNIQUE INDEX `bill_ID_UNIQUE` (`bill_ID` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`patient` (
  `person_id` INT(11) NOT NULL,
  `case_id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`case_id`, `person_id`),
  UNIQUE INDEX `case_id_UNIQUE` (`case_id` ASC),
  INDEX `patientID` (`person_id` ASC),
  CONSTRAINT `patientID`
    FOREIGN KEY (`person_id`)
    REFERENCES `hospitalmanagementsystem`.`person_personal` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`bill_per_case`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`bill_per_case` (
  `case_id` INT(11) NOT NULL,
  `bill_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  UNIQUE INDEX `case_id_UNIQUE` (`case_id` ASC),
  UNIQUE INDEX `bill_id_UNIQUE` (`bill_id` ASC),
  CONSTRAINT `bill`
    FOREIGN KEY (`bill_id`)
    REFERENCES `hospitalmanagementsystem`.`bill` (`bill_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bill_per_Case fk patient`
    FOREIGN KEY (`case_id`)
    REFERENCES `hospitalmanagementsystem`.`patient` (`case_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`block`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`block` (
  `idBlock` INT(11) NOT NULL,
  `block_name` VARCHAR(45) NULL DEFAULT NULL,
  `floor` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idBlock`),
  UNIQUE INDEX `idBlock_UNIQUE` (`idBlock` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`staff_personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`staff_personal` (
  `e_id` INT(11) NOT NULL AUTO_INCREMENT,
  `FName` VARCHAR(45) NULL DEFAULT NULL,
  `LName` VARCHAR(45) NULL DEFAULT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  `gender` VARCHAR(1) NULL DEFAULT NULL,
  `contactNo` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `houseNo` VARCHAR(45) NULL DEFAULT NULL,
  `streetName` VARCHAR(45) NULL DEFAULT NULL,
  `cityName` VARCHAR(45) NULL DEFAULT NULL,
  `ZIP` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`e_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`staff` (
  `E_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Department` VARCHAR(45) NULL DEFAULT NULL,
  `Role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`E_ID`),
  CONSTRAINT `staff link staff personal`
    FOREIGN KEY (`E_ID`)
    REFERENCES `hospitalmanagementsystem`.`staff_personal` (`e_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`doctor` (
  `idDoctor` INT(22) NOT NULL,
  `rating` VARCHAR(45) NULL DEFAULT NULL,
  `experience(years)` INT(22) NULL DEFAULT NULL,
  `trained_in` VARCHAR(45) NULL DEFAULT NULL,
  `case_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDoctor`),
  UNIQUE INDEX `idDoctor_UNIQUE` (`idDoctor` ASC),
  CONSTRAINT `doctor department`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `hospitalmanagementsystem`.`staff` (`E_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`department` (
  `department_name` VARCHAR(22) NOT NULL,
  `head_doctor_id` INT(22) NOT NULL,
  PRIMARY KEY (`department_name`, `head_doctor_id`),
  INDEX `fk_department_doctor1_idx` (`head_doctor_id` ASC),
  CONSTRAINT `fk_department_doctor1`
    FOREIGN KEY (`head_doctor_id`)
    REFERENCES `hospitalmanagementsystem`.`doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`equipment_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`equipment_list` (
  `equipment_id` INT(11) NOT NULL,
  `equipment_name` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`equipment_id`),
  UNIQUE INDEX `equipment_id_UNIQUE` (`equipment_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`inpatient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`inpatient` (
  `case_id` INT(11) NOT NULL,
  `disease_name` VARCHAR(45) NULL DEFAULT NULL,
  `doc_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  UNIQUE INDEX `case_id_UNIQUE` (`case_id` ASC),
  INDEX `doc_key_idx` (`doc_id` ASC),
  CONSTRAINT `case_key`
    FOREIGN KEY (`case_id`)
    REFERENCES `hospitalmanagementsystem`.`patient` (`case_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `doc_key`
    FOREIGN KEY (`doc_id`)
    REFERENCES `hospitalmanagementsystem`.`doctor` (`idDoctor`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`outpatient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`outpatient` (
  `doctor_id` INT(45) NOT NULL,
  `case_id` INT(45) NOT NULL,
  `procedure_name` VARCHAR(45) NULL DEFAULT NULL,
  `equipment_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`doctor_id`, `case_id`),
  UNIQUE INDEX `equipment_id_UNIQUE` (`equipment_id` ASC),
  INDEX `procedure_treatment_idx` (`case_id` ASC),
  CONSTRAINT `equipment_outpatient`
    FOREIGN KEY (`equipment_id`)
    REFERENCES `hospitalmanagementsystem`.`equipment_list` (`equipment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `procedure_employee`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `hospitalmanagementsystem`.`doctor` (`idDoctor`)
    ON UPDATE CASCADE,
  CONSTRAINT `procedure_treatment`
    FOREIGN KEY (`case_id`)
    REFERENCES `hospitalmanagementsystem`.`patient` (`case_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`payment_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`payment_details` (
  `idpayment_details` INT(11) NOT NULL,
  `card_no` INT(35) NULL DEFAULT NULL,
  `card_type` VARCHAR(45) NULL DEFAULT NULL,
  `expiery_date` DATETIME NULL DEFAULT NULL,
  `person_ID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idpayment_details`),
  INDEX `person_personPaymentDetails_idx` (`person_ID` ASC),
  CONSTRAINT `person_personPaymentDetails`
    FOREIGN KEY (`person_ID`)
    REFERENCES `hospitalmanagementsystem`.`person_personal` (`idPerson`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`person_med_record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`person_med_record` (
  `idPerson` INT(11) NOT NULL,
  `height(ft/in)` VARCHAR(22) NULL DEFAULT NULL,
  `weight(kgs)` INT(11) NULL DEFAULT NULL,
  `allergy` VARCHAR(45) NULL DEFAULT NULL,
  `sysbp` INT(11) NULL DEFAULT NULL,
  `dysbp` INT(11) NULL DEFAULT NULL,
  `bloodgroup` VARCHAR(45) NULL DEFAULT NULL,
  `dateupdated` DATETIME NOT NULL,
  PRIMARY KEY (`idPerson`, `dateupdated`),
  CONSTRAINT `idPerson`
    FOREIGN KEY (`idPerson`)
    REFERENCES `hospitalmanagementsystem`.`person_personal` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`pharmacy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`pharmacy` (
  `idMedicine` INT(11) NOT NULL AUTO_INCREMENT,
  `nameMedicine` VARCHAR(45) NULL DEFAULT NULL,
  `drugAction` VARCHAR(100) NULL DEFAULT NULL,
  `price` INT(11) NULL DEFAULT NULL,
  `manufactureDate` DATE NULL DEFAULT NULL,
  `expireIn_Months` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idMedicine`),
  UNIQUE INDEX `idMedicine_UNIQUE` (`idMedicine` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`prescription` (
  `Doses` VARCHAR(45) NULL DEFAULT NULL,
  `Prescription_id` INT(11) NOT NULL AUTO_INCREMENT,
  `case_id` INT(11) NULL DEFAULT NULL,
  `id_medicine` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Prescription_id`),
  UNIQUE INDEX `Prescription_id_UNIQUE` (`Prescription_id` ASC),
  INDEX `prescription_inpatient_idx` (`case_id` ASC),
  INDEX `prescription_pharmacy_idx` (`id_medicine` ASC),
  CONSTRAINT `prescription_inpatient`
    FOREIGN KEY (`case_id`)
    REFERENCES `hospitalmanagementsystem`.`inpatient` (`case_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prescription_pharmacy`
    FOREIGN KEY (`id_medicine`)
    REFERENCES `hospitalmanagementsystem`.`pharmacy` (`idMedicine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`room` (
  `room_id` INT(11) NOT NULL,
  `room_type` VARCHAR(45) NULL DEFAULT NULL,
  `nurse_id` INT(11) NULL DEFAULT NULL,
  `block_idBlock` INT(11) NOT NULL,
  `availability` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`room_id`, `block_idBlock`),
  UNIQUE INDEX `room_id_UNIQUE` (`room_id` ASC),
  INDEX `nurser room_idx` (`nurse_id` ASC),
  INDEX `fk_room_block1_idx` (`block_idBlock` ASC),
  CONSTRAINT `fk_room_block1`
    FOREIGN KEY (`block_idBlock`)
    REFERENCES `hospitalmanagementsystem`.`block` (`idBlock`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `nurser room`
    FOREIGN KEY (`nurse_id`)
    REFERENCES `hospitalmanagementsystem`.`staff` (`E_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospitalmanagementsystem`.`stay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`stay` (
  `cid` INT(11) NOT NULL,
  `start_date` DATETIME NULL DEFAULT NULL,
  `end_date` DATETIME NULL DEFAULT NULL,
  `room_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`),
  INDEX `stay room_idx` (`room_id` ASC),
  CONSTRAINT `stay outpatient`
    FOREIGN KEY (`cid`)
    REFERENCES `hospitalmanagementsystem`.`outpatient` (`case_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `stay room`
    FOREIGN KEY (`room_id`)
    REFERENCES `hospitalmanagementsystem`.`room` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `hospitalmanagementsystem` ;

-- -----------------------------------------------------
-- Placeholder table for view `hospitalmanagementsystem`.`list_lung_transplant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`list_lung_transplant` (`procedure_name` INT, `person_Fname` INT, `person_Lname` INT, `case_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hospitalmanagementsystem`.`listcardiosurgery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`listcardiosurgery` (`procedure_name` INT, `person_Fname` INT, `person_Lname` INT, `case_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hospitalmanagementsystem`.`popular_medicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`popular_medicine` (`Name of Medicine` INT, `Medicine ID` INT, `Number Of Purchases` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hospitalmanagementsystem`.`BloodGroupDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`BloodGroupDetail` (`idperson` INT, `concat(p.person_fname,p.person_lname)` INT, `address_line_1` INT, `address_line_2` INT, `address_line_3` INT, `zipcode` INT, `bloodgroup` INT);

-- -----------------------------------------------------
-- Placeholder table for view `hospitalmanagementsystem`.`bloodgroupdetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitalmanagementsystem`.`bloodgroupdetail` (`idperson` INT, `concat(p.person_fname,p.person_lname)` INT, `address_line_1` INT, `address_line_2` INT, `address_line_3` INT, `zipcode` INT, `bloodgroup` INT);

-- -----------------------------------------------------
-- procedure MaximumBill
-- -----------------------------------------------------

DELIMITER $$
USE `hospitalmanagementsystem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MaximumBill`(IN param1 int)
BEGIN

SELECT b.bill_id, b.date_of_event, b.amount, pt.person_id, pp.person_Fname, pp.person_Lname,pp.person_age,pp.person_gender from bill b 
inner join  bill_per_case bp
on b.bill_id=bp.bill_id 
inner join patient pt
on pt.case_id=bp.case_id 
inner join person_personal pp
on pp.idperson=pt.person_id


where pt.case_id=param1






;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PatientCaseInfo
-- -----------------------------------------------------

DELIMITER $$
USE `hospitalmanagementsystem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PatientCaseInfo`(IN param1 int)
BEGIN

SELECT b.bill_id, b.date_of_event, b.amount, pt.person_id, pp.person_Fname, pp.person_Lname,pp.person_age,pp.person_gender from bill b 
inner join  bill_per_case bp
on b.bill_id=bp.bill_id 
inner join patient pt
on pt.case_id=bp.case_id 
inner join person_personal pp
on pp.idperson=pt.person_id


where pt.case_id=param1






;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure staff_details
-- -----------------------------------------------------

DELIMITER $$
USE `hospitalmanagementsystem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `staff_details`(IN param1 int)
BEGIN


SELECT s.e_id, sp.fname,sp.lname, sp.age, s.department, s.role, sp.email, sp.contactno
 from staff s 
inner join  staff_personal sp
on s.e_id=sp.e_id 
where s.e_id=param1;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `hospitalmanagementsystem`.`list_lung_transplant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospitalmanagementsystem`.`list_lung_transplant`;
USE `hospitalmanagementsystem`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hospitalmanagementsystem`.`list_lung_transplant` AS select `o`.`procedure_name` AS `procedure_name`,`p`.`person_FName` AS `person_Fname`,`p`.`person_LName` AS `person_Lname`,`o`.`case_id` AS `case_id` from ((`hospitalmanagementsystem`.`outpatient` `o` left join `hospitalmanagementsystem`.`patient` `pa` on((`pa`.`case_id` = `o`.`case_id`))) left join `hospitalmanagementsystem`.`person_personal` `p` on((`p`.`idPerson` = `pa`.`person_id`))) where (`o`.`procedure_name` = 'Lung Transplant');

-- -----------------------------------------------------
-- View `hospitalmanagementsystem`.`listcardiosurgery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospitalmanagementsystem`.`listcardiosurgery`;
USE `hospitalmanagementsystem`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hospitalmanagementsystem`.`listcardiosurgery` AS select `o`.`procedure_name` AS `procedure_name`,`p`.`person_FName` AS `person_Fname`,`p`.`person_LName` AS `person_Lname`,`o`.`case_id` AS `case_id` from ((`hospitalmanagementsystem`.`outpatient` `o` left join `hospitalmanagementsystem`.`patient` `pa` on((`pa`.`case_id` = `o`.`case_id`))) left join `hospitalmanagementsystem`.`person_personal` `p` on((`p`.`idPerson` = `pa`.`person_id`))) where (`o`.`procedure_name` = 'Cardio Surgery');

-- -----------------------------------------------------
-- View `hospitalmanagementsystem`.`popular_medicine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospitalmanagementsystem`.`popular_medicine`;
USE `hospitalmanagementsystem`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hospitalmanagementsystem`.`popular_medicine` AS select `ph`.`nameMedicine` AS `Name of Medicine`,`ph`.`idMedicine` AS `Medicine ID`,count(`p`.`id_medicine`) AS `Number Of Purchases` from (`hospitalmanagementsystem`.`prescription` `p` left join `hospitalmanagementsystem`.`pharmacy` `ph` on((`ph`.`idMedicine` = `p`.`id_medicine`))) group by `p`.`id_medicine` order by count(`p`.`id_medicine`) desc limit 1;

-- -----------------------------------------------------
-- View `hospitalmanagementsystem`.`BloodGroupDetail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospitalmanagementsystem`.`BloodGroupDetail`;
USE `hospitalmanagementsystem`;
CREATE  OR REPLACE VIEW `BloodGroupDetail` AS
select p.idperson, concat(p.person_fname,p.person_lname), a.address_line_1,
 a.address_line_2, a.address_line_3, a.zipcode,pm.bloodgroup
from person_personal p 
left join person_med_record  pm
on p.idperson =pm.idperson
left join address a
on a.person_id=p.idperson
;

-- -----------------------------------------------------
-- View `hospitalmanagementsystem`.`bloodgroupdetail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospitalmanagementsystem`.`bloodgroupdetail`;
USE `hospitalmanagementsystem`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `bloodgroupdetail` AS
    SELECT 
        `p`.`idPerson` AS `idperson`,
        CONCAT(`p`.`person_FName`, `p`.`person_LName`) AS `concat(p.person_fname,p.person_lname)`,
        `a`.`address_line_1` AS `address_line_1`,
        `a`.`address_line_2` AS `address_line_2`,
        `a`.`address_line_3` AS `address_line_3`,
        `a`.`ZIPCode` AS `zipcode`,
        `pm`.`bloodgroup` AS `bloodgroup`
    FROM
        ((`person_personal` `p`
        LEFT JOIN `person_med_record` `pm` ON ((`p`.`idPerson` = `pm`.`idPerson`)))
        LEFT JOIN `address` `a` ON ((`a`.`person_id` = `p`.`idPerson`)));
USE `hospitalmanagementsystem`;

DELIMITER $$
USE `hospitalmanagementsystem`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `hospitalmanagementsystem`.`inpatient_AFTER_INSERT`
AFTER INSERT ON `hospitalmanagementsystem`.`inpatient`
FOR EACH ROW
BEGIN


set @doc_id=new.doc_id;

UPDATE  hospitalmanagementsystem.doctor SET case_status='ON CASE' where idDoctor=@doc_id;



END$$

USE `hospitalmanagementsystem`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `hospitalmanagementsystem`.`inpatient_AFTER_UPDATE`
AFTER UPDATE ON `hospitalmanagementsystem`.`inpatient`
FOR EACH ROW
BEGIN

set @doc_id=new.doc_id;

UPDATE  hospitalmanagementsystem.doctor SET case_status='ON CASE' where idDoctor=@doc_id;


END$$

USE `hospitalmanagementsystem`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `hospitalmanagementsystem`.`outpatient_AFTER_INSERT`
AFTER INSERT ON `hospitalmanagementsystem`.`outpatient`
FOR EACH ROW
BEGIN
set @newequipid=new.equipment_id;

UPDATE  hospitalmanagementsystem.equipment_list SET status='NA' where equipment_id=@newequipid;

END$$

USE `hospitalmanagementsystem`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `hospitalmanagementsystem`.`outpatient_AFTER_UPDATE`
AFTER UPDATE ON `hospitalmanagementsystem`.`outpatient`
FOR EACH ROW
BEGIN

set @newequipid=new.equipment_id;

UPDATE  hospitalmanagementsystem.equipment_list SET status='NA' where equipment_id=@newequipid;

END$$

USE `hospitalmanagementsystem`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `hospitalmanagementsystem`.`stay_AFTER_INSERT`
AFTER INSERT ON `hospitalmanagementsystem`.`stay`
FOR EACH ROW
BEGIN

set @room_id=new.room_id;

UPDATE  hospitalmanagementsystem.room SET availability='NA' where room_id=@room_id;




END$$

USE `hospitalmanagementsystem`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `hospitalmanagementsystem`.`stay_AFTER_UPDATE`
AFTER UPDATE ON `hospitalmanagementsystem`.`stay`
FOR EACH ROW
BEGIN

set @room_id=new.room_id;

UPDATE  hospitalmanagementsystem.room SET availability='NA' where room_id=@room_id;


END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

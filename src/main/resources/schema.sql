DROP TABLE IF EXISTS `user`;
CREATE TABLE `resume`.`user` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` TIMESTAMP NULL,
  `USERNAME` VARCHAR(50) NULL UNIQUE,
  `PASSWORD` VARCHAR(2000) NULL,
  `NAME` NVARCHAR(50) NULL,
  PRIMARY KEY (`ID`))
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tresorie
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `tresorie` ;

-- -----------------------------------------------------
-- Schema tresorie
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tresorie` ;
USE `tresorie` ;

-- -----------------------------------------------------
-- Table `tresorie`.`agents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tresorie`.`agents` ;

CREATE TABLE IF NOT EXISTS `tresorie`.`agents` (
  `code_agent` VARCHAR(10) NOT NULL,
  `nom_complet` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL DEFAULT 'Personne',
  `gsm` CHAR(10) NULL,
  `email` VARCHAR(100) NULL,
  `adresse` VARCHAR(150) NULL,
  PRIMARY KEY (`code_agent`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `gsm_UNIQUE` ON `tresorie`.`agents` (`gsm` ASC) ;

CREATE UNIQUE INDEX `email_UNIQUE` ON `tresorie`.`agents` (`email` ASC) ;


-- -----------------------------------------------------
-- Table `tresorie`.`caissiers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tresorie`.`caissiers` ;

CREATE TABLE IF NOT EXISTS `tresorie`.`caissiers` (
  `code_caissier` VARCHAR(10) NOT NULL,
  `nom_complet` VARCHAR(45) NOT NULL,
  `telephone` CHAR(10) NULL,
  `adresse` VARCHAR(150) NULL,
  `photo` MEDIUMBLOB NULL,
  PRIMARY KEY (`code_caissier`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `telephone_UNIQUE` ON `tresorie`.`caissiers` (`telephone` ASC) ;


-- -----------------------------------------------------
-- Table `tresorie`.`operations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tresorie`.`operations` ;

CREATE TABLE IF NOT EXISTS `tresorie`.`operations` (
  `idoperations` INT NOT NULL,
  `montant` DECIMAL(8,2) NOT NULL,
  `date_operation` DATE NOT NULL,
  `N_doc` VARCHAR(45) NULL,
  `agence` VARCHAR(45) NULL,
  `echeance` DATE NULL,
  `type_operation` VARCHAR(45) NULL DEFAULT 'Espece',
  `code_agent` VARCHAR(10) NOT NULL,
  `code_caissier` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idoperations`),
  CONSTRAINT `fk_operations_agents`
    FOREIGN KEY (`code_agent`)
    REFERENCES `tresorie`.`agents` (`code_agent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operations_caissiers1`
    FOREIGN KEY (`code_caissier`)
    REFERENCES `tresorie`.`caissiers` (`code_caissier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_operations_agents_idx` ON `tresorie`.`operations` (`code_agent` ASC) ;

CREATE INDEX `fk_operations_caissiers1_idx` ON `tresorie`.`operations` (`code_caissier` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

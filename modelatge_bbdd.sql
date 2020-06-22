-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cul d'Ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cul d'Ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cul d'Ampolla` DEFAULT CHARACTER SET utf8 ;
USE `Cul d'Ampolla` ;

-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Proveïdor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Proveïdor` (
  `idProveidor` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `carrer` VARCHAR(100) NOT NULL,
  `numero` INT NOT NULL,
  `pis` INT NOT NULL,
  `porta` VARCHAR(4) NOT NULL,
  `ciutat` VARCHAR(200) NOT NULL,
  `codiPostal` VARCHAR(5) NOT NULL,
  `pais` VARCHAR(100) NOT NULL,
  `telefon` VARCHAR(14) NOT NULL,
  `fax` VARCHAR(45) NULL,
  `nif` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idProveidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Ulleres` (
  `idUlleres` INT NOT NULL,
  `idProveidor` INT NULL,
  `marca` VARCHAR(150) NOT NULL,
  `gradVidres` VARCHAR(2) NOT NULL,
  `montura` INT NOT NULL,
  `colMontura` VARCHAR(45) NOT NULL,
  `colVidre` VARCHAR(45) NOT NULL,
  `preu` FLOAT NOT NULL,
  PRIMARY KEY (`idUlleres`),
  INDEX `idProveidor_idx` (`idProveidor` ASC) VISIBLE,
  CONSTRAINT `idProveidor`
    FOREIGN KEY (`idProveidor`)
    REFERENCES `Cul d'Ampolla`.`Proveïdor` (`idProveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Clients` (
  `idClients` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `adreca` VARCHAR(200) NOT NULL,
  `telefon` VARCHAR(14) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `datReg` DATE NOT NULL,
  `nomRecom` VARCHAR(60) NULL,
  PRIMARY KEY (`idClients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul d'Ampolla`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul d'Ampolla`.`Empleat` (
  `idEmpleat` INT NOT NULL,
  `nomEmpleat` VARCHAR(45) NOT NULL,
  `cogEmpleat` VARCHAR(60) NOT NULL,
  `idUlleres` INT NULL,
  PRIMARY KEY (`idEmpleat`),
  INDEX `idUlleres_idx` (`idUlleres` ASC) VISIBLE,
  CONSTRAINT `idUlleres`
    FOREIGN KEY (`idUlleres`)
    REFERENCES `Cul d'Ampolla`.`Ulleres` (`idUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

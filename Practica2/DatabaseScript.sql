-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Practica2BD2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Practica2BD2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Practica2BD2` DEFAULT CHARACTER SET latin1 ;
USE `Practica2BD2` ;

-- -----------------------------------------------------
-- Table `Practica2BD2`.`Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica2BD2`.`Habitacion` (
  `idHabitacion` INT(11) NOT NULL,
  `habitacion` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idHabitacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Practica2BD2`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica2BD2`.`Paciente` (
  `idPaciente` INT(11) NOT NULL,
  `edad` INT(11) NULL DEFAULT NULL,
  `genero` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPaciente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Practica2BD2`.`LOG_ACTIVIDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica2BD2`.`LOG_ACTIVIDAD` (
  `id_log_actividad` INT(11) NOT NULL,
  `timestampx` VARCHAR(100) NULL DEFAULT NULL,
  `actividad` VARCHAR(500) NULL DEFAULT NULL,
  `PACIENTE_idPaciente` INT(11) NULL DEFAULT NULL,
  `HABITACION_idHabitacion` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_log_actividad`),
  INDEX `fk_LOG_ACTIVIDAD_1_idx` (`PACIENTE_idPaciente` ASC),
  INDEX `fk_LOG_ACTIVIDAD_2_idx` (`HABITACION_idHabitacion` ASC),
  CONSTRAINT `fk_LOG_ACTIVIDAD_1`
    FOREIGN KEY (`PACIENTE_idPaciente`)
    REFERENCES `Practica2BD2`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LOG_ACTIVIDAD_2`
    FOREIGN KEY (`HABITACION_idHabitacion`)
    REFERENCES `Practica2BD2`.`Habitacion` (`idHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Practica2BD2`.`LOG_HABITACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Practica2BD2`.`LOG_HABITACION` (
  `timestampx` VARCHAR(100) NOT NULL,
  `statusx` VARCHAR(45) NULL DEFAULT NULL,
  `idHabitacion` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`timestampx`),
  INDEX `fk_LOG_HABITACION_1_idx` (`idHabitacion` ASC),
  CONSTRAINT `fk_LOG_HABITACION_1`
    FOREIGN KEY (`idHabitacion`)
    REFERENCES `Practica2BD2`.`Habitacion` (`idHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

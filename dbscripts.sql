--El presente script tiene los scripts de los objetos de la base de datos
--Crear las tablas

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cassatta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cassatta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cassatta` DEFAULT CHARACTER SET utf8 ;
USE `cassatta` ;

-- -----------------------------------------------------
-- Table `cassatta`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cassatta`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(900) NULL,
  `tipo` TINYINT(1) NULL,
  `foto` BLOB NULL,
  `precio_unit` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idproductos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cassatta`.`envasados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cassatta`.`envasados` (
  `idenvasados` INT NOT NULL AUTO_INCREMENT,
  `nombre_env` VARCHAR(150) NOT NULL,
  `desc_env` VARCHAR(900) NULL,
  `costo_extra` INT NULL,
  `cant_limite` INT NULL,
  `tipo` TINYINT(1) NULL,
  PRIMARY KEY (`idenvasados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cassatta`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cassatta`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nombre_cli` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `tel` INT NULL,
  `cel` INT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cassatta`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cassatta`.`ventas` (
  `idventa` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NULL,
  `fecha` DATE NULL,
  `confirmado` TINYINT NULL,
  `total` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idventa`),
  INDEX `venta_cliente_fk_idx` (`idcliente` ASC),
  CONSTRAINT `venta_cliente_fk`
    FOREIGN KEY (`idcliente`)
    REFERENCES `cassatta`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cassatta`.`ventas_detalles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cassatta`.`ventas_detalles` (
  `idproducto` INT NOT NULL,
  `idventa` INT NOT NULL,
  `precio_unit` DECIMAL(10,2) NULL,
  `cant_prod` INT NULL,
  `envasados_idenvasados` INT NOT NULL,
  PRIMARY KEY (`idproducto`, `idventa`, `envasados_idenvasados`),
  INDEX `vendet_venta_idx` (`idventa` ASC),
  INDEX `fk_ventas_detalles_envasados1_idx` (`envasados_idenvasados` ASC),
  CONSTRAINT `vendet_venta_fk`
    FOREIGN KEY (`idventa`)
    REFERENCES `cassatta`.`ventas` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vendet_prod`
    FOREIGN KEY (`idproducto`)
    REFERENCES `cassatta`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_detalles_envasados1`
    FOREIGN KEY (`envasados_idenvasados`)
    REFERENCES `cassatta`.`envasados` (`idenvasados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cassatta`.`envios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cassatta`.`envios` (
  `idenvios` INT NOT NULL AUTO_INCREMENT,
  `idventa` INT NULL,
  `fecha` DATETIME NULL,
  `direccion` VARCHAR(150) NULL COMMENT 'puede o no ser la del cliente',
  `tel` INT NULL COMMENT 'tel de contacto',
  `cel` INT NULL COMMENT 'Cel de contacto ',
  PRIMARY KEY (`idenvios`),
  INDEX `envios_venta_idx` (`idventa` ASC),
  CONSTRAINT `envios_venta`
    FOREIGN KEY (`idventa`)
    REFERENCES `cassatta`.`ventas` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`estado_proceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estado_proceso` (
  `id` INT NOT NULL,
  `estado_proceso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`abogado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`abogado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_abogado` VARCHAR(48) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contratista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contratista` (
  `cedula_contratista` BIGINT(12) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `area_solicitante` VARCHAR(45) NOT NULL,
  `telefono` BIGINT(12) NOT NULL,
  `hoja_de_vida` TINYINT(1) NULL,
  PRIMARY KEY (`cedula_contratista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`metas_proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`metas_proyecto` (
  `ID` INT NOT NULL,
  `metas_proyecto_descripcion` TEXT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`plan_accion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plan_accion` (
  `codigo` VARCHAR(8) NOT NULL,
  `actividad` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`datos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`datos` (
  `id_datos` INT NOT NULL,
  `codigo_BPIN` INT NOT NULL,
  `nombre_proyecto_de_inversion` VARCHAR(45) NOT NULL,
  `codigo_CCP` VARCHAR(45) NOT NULL,
  `objetivo_especifico` VARCHAR(80) NOT NULL,
  `descripcion_codigo_CCP` VARCHAR(45) NOT NULL,
  `uso_presupuestal` VARCHAR(60) NOT NULL,
  `recurso` INT NOT NULL,
  PRIMARY KEY (`id_datos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`informacion_PAA_e_insumos_etapa_previa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`informacion_PAA_e_insumos_etapa_previa` (
  `linea_PAA` VARCHAR(45) NOT NULL,
  `objetivo_2023` VARCHAR(200) NOT NULL,
  `oblligaciones` LONGTEXT NOT NULL,
  `objetivo_2024` MEDIUMTEXT NULL,
  `metas_proyecto_ID` INT NOT NULL,
  `plan_accion_codigo` VARCHAR(8) NOT NULL,
  `vifencia_futura` VARCHAR(16) NOT NULL,
  `codigo_UNSPSC` VARCHAR(45) NOT NULL,
  `plazo_meses` INT NOT NULL,
  `plazo_dias` INT NULL,
  `mes_inicio` VARCHAR(45) NOT NULL,
  `fecha_inicio_programada` DATE NOT NULL,
  `fecha_inicio_programada_copy1` DATE NOT NULL,
  `valor_honorario_mes` INT NOT NULL,
  `iva` INT NOT NULL,
  `valor_honorario_iva` INT NULL,
  `valor_honorario_2024` INT NULL,
  `valor_estimado_2023-2024` INT NULL,
  `valor_aprobado_plan_anual_de_adquiciciones_1_semestre_2023` INT NULL,
  `valor_aprobado_plan_anual_de_adquiciciones_24-07-2023` INT NULL,
  `datos_id_datos` INT NOT NULL,
  INDEX `fk_informacion_PAA_e_insumos_etapa_previa_metas_proyecto1_idx` (`metas_proyecto_ID` ASC) VISIBLE,
  INDEX `fk_informacion_PAA_e_insumos_etapa_previa_plan_accion1_idx` (`plan_accion_codigo` ASC) VISIBLE,
  INDEX `fk_informacion_PAA_e_insumos_etapa_previa_datos1_idx` (`datos_id_datos` ASC) VISIBLE,
  PRIMARY KEY (`linea_PAA`),
  CONSTRAINT `fk_informacion_PAA_e_insumos_etapa_previa_metas_proyecto1`
    FOREIGN KEY (`metas_proyecto_ID`)
    REFERENCES `mydb`.`metas_proyecto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_informacion_PAA_e_insumos_etapa_previa_plan_accion1`
    FOREIGN KEY (`plan_accion_codigo`)
    REFERENCES `mydb`.`plan_accion` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_informacion_PAA_e_insumos_etapa_previa_datos1`
    FOREIGN KEY (`datos_id_datos`)
    REFERENCES `mydb`.`datos` (`id_datos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proceso` (
  `numero_contrato` INT NOT NULL AUTO_INCREMENT,
  `ultima_actualizacion` DATE NOT NULL,
  `observaciones` VARCHAR(45) NOT NULL,
  `cantidad_contratos` VARCHAR(2) NOT NULL,
  `estado_proceso_id` INT NOT NULL,
  `relacion_linea_PAA` VARCHAR(45) NOT NULL,
  `contingencia` TINYINT NOT NULL,
  `equipo_OTIC` VARCHAR(80) NOT NULL,
  `proyecto_ o_sistema` VARCHAR(200) NOT NULL,
  `rol` VARCHAR(80) NOT NULL,
  `priorizado` TINYINT NOT NULL,
  `abogado_id` INT NOT NULL,
  `contratista_cedula_contratista` BIGINT(12) NOT NULL,
  `linea_PAA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numero_contrato`),
  INDEX `fk_proceso_cotractua_estado_proceso1_idx` (`estado_proceso_id` ASC) VISIBLE,
  INDEX `fk_proceso_abogado1_idx` (`abogado_id` ASC) VISIBLE,
  INDEX `fk_proceso_contratista1_idx` (`contratista_cedula_contratista` ASC) VISIBLE,
  INDEX `fk_proceso_informacion_PAA_e_insumos_etapa_previa1_idx` (`linea_PAA` ASC) VISIBLE,
  CONSTRAINT `fk_proceso_cotractua_estado_proceso1`
    FOREIGN KEY (`estado_proceso_id`)
    REFERENCES `mydb`.`estado_proceso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_abogado1`
    FOREIGN KEY (`abogado_id`)
    REFERENCES `mydb`.`abogado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_contratista1`
    FOREIGN KEY (`contratista_cedula_contratista`)
    REFERENCES `mydb`.`contratista` (`cedula_contratista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_informacion_PAA_e_insumos_etapa_previa1`
    FOREIGN KEY (`linea_PAA`)
    REFERENCES `mydb`.`informacion_PAA_e_insumos_etapa_previa` (`linea_PAA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`liberacion_de_saldos_CDP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`liberacion_de_saldos_CDP` (
  `Valor` INT NOT NULL,
  `No_Radicado` INT NOT NULL,
  `Fecha_Radicado` DATE NOT NULL,
  `proceso_numero_contrato` INT NOT NULL,
  INDEX `fk_liberacion_de_saldos_CDP_proceso1_idx` (`proceso_numero_contrato` ASC) VISIBLE,
  CONSTRAINT `fk_liberacion_de_saldos_CDP_proceso1`
    FOREIGN KEY (`proceso_numero_contrato`)
    REFERENCES `mydb`.`proceso` (`numero_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proyeccion_segundos_contratos_PAA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proyeccion_segundos_contratos_PAA` (
  `fecha_inicio` VARCHAR(24) NULL,
  `duracion_meses` DECIMAL NULL,
  `valor_mes` INT NULL,
  `proyeccion_18_dic_2023` DOUBLE NULL,
  `linea_PAA` VARCHAR(45) NOT NULL,
  INDEX `fk_proyeccion_segundos_contratos_PAA_informacion_PAA_e_insu_idx` (`linea_PAA` ASC) VISIBLE,
  CONSTRAINT `fk_proyeccion_segundos_contratos_PAA_informacion_PAA_e_insumo1`
    FOREIGN KEY (`linea_PAA`)
    REFERENCES `mydb`.`informacion_PAA_e_insumos_etapa_previa` (`linea_PAA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LEGALIZACION_CONTRATOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LEGALIZACION_CONTRATOS` (
  `valor_contrato` FLOAT NOT NULL,
  `valor_mes` FLOAT NOT NULL,
  `plazo_mes` DECIMAL NOT NULL,
  `plazo_dias` INT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `nuevo_supervisor` VARCHAR(45) NULL,
  `No_Proceso_SECOP_II` VARCHAR(45) NULL,
  `linea_PAA` VARCHAR(45) NOT NULL,
  INDEX `fk_LEGALIZACION_CONTRATOS_informacion_PAA_e_insumos_etapa_p_idx` (`linea_PAA` ASC) VISIBLE,
  CONSTRAINT `fk_LEGALIZACION_CONTRATOS_informacion_PAA_e_insumos_etapa_pre1`
    FOREIGN KEY (`linea_PAA`)
    REFERENCES `mydb`.`informacion_PAA_e_insumos_etapa_previa` (`linea_PAA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CDP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CDP` (
  `no` INT NOT NULL,
  `obs_estado` VARCHAR(45) NOT NULL,
  `justificacion` VARCHAR(80) NOT NULL,
  `solicitud_cdp_memorando_No_radicado` BIGINT(20) NOT NULL,
  `solicitud_cdp_fecha_radicado` DATE NOT NULL,
  `fecha_cdp` DATE NOT NULL,
  `valor_cdp` FLOAT NOT NULL,
  `valor_cdp_VF_diciembre_2023` INT NOT NULL,
  `cdp_entregado_a` VARCHAR(45) NOT NULL,
  `linea_PAA` VARCHAR(45) NOT NULL,
  INDEX `fk_CDP_informacion_PAA_e_insumos_etapa_previa1_idx` (`linea_PAA` ASC) VISIBLE,
  CONSTRAINT `fk_CDP_informacion_PAA_e_insumos_etapa_previa1`
    FOREIGN KEY (`linea_PAA`)
    REFERENCES `mydb`.`informacion_PAA_e_insumos_etapa_previa` (`linea_PAA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pagos` (
  `proceso_numero_contrato` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `valor` DOUBLE NOT NULL,
  `pago-PAC_mes-programado` VARCHAR(45) NOT NULL,
  `mes_cuenta` VARCHAR(45) NOT NULL,
  `restantes` INT NOT NULL,
  INDEX `fk_pagos_proceso1_idx` (`proceso_numero_contrato` ASC) VISIBLE,
  CONSTRAINT `fk_pagos_proceso1`
    FOREIGN KEY (`proceso_numero_contrato`)
    REFERENCES `mydb`.`proceso` (`numero_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

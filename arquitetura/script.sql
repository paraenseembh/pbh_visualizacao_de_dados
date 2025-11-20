-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DW
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `DW` ;

-- -----------------------------------------------------
-- Schema DW
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DW` ;
USE `DW` ;

-- -----------------------------------------------------
-- Table `DW`.`D_FUNCAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`D_FUNCAO` (
  `sk_funcao` INT NOT NULL AUTO_INCREMENT,
  `codigo_funcao` INT NULL,
  `nome_funcao` INT NULL,
  `codigo_subfuncao` INT NULL,
  `nome_subfuncao` INT NULL,
  PRIMARY KEY (`sk_funcao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW`.`D_EIXO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`D_EIXO` (
  `sk_eixo` INT NOT NULL AUTO_INCREMENT,
  `codigo_eixo` VARCHAR(45) NULL,
  `nome_eixo` VARCHAR(45) NULL,
  `nome_subeixo` VARCHAR(45) NULL,
  `codigo_subeixo` VARCHAR(45) NULL,
  PRIMARY KEY (`sk_eixo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW`.`D_ACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`D_ACAO` (
  `sk_acao` INT NOT NULL AUTO_INCREMENT,
  `codigo_acao` INT NOT NULL,
  `nome_acao` INT NOT NULL,
  `nome_subacao` INT NOT NULL,
  `codigo_subacao` INT NOT NULL,
  PRIMARY KEY (`sk_acao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW`.`D_TEMPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`D_TEMPO` (
  `sk_tempo` INT NOT NULL AUTO_INCREMENT,
  `ano_exercicio_orcamentario` INT NOT NULL,
  `quadrimestre` VARCHAR(45) NOT NULL,
  `quadrimestre_ano` VARCHAR(6) NOT NULL,
  `num_quadrimestre` INT NOT NULL,
  PRIMARY KEY (`sk_tempo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW`.`D_PROGRAMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`D_PROGRAMA` (
  `sk_programa` INT NOT NULL AUTO_INCREMENT,
  `exercicio` INT NOT NULL,
  `codigo_area_resultado` INT NOT NULL,
  `nome_area_resultado` VARCHAR(120) NOT NULL,
  `codigo_programa` INT NOT NULL,
  `nome_programa` VARCHAR(120) NOT NULL,
  `objetivo` VARCHAR(1500) NOT NULL,
  `publico_alvo` VARCHAR(1000) NOT NULL,
  `justificativa` VARCHAR(2000) NOT NULL,
  `natureza` VARCHAR(20) NOT NULL,
  `tipologia` VARCHAR(50) NOT NULL,
  `classificacao_de_governo` VARCHAR(20) NOT NULL,
  `data_inicio` DATETIME NOT NULL,
  `data_fim` DATETIME NOT NULL,
  `unidade_gestora` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`sk_programa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW`.`F_ORÇAMENTO_TEMATICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`F_ORÇAMENTO_TEMATICO` (
  `valor_orcado` FLOAT NULL,
  `valor_empenhado` FLOAT NULL,
  `valor_pago` FLOAT NULL,
  `valor_liquidado` FLOAT NULL,
  `sk_funcao` INT NOT NULL,
  `sk_eixo` INT NOT NULL,
  `sk_acao` INT NOT NULL,
  `sk_tempo` INT NOT NULL,
  `sk_programa` INT NOT NULL,
  PRIMARY KEY (`sk_funcao`, `sk_eixo`, `sk_acao`, `sk_tempo`, `sk_programa`),
  INDEX `fk_F_ORÇAMENTO_TEMATICO_D_EIXO1_idx` (`sk_eixo` ASC) VISIBLE,
  INDEX `fk_F_ORÇAMENTO_TEMATICO_D_ACAO_SUBACAO1_idx` (`sk_acao` ASC) VISIBLE,
  INDEX `fk_F_ORÇAMENTO_TEMATICO_D_TEMPO1_idx` (`sk_tempo` ASC) VISIBLE,
  INDEX `fk_F_ORÇAMENTO_TEMATICO_D_PROGRAMA1_idx` (`sk_programa` ASC) VISIBLE,
  CONSTRAINT `fk_F_ORÇAMENTO_TEMATICO_D_FUNCAO1`
    FOREIGN KEY (`sk_funcao`)
    REFERENCES `DW`.`D_FUNCAO` (`sk_funcao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORÇAMENTO_TEMATICO_D_EIXO1`
    FOREIGN KEY (`sk_eixo`)
    REFERENCES `DW`.`D_EIXO` (`sk_eixo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORÇAMENTO_TEMATICO_D_ACAO_SUBACAO1`
    FOREIGN KEY (`sk_acao`)
    REFERENCES `DW`.`D_ACAO` (`sk_acao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORÇAMENTO_TEMATICO_D_TEMPO1`
    FOREIGN KEY (`sk_tempo`)
    REFERENCES `DW`.`D_TEMPO` (`sk_tempo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORÇAMENTO_TEMATICO_D_PROGRAMA1`
    FOREIGN KEY (`sk_programa`)
    REFERENCES `DW`.`D_PROGRAMA` (`sk_programa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DW`.`D_SUBFUNCAO_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DW`.`D_SUBFUNCAO_copy1` (
  `idD_SUBFUNCAO` INT NOT NULL,
  `CODIGO_SUBFUNCAO` VARCHAR(45) NULL,
  `NOME_SUBFUNCAO` VARCHAR(45) NULL,
  PRIMARY KEY (`idD_SUBFUNCAO`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

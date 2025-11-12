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
-- Table `mydb`.`D_FUNCAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`D_FUNCAO` (
  `sk_funcao` INT NOT NULL,
  `codigo_funcao` INT NULL,
  `nome_funcao` INT NULL,
  `codigo_subfuncao` INT NULL,
  `nome_subfuncao` INT NULL,
  PRIMARY KEY (`sk_funcao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_EIXO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`D_EIXO` (
  `sk_eixo` INT NOT NULL,
  `codigo_eixo` VARCHAR(45) NULL,
  `nome_eixo` VARCHAR(45) NULL,
  `nome_subeixo` VARCHAR(45) NULL,
  `codigo_subeixo` VARCHAR(45) NULL,
  PRIMARY KEY (`sk_eixo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_ACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`D_ACAO` (
  `sk_acao` INT NOT NULL,
  `codigo_acao` INT NOT NULL,
  `nome_acao` INT NOT NULL,
  `nome_subacao` INT NOT NULL,
  `codigo_subacao` INT NOT NULL,
  PRIMARY KEY (`sk_acao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_TEMPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`D_TEMPO` (
  `sk_tempo` INT NOT NULL,
  `ano_exercicio_orcamentario` INT NULL,
  `quadrimestre` VARCHAR(45) NULL,
  PRIMARY KEY (`sk_tempo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_PROGRAMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`D_PROGRAMA` (
  `sk_programa` INT NOT NULL,
  `nome_programa` VARCHAR(80) NULL,
  `programa` VARCHAR(80) NULL,
  `observacao` VARCHAR(200) NULL,
  `natureza` VARCHAR(45) NULL,
  `tipologia` VARCHAR(45) NULL,
  `clissificacao_de_governo` VARCHAR(45) NULL,
  `codigo_area_resultado` VARCHAR(45) NULL,
  `nome_area_resultado` VARCHAR(45) NULL,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,
  `data_apuracao` DATE NULL,
  `desc_tipologia` VARCHAR(200) NULL,
  PRIMARY KEY (`sk_programa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`F_ORÇAMENTO_TEMATICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`F_ORÇAMENTO_TEMATICO` (
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
    REFERENCES `mydb`.`D_FUNCAO` (`sk_funcao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORÇAMENTO_TEMATICO_D_EIXO1`
    FOREIGN KEY (`sk_eixo`)
    REFERENCES `mydb`.`D_EIXO` (`sk_eixo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORÇAMENTO_TEMATICO_D_ACAO_SUBACAO1`
    FOREIGN KEY (`sk_acao`)
    REFERENCES `mydb`.`D_ACAO` (`sk_acao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORÇAMENTO_TEMATICO_D_TEMPO1`
    FOREIGN KEY (`sk_tempo`)
    REFERENCES `mydb`.`D_TEMPO` (`sk_tempo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORÇAMENTO_TEMATICO_D_PROGRAMA1`
    FOREIGN KEY (`sk_programa`)
    REFERENCES `mydb`.`D_PROGRAMA` (`sk_programa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_SUBFUNCAO_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`D_SUBFUNCAO_copy1` (
  `idD_SUBFUNCAO` INT NOT NULL,
  `CODIGO_SUBFUNCAO` VARCHAR(45) NULL,
  `NOME_SUBFUNCAO` VARCHAR(45) NULL,
  PRIMARY KEY (`idD_SUBFUNCAO`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`D_FUNCAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `D_FUNCAO` (
  `sk_funcao` INT NOT NULL AUTO_INCREMENT,
  `codigo_funcao` INT NULL,
  `nome_funcao` INT NULL,
  `codigo_subfuncao` INT NULL,
  `nome_subfuncao` INT NULL,
  PRIMARY KEY (`sk_funcao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_EIXO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `D_EIXO` (
  `sk_eixo` INT NOT NULL AUTO_INCREMENT,
  `codigo_eixo` VARCHAR(45) NULL,
  `nome_eixo` VARCHAR(45) NULL,
  `nome_subeixo` VARCHAR(45) NULL,
  `codigo_subeixo` VARCHAR(45) NULL,
  PRIMARY KEY (`sk_eixo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_ACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `D_ACAO` (
  `sk_acao` INT NOT NULL AUTO_INCREMENT,
  `codigo_acao` INT NOT NULL,
  `nome_acao` INT NOT NULL,
  `nome_subacao` INT NOT NULL,
  `codigo_subacao` INT NOT NULL,
  PRIMARY KEY (`sk_acao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_TEMPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `D_TEMPO` (
  `sk_tempo` INT NOT NULL AUTO_INCREMENT,
  `ano_exercicio_orcamentario` INT NULL,
  `quadrimestre` VARCHAR(45) NULL,
  PRIMARY KEY (`sk_tempo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`D_PROGRAMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `D_PROGRAMA` (
  `sk_programa` INT NOT NULL AUTO_INCREMENT,
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
CREATE TABLE IF NOT EXISTS `F_ORÇAMENTO_TEMATICO` (
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
  INDEX `idx_F_ORCAMENTO_TEMATICO_sk_eixo` (`sk_eixo` ASC),
  INDEX `idx_F_ORCAMENTO_TEMATICO_sk_acao` (`sk_acao` ASC),
  INDEX `idx_F_ORCAMENTO_TEMATICO_sk_tempo` (`sk_tempo` ASC),
  INDEX `idx_F_ORCAMENTO_TEMATICO_sk_programa` (`sk_programa` ASC),
  CONSTRAINT `fk_F_ORCAMENTO_TEMATICO_D_FUNCAO1`
    FOREIGN KEY (`sk_funcao`)
    REFERENCES `D_FUNCAO` (`sk_funcao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORCAMENTO_TEMATICO_D_EIXO1`
    FOREIGN KEY (`sk_eixo`)
    REFERENCES `D_EIXO` (`sk_eixo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORCAMENTO_TEMATICO_D_ACAO1`
    FOREIGN KEY (`sk_acao`)
    REFERENCES `D_ACAO` (`sk_acao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORCAMENTO_TEMATICO_D_TEMPO1`
    FOREIGN KEY (`sk_tempo`)
    REFERENCES `D_TEMPO` (`sk_tempo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_F_ORCAMENTO_TEMATICO_D_PROGRAMA1`
    FOREIGN KEY (`sk_programa`)
    REFERENCES `D_PROGRAMA` (`sk_programa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
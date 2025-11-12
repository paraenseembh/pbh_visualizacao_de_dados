-- PostgreSQL DDL Script

-- 1. Configurações e Desativação de Checks (Menos comuns/necessárias em PG para DDL simples)
-- As linhas SET @OLD_... e SET SQL_MODE não são diretamente portáveis ou necessárias para a criação das tabelas no PostgreSQL.

-- 2. Criação do Schema (Substitui o USE `mydb` do MySQL)
-- Em PostgreSQL, usa-se CREATE SCHEMA e depois SET search_path.
CREATE SCHEMA IF NOT EXISTS mydb;

-- Define o schema 'mydb' como o padrão para as operações seguintes
SET search_path TO mydb, public;

---
## 🛠️ Criação das Tabelas de Dimensão

-- -----------------------------------------------------
-- Table `mydb`.`D_FUNCAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS D_FUNCAO (
  sk_funcao INT PRIMARY KEY,
  codigo_funcao INT,
  nome_funcao INT,
  codigo_subfuncao INT,
  nome_subfuncao INT
);


-- -----------------------------------------------------
-- Table `mydb`.`D_EIXO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS D_EIXO (
  sk_eixo INT PRIMARY KEY,
  codigo_eixo VARCHAR(45),
  nome_eixo VARCHAR(45),
  nome_subeixo VARCHAR(45),
  codigo_subeixo VARCHAR(45)
);


-- -----------------------------------------------------
-- Table `mydb`.`D_ACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS D_ACAO (
  sk_acao INT PRIMARY KEY,
  codigo_acao INT NOT NULL,
  nome_acao INT NOT NULL,
  nome_subacao INT NOT NULL,
  codigo_subacao INT NOT NULL
);


-- -----------------------------------------------------
-- Table `mydb`.`D_TEMPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS D_TEMPO (
  sk_tempo INT PRIMARY KEY,
  ano_exercicio_orcamentario INT,
  quadrimestre VARCHAR(45)
);


-- -----------------------------------------------------
-- Table `mydb`.`D_PROGRAMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS D_PROGRAMA (
  sk_programa INT PRIMARY KEY,
  nome_programa VARCHAR(80),
  programa VARCHAR(80),
  observacao VARCHAR(200),
  natureza VARCHAR(45),
  tipologia VARCHAR(45),
  clissificacao_de_governo VARCHAR(45),
  codigo_area_resultado VARCHAR(45),
  nome_area_resultado VARCHAR(45),
  data_inicio DATE,
  data_fim DATE,
  data_apuracao DATE,
  desc_tipologia VARCHAR(200)
);

---
## 📊 Criação da Tabela Fato

-- -----------------------------------------------------
-- Table `mydb`.`F_ORÇAMENTO_TEMATICO`
-- *Nota:* Nomes com caracteres especiais (como Ç) são envoltos em aspas duplas ("") no PostgreSQL.
-- FLOAT foi alterado para REAL ou NUMERIC(p,s). Usei REAL, que é um FLOAT de precisão simples (4 bytes).
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "F_ORÇAMENTO_TEMATICO" (
  valor_orcado REAL,
  valor_empenhado REAL,
  valor_pago REAL,
  valor_liquidado REAL,
  sk_funcao INT NOT NULL,
  sk_eixo INT NOT NULL,
  sk_acao INT NOT NULL,
  sk_tempo INT NOT NULL,
  sk_programa INT NOT NULL,

  -- Primary Key composta
  PRIMARY KEY (sk_funcao, sk_eixo, sk_acao, sk_tempo, sk_programa),

  -- Foreign Keys
  CONSTRAINT fk_F_ORCAMENTO_TEMATICO_D_FUNCAO1
    FOREIGN KEY (sk_funcao)
    REFERENCES D_FUNCAO (sk_funcao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_F_ORCAMENTO_TEMATICO_D_EIXO1
    FOREIGN KEY (sk_eixo)
    REFERENCES D_EIXO (sk_eixo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_F_ORCAMENTO_TEMATICO_D_ACAO1
    FOREIGN KEY (sk_acao)
    REFERENCES D_ACAO (sk_acao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_F_ORCAMENTO_TEMATICO_D_TEMPO1
    FOREIGN KEY (sk_tempo)
    REFERENCES D_TEMPO (sk_tempo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_F_ORCAMENTO_TEMATICO_D_PROGRAMA1
    FOREIGN KEY (sk_programa)
    REFERENCES D_PROGRAMA (sk_programa)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Criação dos índices (o PRIMARY KEY já cria um, mas os demais índices foram mantidos)
CREATE INDEX IF NOT EXISTS idx_F_ORCAMENTO_TEMATICO_sk_eixo ON "F_ORÇAMENTO_TEMATICO" (sk_eixo);
CREATE INDEX IF NOT EXISTS idx_F_ORCAMENTO_TEMATICO_sk_acao ON "F_ORÇAMENTO_TEMATICO" (sk_acao);
CREATE INDEX IF NOT EXISTS idx_F_ORCAMENTO_TEMATICO_sk_tempo ON "F_ORÇAMENTO_TEMATICO" (sk_tempo);
CREATE INDEX IF NOT EXISTS idx_F_ORCAMENTO_TEMATICO_sk_programa ON "F_ORÇAMENTO_TEMATICO" (sk_programa);

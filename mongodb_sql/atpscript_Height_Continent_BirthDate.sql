use atp;

-- Tratamento de jogadores sem Altura 

-- Primeiramente cria-se a tabela temporária para qual sera importada o csv dos players com a respetiva heigh

CREATE TABLE temp_players_without_height (
    name_first VARCHAR(15),
    name_last VARCHAR(15),
    height INT(10)
);

-- Adicionar o csv à tabela

LOAD DATA LOCAL INFILE './atp_players.csv'
INTO TABLE temp_players_without_height
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@player_id, name_first, name_last, @dob, @hand, @ioc, height, @wikidata_id);

-- Adicionar uma nova coluna 'name' na tabela 'temp_players_without_height' para armazenar o nome completo
ALTER TABLE temp_players_without_height
ADD COLUMN name VARCHAR(31);

-- Atualizar a coluna 'name' com a junção de 'name_first' e 'name_last'
-- A junção irá combinar os dois nomes com um espaço entre eles
UPDATE temp_players_without_height
SET name = CONCAT(name_first, ' ', name_last);

-- Remover as colunas 'name_first' e 'name_last', pois agora temos a coluna 'name' com os dois nomes
ALTER TABLE temp_players_without_height
DROP COLUMN name_first,
DROP COLUMN name_last;


-- Atualizar a altura na tabela 'player' onde a altura é igual a 0, usando a coluna 'name' para a correspondência com a tabela 'temp_players_without_height'
UPDATE player p
JOIN temp_players_without_height t
ON p.name = t.name
SET p.height = t.height
WHERE p.height = 0;

-- Excluir a tabela temporária 'temp_players_without_height' após os updates
DROP TABLE temp_players_without_height;



-- Introduzir o contexto do Continente

-- Criar a tabela de continent

CREATE TABLE continent (
    continent VARCHAR(15),
    continent_code VARCHAR(10) PRIMARY KEY
) 
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

-- Inserir a inf nesta tabela

LOAD DATA LOCAL INFILE './Continent_Codes.csv'
INTO TABLE continent
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(continent, continent_code);

-- Tratamento da variavel continent_code

UPDATE continent
SET continent_code = 
    REPLACE(
        REPLACE(
            REPLACE(
                TRIM(continent_code),
                '\r', ''
            ),
            '\n', ''
        ),
        '\t', ''
    );



-- Criar a tabela para associar as siglas dos paises aos continentes (em code)

CREATE TABLE continent_country (
    continent_code VARCHAR(10),
    three_letter_country_code VARCHAR(11) PRIMARY KEY
)
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;
	
-- Inserir a inf nesta tabela
LOAD DATA LOCAL INFILE './CountrySigla_ContinentCode.csv'
INTO TABLE continent_country
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(continent_code, three_letter_country_code);

-- Tratamento da variavel three_letter_country_code

UPDATE continent_country
SET three_letter_country_code = 
    REPLACE(
        REPLACE(
            REPLACE(
                TRIM(three_letter_country_code),
                '\r', ''
            ),
            '\n', ''
        ),
        '\t', ''
    );



-- 1ª Foreign Key: country.code_country → continent_country.Three_Letter_Country_Code
ALTER TABLE country
ADD CONSTRAINT fk_country_code
FOREIGN KEY (code_country)
REFERENCES continent_country(Three_Letter_Country_Code)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

-- 2ª Foreign Key: continent_country.Continent_Code → continent.Continent_Code
ALTER TABLE continent_country
ADD CONSTRAINT fk_continent_code
FOREIGN KEY (Continent_Code)
REFERENCES continent(Continent_Code)
ON DELETE RESTRICT
ON UPDATE RESTRICT;



-- Adicionar a Variável Data de Nascimento a tabela Player

--- Primeiramente cria-se a tabela temporária para qual sera importada o csv dos players com a respetiva data de nascimento
CREATE TABLE temp_players_birthdate(
    name_first VARCHAR(100),
    name_last VARCHAR(100),
    birthdate VARCHAR(10)
);


-- Adicionar o csv à tabela

LOAD DATA INFILE './all_players_hand.csv'
INTO TABLE temp_players_birthdate
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(name_first, name_last, @hand, birthdate, @country, @gender);

-- Adicionar uma nova coluna 'name' na tabela 'temp_players_birthdate' para armazenar o nome completo
ALTER TABLE temp_players_birthdate
ADD COLUMN name VARCHAR(31);

-- Atualizar a coluna 'name' com a junção de 'name_first' e 'name_last'
-- A junção irá combinar os dois nomes com um espaço entre eles
UPDATE temp_players_birthdate
SET name = CONCAT(name_first, ' ', name_last);

-- Remover as colunas 'name_first' e 'name_last', pois agora temos a coluna 'name' com os dois nomes
ALTER TABLE temp_players_birthdate
DROP COLUMN name_first,
DROP COLUMN name_last;


-- Formatar a coluna
UPDATE temp_players_birthdate
SET birthdate = STR_TO_DATE(birthdate, '%Y%m%d');

-- Modificar o seu tipo
ALTER TABLE temp_players_birthdate
MODIFY COLUMN birthdate DATE;

ALTER TABLE player
ADD COLUMN birthdate DATE;


UPDATE player p
JOIN temp_players_birthdate t
ON p.name = t.name
SET p.birthdate = t.birthdate;


-- Excluir a tabela temporária 'temp_players_birthdate' após os updates
DROP TABLE temp_players_birthdate;



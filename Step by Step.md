# 📘 Step-by-Step

---

## 1º Passo:

Fazer os imports para o mongo que se encontram no ficheiro `"mongoimports.txt"`, abrindo o terminal na pasta onde se encontram estes ficheiros: `"atpplayers.json"`, `"all_players_single.csv"`, `"all_players_hand.csv"` e `"codes_siglas.csv"`.

---

## 2º Passo:

Correr um comando de cada vez do ficheiro `"atpscript.json"` e verificar se os outputs estão de acordo aqueles que estão no final de cada comando.

---

## 3º Passo:

Fazer os exports do mongo que se encontram no ficheiro `"mongoexports.txt"`, abrindo o terminal na pasta onde se encontra a pasta `"Colunas"`, exportando assim os csv's: `"Tournaments.csv"`, `"Players.csv"`, `"Season.csv"`, `"Game.csv"`, `"Grounds.csv"` e `"Rounds.csv"`.

---

## 4º Passo:

Fazer o import do ficheiro sql `"atpdb.sql"` que contem a estrutura do modelo relacional atp e as tabelas temporárias necessárias.

---

## 5º Passo:

Criar a seguinte diretoria:

```
C:\data\atp
```

E dentro desta colocar o csv `"All_Country_Code.csv"` juntamente com os csv's resultantes do 3º passo.

---

## 6º Passo:

Abrir o MySql através do terminal e dentro da base de dados `"atp"` fazer os imports que se encontram no ficheiro `"Imports SQL.txt"`.

---

## 7º Passo:

Abrir o MySql através do terminal e dentro da base de dados `"atp"` fazer todos os Insert's que se encontram no ficheiro `"atpscript.sql"`.

---

## 1ª Nota:

Se por algum motivo estiver a dar problemas a criar o modelo relacional poderá por optar fazer o import de todo o modelo relacional através do terminal estando na seguinte diretoria:

```
C:\xampp\mysql\bin
```

E correr o seguinte comando:

```bash
mysql -u root < "C:\data\atp\modelo_relacional_atp.sql"
```

Assumindo que foi guardado este ficheiro na seguinte diretoria:

```
C:\data\atp
```

---

Após ter sido identificado em Python problemas em algumas variáveis, como também a necessidade de criar outras voltou-se ao Sql e foi realizado o seguinte passo:

---

## 8º Passo:

Abrir o MySql através do terminal e dentro da base de dados `"atp"` fazer todos os comandos que se encontram no ficheiro `"atpscript_Height_Continent_BirthDate.sql"` colocando a respetiva diretoria na leitura dos ficheiros csv's, que se referem a: `"atp_players.csv"`, `"Continent_Codes.csv"`, `"CountrySigla_ContinentCode.csv"` e `"all_players_hand.csv"`.

---

## 2ª Nota:

Caso esteja a ter problemas com a realização do passo anterior, poderá por optar fazer simplesmente o import do modelo relacional com estas novas alterações no modelo anterior. Para tal basta abrir o terminal estando na seguinte diretoria:

```
C:\xampp\mysql\bin
```

E correr o seguinte comando:

```bash
mysql -u root < "C:\data\atp\atp_modelo_relacional_Height_Continent_BirthDate.sql"
```

Assumindo que foi guardado este ficheiro na seguinte diretoria:

```
C:\data\atp
```

---

Passando para a fase de Análises e Tratamento em Python os passos são os seguintes:

---

## 9º Passo:

Abrir e correr o notebook do jupyter `"TratamentoInicial.ipynb"` que contém todo o pre processamento e análises cruciais para as tomadas de decisão.

---

## 10ª Passo:

Abrir e correr o notebook do jupyter `"ExploratoryDataAnalisysNoNulls.ipynb"`, que faz a leitura do csv `"withoutNull.csv"` e, permite obter o dataset com as variáveis utilizadas para a fase de modelação.

---

A modelação foi feita em RStudio e os passos são:

---

## 11ª Passo:

Abrir o RStudio e correr os 2 scripts que dizem aos 2 métodos de validação criados, a divisão treino-teste e cross-validation, `"Modeling_TrainTest.Rmd"` e `"Modeling_CV.Rmd"` e verificar os valores obtidos das métricas dos modelos utilizados comparando-as com as que se encontram na sheet2 e sheet4 do ficheiro excel `"Evaluation.xsx"` que dizem respeito, respetivamente, à técnica Train-test e Cross-validation.

---

## 12ª Passo:

Por fim, para a criação dos gráficos referentes a estas métricas obtidas para os 4 modelos desenvolvidos basta abrir o jupyter e correr os 2 scripts `"EvaluationTrainTest.ipynb"` e `"EvaluationTestCrossValidation.ipynb"`.


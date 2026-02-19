# 🎾 Tennis Set Prediction – ML Pipeline

Projeto aplicado em Ciência de Dados focado na previsão do número total de sets (2 ou 3) em jogos de ténis profissional, através de um pipeline completo de engenharia e modelação de dados.

O projeto integra múltiplas tecnologias:

MongoDB → Modelo Relacional SQL → Python (Tratamento & EDA) → R (Modelação & Validação)

---

## 🎯 Objetivo

Desenvolver modelos de Machine Learning capazes de prever se um jogo profissional será decidido em:

- 2 sets
- 3 sets

Com base em características dos jogadores, torneios e contexto competitivo.

---

## 🧱 Arquitetura do Projeto

### 🔹 1. Engenharia de Dados – MongoDB

- Importação de dados JSON e CSV
- Criação de variáveis derivadas (Age, Season, Continent)
- Transformação e exportação para formato relacional

---

### 🔹 2. Modelo Relacional – MySQL

- Construção do modelo relacional ATP
- Criação de tabelas temáticas (Players, Tournaments, Games, Grounds, Rounds)
- Inserção de dados e integração estrutural

---

### 🔹 3. Tratamento e Análise – Python

- Limpeza de dados
- Tratamento de inconsistências
- Criação de variáveis dummy
- Normalização
- Análise estatística
- Balanceamento de classes (SMOTE)
- Preparação para modelação

Notebooks principais:

```
python_rstudio/TratamentoInicial.ipynb
python_rstudio/ExploratoryDataAnalisysNoNulls.ipynb
```

---

### 🔹 4. Modelação – R

Modelos implementados:

- Decision Tree
- Random Forest
- XGBoost
- Support Vector Machine (SVM)

Validação:

- Train-Test Split
- Cross-Validation

Scripts:

```
python_rstudio/Modeling_TrainTest.Rmd
python_rstudio/Modeling_CV.Rmd
```

---

### 🔹 5. Avaliação Final

Geração de gráficos comparativos de métricas através de:

```
python/EvaluationTrainTest.ipynb
python/EvaluationTestCrossValidation.ipynb
```

---

## 📊 Estrutura do Repositório

```
README.md
Step by Step.md
.gitignore

data/README.md

mongodb_sql/

python_rstudio/

Grupo_6.pdf
Grupo_6.pptx
```

---

## 📦 Dados

O ficheiro principal de dados não está incluído neste repositório devido ao seu tamanho.

Para instruções completas de importação e execução do pipeline consultar:

- `Step by Step.md`
- `data/README.md`

---

## 🛠 Tecnologias Utilizadas

- MongoDB
- MySQL
- Python (Pandas, Scikit-learn)
- R
- SMOTE
- Técnicas de Machine Learning supervisionado

---

## 🧠 Competências Demonstradas

- Engenharia de dados multi-sistema
- Integração NoSQL + SQL
- Construção de modelo relacional
- Feature engineering
- Balanceamento de classes
- Implementação de múltiplos algoritmos
- Avaliação com validação cruzada
- Pipeline completo de Data Science

---

## 📌 Nota Final

Este projeto demonstra a construção de um pipeline completo de Ciência de Dados, desde a recolha e estruturação dos dados até à modelação e avaliação final dos modelos preditivos.

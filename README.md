# FIAP - Faculdade de Informática e Administração Paulista 

<p align="center">
  <a href="https://www.fiap.com.br/">
    <img width="40%" alt="logo-fiap" src="https://github.com/user-attachments/assets/d8437c7b-f931-4272-be94-71571cef54e5" />
  </a>
</p>


<br>

# 🎲 Modelo Banco de Dados

## 👨‍🎓 Integrantes:
- Antônio Ancelmo Neto barros
```
 - RM: rm563683
 - E-mail: antonio.anbarros@gmail.com
 - GitHub: [@AntonioBarros19](https://github.com/AntonioBarros19)
```
- Beatriz Pilecarte de Melo
```
 - RM: rm564952
 - E-mail: beatrizpilecartedemelo@gmail.com
 - GitHub: [@BPilecarte](https://github.com/BPilecarte)
```
- Francismar Alves Martins Junior
```
 - RM: rm562869
 - E-mail: yggdrasil.git@gmail.com
 - GitHub: [@yggdrasilGit](https://github.com/yggdrasilGit)
```
- Matheus Soares Bento da Silva
```
 - RM: rm565540
 - E-mail: matheusbento044@gmail.com
 - GitHub: [@matheusbento044](https://github.com/matheusbento04)
```
- Vitor Eiji Fernandes Teruia
```
- RM: rm563683
- E-mail: vitorfer2018@gmail.com
- GitHub: [@Vitor985-hub](https://github.com/Vitor985-hub)
```

## 👩‍🏫 Professores:
### Tutor(a) 
- <a href="https://www.linkedin.com/in/leonardoorabona/">Leonardo Ruiz Orabona</a>
### Coordenador(a)
- <a href="https://www.linkedin.com/company/inova-fusc">André Godoi Chiovato</a>


## 📜 Descrição

Este modelo de dados foi projetado para monitorar máquinas industriais, capturando leituras de sensores, gerenciando informações sobre as máquinas e registrando ocorrências e anomalias.

## Estrutura do Banco de Dados
### Entidades e Seus Atributos

`MAQUINAS ⚙️` \
Essa entidade armazena todas as informações sobre as máquinas monitoradas.

| Atributo | Tipo de Dado | Descrição |
| :--- | :--- | :--- |
| id_maquina | INTEGER | Chave Primária. Identificador único da máquina. |
| nome | VARCHAR2(255) | Nome comercial ou de identificação da máquina. |
| numero_serie | VARCHAR2(100) | Número de série único da máquina. |
| modelo | VARCHAR2(100) | Modelo da máquina. |
| fabricante | VARCHAR2(100) | Fabricante da máquina. |
| localizacao | VARCHAR2(100) | Localização física da máquina. |
| data_instalacao | DATE | Data de instalação da máquina. |
| status | VARCHAR2(50) | Estado operacional atual (ex: 'Operacional', 'Manutenção'). |
| ultima_manutencao | DATE | Data da última manutenção. |
| proxima_manutencao | DATE | Data prevista para a próxima manutenção. |

<br/>

`LEITURAS_SENSORES 📊` \
Esta entidade registra as leituras de sensores em tempo real ou em intervalos específicos.

| Atributo | Tipo de Dado | Descrição |
| :--- | :--- | :--- |
| id_leitura_sensor | INTEGER | Chave Primária. Identificador único da leitura. |
| data_hora | TIMESTAMP | Data e hora exatas da coleta dos dados. |
| temperatura | NUMBER(4,2) | Temperatura registrada. |
| vibracao | NUMBER(4,2) | Nível de vibração. |
| corrente | NUMBER(4,2) | Corrente elétrica. |
| pressao | NUMBER(5,2) | Nível de pressão. |
| umidade | NUMBER(4,2) | Nível de umidade. |
| tensao | NUMBER(5,2) | Tensão elétrica. |
| nivel | INTEGER | Nível (e.g., de fluído). |
| velocidade | INTEGER | Velocidade de operação. |
| posicao | INTEGER | Posição de um componente. |
| qualidade_ar | INTEGER | Qualidade do ar. |
| fumaca | CHAR(1) | Indica presença de fumaça ('S' ou 'N'). |

<br/>

`PARAMETROS 📈` \
Essa entidade define os tipos de parâmetros que podem ser monitorados (ex: temperatura, pressão, vibração).

| Atributo | Tipo de Dado | Descrição |
| :--- | :--- | :--- |
| id_parametros | INTEGER | Chave Primária. Identificador único do tipo de parâmetro. |
| descricao_tipo | VARCHAR2(100) | Descrição do parâmetro (ex: 'Temperatura do Motor'). |

<br/>

`PARAMETROS_MAQUINAS_SENSORES 🎯` \
Esta tabela é crucial, pois define os valores de referência (limites) de cada parâmetro para cada máquina específica.

| Atributo | Tipo de Dado | Descrição |
| :--- | :--- | :--- |
| id_maquina | INTEGER | Chave Primária/Estrangeira. ID da máquina. |
| id_parametros | INTEGER | Chave Primária/Estrangeira. ID do parâmetro. |
| valor_maximo | NUMBER | Valor máximo aceitável para o parâmetro na máquina. |
| valor_minimo | NUMBER | Valor mínimo aceitável para o parâmetro na máquina. |

<br/>

`OCORRENCIAS 🚨` \
Esta entidade registra as anomalias ou eventos que ultrapassaram os limites definidos pelos parâmetros.

| Atributo | Tipo de Dado | Descrição |
| :--- | :--- | :--- |
| id_ocorrencia | INTEGER | Chave Primária. Identificador único da ocorrência. |
| id_leitura_sensor | INTEGER | Chave Estrangeira. ID da leitura que gerou a ocorrência. |
| id_parametros | INTEGER | Chave Estrangeira. ID do parâmetro violado. |
| id_maquina | INTEGER | Chave Estrangeira. ID da máquina onde a ocorrência se deu. |
| nmr_ocorrencia | INTEGER | Número único da ocorrência. |
| tipo_anomalia | VARCHAR2(100) | Tipo da anomalia (ex: 'Temperatura Alta'). |
| severidade | VARCHAR2(20) | Nível de gravidade (ex: 'Baixa', 'Crítica'). |
| descricao | VARCHAR2(500) | Descrição detalhada da ocorrência. |
| status_ocorrencia | VARCHAR2(50) | Status da ocorrência (ex: 'Aberta', 'Resolvida'). |
| data_hora_abertura | DATE | Data e hora em que a ocorrência foi registrada. |
| data_hora_encerramento | DATE | Data e hora em que a ocorrência foi resolvida. |

---

### 🔗 Relações entre Entidades 
As relações definem como as entidades se conectam, criando um modelo de dados coeso e funcional.

`MAQUINAS` tem uma relação **um-para-muitos** com `PARAMETROS_MAQUINAS_SENSORES`.

Uma máquina pode ter múltiplos parâmetros de referência configurados.

**Chave Estrangeira:** id_maquina em `PARAMETROS_MAQUINAS_SENSORES`.


`PARAMETROS` tem uma relação **um-para-muitos** com `PARAMETROS_MAQUINAS_SENSORES`.

Um tipo de parâmetro pode ser associado a várias máquinas.

**Chave Estrangeira:** id_parametros em `PARAMETROS_MAQUINAS_SENSORES`.


`LEITURAS_SENSORES` tem uma relação **um-para-um** com `OCORRENCIAS`.

Uma ocorrência é gerada por uma única leitura de sensor.

**Chave Estrangeira:** id_leitura_sensor em `OCORRENCIAS`.


`PARAMETROS_MAQUINAS_SENSORES` tem uma relação **um-para-muitos** com `OCORRENCIAS`.

Os limites de um parâmetro de uma máquina podem resultar em várias ocorrências.

**Chave Estrangeira:** (id_maquina, id_parametros) em `OCORRENCIAS`.

---

## 🖼️ Imagem do Modelo

### Modelo Lógico

<img width="710" height="608" alt="logical_model_db_sprint3" src="https://github.com/user-attachments/assets/2b69592f-1dd2-405c-8f52-60289428583f" />

### Modelo Relacional

<img width="1171" height="726" alt="relational_model_db_sprint3" src="https://github.com/user-attachments/assets/ef64aa0c-fe1f-4e6a-b996-485489aa96bd" />


---

## 📋 Licença

<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"><p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/agodoi/template">MODELO GIT FIAP</a> por <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://fiap.com.br">Fiap</a> está licenciado sobre <a href="http://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution 4.0 International</a>.</p>

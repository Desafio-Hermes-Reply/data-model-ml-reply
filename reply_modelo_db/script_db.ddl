-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-07-26 21:57:01 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE empresas_cliente 
    ( 
     id_empresa    INTEGER  NOT NULL , 
     nome_empresa  VARCHAR2 (255)  NOT NULL , 
     cnpj          CHAR (14)  NOT NULL , 
     endereco      VARCHAR2 (500)  NOT NULL , 
     email         VARCHAR2 (255) , 
     data_contrato DATE  NOT NULL , 
     empresa_ativa CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE empresas_cliente 
    ADD CONSTRAINT PK_empresas_cliente PRIMARY KEY ( id_empresa ) ;

CREATE TABLE leitura_sensores 
    ( 
     id_leitura INTEGER  NOT NULL , 
     id_sensor  INTEGER  NOT NULL , 
     valor      INTEGER  NOT NULL , 
     tipo_valor VARCHAR2 (50)  NOT NULL , 
     data_hora  DATE  NOT NULL 
    ) 
;

ALTER TABLE leitura_sensores 
    ADD CONSTRAINT PK_leitura_sensores PRIMARY KEY ( id_leitura, id_sensor ) ;

CREATE TABLE maquinas 
    ( 
     id_maquina         INTEGER  NOT NULL , 
     nome               VARCHAR2 (255)  NOT NULL , 
     numero_serie       VARCHAR2 (100)  NOT NULL , 
     modelo             VARCHAR2 (100)  NOT NULL , 
     fabricante         VARCHAR2 (100)  NOT NULL , 
     localizacao        VARCHAR2 (100)  NOT NULL , 
     data_instalacao    DATE  NOT NULL , 
     status             VARCHAR2 (50)  NOT NULL , 
     ultima_manutencao  DATE , 
     proxima_manutencao DATE 
    ) 
;

ALTER TABLE maquinas 
    ADD CONSTRAINT PK_maquinas PRIMARY KEY ( id_maquina ) ;

CREATE TABLE ocorrencias 
    ( 
     id_ocorrencia     INTEGER  NOT NULL , 
     id_leitura        INTEGER  NOT NULL , 
     id_sensor         INTEGER  NOT NULL , 
     nmr_ocorrencia    INTEGER  NOT NULL , 
     tipo_anomalia     VARCHAR2 (100)  NOT NULL , 
     severidade        VARCHAR2 (20)  NOT NULL , 
     descricao         VARCHAR2 (500) , 
     status_ocorrencia VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE ocorrencias 
    ADD CONSTRAINT PK_ocorrencias PRIMARY KEY ( id_ocorrencia, id_leitura ) ;

CREATE TABLE perfis 
    ( 
     id_perfil   INTEGER  NOT NULL , 
     nome_perfil VARCHAR2 (100)  NOT NULL , 
     descricao   VARCHAR2 (500)  NOT NULL 
    ) 
;

ALTER TABLE perfis 
    ADD CONSTRAINT PK_perfis PRIMARY KEY ( id_perfil ) ;

CREATE TABLE permissoes_maquina_usuario 
    ( 
     id_permissao    INTEGER  NOT NULL , 
     id_maquina      INTEGER  NOT NULL , 
     id_usuario      INTEGER  NOT NULL , 
     data_concessao  TIMESTAMP WITH TIME ZONE  NOT NULL , 
     permissao_ativa CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE permissoes_maquina_usuario 
    ADD CONSTRAINT PK_permissoes_maquina_usuario PRIMARY KEY ( id_maquina, id_usuario, id_permissao ) ;

CREATE TABLE sensores 
    ( 
     id_sensor    INTEGER  NOT NULL , 
     id_maquina   INTEGER  NOT NULL , 
     nome         VARCHAR2 (200)  NOT NULL , 
     modelo       VARCHAR2 (50)  NOT NULL , 
     tipo_medicao VARCHAR2 (20)  NOT NULL , 
     sensor_ativo CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE sensores 
    ADD CONSTRAINT PK_sensores PRIMARY KEY ( id_sensor ) ;

CREATE TABLE usuarios 
    ( 
     id_usuario    INTEGER  NOT NULL , 
     id_empresa    INTEGER  NOT NULL , 
     id_perfil     INTEGER  NOT NULL , 
     nome          VARCHAR2 (50)  NOT NULL , 
     sobrenome     VARCHAR2 (100)  NOT NULL , 
     email         VARCHAR2 (100)  NOT NULL , 
     senha_hash    VARCHAR2 (255)  NOT NULL , 
     nivel_acesso  VARCHAR2 (50)  NOT NULL , 
     data_cadastro DATE  NOT NULL , 
     ultimo_login  TIMESTAMP WITH TIME ZONE  NOT NULL , 
     usuario_ativo CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE usuarios 
    ADD CONSTRAINT PK_usuarios PRIMARY KEY ( id_usuario ) ;

ALTER TABLE leitura_sensores 
    ADD CONSTRAINT FK_leitura_sensores_sensores FOREIGN KEY 
    ( 
     id_sensor
    ) 
    REFERENCES sensores 
    ( 
     id_sensor
    ) 
;

ALTER TABLE ocorrencias 
    ADD CONSTRAINT FK_ocorrencias_leitura_sen FOREIGN KEY 
    ( 
     id_leitura,
     id_sensor
    ) 
    REFERENCES leitura_sensores 
    ( 
     id_leitura,
     id_sensor
    ) 
;

ALTER TABLE permissoes_maquina_usuario 
    ADD CONSTRAINT FK_permissoes_maquina_us_mq FOREIGN KEY 
    ( 
     id_maquina
    ) 
    REFERENCES maquinas 
    ( 
     id_maquina
    ) 
;

ALTER TABLE permissoes_maquina_usuario 
    ADD CONSTRAINT FK_permissoes_maquina_us_us FOREIGN KEY 
    ( 
     id_usuario
    ) 
    REFERENCES usuarios 
    ( 
     id_usuario
    ) 
;

ALTER TABLE sensores 
    ADD CONSTRAINT FK_sensores_maquinas FOREIGN KEY 
    ( 
     id_maquina
    ) 
    REFERENCES maquinas 
    ( 
     id_maquina
    ) 
;

ALTER TABLE usuarios 
    ADD CONSTRAINT FK_usuarios_empresas_cliente FOREIGN KEY 
    ( 
     id_empresa
    ) 
    REFERENCES empresas_cliente 
    ( 
     id_empresa
    ) 
;

ALTER TABLE usuarios 
    ADD CONSTRAINT FK_usuarios_perfis FOREIGN KEY 
    ( 
     id_perfil
    ) 
    REFERENCES perfis 
    ( 
     id_perfil
    ) 
;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

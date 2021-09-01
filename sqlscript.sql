REM   Script: Projeto final BD1
REM   Projeto de banco de dados de uma biblioteca, tenho fé que agora vai 

CREATE TABLE ENDERECO( 
    ENDERECO_ID NUMBER, 
    NUMERO NUMBER, 
    RUA VARCHAR(50), 
    BAIRRO VARCHAR(50), 
    CIDADE VARCHAR(50), 
    PRIMARY KEY (ENDERECO_ID) 
);

CREATE TABLE SECAO( 
    SECAO_ID NUMBER, 
    GENERO VARCHAR(25), 
    QUANTIDADE_LIVRO NUMBER, 
    PRIMARY KEY (SECAO_ID) 
);

CREATE TABLE FUNCIONARIO( 
    CPF VARCHAR(11), 
    NOME VARCHAR(50),   
    ENDERECO_ID NUMBER, 
    SALARIO NUMBER, 
    CARGA_HORARIA NUMBER, 
     
    PRIMARY KEY(CPF), 
    FOREIGN KEY (ENDERECO_ID) REFERENCES ENDERECO(ENDERECO_ID) 
);

CREATE TABLE EDITORA( 
    EDITORA_ID NUMBER, 
    CNPJ VARCHAR(14), 
    NOME VARCHAR(50), 
    ENDERECO_ID NUMBER, 
     
    PRIMARY KEY(EDITORA_ID), 
    FOREIGN KEY(ENDERECO_ID) REFERENCES ENDERECO(ENDERECO_ID) 
);

CREATE TABLE AUTOR( 
    AUTOR_ID NUMBER, 
    NOME VARCHAR(70), 
    NACIONALIDADE VARCHAR(50), 
    EMAIL VARCHAR(50), 
    EDITORA_ID NUMBER, 
     
    PRIMARY KEY (AUTOR_ID), 
    FOREIGN KEY(EDITORA_ID) REFERENCES EDITORA(EDITORA_ID) 
);

CREATE TABLE LEITOR( 
    CPF_LEITOR VARCHAR(11), 
    NOME VARCHAR(70), 
    INADIMPLENTE VARCHAR(3), 
    ENDERECO_ID NUMBER, 
     
    PRIMARY KEY(CPF_LEITOR), 
    FOREIGN KEY(ENDERECO_ID) REFERENCES ENDERECO(ENDERECO_ID), 
    CHECK(INADIMPLENTE IN ('SIM', 'NAO')) 
);

CREATE TABLE MONITOR( 
    CPF_MONITOR VARCHAR(11), 
    SECAO_ID NUMBER, 
     
    PRIMARY KEY (CPF_MONITOR), 
    FOREIGN KEY (CPF_MONITOR) REFERENCES FUNCIONARIO(CPF), 
    FOREIGN KEY (SECAO_ID) REFERENCES SECAO(SECAO_ID) 
     
);

CREATE TABLE BIBLIOTECARIA( 
    CPF_BIBLIOTECARIA VARCHAR(11), 
     
    PRIMARY KEY(CPF_BIBLIOTECARIA), 
    FOREIGN KEY(CPF_BIBLIOTECARIA) REFERENCES FUNCIONARIO(CPF) 
);

CREATE  TABLE SEMINARIO( 
    SEMINARIO_ID NUMBER, 
    PUBLICO VARCHAR(11), 
    TEMA VARCHAR(25), 
    CPF_BIBLIOTECARIA VARCHAR(11), 
     
    PRIMARY KEY(SEMINARIO_ID), 
    FOREIGN KEY(CPF_BIBLIOTECARIA) REFERENCES BIBLIOTECARIA(CPF_BIBLIOTECARIA), 
    CHECK(PUBLICO IN ('FUNCIONARIO', 'FORA'))	 
);

CREATE TABLE ESPACO( 
    ESPACO_ID NUMBER, 
    CPF_LEITOR VARCHAR(11), 
   CPF_BIBLIOTECARIA  VARCHAR(11), 
     
    PRIMARY KEY(ESPACO_ID), 
    FOREIGN KEY (CPF_LEITOR) REFERENCES LEITOR(CPF_LEITOR), 
    FOREIGN KEY (CPF_BIBLIOTECARIA) REFERENCES BIBLIOTECARIA(CPF_BIBLIOTECARIA)  
);

CREATE TABLE LIVRO( 
    LIVRO_ID NUMBER, 
    TITULO VARCHAR(80), 
    ESTADO_LIVRO VARCHAR(5), 
    GENERO VARCHAR(25), 
    SECAO_ID NUMBER, 
    CPF_MONITOR VARCHAR(11), 
    AUTOR_ID NUMBER, 
     
    PRIMARY KEY(LIVRO_ID), 
    FOREIGN KEY(SECAO_ID) REFERENCES SECAO(SECAO_ID), 
    FOREIGN KEY(AUTOR_ID) REFERENCES AUTOR(AUTOR_ID), 
    FOREIGN KEY(CPF_MONITOR) REFERENCES MONITOR(CPF_MONITOR), 
     
    CHECK(ESTADO_LIVRO IN ('NOVO', 'USADO')) 
     
     
);

CREATE TABLE RESERVA(
    RESERVA_ID NUMBER,
    ESPACO_ID NUMBER,
    HORARIO_INICIO DATE,
    HORARIO_FIM DATE,
    
    PRIMARY KEY(RESERVA_ID),
    FOREIGN KEY(ESPACO_ID) REFERENCES ESPACO(ESPACO_ID)
);
CREATE TABLE TELEFONE_FUNC(
    CPF VARCHAR(11),
    TELEFONE VARCHAR(11),
    
    PRIMARY KEY(CPF),
    FOREIGN KEY(CPF) REFERENCES FUNCIONARIO(CPF)
);
CREATE TABLE TELEFONE_EDITORA(
    EDITORA_ID NUMBER,
    TELEFONE VARCHAR(11),
    
    PRIMARY KEY(EDITORA_ID),
    FOREIGN KEY(EDITORA_ID) REFERENCES EDITORA(EDITORA_ID)
    
);
CREATE TABLE TELEFONE_LEITOR(
    CPF_LEITOR VARCHAR(11),
    TELEFONE VARCHAR(11),
    
    PRIMARY KEY(CPF_LEITOR),
    FOREIGN KEY(CPF_LEITOR) REFERENCES LEITOR(CPF_LEITOR)
    
)

//INSERINDO CONTEUDO EM SECAO

INSERT INTO SECAO VALUES (1, 'ROMANCE', 5);
INSERT INTO SECAO VALUES (2, 'DRAMA', 10);
INSERT INTO SECAO VALUES (3, 'ACAO', 30);
INSERT INTO SECAO VALUES (4, 'AVENTURA', 25);
INSERT INTO SECAO VALUES (5, 'COMEDIA', 20);
INSERT INTO SECAO VALUES (6, 'CULINARIA', 12);
INSERT INTO SECAO VALUES (7, 'MARKETING', 17);
INSERT INTO SECAO VALUES (8, 'TECNOLOGIA', 55);
INSERT INTO SECAO VALUES (9, 'FICCAO', 60);
INSERT INTO SECAO VALUES (10, 'POESIA', 22);

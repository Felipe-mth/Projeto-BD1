CREATE TABLE ENDERECO( 
    ENDERECO_ID NUMBER, 
    NUMERO NUMBER, 
    RUA VARCHAR(50), 
    BAIRRO VARCHAR(50), 
    CIDADE VARCHAR(50), 
    PRIMARY KEY (ENDERECO_ID) 
)
;

CREATE TABLE SECAO( 
    SECAO_ID NUMBER, 
    GENERO VARCHAR(25), 
    QUANTIDADE_LIVRO NUMBER, 
    PRIMARY KEY (SECAO_ID) 
)
;

CREATE TABLE FUNCIONARIO( 
    CPF VARCHAR(11), 
    NOME VARCHAR(50),   
    ENDERECO_ID NUMBER, 
    SALARIO NUMBER, 
    CARGA_HORARIA NUMBER, 
     
    PRIMARY KEY(CPF), 
    FOREIGN KEY (ENDERECO_ID) REFERENCES ENDERECO(ENDERECO_ID) 
)
;

CREATE TABLE EDITORA( 
    EDITORA_ID NUMBER, 
    CNPJ VARCHAR(14), 
    NOME VARCHAR(50), 
    ENDERECO_ID NUMBER, 
     
    PRIMARY KEY(EDITORA_ID), 
    FOREIGN KEY(ENDERECO_ID) REFERENCES ENDERECO(ENDERECO_ID) 
)
;

CREATE TABLE AUTOR( 
    AUTOR_ID NUMBER, 
    NOME VARCHAR(70), 
    NACIONALIDADE VARCHAR(50), 
    EDITORA_ID NUMBER, 
     
    PRIMARY KEY (AUTOR_ID), 
    FOREIGN KEY(EDITORA_ID) REFERENCES EDITORA(EDITORA_ID) 
)
;

CREATE TABLE LEITOR( 
    CPF_LEITOR VARCHAR(11), 
    NOME VARCHAR(70), 
    INADIMPLENTE VARCHAR(3), 
    ENDERECO_ID NUMBER, 
     
    PRIMARY KEY(CPF_LEITOR), 
    FOREIGN KEY(ENDERECO_ID) REFERENCES ENDERECO(ENDERECO_ID), 
    CHECK(INADIMPLENTE IN ('SIM', 'NAO')) 
)
;

CREATE TABLE MONITOR( 
    CPF_MONITOR VARCHAR(11), 
    SECAO_ID NUMBER, 
     
    PRIMARY KEY (CPF_MONITOR), 
    FOREIGN KEY (CPF_MONITOR) REFERENCES FUNCIONARIO(CPF), 
    FOREIGN KEY (SECAO_ID) REFERENCES SECAO(SECAO_ID) 
     
)
;

CREATE TABLE BIBLIOTECARIA( 
    CPF_BIBLIOTECARIA VARCHAR(11), 
     
    PRIMARY KEY(CPF_BIBLIOTECARIA), 
    FOREIGN KEY(CPF_BIBLIOTECARIA) REFERENCES FUNCIONARIO(CPF) 
)
;

CREATE  TABLE SEMINARIO( 
    SEMINARIO_ID NUMBER, 
    PUBLICO VARCHAR(11), 
    TEMA VARCHAR(100), 
    CPF_BIBLIOTECARIA VARCHAR(11), 
     
    PRIMARY KEY(SEMINARIO_ID), 
    FOREIGN KEY(CPF_BIBLIOTECARIA) REFERENCES BIBLIOTECARIA(CPF_BIBLIOTECARIA), 
    CHECK(PUBLICO IN ('FUNCIONARIO', 'FORA'))	 
)
;

CREATE TABLE ESPACO( 
    ESPACO_ID NUMBER, 
    CPF_LEITOR VARCHAR(11), 
   CPF_BIBLIOTECARIA  VARCHAR(11), 
     
    PRIMARY KEY(ESPACO_ID), 
    FOREIGN KEY (CPF_LEITOR) REFERENCES LEITOR(CPF_LEITOR), 
    FOREIGN KEY (CPF_BIBLIOTECARIA) REFERENCES BIBLIOTECARIA(CPF_BIBLIOTECARIA)  
)
;

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


CREATE TABLE EMPRESTIMO(
    EMPRESTIMO_ID NUMBER,
    CPF_LEITOR VARCHAR(11),
    CPF_BIBLIOTECARIA VARCHAR(11),
    LIVRO_ID NUMBER,
    
    PRIMARY KEY(EMPRESTIMO_ID),
    FOREIGN KEY(CPF_LEITOR) REFERENCES LEITOR(CPF_LEITOR),
    FOREIGN KEY(CPF_BIBLIOTECARIA) REFERENCES BIBLIOTECARIA(CPF_BIBLIOTECARIA),
    FOREIGN KEY(LIVRO_ID) REFERENCES LIVRO(LIVRO_ID)
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
    
   
    FOREIGN KEY(CPF) REFERENCES FUNCIONARIO(CPF)
);
CREATE TABLE TELEFONE_EDITORA(
    EDITORA_ID NUMBER,
    TELEFONE VARCHAR(11),
    
    
    FOREIGN KEY(EDITORA_ID) REFERENCES EDITORA(EDITORA_ID)
    
);
CREATE TABLE TELEFONE_LEITOR(
    CPF_LEITOR VARCHAR(11),
    TELEFONE VARCHAR(11),
    
   
    FOREIGN KEY(CPF_LEITOR) REFERENCES LEITOR(CPF_LEITOR)
    
);


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

//Adicionar endereço
INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 1, 101, 'JOÃO BARROS', 'TORRE', 'RECIFE');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 2, 207, 'AGAMENOM', 'CASA AMARELA', 'RECIFE');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 3, 252, 'DONA OLEGARINA', 'POÇO DA PANELA', 'RECIFE');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 5, 07, 'RUA DE JANEIRO', 'CAIC', 'GRAVATA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 6, 34, 'AGAMENOM MAGALHAES', 'MAURISSIO DE NASSAU', 'CARUARU');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 7, 45, 'ADIMILSON JOSE' , 'SALGADÃO', 'CARUARU');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 8, 57, 'RUA 2 DE OUTUBRO' , 'BONFIM', 'VITORIA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 9, 41, 'RUA 21 DE NOVEMBRO', 'GRANDE VITORIA', 'VITORIA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 10, 93, 'FAZENDA 2 IRMAOS', 'CENTRO', 'POMBOS');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE) 
VALUES( 4, 10, 'QUINTINO BOCAIUVA', 'CENTRO', 'GRAVATA');


INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(11,63 , 'Rua Dourival Jose Pereira', 'Prq Feiras Toritama', 'TORITAMA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(12, 78 , 'Rua Joao Pereira Tabos', 'Toritama', 'TORITAMA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(13,114 , 'Rua Toritama', 'Cohab', 'TORITAMA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(14,59 , 'Rua do Matadouro', 'Toritama', 'TORITAMA');
INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(15,69, 'Rua benicio deltoro', 'Loteamento boa esperança', 'TORITAMA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(16,71 , 'Fazenda Acaflor', 'Zn Rural', 'BONITO');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(17,27 , 'Rua Afranio de Godoy', 'Centro', 'BONITO');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(18, 28, 'Rua 09 de Janeiro', 'Centro', 'BEZERROS');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(19,32 , 'Rua 15 de Novembro', 'Centro', 'BEZERROS');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(20,17 , 'Rua Abelha Rainha', 'Alto da Bondade', 'OLINDA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(21,13 , 'Rua Abreu e Lima', 'Peixinhos', 'OLINDA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(22,14 , 'Rua Abrolhos', 'Ouro Preto', 'OLINDA');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(23,6 , 'Rua Aprigio Assuncao', 'Centro', 'TRIUNFO');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(24,3 , 'Rua Alaide Siqueira', 'Guanabra', 'TRIUNFO');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(25,89, 'Rua A', 'Vassoural', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(26,88, 'Rua Abdias Antônio de Lira', 'Nossa Senhora das Gracas', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(27,58, 'Rua Abel Miranda Cavalcante', 'Kennedy', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(28,56, 'Rua Abelardo Barbosa', 'Nova Caruaru', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(29,55, 'Rua Abenildo Barbosa Galindo', 'Jose Carlos de Oliveira', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(31,47, 'Travessa Abilio Crespo', 'Morro de Bom Jesus', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(32,109, 'Rua Adalgisa Nunes', 'Cidade Alta', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(33,107, 'Rua Adalgisa Nunes da Paz', 'Mauricio de Nassau', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(34,236, 'Rua Adalgiza Freire da Silva', 'Rendeiras', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(35,703, 'Rua da Varzea', 'Rendeiras', 'Caruaru');

INSERT INTO ENDERECO( ENDERECO_ID, NUMERO, RUA, BAIRRO, CIDADE)
VALUES(36,164, 'Rua de Brito', 'Mauricio de Nassau', 'Caruaru');

//Adicionanado funcionario
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('08762527061', 'Davi Manuel Heitor Nunes',12,3450, 4);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('18627022097', 'Eliane Lopes Magalhães Gomes', 11,1700, 8);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('23336432006', 'Faustão Dignissimo Jovem Pinto', 7,1700, 8);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('08121598028', 'Alice Wanderleia Sato', 3,3450, 4);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('07879639098', 'Vanessa Sophia da Luz', 5,1700, 8);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('45802434040', 'Pedro Fábio Hugo de Paula', 2,3450, 4);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('39708540080', 'Ryan Thomas Silveira', 1,1700, 8);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('71451372086', 'Teresinha Julia Novaes', 6,1700, 8);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('70252910052', 'Bianca Yasmin Oliveira', 6,3450, 4);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('17761782032', 'Breno Guilherme Lucca Moraes', 9,1700, 8);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('00244768030', 'Isabela Eduarda Evelyn Lopes', 8,1700, 8);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('21925301028', 'Kaique Roberto Aparício', 10,1700, 8);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('38868284090', 'Lucca Thales Rodrigues', 13,1700, 8);
INSERT INTO FUNCIONARIO(CPF, NOME, ENDERECO_ID, SALARIO, CARGA_HORARIA) VALUES ('61721319077', 'Lorena Nicole da Costa', 14,1700, 8);

//Adicionando Bibliotecaria
INSERT INTO BIBLIOTECARIA(CPF_BIBLIOTECARIA) VALUES ('08762527061');
INSERT INTO BIBLIOTECARIA(CPF_BIBLIOTECARIA) VALUES ('08121598028');
INSERT INTO BIBLIOTECARIA(CPF_BIBLIOTECARIA) VALUES ('45802434040');
INSERT INTO BIBLIOTECARIA(CPF_BIBLIOTECARIA) VALUES ('70252910052');

//Adicionando monitor
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('18627022097', 8);
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('23336432006', 2);
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('07879639098', 1);
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('39708540080', 5);
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('71451372086', 10);
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('17761782032', 7);
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('00244768030', 4);
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('21925301028', 3);
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('38868284090', 6);
INSERT INTO MONITOR(CPF_MONITOR, SECAO_ID) VALUES ('61721319077', 9);

//Adicionando leitor
INSERT INTO LEITOR VALUES('16810003002', 'Raul Emanuel Cavalcanti', 'SIM', 23);
INSERT INTO LEITOR VALUES('97250037218', 'Nair Isabelle Mendes', 'SIM', 22);
INSERT INTO LEITOR VALUES('52844259286', 'Bruna Jaqueline Andrea da Cunha', 'NAO', 18);
INSERT INTO LEITOR VALUES('44591724611', 'Gustavo Vitor Ryan Martins', 'NAO', 19);
INSERT INTO LEITOR VALUES('86376725317', 'Thiago Pietro Monteiro', 'NAO', 21);
INSERT INTO LEITOR VALUES('14069945881', 'Luna Clarice Marlene Barbosa', 'SIM', 24);
INSERT INTO LEITOR VALUES('11881723100', 'Andrea Luzia Caldeira', 'NAO', 17);
INSERT INTO LEITOR VALUES('03337911340', 'Emilly Amanda Alves', 'NAO', 16);
INSERT INTO LEITOR VALUES('15346378936', 'Rosa Betina Sabrina Moraes', 'SIM', 15);
INSERT INTO LEITOR VALUES('44367377210', 'Davi Paulo Gonçalves', 'NAO',20);

//Adicionando editora
INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(1, '07533868000104' , 'NOVA VIDA' ,  32);

INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(3, '37157620000149' , 'GRUPO PLANETA' , 33 );

INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(4, '26267460000174' , 'BERTELSMAN' ,  29);

INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(5, '77364400000100' , 'Abreu'  ,  31);

INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(6, '24447371000184' , 'Sextante' ,  27);

INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(7, '63585363000156' , 'Harper Collins' ,  26);

INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(8, '45347510000178' , 'Kirio' ,  28);

INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(9, '41533212000111' , 'Intriseca' , 25 );

INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(10, '35857431000153' , 'Elyda' ,  35);

INSERT INTO EDITORA( EDITORA_ID, CNPJ, NOME, ENDERECO_ID)
VALUES(2, '57494909000160' , 'UNIVERSAL' , 36);




//Adicionando Seminario
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (1, 'FUNCIONARIO', 'AS POESIAS DE CAMOES', '08762527061');
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (2, 'FORA', 'LITERATURA BRASILEIRA', '08762527061');
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (3, 'FUNCIONARIO', 'LITERATURA INGLESA', '08762527061');
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (4, 'FUNCIONARIO', 'SIMBOLOS EM SENHOR DOS ANEIS', '08762527061');
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (5, 'FORA', 'NARNIA E SUAS REPRESENTACOES FANTASTICAS', '08121598028');
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (6, 'FORA', 'A IMPORTANCIA DE ESTUDAR MARKETING', '08121598028');
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (7, 'FUNCIONARIO', 'ROMANCES NO SECULO XX', '45802434040');
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (8, 'FORA', 'MACHADO DE ASSIS E SEUS CONTOS', '45802434040');
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (9, 'FUNCIONARIO', 'A AVENTURA NA FORMACAO DO IMAGINARIO', '70252910052');
INSERT INTO SEMINARIO(SEMINARIO_ID, PUBLICO, TEMA, CPF_BIBLIOTECARIA) VALUES (10, 'FUNCIONARIO', 'FICCAO E TECNOLOGIA - IMPACTOS NO MUNDO MODERNO', '70252910052');

//Adicoinando Autor

INSERT INTO AUTOR VALUES(1, 'José de Alencar ', 'brasileiro', 10);
INSERT INTO AUTOR VALUES(2,'Cecília Meireles', 'brasileiro', 7);
INSERT INTO AUTOR VALUES(3,'Carlos Drummond de Andrade', 'brasileiro', 9);
INSERT INTO AUTOR VALUES(4,'Machado de Assis', 'brasileiro', 8);
INSERT INTO AUTOR VALUES(5,'Truman Capote', 'americano', 3);
INSERT INTO AUTOR VALUES(6,'William Shakespeare','inglês', 5);
INSERT INTO AUTOR VALUES(7,'Gustave Flaubert ', 'francês', 4);
INSERT INTO AUTOR VALUES(8,'Simone de Beauvoir', 'francês', 2);
INSERT INTO AUTOR VALUES(9,'Gabriel Garcia Marquez', 'colombiano',1);
INSERT INTO AUTOR VALUES(10,'Liliana Bodoc', 'argentina', 6);

//Adicionando Espaço
INSERT INTO ESPACO(ESPACO_ID, CPF_LEITOR) VALUES(1, '16810003002');
INSERT INTO ESPACO(ESPACO_ID, CPF_LEITOR) VALUES(2, '97250037218');
INSERT INTO ESPACO(ESPACO_ID, CPF_LEITOR)VALUES(3, '52844259286');
INSERT INTO ESPACO(ESPACO_ID, CPF_LEITOR) VALUES(4, '44591724611');
INSERT INTO ESPACO(ESPACO_ID, CPF_LEITOR) VALUES(5, '86376725317');
INSERT INTO ESPACO(ESPACO_ID, CPF_BIBLIOTECARIA) VALUES(6, '08762527061');
INSERT INTO ESPACO(ESPACO_ID, CPF_BIBLIOTECARIA) VALUES(7, '08121598028');
INSERT INTO ESPACO(ESPACO_ID, CPF_BIBLIOTECARIA) VALUES(8, '45802434040');
INSERT INTO ESPACO(ESPACO_ID, CPF_BIBLIOTECARIA) VALUES(9, '70252910052');
INSERT INTO ESPACO(ESPACO_ID, CPF_BIBLIOTECARIA) VALUES(10,'70252910052');

//Adicionando telefone da editora
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (1, '2138757352');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (1, '21981768117');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (2, '7738136166');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (3, '77995681486');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (3, '2129412234');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (4, '21981489060');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (5, '8738863449');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (6, '87984786986');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (7, '6536847127');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (8, '65987441388');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (8, '4835635137');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (9, '48998057191');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (10, '8629411256');
INSERT INTO TELEFONE_EDITORA(EDITORA_ID, TELEFONE) VALUES (10, '86986143196');

//Adicionando telefone leitor
INSERT INTO TELEFONE_LEITOR VALUES ('16810003002' , '81936086481');
INSERT INTO TELEFONE_LEITOR VALUES ('16810003002' , '87976469909');
INSERT INTO TELEFONE_LEITOR VALUES ('97250037218' , '81900480787');
INSERT INTO TELEFONE_LEITOR VALUES ('52844259286' , '87938041667' );
INSERT INTO TELEFONE_LEITOR VALUES ('44591724611' , '81902192740');
INSERT INTO TELEFONE_LEITOR VALUES ('86376725317' , '81970991286' );
INSERT INTO TELEFONE_LEITOR VALUES ('86376725317' , '81911018600');
INSERT INTO TELEFONE_LEITOR VALUES ('14069945881' , '8797151-4522');
INSERT INTO TELEFONE_LEITOR VALUES ('03337911340' , '87960138388');
INSERT INTO TELEFONE_LEITOR VALUES ('15346378936' , '87945539619');
INSERT INTO TELEFONE_LEITOR VALUES ('15346378936' , '81947461620');
INSERT INTO TELEFONE_LEITOR VALUES ('44367377210' , '81914337251');
INSERT INTO TELEFONE_LEITOR VALUES ('44367377210' , '81964811064');

//Adicionando Livro
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (1, 'Dom Quixote','NOVO', 'ROMANCE', 1, '18627022097', 1);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (2, 'Guerra e Paz','USADO', 'ROMANCE', 1, '18627022097', 4);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (3, 'Didascalicon','USADO', 'ROMANCE', 1, '23336432006', 2);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (4, 'Cem Anos de Solidão','USADO', 'DRAMA', 2, '23336432006', 2);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (5, 'Ulisses','NOVO', 'DRAMA', 2, '07879639098', 3);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (6, 'Em Busca do Tempo Perdido','USADO', 'DRAMA', 2, '07879639098', 1);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (7, 'A Divina Comedia','NOVO', 'ACAO', 3, '39708540080', 10);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (8, 'Grande Sertao: Veredas','USADO', 'ACAO', 3, '39708540080', 5);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (9, 'Edipo Rei','NOVO', 'ACAO', 3, '71451372086', 1);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (10, '1984','NOVO', 'AVENTURA', 4, '71451372086', 3);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (11, 'Orgulho e Preconceito','NOVO', 'AVENTURA', 4, '17761782032', 9);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (12, 'Crime e Castigo','USADO', 'AVENTURA', 4, '17761782032', 7);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (13, 'Anna Karenina','NOVO', 'COMEDIA', 5, '00244768030', 2);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (14, 'Iliada','NOVO', 'COMEDIA', 5, '00244768030', 10);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (15, 'Odisseia','USADO', 'COMEDIA', 5, '21925301028', 4);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (16, 'Os Lusiadas','USADO', 'CULINARIA', 6, '21925301028', 9);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (17, 'Hamlet','USADO', 'CULINARIA', 6, '38868284090', 5);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (18, 'O Grande Gatsby','NOVO', 'CULINARIA', 6, '38868284090', 1);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (19, 'Admiravel Mundo Novo','USADO', 'MARKETING', 7, '61721319077', 7);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (20, 'Romeu e Julieta','NOVO', 'MARKETING', 7, '61721319077', 5);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (21, 'A República','USADO', 'MARKETING', 7, '23336432006', 2);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (22, 'Apologia de Socrates','USADO', 'TECNOLOGIA', 8, '18627022097', 6);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (23, 'Viagem ao centro da Terra','USADO', 'TECNOLOGIA', 8, '18627022097', 10);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (24, 'Metafisica','USADO', 'TECNOLOGIA', 8, '23336432006', 6);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (25, 'Critica da Razao Pura','USADO', 'FICCAO', 9, '07879639098', 3);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (26, 'Os Elementos','NOVO', 'FICCAO', 9, '17761782032', 8);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (27, 'Os tres mosqueteiros','NOVO', 'FICCAO', 9, '17761782032', 1);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (28, 'Suma Teologica','NOVO', 'POESIA', 10, '71451372086', 5);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (29, 'De Anima','NOVO', 'POESIA', 10, '71451372086', 9);
INSERT INTO LIVRO(LIVRO_ID, TITULO, ESTADO_LIVRO, GENERO, SECAO_ID, CPF_MONITOR, AUTOR_ID) VALUES (30, 'Confissoes','NOVO', 'POESIA', 10, '61721319077', 2);

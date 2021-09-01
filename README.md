# Projeto-BD1
Projeto final da cadeira de banco de dados 1. Fazendo um banco para uma biblioteca

Minimundo

Um sistema para uma biblioteca que possui 2 tipos de funcionários sendo eles: bibliotecária e monitores. Os funcionários possuem CPF, nome, endereço(com rua,número, bairro e cidade), telefone, salário e carga horária. Os monitores cuidam de uma seção, já a bibliotecária ministra seminários e cuida dos empréstimos de livros.
Um seminário possui Id, tema, e se é destinado a funcionários ou aberto ao público. E uma bibliotecária ministra vários seminários.
Uma seção possui id, genêro, quantidade de livros suportados. Um monitor é responsável por uma seção e uma seção só possui um responsável, uma seção possui vários livros. 
Um livro possui id, título, gênero, e estado do livro. Um monitor cataloga vários livros.
Um leitor possui CPF, nome, endereço, telefone, se está inadimplente. O leitor pode pegar vários livros.
O Autor possui id, nacionalidade, nome, email. Vários autores podem escrever um livro. 
A editora possui id, CNPJ, nome, telefone e endereço. Uma editora possui vários autores.
O espaço de apresentação e leitura possui id, data_reserva, horário_inicio, horário_termino. Um leitor ou uma bibliotecária podem reservar um espaço

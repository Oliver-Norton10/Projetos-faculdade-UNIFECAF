create database sistema_faculdade;
use sistema_faculdade;


-- Tabela CURSO
CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    duracao INT NOT NULL,
    carga_horaria INT NOT NULL
);

-- Tabela ALUNO
CREATE TABLE aluno (
    id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100),
    matricula VARCHAR(20) UNIQUE NOT NULL
);

-- Tabela PROFESSOR
CREATE TABLE professor (
    id_professor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100),
    especializacao VARCHAR(100)
);

-- Tabela MATERIA
CREATE TABLE materia (
    id_materia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

-- Tabela TURMA
CREATE TABLE turma (
    id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    id_curso INT NOT NULL,
    id_materia INT NOT NULL,
    
    CONSTRAINT fk_turma
    FOREIGN KEY (id_curso) 
    REFERENCES curso(id_curso),
    FOREIGN KEY (id_materia) 
    REFERENCES materia(id_materia)
);

-- Tabela ASSOCIATIVA aluno_turma
CREATE TABLE aluno_turma (
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    
    CONSTRAINT fk_aluno_turma
    PRIMARY KEY (id_aluno, id_turma),
    FOREIGN KEY (id_aluno)
    REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_turma) 
    REFERENCES turma(id_turma)
);

-- Tabela ASSOCIATIVA professor_materia
CREATE TABLE professor_materia (
    id_professor INT NOT NULL,
    id_materia INT NOT NULL,
    
    CONSTRAINT fk_professor_materia
    PRIMARY KEY (id_professor, id_materia),
    FOREIGN KEY (id_professor)
    REFERENCES professor(id_professor),
    FOREIGN KEY (id_materia) 
    REFERENCES materia(id_materia)
);

-- Tabela NOTAS
CREATE TABLE notas (
    id_nota INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    nota1 DECIMAL(4,2),
    nota2 DECIMAL(4,2),
    media DECIMAL(4,2),
    
    CONSTRAINT fk_notas
    FOREIGN KEY (id_aluno)
    REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_turma)
    REFERENCES turma(id_turma)
);



-- CURSOS
INSERT INTO curso (nome, duracao, carga_horaria) VALUES
('Administração', 8, 3200),
('Engenharia da Computação', 10, 4000),
('Pedagogia', 8, 3000);

-- ALUNOS
INSERT INTO aluno (nome, data_nascimento, email, matricula) VALUES
('Lucas Martins', '2001-03-15', 'lucas.martins@email.com', '20231001'),
('Ana Beatriz Souza', '2002-05-21', 'ana.souza@email.com', '20231002'),
('Carlos Henrique Lima', '2000-11-09', 'carlos.lima@email.com', '20231003');

-- PROFESSORES
INSERT INTO professor (nome, cpf, email, especializacao) VALUES
('Marcos Silveira', '123.456.789-00', 'marcos.silveira@faculdade.com', 'Matemática'),
('Renata Alves', '987.654.321-00', 'renata.alves@faculdade.com', 'Programação'),
('João Pedro Rocha', '321.654.987-00', 'joao.rocha@faculdade.com', 'Gestão Educacional');

-- MATERIAS
INSERT INTO materia (nome, carga_horaria) VALUES
('Algoritmos e Lógica de Programação', 80),
('Gestão de Pessoas', 60),
('Matemática Financeira', 60);

-- TURMAS
INSERT INTO turma (ano, semestre, id_curso, id_materia) VALUES
(2025, 1, 2, 1), -- Eng. Computação - Algoritmos
(2025, 1, 1, 2), -- Administração - Gestão de Pessoas
(2025, 1, 3, 3); -- Pedagogia - Matemática Financeira

-- ALUNO_TURMA
INSERT INTO aluno_turma (id_aluno, id_turma) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2); -- Lucas em duas turmas

-- PROFESSOR_MATERIA
INSERT INTO professor_materia (id_professor, id_materia) VALUES
(2, 1), -- Renata leciona Algoritmos
(3, 2), -- João leciona Gestão de Pessoas
(1, 3); -- Marcos leciona Matemática Financeira

-- NOTAS
INSERT INTO notas (id_aluno, id_turma, nota1, nota2, media) VALUES
(1, 1, 8.5, 9.0, 8.75),
(2, 2, 7.0, 6.5, 6.75),
(3, 3, 9.0, 8.5, 8.75),
(1, 2, 6.0, 7.0, 6.5);


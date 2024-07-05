# Projeto de Modelagem Dimensional com Foco na Análise dos Dados dos Professores

Olá, meu nome é Alberto Leandro, sou arquiteto e urbanista especialista em ciência de dados. Aqui explicarei o processo para criar um esquema em estrela com o foco na análise dos dados dos professores. Sendo assim, a tabela fato deve refletir diversos dados sobre professor, cursos ministrados, departamento ao qual faz parte.

## Objetivo

O objetivo deste projeto é criar um diagrama dimensional – star schema – com base no diagrama relacional disponibilizado, com foco na análise dos dados dos professores.

## Estrutura do Banco de Dados

### Tabelas Relacionais

```sql
-- Criação da tabela Professor
CREATE TABLE Professor (
  idProfessor INT PRIMARY KEY,
  Departamento_idDepartamento INT
);

-- Criação da tabela Departamento
CREATE TABLE Departamento (
  idDepartamento INT PRIMARY KEY,
  idProfessor_coordenador INT
);

-- Criação da tabela Disciplina
CREATE TABLE Disciplina (
  idDisciplina INT PRIMARY KEY,
  Professor_idProfessor INT
);

-- Criação da tabela Matriculado
CREATE TABLE Matriculado (
  Aluno_idAluno INT,
  Disciplina_idDisciplina INT
);

-- Criação da tabela Aluno
CREATE TABLE Aluno (
  idAluno INT PRIMARY KEY
);

-- Criação da tabela Curso
CREATE TABLE Curso (
  idCurso INT PRIMARY KEY,
  Departamento_idDepartamento INT
);

-- Criação da tabela Disciplina_Curso
CREATE TABLE Disciplina_Curso (
  Disciplina_idDisciplina INT,
  Curso_idCurso INT
);

-- Criação da tabela Pre_requisitos_das_disciplinas
CREATE TABLE Pre_requisitos_das_disciplinas (
  Disciplina_idDisciplina INT,
  Pre_requisitos_idPre_requisitos INT
);

-- Criação da tabela Pre_requisitos
CREATE TABLE Pre_requisitos (
  idPre_requisitos INT PRIMARY KEY
);


--TABELAS DIMENSIONAIS

-- Criação da tabela Dim_Professor
CREATE TABLE Dim_Professor (
  idProfessor INT PRIMARY KEY,
  Nome VARCHAR(100),
  Departamento_idDepartamento INT
);

-- Criação da tabela Dim_Departamento
CREATE TABLE Dim_Departamento (
  idDepartamento INT PRIMARY KEY,
  Nome VARCHAR(100)
);

-- Criação da tabela Dim_Disciplina
CREATE TABLE Dim_Disciplina (
  idDisciplina INT PRIMARY KEY,
  Nome VARCHAR(100),
  Professor_idProfessor INT
);

-- Criação da tabela Dim_Curso
CREATE TABLE Dim_Curso (
  idCurso INT PRIMARY KEY,
  Nome VARCHAR(100),
  Departamento_idDepartamento INT
);

-- Criação da tabela Dim_Tempo
CREATE TABLE Dim_Tempo (
  Data DATE PRIMARY KEY,
  Ano INT,
  Mes INT,
  Dia INT
);


--TABELA FATO
-- Criação da tabela Fato_Professor
CREATE TABLE Fato_Professor (
  idProfessor INT,
  idDepartamento INT,
  idDisciplina INT,
  idCurso INT,
  Data DATE,
  FOREIGN KEY (idProfessor) REFERENCES Dim_Professor(idProfessor),
  FOREIGN KEY (idDepartamento) REFERENCES Dim_Departamento(idDepartamento),
  FOREIGN KEY (idDisciplina) REFERENCES Dim_Disciplina(idDisciplina),
  FOREIGN KEY (idCurso) REFERENCES Dim_Curso(idCurso),
  FOREIGN KEY (Data) REFERENCES Dim_Tempo(Data)
);

--INSERÇÃO DE DADOS DE EXEMPLO
-- Inserção de dados na tabela Dim_Professor
INSERT INTO Dim_Professor (idProfessor, Nome, Departamento_idDepartamento) VALUES
(1, 'Professor A', 1),
(2, 'Professor B', 2);

-- Inserção de dados na tabela Dim_Departamento
INSERT INTO Dim_Departamento (idDepartamento, Nome) VALUES
(1, 'Departamento A'),
(2, 'Departamento B');

-- Inserção de dados na tabela Dim_Disciplina
INSERT INTO Dim_Disciplina (idDisciplina, Nome, Professor_idProfessor) VALUES
(1, 'Disciplina A', 1),
(2, 'Disciplina B', 2);

-- Inserção de dados na tabela Dim_Curso
INSERT INTO Dim_Curso (idCurso, Nome, Departamento_idDepartamento) VALUES
(1, 'Curso A', 1),
(2, 'Curso B', 2);

-- Inserção de dados na tabela Dim_Tempo
INSERT INTO Dim_Tempo (Data, Ano, Mes, Dia) VALUES
('2023-01-01', 2023, 1, 1),
('2023-02-01', 2023, 2, 1);

-- Inserção de dados na tabela Fato_Professor
INSERT INTO Fato_Professor (idProfessor, idDepartamento, idDisciplina, idCurso, Data) VALUES
(1, 1, 1, 1, '2023-01-01'),
(2, 2, 2, 2, '2023-02-01');

--CONSULTAS SQL PARA OBTENÇÃO DE INSIGHTS

SELECT
  p.Nome AS Professor,
  d.Nome AS Disciplina,
  c.Nome AS Curso,
  t.Data
FROM
  Fato_Professor fp
JOIN
  Dim_Professor p ON fp.idProfessor = p.idProfessor
JOIN
  Dim_Disciplina d ON fp.idDisciplina = d.idDisciplina
JOIN
  Dim_Curso c ON fp.idCurso = c.idCurso
JOIN
  Dim_Tempo t ON fp.Data = t.Data;


--Conclusão
Este projeto demonstra a criação de um esquema em estrela para análise de dados de professores em um contexto universitário. O processo inclui a criação de tabelas relacionais e dimensionais, inserção de dados de exemplo e execução de consultas para obtenção de insights valiosos. A estrutura proposta permite uma análise eficiente e detalhada dos dados, facilitando a tomada de decisões informadas.

CREATE DATABASE Universidade;
USE Universidade;

-- Tabela Dimensão Professor
CREATE TABLE DimProfessor (
    idProfessor INT PRIMARY KEY,
    nomeProfessor VARCHAR(100),
    tituloProfessor VARCHAR(50),
    departamento_idDepartamento INT
);

-- Tabela Dimensão Departamento
CREATE TABLE DimDepartamento (
    idDepartamento INT PRIMARY KEY,
    nomeDepartamento VARCHAR(100),
    professor_coordenador_idProfessor INT
);

-- Tabela Dimensão Curso
CREATE TABLE DimCurso (
    idCurso INT PRIMARY KEY,
    nomeCurso VARCHAR(100),
    departamento_idDepartamento INT
);

-- Tabela Dimensão Disciplina
CREATE TABLE DimDisciplina (
    idDisciplina INT PRIMARY KEY,
    nomeDisciplina VARCHAR(100),
    curso_idCurso INT,
    professor_idProfessor INT
);

-- Tabela Dimensão Data
CREATE TABLE DimData (
    idData INT PRIMARY KEY,
    dataCompleta DATE,
    ano INT,
    mes INT,
    dia INT,
    trimestre INT,
    semestre INT
);

-- Tabela Fato Professor
CREATE TABLE FatoProfessor (
    idFato INT PRIMARY KEY,
    professor_idProfessor INT,
    departamento_idDepartamento INT,
    curso_idCurso INT,
    disciplina_idDisciplina INT,
    data_idData INT,
    cargaHoraria INT,
    numeroAlunos INT,
    FOREIGN KEY (professor_idProfessor) REFERENCES DimProfessor(idProfessor),
    FOREIGN KEY (departamento_idDepartamento) REFERENCES DimDepartamento(idDepartamento),
    FOREIGN KEY (curso_idCurso) REFERENCES DimCurso(idCurso),
    FOREIGN KEY (disciplina_idDisciplina) REFERENCES DimDisciplina(idDisciplina),
    FOREIGN KEY (data_idData) REFERENCES DimData(idData)
);

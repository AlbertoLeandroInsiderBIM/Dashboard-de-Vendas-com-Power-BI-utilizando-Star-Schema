USE Universidade;

-- Inserir dados na tabela DimProfessor
INSERT INTO DimProfessor (idProfessor, nomeProfessor, tituloProfessor, departamento_idDepartamento)
VALUES
    (1, 'Carlos Silva', 'Doutor', 1),
    (2, 'Ana Souza', 'Mestre', 2),
    (3, 'Marcos Lima', 'Doutor', 3);

-- Inserir dados na tabela DimDepartamento
INSERT INTO DimDepartamento (idDepartamento, nomeDepartamento, professor_coordenador_idProfessor)
VALUES
    (1, 'Ciência da Computação', 1),
    (2, 'Matemática', 2),
    (3, 'Física', 3);

-- Inserir dados na tabela DimCurso
INSERT INTO DimCurso (idCurso, nomeCurso, departamento_idDepartamento)
VALUES
    (1, 'Bacharelado em Ciência da Computação', 1),
    (2, 'Licenciatura em Matemática', 2),
    (3, 'Bacharelado em Física', 3);

-- Inserir dados na tabela DimDisciplina
INSERT INTO DimDisciplina (idDisciplina, nomeDisciplina, curso_idCurso, professor_idProfessor)
VALUES
    (1, 'Estruturas de Dados', 1, 1),
    (2, 'Cálculo Diferencial', 2, 2),
    (3, 'Física Quântica', 3, 3);

-- Inserir dados na tabela DimData
INSERT INTO DimData (idData, dataCompleta, ano, mes, dia, trimestre, semestre)
VALUES
    (1, '2023-01-15', 2023, 1, 15, 1, 1),
    (2, '2023-03-10', 2023, 3, 10, 1, 1),
    (3, '2023-05-20', 2023, 5, 20, 2, 1);

-- Inserir dados na tabela FatoProfessor
INSERT INTO FatoProfessor (idFato, professor_idProfessor, departamento_idDepartamento, curso_idCurso, disciplina_idDisciplina, data_idData, cargaHoraria, numeroAlunos)
VALUES
    (1, 1, 1, 1, 1, 1, 60, 30),
    (2, 2, 2, 2, 2, 2, 45, 25),
    (3, 3, 3, 3, 3, 3, 50, 20);

SELECT 
    p.nomeProfessor AS Professor,
    SUM(f.cargaHoraria) AS TotalCargaHoraria
FROM 
    FatoProfessor f
JOIN 
    DimProfessor p ON f.professor_idProfessor = p.idProfessor
GROUP BY 
    p.nomeProfessor
ORDER BY 
    TotalCargaHoraria DESC;

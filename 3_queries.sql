-- 1. Listar todos os animais e seus respectivos tutores (JOIN simples)
SELECT A.nome AS Nome_Animal, A.especie, T.nome AS Nome_Tutor, T.telefone 
FROM ANIMAL A
INNER JOIN TUTOR T ON A.id_tutor = T.id_tutor;

-- 2. Listar todas as consultas com data, nome do animal e nome do veterinário (JOIN triplo)
SELECT C.data_hora, A.nome AS Animal, V.nome AS Veterinario, C.motivo_visita
FROM CONSULTA C
JOIN ANIMAL A ON C.id_animal = A.id_animal
JOIN VETERINARIO V ON C.id_veterinario = V.id_veterinario
ORDER BY C.data_hora DESC;

-- 3. Mostrar quais procedimentos foram realizados na Consulta nº 1 (WHERE)
SELECT P.nome_procedimento, I.observacao_item
FROM ITEM_CONSULTA I
JOIN PROCEDIMENTO P ON I.id_procedimento = P.id_procedimento
WHERE I.id_consulta = 1;

-- 4. Contar quantos animais cada tutor possui (GROUP BY)
SELECT T.nome, COUNT(A.id_animal) AS Qtd_Animais
FROM TUTOR T
LEFT JOIN ANIMAL A ON T.id_tutor = A.id_tutor
GROUP BY T.nome;

-- 5. Listar exames realizados em um determinado período (BETWEEN)
SELECT E.tipo_exame, E.data_realizacao, A.nome AS Animal, C.data_hora AS Data_Consulta
FROM EXAME E
JOIN CONSULTA C ON E.id_consulta = C.id_consulta
JOIN ANIMAL A ON C.id_animal = A.id_animal
WHERE E.data_realizacao BETWEEN '2025-11-20' AND '2025-11-22'
ORDER BY E.data_realizacao;

-- 6. Listar veterinários que realizaram mais de uma consulta (HAVING)
SELECT V.nome, COUNT(C.id_consulta) AS Qtd_Consultas
FROM VETERINARIO V
JOIN CONSULTA C ON V.id_veterinario = C.id_veterinario
GROUP BY V.nome
HAVING COUNT(C.id_consulta) > 1;

-- 7. Listar todos os tutores que não possuem animais cadastrados (LEFT JOIN com IS NULL)
SELECT T.nome, T.cpf
FROM TUTOR T
LEFT JOIN ANIMAL A ON T.id_tutor = A.id_tutor
WHERE A.id_animal IS NULL;

-- 8. Listar procedimentos com valor acima de R$ 50,00 (WHERE com condição)
SELECT nome_procedimento, valor_procedimento
FROM PROCEDIMENTO
WHERE valor_procedimento > 50.00;

-- 9. Listar todas as consultas junto com os procedimentos realizados (JOIN múltiplo)
SELECT C.id_consulta, A.nome AS Animal, V.nome AS Veterinario, P.nome_procedimento
FROM CONSULTA C
JOIN ANIMAL A ON C.id_animal = A.id_animal
JOIN VETERINARIO V ON C.id_veterinario = V.id_veterinario
JOIN ITEM_CONSULTA I ON C.id_consulta = I.id_consulta
JOIN PROCEDIMENTO P ON I.id_procedimento = P.id_procedimento;

-- 10. Listar toda base de dados de animais, tutores e consultas (JOINs completos)
SELECT A.nome AS Animal, A.especie, T.nome AS Tutor, T.telefone, C.data_hora AS Data_Consulta, V.nome AS Veterinario
FROM ANIMAL A
JOIN TUTOR T ON A.id_tutor = T.id_tutor
JOIN CONSULTA C ON A.id_animal = C.id_animal
JOIN VETERINARIO V ON C.id_veterinario = V.id_veterinario;  

-- --- UPDATE (3 exemplos) ---

-- 1. Atualizar o telefone de um tutor específico
UPDATE TUTOR 
SET telefone = '(11) 97777-9999' 
WHERE id_tutor = 1;

-- 2. Corrigir o nome de um animal
UPDATE ANIMAL 
SET nome = 'Rex Junior' 
WHERE id_animal = 1;

-- 3. Reajustar o valor de um procedimento (Aumento de 10%)
UPDATE PROCEDIMENTO 
SET valor_procedimento = valor_procedimento * 1.10 
WHERE nome_procedimento = 'Vacina V10';


-- --- DELETE (3 exemplos) ---

-- 1. Remover um exame que foi cadastrado errado
DELETE FROM EXAME 
WHERE id_exame = 2;

-- 2. Remover um item de consulta (ex: cancelou o corte de unha da consulta 1)
-- Nota: Em tabelas N:N, deletamos pela chave composta
DELETE FROM ITEM_CONSULTA 
WHERE id_consulta = 1 AND id_procedimento = 3; 

-- 3. Remover um animal (Cuidado: só funciona se não tiver consultas vinculadas, ou se configurar CASCADE)
-- Vamos remover um animal fictício que acabamos de criar para teste
INSERT INTO ANIMAL (nome, especie, id_tutor) VALUES ('Teste', 'Ave', 1); -- Criando para deletar
DELETE FROM ANIMAL 
WHERE nome = 'Teste';
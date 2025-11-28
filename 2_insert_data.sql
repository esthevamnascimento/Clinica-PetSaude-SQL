-- Povoando a tabela TUTOR
INSERT INTO TUTOR (nome, cpf, telefone, endereco) VALUES 
('Carlos Silva', '123.456.789-00', '(11) 99999-1234', 'Rua A, 123, Centro'),
('Maria Oliveira', '987.654.321-11', '(11) 98888-5678', 'Av. Brasil, 456, Bairro Novo');

-- Povoando a tabela VETERINARIO
INSERT INTO VETERINARIO (nome, cpf, especialidade, crmv) VALUES 
('Dra. Ana Costa', '111.222.333-44', 'Clínico Geral', 'SP-12345'),
('Dr. Pedro Santos', '555.666.777-88', 'Cirurgião', 'SP-67890');

-- Povoando a tabela PROCEDIMENTO
INSERT INTO PROCEDIMENTO (nome_procedimento, valor_procedimento) VALUES 
('Consulta de Rotina', 150.00),
('Vacina V10', 80.00),
('Corte de Unhas', 30.00),
('Curativo', 50.00);

-- Povoando a tabela ANIMAL
INSERT INTO ANIMAL (nome, especie, raca, data_nascimento, sexo, id_tutor) VALUES 
('Rex', 'Canino', 'Labrador', '2020-05-10', 'M', 1),
('Mimi', 'Felino', 'Siamês', '2021-08-20', 'F', 2),
('Totó', 'Canino', 'Vira-Lata', '2019-01-15', 'M', 1);

-- Povoando a tabela CONSULTA
INSERT INTO CONSULTA (data_hora, motivo_visita, diagnostico, id_animal, id_veterinario) VALUES 
('2025-11-20 10:00:00', 'Vacinação anual', 'Animal saudável', 1, 1),
('2025-11-21 14:30:00', 'Ferida na pata', 'Corte superficial', 2, 2),
('2025-11-22 09:00:00', 'Check-up', 'Leve sobrepeso', 3, 1);

-- Povoando a tabela ITEM_CONSULTA (Associativa)
INSERT INTO ITEM_CONSULTA (id_consulta, id_procedimento, observacao_item) VALUES 
(1, 1, 'Exame físico completo'), -- Consulta 1 teve Consulta de Rotina
(1, 2, 'Aplicada no dorso'),     -- Consulta 1 teve Vacina
(2, 4, 'Limpeza e curativo'),   -- Consulta 2 teve Curativo
(3, 1, 'Avaliação geral');      -- Consulta 3 teve Consulta de Rotina

-- Povoando a tabela EXAME
INSERT INTO EXAME (tipo_exame, data_realizacao, resultado, id_consulta) VALUES 
('Hemograma', '2025-11-22', 'Leucócitos normais', 3),
('Raio-X Pata', '2025-11-21', 'Sem fraturas', 2);

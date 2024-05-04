-- Inserindo dados na tabela "Estado"
INSERT INTO Estado (nome, sigla) VALUES
  ('São Paulo', 'SP'),
  ('Minas Gerais', 'MG'),
  ('Rio de Janeiro', 'RJ'),
  ('Bahia', 'BA');

-- Inserindo dados na tabela "Municipio"
INSERT INTO Municipio (nome, idEstado) VALUES
  ('São Paulo', (SELECT idEstado FROM Estado WHERE sigla = 'SP')),
  ('Campinas', (SELECT idEstado FROM Estado WHERE sigla = 'SP')),
  ('Belo Horizonte', (SELECT idEstado FROM Estado WHERE sigla = 'MG')),
  ('Salvador', (SELECT idEstado FROM Estado WHERE sigla = 'BA'));

-- Inserindo dados na tabela "Cliente"
INSERT INTO Cliente (nome, cpf, email, idMunicipio) VALUES
  ('Fulano da Silva', '123.456.789-00', 'fulano@email.com', (SELECT idMunicipio FROM Municipio WHERE nome = 'São Paulo')),
  ('Beltrana Pereira', '987.654.321-11', 'beltrana@email.com', (SELECT idMunicipio FROM Municipio WHERE nome = 'Campinas')),
  ('Ciclano Santos', '000.111.222-33', 'ciclano@email.com', (SELECT idMunicipio FROM Municipio WHERE nome = 'Belo Horizonte'));

-- Inserindo dados na tabela "ContaReceber"
INSERT INTO ContaReceber (idCliente, dataVencimento, valor, situacao) VALUES
  ((SELECT idCliente FROM Cliente WHERE nome = 'Fulano da Silva'), '2024-06-15', 1000.00, '1'),
  ((SELECT idCliente FROM Cliente WHERE nome = 'Beltrana Pereira'), '2024-05-20', 500.75, '2'),
  ((SELECT idCliente FROM Cliente WHERE  nome = 'Ciclano Santos'), '2024-07-10', 2345.98, '1'),
  ((SELECT idCliente FROM Cliente WHERE nome = 'Fulano da Silva'), '2024-08-01', 876.50, '3'),
  ((SELECT idCliente FROM Cliente WHERE nome = 'Beltrana Pereira'), '2024-09-30', 1234.00, '1'),
  ((SELECT idCliente FROM Cliente WHERE nome = 'Ciclano Santos'), '2024-10-25', 456.78, '1');

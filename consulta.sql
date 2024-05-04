CREATE VIEW ContasAPagar AS
SELECT 
  CR.idContaReceber,
  C.nome AS nomeCliente,
  C.cpf,
  CR.dataVencimento,
  CR.valor
FROM ContaReceber CR
INNER JOIN Cliente C ON CR.idCliente = C.idCliente
WHERE CR.situacao = '1';
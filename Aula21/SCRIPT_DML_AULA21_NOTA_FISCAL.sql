DESC T_SPV_CLIENTE;

-- 1. 
INSERT INTO T_SPV_CLIENTE 
(cd_cliente , nm_cliente, dt_nascimento, ds_sexo, nr_cpf, nr_cpf_dig, nr_rg, nr_rg_dig, ds_email) 
VALUES (1,'MARIA DAS DORES', TO_DATE('21/04/2987', 'dd/mm/yyyy'), 
      'f', 92876345, 01 , 21356789, 'x' ,'MARIAJOSE@MARIAJOSE.COM.BR');
      
COMMIT;      
SELECT * FROM T_SPV_CLIENTE;

-- 2. A inserção não foi realizada com sucesso.
-- An UPDATE or INSERT statement attempted to insert a duplicate key.
-- Não foi realizada pois já existia uma tupla com os mesmos valores.

--3. 
INSERT INTO T_SPV_CLIENTE
(cd_cliente , nm_cliente, dt_nascimento, ds_sexo, nr_cpf, nr_cpf_dig, nr_rg, nr_rg_dig, ds_email) 
VALUES (2, 'MARIA DE DEUS', TO_DATE('09/03/1991', 'dd/mm/yyyy'), 'A', 123456789, 01, 
123456789, 'X', 'MARIADEDEUS@DEDEUS.COM.BR');
-- não foi realizada a inserção
-- check constraint
-- Não foi inserido pois o sexo está errado, não seguindo a regra da check constraint.

--4.
INSERT INTO T_SPV_CLIENTE
(cd_cliente , nm_cliente, dt_nascimento, ds_sexo, nr_cpf, nr_cpf_dig, nr_rg, nr_rg_dig, ds_email) 
VALUES (3, 'JOÃO DA SILVA', TO_DATE('08/09/2991', 'dd/mm/yyyy'), 'M', 12387654, 31, 98765432, '1', NULL);

COMMIT;

SELECT * FROM T_SPV_CLIENTE;

--5.
INSERT INTO T_SPV_CLIENTE
(cd_cliente , nm_cliente, dt_nascimento, ds_sexo, nr_cpf, nr_cpf_dig, nr_rg, nr_rg_dig) 
VALUES (4, 'JOÃO DA SILVA', TO_DATE('08/09/1991', 'dd/mm/yyyy'), 'M', 12387654, 31,
98765432, '1'); COMMIT;

SELECT * FROM T_SPV_CLIENTE;

--6.
DESC T_SPV_UNIDADE_MEDIDA;
INSERT ALL
  INTO T_SPV_UNIDADE_MEDIDA
    (cd_unidade_medida, ds_sigla, ds_unidade_medida)
    VALUES (1, 'CXA', 'CAIXA')
    
    
  INTO T_SPV_UNIDADE_MEDIDA
    (cd_unidade_medida, ds_sigla, ds_unidade_medida)
    VALUES (2, 'PCT', 'PACOTE')
    
    
  INTO T_SPV_UNIDADE_MEDIDA
    (cd_unidade_medida, ds_sigla, ds_unidade_medida)
    VALUES (4, 'MAQ', 'MAQUINA')
    
    
  INTO T_SPV_UNIDADE_MEDIDA
    (cd_unidade_medida, ds_sigla, ds_unidade_medida)
    VALUES (5, 'EQP', 'EQUIPAMENTO')    
SELECT * FROM DUAL;

--7
CREATE TABLE T_SPV_UNIDADE_MEDIDA_COPY
 (
 cd_unidade_medida NUMBER (2) NOT NULL ,
 ds_sigla CHAR (3) NOT NULL ,
 ds_unidade_medida VARCHAR2 (30) NOT NULL
 ); 
ALTER TABLE T_SPV_UNIDADE_MEDIDA_COPY
 ADD CONSTRAINT PK_SPV_UNID_MEDIDA_COPY PRIMARY KEY ( cd_unidade_medida ) ; 

COMMIT;
DESC T_SPV_UNIDADE_MEDIDA_COPY;
INSERT INTO T_SPV_UNIDADE_MEDIDA_COPY
  (cd_unidade_medida, ds_sigla, ds_unidade_medida)
  (SELECT 
    cd_unidade_medida, ds_sigla, ds_unidade_medida
  FROM T_SPV_UNIDADE_MEDIDA);

COMMIT;
SELECT * FROM T_SPV_UNIDADE_MEDIDA_COPY;

--8.
CREATE TABLE T_AULA21_TESTE
 (
 cd_teste NUMBER (2) NOT NULL ,
 ds_teste VARCHAR2 (30) NOT NULL ,
 dt_realizacao DATE DEFAULT SYSDATE
 );
ALTER TABLE T_AULA21_TESTE
 ADD CONSTRAINT PK_AULA21_TESTE PRIMARY KEY ( cd_teste ) ; 
 
 --8.a)
 INSERT INTO T_AULA21_TESTE
 (cd_teste, ds_teste, dt_realizacao)
 VALUES (1, 'TESTE 1', NULL );
 COMMIT;
 SELECT * FROM T_AULA21_TESTE;
 -- FOI REALIZADA COM SUCESSO A INSERÇÃO
 -- NÃO FOI ARMAZENDO NENHUMA INFORMAÇÃO
 
 --8.b)
 INSERT INTO T_AULA21_TESTE
 (cd_teste, ds_teste, dt_realizacao)
 VALUES (2, 'TESTE 2', DEFAULT);
 
 COMMIT;
 SELECT * FROM T_AULA21_TESTE;
 --REALIZADA COM SUCESSO
 --A DATA DO DIA DE HOJE
 
 --8.c)
 INSERT INTO T_AULA21_TESTE
 (cd_teste, ds_teste, dt_realizacao)
 VALUES (3, 'TESTE 3', TO_DATE('10/08/2013', 'dd/mm/yyyy'));
 COMMIT;
 SELECT * FROM T_AULA21_TESTE;
 --SUCESSO
 --A DATA PROPOSTA.
 
 --8.d)
 INSERT INTO T_AULA21_TESTE
 (cd_teste, ds_teste)
 VALUES (4, 'TESTE 4');
 COMMIT;
 SELECT * FROM T_AULA21_TESTE;
 --SUCESSO
 --DATA DE HOJE
 
 --8.e)
 INSERT INTO T_AULA21_TESTE
 (cd_teste, ds_teste, dt_realizacao)
 VALUES (5, 'TESTE 5', sysdate);
 COMMIT;
 SELECT * FROM T_AULA21_TESTE;
 -- SUCESSO
 -- DATA DO DIA DE HOJE
 
 --9)
 DESC T_SPV_PRODUTO;
 
 INSERT ALL
  INTO T_SPV_PRODUTO
    (cd_produto, cd_unidade_medida, ds_produto, ds_completa_produto,
    qt_estoque, vl_preco_unitario)
  VALUES (1, 5, 'NOTEBOOK SENSACIONAL', 'NOTEBOOK XPTO SUPER ESPECIAL', 3, 1980.56)
  
  INTO T_SPV_PRODUTO
    (cd_produto, cd_unidade_medida, ds_produto, ds_completa_produto,
    qt_estoque, vl_preco_unitario)
  VALUES (2, 5, 'IMPRESSORA X3', ' IMPRESSORA MULTIFUNCIONAL HP', 5, 432.89)
  
  INTO T_SPV_PRODUTO
    (cd_produto, cd_unidade_medida, ds_produto, ds_completa_produto,
    qt_estoque, vl_preco_unitario)
  VALUES (3, 5, 'PEN DRIVE - 16GB', 'PEN DRIVE 16GB KINGSTON', 10, 60.00)
  SELECT * FROM DUAL;
  
  COMMIT;
  
  SELECT * FROM T_SPV_PRODUTO;
  
--10.
INSERT INTO T_SPV_PRODUTO
    (cd_produto, cd_unidade_medida, ds_produto, ds_completa_produto,
    qt_estoque, vl_preco_unitario)
VALUES 
    (4, 3, 'HD EXTERNO - 500GB', 'D EXTERNO SANSUMG - 500GB', 10, 305.00);
    
  COMMIT;
  SELECT * FROM T_SPV_PRODUTO;
--ERRO
--duplicate key
--Pois já existe uma unidade com este código, por causa da unique constraint.

--11.
DESC T_SPV_PRODUTO;
UPDATE T_SPV_PRODUTO
SET VL_PRECO_UNITARIO=VL_PRECO_UNITARIO*0.15
WHERE CD_UNIDADE_MEDIDA=1;

--12.
SELECT * FROM T_SPV_PRODUTO;
UPDATE T_SPV_PRODUTO
SET CD_UNIDADE_MEDIDA=5
WHERE CD_PRODUTO=2;
COMMIT;
SELECT * FROM T_SPV_PRODUTO;

--13. Adicionar 10 unidades para todos os produtos que não são 'equipamento (cd_unidade_medida 5) E  com estoque menor que 5'
UPDATE T_SPV_PRODUTO
SET QT_ESTOQUE=QT_ESTOQUE+10
WHERE QT_ESTOQUE < 5 AND NOT CD_UNIDADE_MEDIDA=5;
COMMIT;
SELECT * FROM T_SPV_PRODUTO;

--14.
SELECT * FROM T_SPV_NOTA_FISCAL;
UPDATE T_SPV_NOTA_FISCAL
SET VL_TOTAL_NF=VL_TOTAL_NF + (VL_TOTAL_NF * 0.15)
WHERE DT_EMISSAO >= TO_DATE('15/08/2014', 'dd/mm/yyyy');
COMMIT;

--15.


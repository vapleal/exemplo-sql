-- exemplo simples
-- criar procedure
DELIMITER //
CREATE PROCEDURE teste ()
BEGIN
	SELECT * FROM produtos;
END//
DELIMITER ;


-- chamar procedure, executar
call teste()


/* 1) basica */
DELIMITER //
CREATE PROCEDURE sp_ins_venda ( IN num_venda INT(5),
	IN data_venda DATE,
	IN vendedor INT(5),
	IN cliente INT(5),
	IN produto INT(5),
	IN quantidade INT(3),
	IN valor_unitario FLOAT(10,2) )
BEGIN
INSERT INTO vendas ( num_venda,
		data_venda,
		vendedor,
		cliente,
		produto,
		quantidade,
		valor_unitario )
	VALUES ( num_venda,
		data_venda,
		vendedor,
		cliente,
		produto,
		quantidade,
		valor_unitario );
END//
DELIMITER ;

CALL sp_ins_venda (10035, '2015-05-11', 112, 10021, 10014, 3, 159.99);

/* 2) valor automatico */
DELIMITER //
CREATE PROCEDURE sp_ins_venda ( IN num_venda INT(5),
	IN data_venda DATE,
	IN vendedor INT(5),
	IN cliente INT(5),
	IN produto INT(5),
	IN quantidade INT(3) )
BEGIN
INSERT INTO vendas ( num_venda,
		data_venda,
		vendedor,
		cliente,
		produto,
		quantidade,
		valor_unitario )
	VALUES ( num_venda,
		data_venda,
		vendedor,
		cliente,
		produto,
		quantidade,
		(SELECT valor FROM produtos WHERE cod_produto = produto) );
END//
DELIMITER ;

CALL sp_ins_venda (10035, '2015-05-11', 112, 10021, 10014, 3);

/* 3) valor automatico, numeração automatica */
DELIMITER //
CREATE PROCEDURE sp_ins_venda ( IN data_venda DATE,
	IN vendedor INT(5),
	IN cliente INT(5),
	IN produto INT(5),
	IN quantidade INT(3) )
BEGIN
INSERT INTO vendas ( num_venda,
		data_venda,
		vendedor,
		cliente,
		produto,
		quantidade,
		valor_unitario )
	VALUES ( (SELECT (num_venda+1) as cod FROM vendas ve ORDER BY cod DESC LIMIT 1),
		data_venda,
		vendedor,
		cliente,
		produto,
		quantidade,
		(SELECT valor FROM produtos WHERE cod_produto = produto) );
END//
DELIMITER ;

CALL sp_ins_venda ('2015-05-11', 112, 10021, 10014, 2);

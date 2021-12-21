SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `Tg_prod_del` AFTER DELETE ON `vendas` FOR EACH ROW begin
			update produtos set estoque = estoque + old.quantidade
			where cod_produto = old.produto;
			
			update clientes set credito_utilizado = credito_utilizado - (old.quantidade*old.valor_unitario)
			where cod_cliente = old.cliente;
	end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Copiando estrutura para trigger aula.Tg_prod_up
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `Tg_prod_up` AFTER UPDATE ON `vendas` FOR EACH ROW BEGIN
			SET @prod_novo = NEW.produto;
			SET @prod_antigo = OLD.produto;
			SET @qtd_novo = NEW.quantidade;
			SET @qtd_antigo = OLD.quantidade;
			IF @prod_novo = @prod_antigo THEN
				update produtos set estoque = estoque + @qtd_antigo - @qtd_novo
				where cod_produto = @prod_novo;
			ELSE
				update produtos set estoque = estoque + @qtd_antigo
				where cod_produto = @prod_antigo;
				update produtos set estoque = estoque - @qtd_novo
				where cod_produto = @prod_novo;
			END IF;
		END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Copiando estrutura para trigger aula.Tg_prod_venda
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `Tg_prod_venda` AFTER INSERT ON `vendas` FOR EACH ROW begin
			update produtos set estoque = estoque - new.quantidade
			where cod_produto = new.produto;
			
			update clientes set credito_utilizado = credito_utilizado + (new.quantidade*new.valor_unitario)
			where cod_cliente = new.cliente;
	end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.1.53-community-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para aula
CREATE DATABASE IF NOT EXISTS `aula` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aula`;


-- Copiando estrutura para tabela aula.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `cod_cliente` int(5) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `limite_credito` float(10,2) DEFAULT NULL,
  `credito_utilizado` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aula.clientes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`cod_cliente`, `nome`, `data_cadastro`, `limite_credito`, `credito_utilizado`) VALUES
	(10002, 'JOHN DA SILVA', '2013-11-25', 12000.00, 1211.98),
	(10004, 'KAKO THEFROG', '2010-09-13', 10000.00, 1819.97),
	(10021, 'HALLAN BIK', '2005-03-03', 15000.00, 9406.42);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


-- Copiando estrutura para tabela aula.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `cod_produto` int(5) NOT NULL,
  `descricao` varchar(20) DEFAULT NULL,
  `valor` float(10,2) DEFAULT NULL,
  `estoque` int(5) DEFAULT NULL,
  PRIMARY KEY (`cod_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aula.produtos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`cod_produto`, `descricao`, `valor`, `estoque`) VALUES
	(10014, 'POLTRONA CANTO', 159.99, 6),
	(10015, 'TELEVISOR 42', 1499.99, 14),
	(10020, 'JOGO DE JANTAR', 327.50, 20),
	(10023, 'XBOX 360', 605.99, 1);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;


-- Copiando estrutura para tabela aula.vendas
CREATE TABLE IF NOT EXISTS `vendas` (
  `num_venda` int(5) NOT NULL,
  `data_venda` date DEFAULT NULL,
  `vendedor` int(5) DEFAULT NULL,
  `cliente` int(5) DEFAULT NULL,
  `produto` int(5) DEFAULT NULL,
  `quantidade` int(3) DEFAULT NULL,
  `valor_unitario` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`num_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aula.vendas: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` (`num_venda`, `data_venda`, `vendedor`, `cliente`, `produto`, `quantidade`, `valor_unitario`) VALUES
	(10109, '2015-01-03', 104, 10002, 10023, 2, 605.99),
	(10111, '2015-01-26', 112, 10021, 10015, 4, 1499.99),
	(10115, '2015-01-29', 98, 10021, 10020, 3, 327.50),
	(10121, '2015-02-01', 98, 10004, 10014, 2, 159.99),
	(10124, '2015-02-03', 104, 10021, 10023, 4, 605.99),
	(10129, '2015-02-23', 98, 10004, 10015, 1, 1499.99);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;


-- Copiando estrutura para tabela aula.vendedores
CREATE TABLE IF NOT EXISTS `vendedores` (
  `cod_vendedor` int(5) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `data_contrato` date DEFAULT NULL,
  `quota_venda` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`cod_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aula.vendedores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` (`cod_vendedor`, `nome`, `data_contrato`, `quota_venda`) VALUES
	(98, 'JOSE  BAUM DEBICO', '2003-12-24', 50000.00),
	(104, 'JOAO DA VENDA', '2010-03-03', 20000.00),
	(112, 'DIRCEU DAOTOMBO', '2015-01-13', 100000.00);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

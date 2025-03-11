-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.20-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para projeto_sorveteria
CREATE DATABASE IF NOT EXISTS `projeto_sorveteria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `projeto_sorveteria`;

-- Copiando estrutura para tabela projeto_sorveteria.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.categoria: ~3 rows (aproximadamente)
DELETE FROM `categoria`;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`codCategoria`, `nome`, `descricao`) VALUES
	(8, ' Sorvete', ' sorvete'),
	(10, 'a', 'n'),
	(11, 'nnm', 'mnmn');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_sorveteria.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `codCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `dataNascimento` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.clientes: ~2 rows (aproximadamente)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`codCliente`, `nome`, `cpf`, `dataNascimento`, `email`, `endereco`, `telefone`) VALUES
	(1, 'Rodrigo', '12312312323', '2023-05-24', 'rodrigo@gmail.com', 'rua das flores , 111', '35 99888 1344'),
	(2, 'Roger Guedes', '11', '2023-06-11', '12', '12', '12');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_sorveteria.fornecedor
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `codFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `telefone` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `endereco` varchar(50) NOT NULL DEFAULT '0',
  `cnpj` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.fornecedor: ~1 rows (aproximadamente)
DELETE FROM `fornecedor`;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` (`codFornecedor`, `nome`, `telefone`, `email`, `endereco`, `cnpj`) VALUES
	(1, ' R', 'r', 'r', 'r', 'r');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_sorveteria.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `salario` double(8,2) NOT NULL,
  `nascimento` date NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  `clt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.funcionario: ~2 rows (aproximadamente)
DELETE FROM `funcionario`;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`codFuncionario`, `nome`, `cargo`, `endereco`, `cpf`, `salario`, `nascimento`, `usuario`, `senha`, `clt`) VALUES
	(2, 'Rodrigo', 'pedreiro', 'a', '1', 10000.00, '2023-05-15', '111', '111', '111'),
	(3, 'Caetano', ' 1', '1', '1', 1.00, '2023-05-15', '1', '2', '1');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_sorveteria.itemvenda
CREATE TABLE IF NOT EXISTS `itemvenda` (
  `codItemVenda` int(11) NOT NULL AUTO_INCREMENT,
  `codVenda` int(11) NOT NULL,
  `codProduto` int(11) NOT NULL,
  `quantVenda` double NOT NULL DEFAULT 0,
  `valor` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`codItemVenda`),
  KEY `FK__venda` (`codVenda`),
  KEY `FK__produto` (`codProduto`),
  CONSTRAINT `FK__produto` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__venda` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.itemvenda: ~1 rows (aproximadamente)
DELETE FROM `itemvenda`;
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
INSERT INTO `itemvenda` (`codItemVenda`, `codVenda`, `codProduto`, `quantVenda`, `valor`) VALUES
	(1, 5, 6, 10, 0),
	(2, 34, 7, 1.4, 10.1),
	(3, 35, 6, 1.4, 10.1),
	(4, 36, 6, 1.4, 10.1),
	(5, 37, 7, 1.4, 10.1),
	(6, 38, 7, 1.4, 10.1),
	(7, 39, 7, 1.4, 10.1);
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_sorveteria.log
CREATE TABLE IF NOT EXISTS `log` (
  `codLog` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(100) NOT NULL,
  `tabela` varchar(20) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `dataHora` datetime NOT NULL,
  `observacoes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codLog`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.log: ~4 rows (aproximadamente)
DELETE FROM `log`;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` (`codLog`, `acao`, `tabela`, `usuario`, `dataHora`, `observacoes`) VALUES
	(7, 'Inserção', 'marca', 'root@localhost', '2022-11-30 18:47:30', 'Marca inserida = kibom'),
	(8, 'Atualização', 'produto', 'root@localhost', '2022-11-30 18:56:36', 'codProduto = 7 Preço venda velho = 10.00 Preço venda novo = 10.00'),
	(9, 'Atualização', 'produto', 'root@localhost', '2022-11-30 18:57:08', 'codProduto = 7 Preço venda velho = 10.00 Preço venda novo = 9.00'),
	(10, 'Atualização', 'produto', 'root@localhost', '2022-12-01 20:14:29', 'codProduto = 6 Preço venda velho = 111.00 Preço venda novo = 111.00');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_sorveteria.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `codMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.marca: ~2 rows (aproximadamente)
DELETE FROM `marca`;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`codMarca`, `nome`) VALUES
	(8, 'kibom'),
	(9, ' Icebom');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Copiando estrutura para procedure projeto_sorveteria.proc_atualizaCategoria


-- Copiando estrutura para procedure projeto_sorveteria.proc_atualizaFuncionario
/*DELIMITER //
CREATE PROCEDURE `proc_atualizaFuncionario`(
	IN `novoCpf` VARCHAR(14),
	IN `novoNome` VARCHAR(100),
	IN `codigo` INT
)
BEGIN
UPDATE funcionario SET cpf = novoCpf, nome = novoNome WHERE codFuncionario = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_atualizaMarca
DELIMITER //
CREATE PROCEDURE `proc_atualizaMarca`(
	IN `novoNome` VARCHAR(30),
	IN `codigo` INT
)
BEGIN
UPDATE marca SET nome = novoNome WHERE codMarca = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_AtualizaProduto
DELIMITER //
CREATE PROCEDURE `proc_AtualizaProduto`(
	IN `preVenda` DECIMAL(8,2),
	IN `preCusto` DECIMAL(8,2),
	IN `quanEstoque` DECIMAL(8,2),
	IN `margem` DECIMAL(8,2),
	IN `codigo` INT
)
BEGIN
UPDATE produto SET precoVenda = preVenda, precoCusto = preCusto, quantidadeEstoque = quanEstoque, margemdeLucro = margem 
WHERE codProduto = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_atualizaVenda
DELIMITER //
CREATE PROCEDURE `proc_atualizaVenda`(
	IN `codigo` INT,
	IN `codigoFuncionario` INT
)
BEGIN
UPDATE venda SET codFuncionario = codigoFuncionario WHERE codVenda = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_deletacategoria
DELIMITER //
CREATE PROCEDURE `proc_deletacategoria`(
	IN `codigo` INT
)
BEGIN
DELETE FROM categoria WHERE codCategoria = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_deletafuncionario
DELIMITER //
CREATE PROCEDURE `proc_deletafuncionario`(
	IN `codigo` INT
)
BEGIN
DELETE FROM funcionario WHERE codFuncionario = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_deletamarca
DELIMITER //
CREATE PROCEDURE `proc_deletamarca`(
	IN `codigo` INT
)
BEGIN
DELETE FROM marca WHERE codMarca = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_deletaproduto
DELIMITER //
CREATE PROCEDURE `proc_deletaproduto`(
	IN `codigo` INT
)
BEGIN
DELETE FROM produto WHERE codProduto = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_deletavenda
DELIMITER //
CREATE PROCEDURE `proc_deletavenda`(
	IN `codigo` INT
)
BEGIN
DELETE FROM venda WHERE codVenda = codigo;
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_insereCategoria
DELIMITER //
CREATE PROCEDURE `proc_insereCategoria`(
	IN `descri` VARCHAR(50)
)
BEGIN
	INSERT INTO categoria VALUES(NULL, descri);
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_insereFuncionario
DELIMITER //
CREATE PROCEDURE `proc_insereFuncionario`(
	IN `cpfFuncionario` VARCHAR(14),
	IN `nomeFuncionario` VARCHAR(100)
)
BEGIN
	INSERT INTO funcionario VALUES(NULL, cpfFuncionario, nomeFuncionario);
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_insereMarca
DELIMITER //
CREATE PROCEDURE `proc_insereMarca`(
	IN `nomeMarca` VARCHAR(30)
)
BEGIN
INSERT INTO marca VALUES(NULL, nomeMarca);
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_insereproduto
DELIMITER //
CREATE PROCEDURE `proc_insereproduto`(
	IN `nomePro` VARCHAR(50),
	IN `saborPro` VARCHAR(20),
	IN `ingrePro` VARCHAR(100),
	IN `validadePro` DATE,
	IN `margePro` DECIMAL(8,2),
	IN `preVenda` DECIMAL(8,2),
	IN `preCusto` DECIMAL(8,2),
	IN `quantiEstoque` DECIMAL(8,2),
	IN `codCategoriaa` INT,
	IN `codMarcaa` INT
)
BEGIN
	INSERT INTO produto VALUES(NULL, nomePro, saborPro, ingrePro, validadePro, margePro, preVenda, preCusto, quantiEstoque, codCategoriaa, codMarcaa);
END//
DELIMITER ;

-- Copiando estrutura para procedure projeto_sorveteria.proc_insereVenda
DELIMITER //
CREATE PROCEDURE `proc_insereVenda`(
	IN `codFuncio` INT,
	IN `horaVend` DATETIME
)
BEGIN
INSERT INTO venda VALUES(NULL, codFuncio, horaVend);
END//
DELIMITER ;
*/information_schema
-- Copiando estrutura para tabela projeto_sorveteria.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `codCategoria` int(11) NOT NULL,
  `codMarca` int(11) NOT NULL,
  `codFornecedor` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `margemdeLucro` double NOT NULL DEFAULT 0,
  `precoVenda` double NOT NULL,
  `precoCusto` double NOT NULL,
  `quantidadeEstoque` double NOT NULL,
  PRIMARY KEY (`codProduto`) USING BTREE,
  KEY `codCategoria` (`codCategoria`),
  KEY `codMarca` (`codMarca`),
  KEY `codFornecedor` (`codFornecedor`),
  CONSTRAINT `codFornecedor` FOREIGN KEY (`codFornecedor`) REFERENCES `fornecedor` (`codFornecedor`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`codCategoria`) REFERENCES `categoria` (`codCategoria`),
  CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`codMarca`) REFERENCES `marca` (`codMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.produto: ~2 rows (aproximadamente)
DELETE FROM `produto`;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codProduto`, `codCategoria`, `codMarca`, `codFornecedor`, `nome`, `margemdeLucro`, `precoVenda`, `precoCusto`, `quantidadeEstoque`) VALUES
	(6, 8, 8, 1, 'dsf', 11, 111, 55, 55),
	(7, 8, 8, 1, 'dsfsd', 50, 9, 4, 50);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_sorveteria.turnos
CREATE TABLE IF NOT EXISTS `turnos` (
  `codTurnos` int(11) NOT NULL AUTO_INCREMENT,
  `codFuncionario` int(11) NOT NULL DEFAULT 0,
  `horaInicio` varchar(50) DEFAULT NULL,
  `horaFim` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codTurnos`),
  KEY `FK1_codFuncionario` (`codFuncionario`),
  CONSTRAINT `FK1_codFuncionario` FOREIGN KEY (`codFuncionario`) REFERENCES `funcionario` (`codFuncionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.turnos: ~2 rows (aproximadamente)
DELETE FROM `turnos`;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` (`codTurnos`, `codFuncionario`, `horaInicio`, `horaFim`) VALUES
	(1, 2, '2023-05-24 14:11:03', '2023-05-24 14:11:05'),
	(3, 3, ' 1010', ' 1');
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_sorveteria.venda
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int(11) NOT NULL AUTO_INCREMENT,
  `codFuncionario` int(11) NOT NULL,
  `codCliente` int(11) NOT NULL,
  `dataVenda` date DEFAULT NULL,
  PRIMARY KEY (`codVenda`),
  KEY `codFuncionario` (`codFuncionario`),
  KEY `FK_venda_clientes` (`codCliente`),
  CONSTRAINT `FK_venda_clientes` FOREIGN KEY (`codCliente`) REFERENCES `clientes` (`codCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`codFuncionario`) REFERENCES `funcionario` (`codFuncionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela projeto_sorveteria.venda: ~26 rows (aproximadamente)
DELETE FROM `venda`;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`codVenda`, `codFuncionario`, `codCliente`, `dataVenda`) VALUES
	(5, 2, 1, '2022-12-01'),
	(6, 2, 1, '2022-12-01'),
	(7, 2, 1, '2023-06-13'),
	(8, 2, 1, '2023-06-13'),
	(9, 2, 1, '2023-06-13'),
	(10, 2, 1, '2023-06-13'),
	(11, 2, 1, '2023-06-13'),
	(12, 2, 1, '2023-06-13'),
	(13, 2, 1, '2023-06-13'),
	(14, 2, 1, '2023-06-13'),
	(15, 2, 1, '2023-06-13'),
	(16, 2, 1, '2023-06-13'),
	(17, 2, 1, '2023-06-13'),
	(18, 2, 1, '2023-06-13'),
	(19, 2, 1, '2023-06-13'),
	(20, 2, 1, '2023-06-13'),
	(21, 2, 1, '2023-06-13'),
	(22, 2, 1, '2023-06-13'),
	(23, 2, 1, '2023-06-13'),
	(24, 2, 1, '2023-06-13'),
	(25, 2, 1, '2023-06-13'),
	(26, 2, 1, '2023-06-13'),
	(27, 2, 1, '2023-06-13'),
	(28, 2, 1, '2023-06-13'),
	(29, 2, 1, '2023-06-13'),
	(30, 2, 1, '2023-06-13'),
	(31, 2, 1, '2023-06-13'),
	(32, 2, 1, '2023-06-13'),
	(33, 2, 1, '2023-06-13'),
	(34, 2, 1, '2023-06-13'),
	(35, 2, 1, '2023-06-13'),
	(36, 2, 1, '2023-06-13'),
	(37, 2, 1, '2023-06-13'),
	(38, 2, 1, '2023-06-13'),
	(39, 2, 1, '2023-06-13');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

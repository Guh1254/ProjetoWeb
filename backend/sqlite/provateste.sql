-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 22/11/2023 às 15:26
-- Versão do servidor: 8.0.34
-- Versão do PHP: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `provateste`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `idendereco` int NOT NULL,
  `cep` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `rua` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `bairro` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `cidade` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `uf` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `ibge` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `iduser` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Acionadores `endereco`
--
DELIMITER $$
CREATE TRIGGER `DeleteEnd` AFTER DELETE ON `endereco` FOR EACH ROW insert into log_endereco(Acao,idendereco,cep,rua,bairro,cidade,uf,iduser) values("Deletado",OLD.idendereco,OLD.cep,OLD.rua,OLD.bairro,OLD.cidade,OLD.uf,OLD.ibge,OLD.iduser)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateEnd` AFTER UPDATE ON `endereco` FOR EACH ROW insert into log_endereco(Acao,idendereco,cep,rua,bairro,cidade,uf,iduser) values("Alterado",OLD.idendereco,OLD.cep,OLD.rua,OLD.bairro,OLD.cidade,OLD.uf,OLD.ibge,OLD.iduser)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_endereco`
--

CREATE TABLE `log_endereco` (
  `logid` int NOT NULL,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idendereco` int DEFAULT NULL,
  `cep` text COLLATE utf8mb4_general_ci,
  `rua` text COLLATE utf8mb4_general_ci,
  `bairro` text COLLATE utf8mb4_general_ci,
  `cidade` text COLLATE utf8mb4_general_ci,
  `uf` text COLLATE utf8mb4_general_ci,
  `ibge` text COLLATE utf8mb4_general_ci NOT NULL,
  `iduser` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_produtos`
--

CREATE TABLE `log_produtos` (
  `logid` int NOT NULL,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int NOT NULL,
  `nome` text COLLATE utf8mb4_general_ci,
  `preco` decimal(4,2) DEFAULT NULL,
  `quantidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_users`
--

CREATE TABLE `log_users` (
  `logid` int NOT NULL,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int NOT NULL,
  `nome` text COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `senha` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `datanascimento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_vendas`
--

CREATE TABLE `log_vendas` (
  `logid` int NOT NULL,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `data_cadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int NOT NULL,
  `nome` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome`) VALUES
(1, 'X'),
(2, 'Y');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil_permissoes`
--

CREATE TABLE `perfil_permissoes` (
  `perfilid` int NOT NULL,
  `permissao_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `id` int NOT NULL,
  `nome` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Despejando dados para a tabela `permissoes`
--

INSERT INTO `permissoes` (`id`, `nome`) VALUES
(1, 'buscaprod'),
(2, 'buscauser'),
(3, 'criarprod'),
(4, 'criaruser'),
(5, 'grafico'),
(6, 'index'),
(7, 'vincular'),
(8, 'todosprod'),
(9, 'todosuser');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int NOT NULL,
  `nome` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `preco` decimal(4,2) NOT NULL,
  `quantidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Acionadores `produtos`
--
DELIMITER $$
CREATE TRIGGER `DeleteProd` AFTER DELETE ON `produtos` FOR EACH ROW insert into log_produtos(Acao,id,nome,preco,quantidade) 
values("Deletado",OLD.id,OLD.nome,OLD.preco,OLD.quantidade)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateProd` AFTER UPDATE ON `produtos` FOR EACH ROW insert into log_produtos(Acao,id,nome,preco,quantidade) 
values("Alterado",OLD.id,OLD.nome,OLD.preco,OLD.quantidade)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `produtos_por_usuario`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `produtos_por_usuario` (
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `nome` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `datanascimento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Acionadores `users`
--
DELIMITER $$
CREATE TRIGGER `DeleteUsers` AFTER DELETE ON `users` FOR EACH ROW insert into log_users(Acao,id,nome,email,senha,datanascimento) 
values("Deletado",OLD.id,OLD.nome,OLD.email,OLD.senha,OLD.datanascimento)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateUsers` AFTER UPDATE ON `users` FOR EACH ROW insert into log_users(Acao,id,nome,email,senha,perfilid,datanascimento) 
values("Alterado",OLD.id,OLD.nome,OLD.email,OLD.senha,OLD.datanascimento)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usersx`
--

CREATE TABLE `usersx` (
  `id` int NOT NULL,
  `name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_produto` int NOT NULL,
  `data_cadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para view `produtos_por_usuario`
--
DROP TABLE IF EXISTS `produtos_por_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id21521145_guh1254`@`%` SQL SECURITY DEFINER VIEW `produtos_por_usuario`  AS SELECT `u`.`id` AS `id`, `u`.`nome` AS `nome`, count(`v`.`id_produto`) AS `quantidade_produtos` FROM (`users` `u` left join `vendas` `v` on((`u`.`id` = `v`.`id_usuario`))) GROUP BY `u`.`id` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idendereco`);

--
-- Índices de tabela `log_endereco`
--
ALTER TABLE `log_endereco`
  ADD PRIMARY KEY (`logid`);

--
-- Índices de tabela `log_produtos`
--
ALTER TABLE `log_produtos`
  ADD PRIMARY KEY (`logid`);

--
-- Índices de tabela `log_users`
--
ALTER TABLE `log_users`
  ADD PRIMARY KEY (`logid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `log_vendas`
--
ALTER TABLE `log_vendas`
  ADD PRIMARY KEY (`logid`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usersx`
--
ALTER TABLE `usersx`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idendereco` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_endereco`
--
ALTER TABLE `log_endereco`
  MODIFY `logid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_produtos`
--
ALTER TABLE `log_produtos`
  MODIFY `logid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_users`
--
ALTER TABLE `log_users`
  MODIFY `logid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_vendas`
--
ALTER TABLE `log_vendas`
  MODIFY `logid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usersx`
--
ALTER TABLE `usersx`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

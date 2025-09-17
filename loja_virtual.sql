-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/09/2025 às 15:10
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_virtual`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Senha` varchar(255) DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  `Endereco` text DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Estado` varchar(2) DEFAULT NULL,
  `CEP` varchar(9) DEFAULT NULL,
  `DataCadastro` datetime NOT NULL,
  `data_cadastro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nome`, `Email`, `Senha`, `CPF`, `Endereco`, `Cidade`, `Estado`, `CEP`, `DataCadastro`, `data_cadastro`) VALUES
(1, 'Gabriela Almeida', 'gabriela.almeida@email.com', 'senha123', '123.456.789-00', 'Rua A, 123', 'São Paulo', 'SP', '01000-000', '0000-00-00 00:00:00', '2023-01-15'),
(2, 'Ricardo Ferreira', 'ricardo.ferreira@email.com', 'senha456', '234.567.890-01', 'Avenida B, 456', 'Rio de Janeiro', 'RJ', '20000-000', '0000-00-00 00:00:00', '2023-02-22'),
(3, 'Cláudia Martins', 'claudia.martins@email.com', 'senha789', '345.678.901-02', 'Rua C, 789', 'Belo Horizonte', 'MG', '30000-000', '0000-00-00 00:00:00', '2023-03-30'),
(4, 'Eduardo Costa', 'eduardo.costa@email.com', 'senha1234', '456.789.012-03', 'Praça D, 101', 'Curitiba', 'PR', '80000-000', '0000-00-00 00:00:00', '2023-04-10'),
(5, 'Carla Pimentel', 'carla.pimentel@email.com', 'senha5678', '567.890.123-04', 'Rua E, 202', 'Porto Alegre', 'RS', '90000-000', '0000-00-00 00:00:00', '2023-05-25'),
(6, 'Felipe Martins', 'felipe.martins@email.com', 'senha1111', '678.901.234-05', 'Avenida F, 303', 'Salvador', 'BA', '40000-000', '0000-00-00 00:00:00', '2023-06-15'),
(7, 'Beatriz Souza', 'beatriz.souza@email.com', 'senha2222', '789.012.345-06', 'Rua G, 404', 'Fortaleza', 'CE', '60000-000', '0000-00-00 00:00:00', '2023-07-30'),
(8, 'Leonardo Oliveira', 'leonardo.oliveira@email.com', 'senha3333', '890.123.456-07', 'Avenida H, 505', 'Recife', 'PE', '70000-000', '0000-00-00 00:00:00', '2023-08-20'),
(9, 'Isabela Rocha', 'isabela.rocha@email.com', 'senha4444', '901.234.567-08', 'Praça I, 606', 'Manaus', 'AM', '69000-000', '0000-00-00 00:00:00', '2023-09-05'),
(10, 'Vinícius Almeida', 'vinicius.almeida@email.com', 'senha5555', '012.345.678-09', 'Rua J, 707', 'Goiânia', 'GO', '74000-000', '0000-00-00 00:00:00', '2023-09-10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenspedido`
--

CREATE TABLE `itenspedido` (
  `ID_ItemPedido` int(11) NOT NULL,
  `ID_Pedido` int(11) NOT NULL,
  `ID_Produto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `PrecoUnitario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itenspedido`
--

INSERT INTO `itenspedido` (`ID_ItemPedido`, `ID_Pedido`, `ID_Produto`, `Quantidade`, `PrecoUnitario`) VALUES
(1, 1, 1, 2, 49.9),
(2, 2, 3, 1, 120),
(3, 3, 6, 1, 350),
(4, 4, 5, 1, 35),
(5, 5, 2, 2, 49.9),
(6, 6, 8, 1, 90),
(7, 7, 4, 1, 150),
(8, 8, 6, 1, 350),
(9, 9, 7, 3, 20),
(10, 10, 9, 1, 180);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `DataPedido` datetime NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `ValorTotal` double NOT NULL,
  `EnderecoEntrega` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`ID_Pedido`, `ID_Cliente`, `DataPedido`, `Status`, `ValorTotal`, `EnderecoEntrega`) VALUES
(1, 1, '2023-09-01 10:00:00', 'Entregue', 149.8, 'Rua A, 123, São Paulo, SP'),
(2, 2, '2023-09-02 11:15:00', 'Enviado', 120, 'Avenida B, 456, Rio de Janeiro, RJ'),
(3, 3, '2023-09-03 12:30:00', 'Pendente', 350, 'Rua C, 789, Belo Horizonte, MG'),
(4, 4, '2023-09-04 14:45:00', 'Cancelado', 35, 'Praça D, 101, Curitiba, PR'),
(5, 5, '2023-09-05 16:00:00', 'Entregue', 200, 'Rua E, 202, Porto Alegre, RS'),
(6, 6, '2023-09-06 17:20:00', 'Entregue', 90, 'Avenida F, 303, Salvador, BA'),
(7, 7, '2023-09-07 18:40:00', 'Pendente', 120, 'Rua G, 404, Fortaleza, CE'),
(8, 8, '2023-09-08 19:55:00', 'Enviado', 350, 'Avenida H, 505, Recife, PE'),
(9, 9, '2023-09-09 20:15:00', 'Entregue', 60, 'Praça I, 606, Manaus, AM'),
(10, 10, '2023-09-10 21:30:00', 'Pendente', 180, 'Rua J, 707, Goiânia, GO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID_Produto` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Descricao` text DEFAULT NULL,
  `Preco` double NOT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `Estoque` int(11) NOT NULL,
  `DataCriacao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`ID_Produto`, `Nome`, `Descricao`, `Preco`, `SKU`, `Estoque`, `DataCriacao`) VALUES
(1, 'Camiseta Azul P', 'Camiseta azul tamanho P', 49.9, 'CAM-AZ-P-01', 50, '2023-01-10 09:00:00'),
(2, 'Camiseta Vermelha M', 'Camiseta vermelha tamanho M', 49.9, 'CAM-VE-M-02', 60, '2023-01-12 10:30:00'),
(3, 'Calça Jeans 42', 'Calça jeans masculina tamanho 42', 120, 'CAL-JE-42-03', 30, '2023-01-15 11:00:00'),
(4, 'Tênis Esportivo', 'Tênis para corrida tamanho 40', 150, 'TEN-ES-40-04', 25, '2023-01-20 08:45:00'),
(5, 'Boné Preto', 'Boné preto com logo', 35, 'BON-PR-05', 100, '2023-01-25 12:00:00'),
(6, 'Jaqueta Couro', 'Jaqueta de couro legítimo', 350, 'JAQ-CO-06', 15, '2023-02-01 14:00:00'),
(7, 'Meia Esportiva', 'Par de meias para esportes', 20, 'MEA-ES-07', 200, '2023-02-05 10:10:00'),
(8, 'Mochila Escolar', 'Mochila com vários compartimentos', 90, 'MOC-ES-08', 40, '2023-02-10 09:30:00'),
(9, 'Relógio Digital', 'Relógio digital à prova d´água', 180, 'REL-DI-09', 35, '2023-02-15 11:50:00'),
(10, 'Óculos de Sol', 'Óculos de sol UV400', 120, 'OCU-SO-10', 80, '2023-02-20 13:25:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Índices de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD PRIMARY KEY (`ID_ItemPedido`),
  ADD KEY `ID_Pedido` (`ID_Pedido`),
  ADD KEY `ID_Produto` (`ID_Produto`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID_Produto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  MODIFY `ID_ItemPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `ID_Produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD CONSTRAINT `itenspedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `itenspedido_ibfk_2` FOREIGN KEY (`ID_Produto`) REFERENCES `produtos` (`ID_Produto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

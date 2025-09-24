-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/09/2025 às 16:50
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
-- Banco de dados: `marketpro`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanha`
--

CREATE TABLE `campanha` (
  `id_campanha` int(11) NOT NULL,
  `nome_campanha` varchar(100) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `orcamento` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanha`
--

INSERT INTO `campanha` (`id_campanha`, `nome_campanha`, `data_inicio`, `data_fim`, `orcamento`) VALUES
(1, 'Campanha Inverno', '2025-05-04', '2025-05-24', 50000.00),
(2, 'Campanha Verão', '2025-06-06', '2025-05-24', 8000.00),
(3, 'Campanha Primavera', '2025-07-01', '2025-05-24', 2000.00),
(4, 'Campanha Outono', '2025-08-02', '2025-05-24', 6000.00),
(5, 'Campanha Inferno', '2025-09-07', '2025-05-24', 4000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanha_midia`
--

CREATE TABLE `campanha_midia` (
  `id_campanha` int(11) DEFAULT NULL,
  `id_midia` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanha_midia`
--

INSERT INTO `campanha_midia` (`id_campanha`, `id_midia`, `id_cliente`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `segmento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cliente`, `email`, `segmento`) VALUES
(1, 'Sergio', 'serginhogameplay@gmail.com', 'fotografo'),
(2, 'Samara', 'samarinhaalves@gmail.com', 'papelaria'),
(3, 'Sivana', 'silvanajungkook@gmail.com', 'agropet'),
(4, 'Suelen', 'suelenprivacy@gmail.com', 'restaurante'),
(5, 'Seu Jorge', 'seujorge23232@gmail.com', 'musica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `midia`
--

CREATE TABLE `midia` (
  `id_midia` int(11) NOT NULL,
  `tipo_midia` varchar(50) DEFAULT NULL,
  `custo_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `midia`
--

INSERT INTO `midia` (`id_midia`, `tipo_midia`, `custo_unitario`) VALUES
(1, 'TV', 1000.00),
(2, 'Twich', 150.00),
(3, 'Outdoor', 11.00),
(4, 'Privacy', 99999999.99),
(5, 'Youtube AD', 500.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `campanha`
--
ALTER TABLE `campanha`
  ADD PRIMARY KEY (`id_campanha`);

--
-- Índices de tabela `campanha_midia`
--
ALTER TABLE `campanha_midia`
  ADD KEY `id_campanha` (`id_campanha`),
  ADD KEY `id_midia` (`id_midia`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `midia`
--
ALTER TABLE `midia`
  ADD PRIMARY KEY (`id_midia`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `campanha_midia`
--
ALTER TABLE `campanha_midia`
  ADD CONSTRAINT `campanha_midia_ibfk_1` FOREIGN KEY (`id_campanha`) REFERENCES `campanha` (`id_campanha`),
  ADD CONSTRAINT `campanha_midia_ibfk_2` FOREIGN KEY (`id_midia`) REFERENCES `midia` (`id_midia`),
  ADD CONSTRAINT `campanha_midia_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

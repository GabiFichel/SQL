-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/09/2025 às 14:06
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
-- Banco de dados: `locadora`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_carro` int(11) NOT NULL,
  `data_reserva` date NOT NULL,
  `data_devolucao` date NOT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `id` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `placa` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `cor` varchar(30) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'disponível'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `idade`, `email`, `telefone`, `endereco`) VALUES
(1, 'Ana Souza', 28, 'ana.souza@email.com', '11999990001', 'Rua das Flores, 123'),
(2, 'Carlos Lima', 35, 'carlos.lima@email.com', '11999990002', 'Av. Brasil, 456'),
(3, 'Fernanda Rocha', 42, 'fernanda.rocha@email.com', '11999990003', 'Rua Verde, 789'),
(4, 'João Pedro', 30, 'joao.pedro@email.com', '11999990004', 'Rua Azul, 321'),
(5, 'Mariana Silva', 25, 'mariana.silva@email.com', '11999990005', 'Av. Central, 654'),
(6, 'Ricardo Alves', 38, 'ricardo.alves@email.com', '11999990006', 'Rua do Sol, 987'),
(7, 'Beatriz Costa', 27, 'beatriz.costa@email.com', '11999990007', 'Rua da Paz, 111'),
(8, 'Lucas Martins', 33, 'lucas.martins@email.com', '11999990008', 'Av. das Árvores, 222'),
(9, 'Juliana Mendes', 29, 'juliana.mendes@email.com', '11999990009', 'Rua do Campo, 333'),
(10, 'Eduardo Tavares', 40, 'eduardo.tavares@email.com', '11999990010', 'Rua do Lago, 444');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente` (`id_cliente`),
  ADD KEY `fk_carro` (`id_carro`);

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluguel`
--
ALTER TABLE `aluguel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `fk_carro` FOREIGN KEY (`id_carro`) REFERENCES `carro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

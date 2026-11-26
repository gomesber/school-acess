-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2026 at 11:40 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_access`
--

-- --------------------------------------------------------

--
-- Table structure for table `acesso`
--

CREATE TABLE `acesso` (
  `id_acesso` int NOT NULL,
  `id_pessoa` int NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_acesso` enum('ENTRADA','SAIDA') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `acesso`
--

INSERT INTO `acesso` (`id_acesso`, `id_pessoa`, `data_hora`, `tipo_acesso`) VALUES
(1, 1, '2026-11-26 05:11:19', 'ENTRADA'),
(2, 2, '2026-11-26 06:11:19', 'ENTRADA'),
(3, 4, '2026-11-26 06:11:19', 'ENTRADA'),
(4, 1, '2026-11-26 07:11:19', 'SAIDA'),
(5, 3, '2026-11-26 07:21:19', 'ENTRADA'),
(6, 5, '2026-11-26 07:31:19', 'ENTRADA'),
(7, 6, '2026-11-26 07:41:19', 'ENTRADA');

-- --------------------------------------------------------

--
-- Table structure for table `aluno`
--

CREATE TABLE `aluno` (
  `id_pessoa` int NOT NULL,
  `matricula` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_turma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aluno`
--

INSERT INTO `aluno` (`id_pessoa`, `matricula`, `id_turma`) VALUES
(1, '2026001', 1),
(2, '2026002', 1),
(3, '2026003', 2);

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `id_curso` int NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci
) ;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`id_curso`, `nome`, `descricao`) VALUES
(1, 'Desenvolvimento de Sistemas', 'Curso técnico de programação'),
(2, 'Automação Industrial', 'Curso técnico de automação'),
(3, 'Informática', 'Curso técnico de informática');

-- --------------------------------------------------------

--
-- Table structure for table `funcionario`
--

CREATE TABLE `funcionario` (
  `id_pessoa` int NOT NULL,
  `nif` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `funcionario`
--

INSERT INTO `funcionario` (`id_pessoa`, `nif`, `cargo`) VALUES
(4, 'FUNC001', 'Professor'),
(5, 'FUNC002', 'Coordenadora');

-- --------------------------------------------------------

--
-- Table structure for table `pessoa`
--

CREATE TABLE `pessoa` (
  `id_pessoa` int NOT NULL,
  `nome` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `tipo` enum('ALUNO','FUNCIONARIO','VISITANTE') COLLATE utf8mb4_unicode_ci NOT NULL
) ;

--
-- Dumping data for table `pessoa`
--

INSERT INTO `pessoa` (`id_pessoa`, `nome`, `email`, `telefone`, `cpf`, `data_nascimento`, `tipo`) VALUES
(1, 'Joao Silva', 'joao@email.com', '11999990001', '12345678901', '2007-05-10', 'ALUNO'),
(2, 'Maria Souza', 'maria@email.com', '11999990002', '12345678902', '2006-08-15', 'ALUNO'),
(3, 'Pedro Santos', 'pedro@email.com', '11999990003', '12345678903', '2005-03-20', 'ALUNO'),
(4, 'Carlos Oliveira', 'carlos@escola.com', '11999990004', '12345678904', '1985-02-10', 'FUNCIONARIO'),
(5, 'Ana Costa', 'ana@escola.com', '11999990005', '12345678905', '1990-07-22', 'FUNCIONARIO'),
(6, 'Roberto Lima', 'roberto@email.com', '11999990006', '12345678906', '1980-11-12', 'VISITANTE');

-- --------------------------------------------------------

--
-- Table structure for table `turma`
--

CREATE TABLE `turma` (
  `id_turma` int NOT NULL,
  `id_curso` int NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horario_inicio` time NOT NULL,
  `horario_fim` time NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL
) ;

--
-- Dumping data for table `turma`
--

INSERT INTO `turma` (`id_turma`, `id_curso`, `nome`, `horario_inicio`, `horario_fim`, `data_inicio`, `data_fim`) VALUES
(1, 1, 'DS-2026-A', '07:30:00', '12:00:00', '2026-02-01', '2026-12-15'),
(2, 2, 'AUT-2026-A', '13:00:00', '17:30:00', '2026-02-01', '2026-12-15'),
(3, 3, 'INFO-2026-A', '19:00:00', '22:00:00', '2026-02-01', '2026-12-15');

-- --------------------------------------------------------

--
-- Table structure for table `visitante`
--

CREATE TABLE `visitante` (
  `id_pessoa` int NOT NULL,
  `empresa` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motivo_visita` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitante`
--

INSERT INTO `visitante` (`id_pessoa`, `empresa`, `motivo_visita`) VALUES
(6, 'Empresa ABC', 'Reuniao com a direcao');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acesso`
--
ALTER TABLE `acesso`
  ADD PRIMARY KEY (`id_acesso`),
  ADD KEY `idx_acesso_data` (`data_hora`),
  ADD KEY `idx_acesso_pessoa_data` (`id_pessoa`,`data_hora`);

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id_pessoa`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `fk_aluno_turma` (`id_turma`),
  ADD KEY `idx_aluno_matricula` (`matricula`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_pessoa`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD KEY `idx_funcionario_nif` (`nif`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id_pessoa`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_pessoa_cpf` (`cpf`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `fk_turma_curso` (`id_curso`);

--
-- Indexes for table `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`id_pessoa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acesso`
--
ALTER TABLE `acesso`
  MODIFY `id_acesso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id_pessoa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `id_turma` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acesso`
--
ALTER TABLE `acesso`
  ADD CONSTRAINT `fk_acesso_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_aluno_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_aluno_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `visitante`
--
ALTER TABLE `visitante`
  ADD CONSTRAINT `fk_visitante_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

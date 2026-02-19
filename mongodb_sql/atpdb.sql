-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Dez-2024 às 01:29
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `atp`
--
DROP DATABASE IF EXISTS `atp`;
CREATE DATABASE IF NOT EXISTS `atp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `atp`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `backhand`
--

CREATE TABLE `backhand` (
  `id_backhand` varchar(1) NOT NULL,
  `Backhand` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `backhand`
--

INSERT INTO `backhand` (`id_backhand`, `Backhand`) VALUES
('O', 'One-Handed'),
('T', 'Two-Handed'),
('U', 'Unknown');

-- --------------------------------------------------------

--
-- Estrutura da tabela `country`
--

CREATE TABLE `country` (
  `code_country` varchar(11) NOT NULL,
  `country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `game`
--

CREATE TABLE `game` (
  `Id_game` int(11) NOT NULL,
  `player1` int(11) DEFAULT NULL,
  `player2` int(11) DEFAULT NULL,
  `id_season` int(11) DEFAULT NULL,
  `GameRound` varchar(20) DEFAULT NULL,
  `RankPlayer1` int(11) DEFAULT NULL,
  `RankPlayer2` int(11) DEFAULT NULL,
  `Score` varchar(30) DEFAULT NULL,
  `Winner` int(11) DEFAULT NULL,
  `Released` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ground`
--

CREATE TABLE `ground` (
  `ground` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hand`
--

CREATE TABLE `hand` (
  `id_Hand` varchar(1) NOT NULL,
  `Hand` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `hand`
--

INSERT INTO `hand` (`id_Hand`, `Hand`) VALUES
('A', 'Ambidextrous'),
('L', 'Left-Handed'),
('R', 'Right-Handed'),
('U', 'Unknown');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player`
--

CREATE TABLE `player` (
  `name` varchar(30) NOT NULL,
  `linkPlayer` varchar(90) DEFAULT NULL,
  `height` int(10) DEFAULT NULL,
  `hand` varchar(1) DEFAULT NULL,
  `backhand` varchar(1) DEFAULT NULL,
  `born` varchar(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `round`
--

CREATE TABLE `round` (
  `gameround` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `season`
--

CREATE TABLE `season` (
  `id_season` int(11) NOT NULL,
  `tournament` varchar(30) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `location` varchar(11) DEFAULT NULL,
  `ground` varchar(8) DEFAULT NULL,
  `prize` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tempgame`
--

CREATE TABLE `tempgame` (
  `Player1` varchar(30) DEFAULT NULL,
  `Player2` varchar(30) DEFAULT NULL,
  `Tournament` varchar(30) DEFAULT NULL,
  `Start` varchar(30) DEFAULT NULL,
  `End` varchar(30) DEFAULT NULL,
  `Prize` varchar(11) DEFAULT NULL,
  `GameRound` varchar(20) DEFAULT NULL,
  `RankPlayer1` int(11) DEFAULT NULL,
  `RankPlayer2` int(11) DEFAULT NULL,
  `Score` varchar(30) DEFAULT NULL,
  `Released` int(1) DEFAULT NULL,
  `location` varchar(11) DEFAULT NULL,
  `Winner` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tempgame2`
--

CREATE TABLE `tempgame2` (
  `Player1` varchar(30) DEFAULT NULL,
  `Player2` varchar(30) DEFAULT NULL,
  `Tournament` varchar(30) DEFAULT NULL,
  `Start` date DEFAULT NULL,
  `End` date DEFAULT NULL,
  `Prize` varchar(11) DEFAULT NULL,
  `GameRound` varchar(20) DEFAULT NULL,
  `RankPlayer1` int(11) DEFAULT NULL,
  `RankPlayer2` int(11) DEFAULT NULL,
  `Score` varchar(30) DEFAULT NULL,
  `Released` int(1) DEFAULT NULL,
  `location` varchar(11) DEFAULT NULL,
  `Winner` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tempseason`
--

CREATE TABLE `tempseason` (
  `tournament` varchar(30) DEFAULT NULL,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `location` varchar(11) DEFAULT NULL,
  `ground` varchar(8) DEFAULT NULL,
  `prize` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `temptournaments`
--

CREATE TABLE `temptournaments` (
  `Name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tournaments`
--

CREATE TABLE `tournaments` (
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `backhand`
--
ALTER TABLE `backhand`
  ADD PRIMARY KEY (`id_backhand`);

--
-- Índices para tabela `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`code_country`);

--
-- Índices para tabela `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`Id_game`),
  ADD KEY `player1` (`player1`),
  ADD KEY `player2` (`player2`),
  ADD KEY `id_season` (`id_season`),
  ADD KEY `GameRound` (`GameRound`),
  ADD KEY `Winner` (`Winner`);

--
-- Índices para tabela `ground`
--
ALTER TABLE `ground`
  ADD PRIMARY KEY (`ground`);

--
-- Índices para tabela `hand`
--
ALTER TABLE `hand`
  ADD PRIMARY KEY (`id_Hand`);

--
-- Índices para tabela `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hand` (`hand`),
  ADD KEY `backhand` (`backhand`),
  ADD KEY `born` (`born`);

--
-- Índices para tabela `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`gameround`);

--
-- Índices para tabela `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`id_season`),
  ADD KEY `location` (`location`),
  ADD KEY `ground` (`ground`),
  ADD KEY `tournament` (`tournament`),
  ADD KEY `idx_Season` (`tournament`,`start`,`end`,`prize`);

--
-- Índices para tabela `tempgame2`
--
ALTER TABLE `tempgame2`
  ADD KEY `idx_TempSeason` (`Tournament`,`Start`,`End`,`Prize`);

--
-- Índices para tabela `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `game`
--
ALTER TABLE `game`
  MODIFY `Id_game` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `season`
--
ALTER TABLE `season`
  MODIFY `id_season` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`player1`) REFERENCES `player` (`id`),
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`player2`) REFERENCES `player` (`id`),
  ADD CONSTRAINT `game_ibfk_3` FOREIGN KEY (`id_season`) REFERENCES `season` (`id_season`),
  ADD CONSTRAINT `game_ibfk_4` FOREIGN KEY (`GameRound`) REFERENCES `round` (`gameround`),
  ADD CONSTRAINT `game_ibfk_5` FOREIGN KEY (`Winner`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`hand`) REFERENCES `hand` (`id_Hand`),
  ADD CONSTRAINT `player_ibfk_2` FOREIGN KEY (`backhand`) REFERENCES `backhand` (`id_backhand`),
  ADD CONSTRAINT `player_ibfk_3` FOREIGN KEY (`born`) REFERENCES `country` (`code_country`);

--
-- Limitadores para a tabela `season`
--
ALTER TABLE `season`
  ADD CONSTRAINT `season_ibfk_1` FOREIGN KEY (`location`) REFERENCES `country` (`code_country`),
  ADD CONSTRAINT `season_ibfk_2` FOREIGN KEY (`ground`) REFERENCES `ground` (`ground`),
  ADD CONSTRAINT `season_ibfk_3` FOREIGN KEY (`tournament`) REFERENCES `tournaments` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

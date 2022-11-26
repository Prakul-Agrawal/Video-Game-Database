-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: Phase4
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement` (
  `AchievementName` varchar(30) NOT NULL,
  `PlayerID` int NOT NULL,
  `Date` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`AchievementName`,`PlayerID`),
  KEY `PlayerAchievement_FK` (`PlayerID`),
  CONSTRAINT `PlayerAchievement_FK` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achievementcoins`
--

DROP TABLE IF EXISTS `achievementcoins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievementcoins` (
  `AchievementName` varchar(30) NOT NULL,
  `CoinsAwarded` int NOT NULL,
  PRIMARY KEY (`AchievementName`),
  CONSTRAINT `AchievementCoins_FK` FOREIGN KEY (`AchievementName`) REFERENCES `achievement` (`AchievementName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievementcoins`
--

LOCK TABLES `achievementcoins` WRITE;
/*!40000 ALTER TABLE `achievementcoins` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievementcoins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `Name` varchar(20) NOT NULL,
  `HealthPoints` int NOT NULL,
  `AttackDamage` int NOT NULL,
  `MinimumPlayerLevel` int NOT NULL DEFAULT '0',
  `Role` char(8) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan`
--

DROP TABLE IF EXISTS `clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clan` (
  `ClanID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `LeaderID` int DEFAULT NULL,
  PRIMARY KEY (`ClanID`),
  KEY `Leader_FK` (`LeaderID`),
  CONSTRAINT `Leader_FK` FOREIGN KEY (`LeaderID`) REFERENCES `player` (`PlayerID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handles`
--

DROP TABLE IF EXISTS `handles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `handles` (
  `PlayerID` int NOT NULL,
  `Handle` varchar(30) NOT NULL,
  PRIMARY KEY (`PlayerID`,`Handle`),
  CONSTRAINT `Handle_FK` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handles`
--

LOCK TABLES `handles` WRITE;
/*!40000 ALTER TABLE `handles` DISABLE KEYS */;
/*!40000 ALTER TABLE `handles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mage`
--

DROP TABLE IF EXISTS `mage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mage` (
  `CharacterName` varchar(20) NOT NULL,
  `SpellDamage` int DEFAULT NULL,
  PRIMARY KEY (`CharacterName`),
  CONSTRAINT `Mage_FK` FOREIGN KEY (`CharacterName`) REFERENCES `characters` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mage`
--

LOCK TABLES `mage` WRITE;
/*!40000 ALTER TABLE `mage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map` (
  `MapName` varchar(20) NOT NULL,
  `Theme` varchar(10) NOT NULL,
  PRIMARY KEY (`MapName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marksman`
--

DROP TABLE IF EXISTS `marksman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marksman` (
  `CharacterName` varchar(20) NOT NULL,
  `AttackRange` int DEFAULT NULL,
  PRIMARY KEY (`CharacterName`),
  CONSTRAINT `Marksman_FK` FOREIGN KEY (`CharacterName`) REFERENCES `characters` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marksman`
--

LOCK TABLES `marksman` WRITE;
/*!40000 ALTER TABLE `marksman` DISABLE KEYS */;
/*!40000 ALTER TABLE `marksman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `MatchID` int NOT NULL AUTO_INCREMENT,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `MapName` varchar(20) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MatchID`),
  KEY `MatchServer_FK` (`Country`,`City`),
  KEY `MatchMap_FK` (`MapName`),
  CONSTRAINT `MatchMap_FK` FOREIGN KEY (`MapName`) REFERENCES `map` (`MapName`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MatchServer_FK` FOREIGN KEY (`Country`, `City`) REFERENCES `server` (`Country`, `City`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc`
--

DROP TABLE IF EXISTS `npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc` (
  `NPCName` varchar(20) NOT NULL,
  `MapName` varchar(20) NOT NULL,
  `ItemSold` varchar(20) NOT NULL,
  PRIMARY KEY (`NPCName`,`MapName`),
  KEY `NPCMap_FK` (`MapName`),
  CONSTRAINT `NPCMap_FK` FOREIGN KEY (`MapName`) REFERENCES `map` (`MapName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `npc`
--

LOCK TABLES `npc` WRITE;
/*!40000 ALTER TABLE `npc` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playedwith`
--

DROP TABLE IF EXISTS `playedwith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playedwith` (
  `CharacterName` varchar(20) NOT NULL,
  `WeaponName` varchar(20) NOT NULL,
  `Level` int NOT NULL,
  `PlayerID` int NOT NULL,
  `MatchID` int NOT NULL,
  `SidePlayedOn` char(4) NOT NULL,
  `KillsScored` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PlayerID`,`MatchID`),
  KEY `PlayedWithCharacter_FK` (`CharacterName`),
  KEY `PlayedWithMatch_FK` (`MatchID`),
  KEY `PlayedWithWeapon_FK` (`WeaponName`,`Level`),
  CONSTRAINT `PlayedWithCharacter_FK` FOREIGN KEY (`CharacterName`) REFERENCES `characters` (`Name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PlayedWithMatch_FK` FOREIGN KEY (`MatchID`) REFERENCES `matches` (`MatchID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PlayedWithPlayer_FK` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PlayedWithWeapon_FK` FOREIGN KEY (`WeaponName`, `Level`) REFERENCES `weapon` (`WeaponName`, `Level`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playedwith`
--

LOCK TABLES `playedwith` WRITE;
/*!40000 ALTER TABLE `playedwith` DISABLE KEYS */;
/*!40000 ALTER TABLE `playedwith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `PlayerID` int NOT NULL AUTO_INCREMENT,
  `Level` int NOT NULL DEFAULT '0',
  `Email` varchar(50) NOT NULL,
  `ProfilePicture` char(100) DEFAULT NULL,
  `Coins` int NOT NULL DEFAULT '0',
  `TimePlayed` bigint NOT NULL DEFAULT '0',
  `Rating` int DEFAULT NULL,
  `AccountCreationDate` date NOT NULL,
  `ClanID` int DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `Clan_FK` (`ClanID`),
  CONSTRAINT `Clan_FK` FOREIGN KEY (`ClanID`) REFERENCES `clan` (`ClanID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server` (
  `Capacity` int NOT NULL,
  `Country` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `ParentServerCountry` varchar(30) DEFAULT NULL,
  `ParentServerCity` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Country`,`City`),
  KEY `Server_FK` (`ParentServerCountry`,`ParentServerCity`),
  CONSTRAINT `Server_FK` FOREIGN KEY (`ParentServerCountry`, `ParentServerCity`) REFERENCES `server` (`Country`, `City`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support` (
  `CharacterName` varchar(20) NOT NULL,
  `Healing` int DEFAULT NULL,
  PRIMARY KEY (`CharacterName`),
  CONSTRAINT `Support_FK` FOREIGN KEY (`CharacterName`) REFERENCES `characters` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tank`
--

DROP TABLE IF EXISTS `tank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tank` (
  `CharacterName` varchar(20) NOT NULL,
  `Armour` int DEFAULT NULL,
  PRIMARY KEY (`CharacterName`),
  CONSTRAINT `Tank_FK` FOREIGN KEY (`CharacterName`) REFERENCES `characters` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tank`
--

LOCK TABLES `tank` WRITE;
/*!40000 ALTER TABLE `tank` DISABLE KEYS */;
/*!40000 ALTER TABLE `tank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `PlayerID` int NOT NULL,
  `MatchID` int NOT NULL,
  `NPCName` varchar(20) NOT NULL,
  PRIMARY KEY (`PlayerID`,`MatchID`,`NPCName`),
  KEY `MatchTransaction_FK` (`MatchID`),
  KEY `NPCTransaction_FK` (`NPCName`),
  CONSTRAINT `MatchTransaction_FK` FOREIGN KEY (`MatchID`) REFERENCES `matches` (`MatchID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `NPCTransaction_FK` FOREIGN KEY (`NPCName`) REFERENCES `npc` (`NPCName`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PlayerTransaction_FK` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapon`
--

DROP TABLE IF EXISTS `weapon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapon` (
  `WeaponName` varchar(20) NOT NULL,
  `Level` int NOT NULL,
  `AttackSpeed` int NOT NULL,
  `AttackDamage` int NOT NULL,
  PRIMARY KEY (`WeaponName`,`Level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon`
--

LOCK TABLES `weapon` WRITE;
/*!40000 ALTER TABLE `weapon` DISABLE KEYS */;
/*!40000 ALTER TABLE `weapon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weaponeffects`
--

DROP TABLE IF EXISTS `weaponeffects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weaponeffects` (
  `WeaponName` varchar(20) NOT NULL,
  `Level` int NOT NULL,
  `SpecialEffects` varchar(20) NOT NULL,
  PRIMARY KEY (`WeaponName`,`Level`,`SpecialEffects`),
  CONSTRAINT `WeaponEffects_FK` FOREIGN KEY (`WeaponName`, `Level`) REFERENCES `weapon` (`WeaponName`, `Level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weaponeffects`
--

LOCK TABLES `weaponeffects` WRITE;
/*!40000 ALTER TABLE `weaponeffects` DISABLE KEYS */;
/*!40000 ALTER TABLE `weaponeffects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27  0:52:10

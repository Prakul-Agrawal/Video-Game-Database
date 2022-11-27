-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: Phase4
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
INSERT INTO `achievement` VALUES ('Buy from 10 NPCs',10000,'2021-03-18'),('Buy from 10 NPCs',10001,'2022-12-24'),('Buy from 10 NPCs',10005,'2022-10-25'),('Buy from 10 NPCs',10009,'2022-11-24'),('Buy from 10 NPCs',10013,'2022-12-28'),('Buy from 10 NPCs',10015,'2021-08-22'),('Buy from 10 NPCs',10017,'2021-02-14'),('Buy from 10 NPCs',10019,'2022-01-15'),('Deal 1000 damage',10000,'2022-12-10'),('Deal 1000 damage',10001,'2021-09-15'),('Deal 1000 damage',10002,'2021-06-08'),('Deal 1000 damage',10003,'2021-04-21'),('Deal 1000 damage',10004,'2022-08-08'),('Deal 1000 damage',10018,'2021-11-21'),('Deal 1000 damage',10019,'2022-04-21'),('Earn 500 gold',10001,'2021-01-10'),('Earn 500 gold',10002,'2021-01-24'),('Earn 500 gold',10003,'2021-12-05'),('Earn 500 gold',10006,'2022-11-13'),('Earn 500 gold',10010,'2021-03-18'),('Earn 500 gold',10014,'2021-05-12'),('Earn 500 gold',10018,'2022-12-09'),('Never die',10001,'2022-02-24'),('Never die',10004,'2021-09-07'),('Never die',10017,'2022-10-26'),('Never die',10019,'2022-03-14'),('Score 10 kills',10000,'2022-09-19'),('Score 10 kills',10003,'2022-10-08'),('Score 10 kills',10006,'2022-01-02'),('Score 10 kills',10009,'2021-04-10'),('Score 10 kills',10012,'2021-04-05'),('Win first match',10000,'2021-03-21'),('Win first match',10001,'2021-04-07'),('Win first match',10002,'2022-02-01'),('Win first match',10003,'2021-11-08'),('Win first match',10004,'2022-06-15'),('Win first match',10005,'2021-02-06'),('Win first match',10006,'2022-10-23'),('Win first match',10007,'2022-04-22'),('Win first match',10008,'2022-10-20'),('Win first match',10009,'2021-08-24'),('Win first match',10010,'2021-01-22'),('Win first match',10011,'2021-08-13'),('Win first match',10012,'2021-07-28'),('Win first match',10013,'2021-04-10'),('Win first match',10014,'2022-07-28'),('Win first match',10015,'2022-04-13'),('Win first match',10016,'2021-05-09'),('Win first match',10017,'2021-02-13'),('Win first match',10018,'2022-04-10'),('Win first match',10019,'2021-01-13');
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
INSERT INTO `achievementcoins` VALUES ('Buy from 10 NPCs',7500),('Deal 1000 damage',10000),('Earn 500 gold',5000),('Never die',15000),('Score 10 kills',10000),('Win first match',1000);
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
INSERT INTO `characters` VALUES ('Aatrox',650,55,5,'Tank'),('Ahri',570,50,8,'Mage'),('Bard',630,48,12,'Support'),('Caitlyn',580,62,3,'Marksman'),('Darius',625,58,0,'Tank'),('Diana',540,47,8,'Mage'),('Draven',575,64,10,'Marksman'),('Janna',570,52,0,'Support'),('Jinx',600,59,0,'Marksman'),('Kalista',570,64,10,'Marksman'),('Kayle',670,50,10,'Tank'),('LeBlanc',590,55,0,'Mage'),('Lillia',600,55,10,'Mage'),('Lucian',620,60,8,'Marksman'),('Lulu',540,47,8,'Support'),('Malphite',660,52,10,'Tank'),('Morgana',610,51,8,'Support'),('Nami',560,50,10,'Support'),('Olaf',645,60,12,'Tank'),('Seraphine',570,55,12,'Mage');
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
INSERT INTO `clan` VALUES (1,'DevilKillers',10002),(2,'TheElite',10008),(3,'Pokeclub',10010),(4,'Hyrule',10015),(5,'Narnia',10018);
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
INSERT INTO `handles` VALUES (10000,'Esmereldaxx'),(10001,'DizzyDolly'),(10002,'TwistedSister'),(10003,'Potamus'),(10003,'Splendido76'),(10004,'Atlantean'),(10004,'DoomedSilver'),(10005,'Demonatic'),(10005,'PanMan'),(10005,'WhiteRabbit'),(10006,'Lonesomefret'),(10006,'Maceface'),(10007,'Millennial0'),(10007,'Needlepoint'),(10008,'Confussion'),(10008,'I_Cant_Play'),(10009,'heavenshawk'),(10010,'TwistedSister'),(10011,'Greenlaker'),(10012,'Realmvanquish'),(10013,'Gratefuldread'),(10014,'Hoozapoppin'),(10014,'ShiftedRy'),(10015,'RatBoy'),(10015,'Sweetcaroline'),(10016,'Bisakrest'),(10016,'Crash23'),(10017,'Falconry'),(10017,'Vemodalen'),(10018,'EliminaT0R'),(10018,'Hiraeth'),(10019,'Pebbles44');
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
INSERT INTO `mage` VALUES ('Ahri',50),('Diana',40),('LeBlanc',50),('Lillia',45),('Seraphine',40);
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
INSERT INTO `map` VALUES ('Chernobyl','Nuclear'),('Dusseldorf','SciFi'),('Dust','Desert'),('Inferno','Summer'),('Mirage','Desert'),('Nuketown','Nuclear'),('Overpass','Rainy'),('Palm','Beach'),('Space Rift','SciFi'),('Summer Pool','Summer'),('Winter Rift','Snow'),('Xmas special','Snow');
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
INSERT INTO `marksman` VALUES ('Caitlyn',70),('Draven',55),('Jinx',65),('Kalista',60),('Lucian',60);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'2022-01-28 11:30:00','2022-01-28 12:00:00','Dust','China','Beijing'),(2,'2022-02-14 14:55:30','2022-02-14 15:30:30','Winter Rift','China','Shanghai'),(3,'2021-12-23 10:45:00','2021-12-23 11:25:00','Summer Pool','China','Hong Kong'),(4,'2022-02-20 11:10:00','2022-02-20 12:20:00','Space Rift','India','Bombay'),(5,'2022-03-10 21:00:00','2022-03-10 21:50:00','Xmas special','India','Hyderabad'),(6,'2022-03-27 20:50:30','2022-03-27 21:40:30','Palm','India','Delhi'),(7,'2022-05-10 13:45:00','2022-05-10 14:25:00','Mirage','USA','New York'),(8,'2022-05-03 15:25:00','2022-05-03 16:00:00','Inferno','USA','Chicago'),(9,'2022-06-20 17:20:00','2022-06-20 17:55:00','Overpass','USA','Washington DC'),(10,'2022-08-21 10:15:00','2022-08-21 11:05:00','Chernobyl','USA','LA');
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
INSERT INTO `npc` VALUES ('Akali','Dusseldorf','Hourglass'),('Akali','Dust','Hourglass'),('Akali','Mirage','Hourglass'),('Akali','Xmas special','Dagger'),('Chester','Dusseldorf','Boots'),('Chester','Dust','Boots'),('Chester','Inferno','Boots'),('Chester','Mirage','Boots'),('Chester','Palm','Attack potion'),('Chester','Summer Pool','Attack potion'),('Chester','Xmas special','Attack potion'),('Garcy','Dusseldorf','Blink'),('Garcy','Dust','Blink'),('Garcy','Inferno','Blink'),('Garcy','Mirage','Blink'),('Garcy','Overpass','Blink'),('Garcy','Space Rift','Blink'),('Garcy','Winter Rift','Blink'),('Lucy','Chernobyl','Shield potion'),('Lucy','Dusseldorf','Shield potion'),('Lucy','Mirage','Boots'),('Lucy','Nuketown','Shield potion'),('Lucy','Palm','Boots'),('Sandra','Dust','Cooling potion'),('Sandra','Mirage','Cooling potion'),('Sandra','Palm','Cooling potion'),('Sandra','Space Rift','Cooling potion'),('Sandra','Summer Pool','Cooling potion'),('Santa','Xmas special','Present');
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
INSERT INTO `playedwith` VALUES ('Seraphine','Death’s Dance',2,10000,4,'red',20),('Draven','Kraken Slayer',1,10000,5,'red',0),('Malphite','Serrated Dirk',1,10000,6,'blue',21),('Caitlyn','Eclipse',1,10000,7,'blue',18),('Morgana','Divine Sunderer',2,10001,3,'red',9),('Morgana','Vampiric Scepter',1,10001,4,'red',3),('Ahri','Death’s Dance',2,10001,5,'blue',15),('Malphite','Galeforce',3,10001,7,'red',21),('Lillia','Bloodthirster',1,10001,8,'red',14),('Lillia','Eclipse',1,10001,9,'blue',10),('Nami','Serrated Dirk',1,10002,3,'red',17),('Diana','Death’s Dance',1,10002,9,'blue',24),('Bard','Death’s Dance',1,10002,10,'blue',9),('Diana','Bloodthirster',3,10003,1,'blue',21),('Bard','Galeforce',3,10003,3,'blue',21),('Aatrox','Death’s Dance',1,10003,4,'red',20),('Seraphine','Divine Sunderer',3,10003,5,'red',17),('Kayle','Sheen',1,10003,6,'red',24),('Seraphine','Kraken Slayer',1,10003,7,'blue',20),('Caitlyn','Dark Seal',1,10003,9,'red',11),('Olaf','Eclipse',1,10004,3,'red',14),('Janna','Dull Blade',1,10004,5,'blue',0),('Darius','Eclipse',1,10004,6,'red',0),('LeBlanc','Divine Sunderer',3,10004,7,'red',0),('Kalista','Dull Blade',1,10005,4,'blue',24),('Kalista','Eclipse',2,10005,6,'blue',0),('Kalista','Divine Sunderer',3,10005,8,'red',4),('Janna','Death’s Dance',2,10005,9,'red',6),('Lucian','Death’s Dance',3,10006,1,'red',2),('Draven','Serrated Dirk',1,10006,2,'red',7),('Darius','Eclipse',2,10006,3,'blue',18),('LeBlanc','Bloodthirster',1,10006,5,'red',6),('Draven','Kraken Slayer',3,10006,7,'red',12),('Ahri','Bloodthirster',3,10006,9,'red',19),('Darius','Bloodthirster',3,10006,10,'red',1),('Draven','Divine Sunderer',3,10007,1,'blue',15),('Kalista','Serrated Dirk',2,10007,2,'blue',15),('Diana','Divine Sunderer',1,10007,3,'blue',16),('Draven','Galeforce',1,10007,4,'blue',16),('Malphite','Sheen',1,10007,9,'red',23),('Diana','Eclipse',2,10007,10,'red',23),('Aatrox','Kraken Slayer',3,10008,2,'red',7),('Draven','Kraken Slayer',3,10008,8,'blue',5),('Nami','Serrated Dirk',2,10008,10,'blue',11),('Lillia','Vampiric Scepter',1,10009,2,'blue',4),('Olaf','Serrated Dirk',1,10009,8,'blue',11),('Caitlyn','Bloodthirster',1,10009,10,'blue',11),('Bard','Death’s Dance',2,10010,1,'blue',19),('Janna','Bloodthirster',2,10010,2,'red',6),('Aatrox','Galeforce',2,10010,3,'red',17),('Bard','Divine Sunderer',3,10010,4,'blue',0),('Darius','Vampiric Scepter',1,10010,5,'red',0),('Jinx','Bloodthirster',3,10010,8,'blue',25),('Janna','Galeforce',3,10010,10,'red',14),('Nami','Bloodthirster',1,10011,1,'red',10),('Malphite','Kraken Slayer',1,10011,2,'blue',13),('Kayle','Bloodthirster',1,10011,3,'blue',23),('Olaf','Serrated Dirk',2,10011,6,'red',5),('Jinx','Dull Blade',1,10011,7,'blue',23),('Nami','Death’s Dance',3,10011,8,'blue',13),('Kalista','Kraken Slayer',1,10011,9,'blue',11),('Kayle','Bloodthirster',2,10011,10,'blue',2),('Morgana','Eclipse',2,10012,1,'blue',2),('Bard','Serrated Dirk',1,10012,7,'blue',5),('Lulu','Sheen',1,10012,8,'red',20),('Aatrox','Kraken Slayer',3,10012,10,'red',18),('Bard','Kraken Slayer',2,10013,2,'red',18),('Jinx','Kraken Slayer',2,10013,5,'blue',9),('Seraphine','Dull Blade',1,10013,6,'red',23),('Bard','Death’s Dance',3,10013,9,'blue',24),('Jinx','Death’s Dance',2,10013,10,'red',23),('Ahri','Galeforce',3,10014,1,'red',9),('Diana','Bloodthirster',3,10014,5,'blue',20),('Ahri','Divine Sunderer',2,10014,6,'blue',21),('LeBlanc','Serrated Dirk',2,10014,8,'blue',21),('Kayle','Serrated Dirk',1,10014,9,'blue',2),('Caitlyn','Dull Blade',1,10015,1,'blue',16),('Jinx','Death’s Dance',2,10015,2,'blue',11),('Bard','Bloodthirster',2,10015,5,'blue',2),('Aatrox','Divine Sunderer',1,10015,9,'red',10),('Ahri','Sheen',2,10016,2,'blue',24),('Malphite','Sheen',2,10016,4,'red',7),('Kayle','Sheen',1,10016,5,'red',20),('Lucian','Kraken Slayer',2,10016,6,'blue',2),('LeBlanc','Sheen',2,10017,1,'red',24),('LeBlanc','Sheen',2,10017,3,'red',19),('Nami','Serrated Dirk',2,10017,4,'blue',17),('Aatrox','Vampiric Scepter',1,10017,6,'red',6),('Aatrox','Death’s Dance',2,10017,7,'blue',4),('Darius','Kraken Slayer',2,10017,8,'red',15),('Olaf','Divine Sunderer',1,10018,1,'red',6),('Lucian','Serrated Dirk',2,10018,3,'blue',22),('Janna','Eclipse',2,10018,4,'blue',6),('Janna','Death’s Dance',3,10018,7,'red',19),('Olaf','Divine Sunderer',2,10019,2,'red',19),('Darius','Galeforce',2,10019,4,'red',7),('Bard','Divine Sunderer',1,10019,6,'blue',4),('Lillia','Sheen',2,10019,7,'red',3),('Lucian','Divine Sunderer',2,10019,8,'red',16),('Olaf','Serrated Dirk',1,10019,10,'blue',13);
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
) ENGINE=InnoDB AUTO_INCREMENT=10020 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (10000,11,'melyna93@yahoo.com','https://imgur.com/gallery/qix5QTO',23848,449,6841,'2022-04-18',5),(10001,15,'kjacobi@hotmail.com','https://imgur.com/gallery/syo908',13157,30,8230,'2022-03-23',1),(10002,15,'crystal14@yahoo.com','https://imgur.com/gallery/jodJAO',30093,125,8324,'2021-06-18',1),(10003,26,'abby.davis@gmail.com','https://imgur.com/gallery/qij291A',531,12,14709,'2021-10-07',2),(10004,1,'okeefe.kathryn@hotmail.com','https://imgur.com/gallery/qadOI0',36105,323,2028,'2021-08-02',3),(10005,10,'fgreenholt@gmail.com','https://imgur.com/gallery/asdj90',3673,379,5374,'2021-11-19',3),(10006,0,'ashton42@hotmail.com','https://imgur.com/gallery/nfoOA',36420,230,608,'2022-12-27',4),(10007,8,'christy.price@yahoo.com','https://imgur.com/gallery/kop849',5000,497,4973,'2022-10-16',4),(10008,27,'wunsch.rafaela@hotmail.com','https://imgur.com/gallery/mk8UI',27286,183,14345,'2022-01-12',2),(10009,26,'hrogahn@yahoo.com','https://imgur.com/gallery/uit90A',13421,448,14266,'2022-05-05',4),(10010,6,'polly.stiedemann@hotmail.com','https://imgur.com/gallery/gtu812',2000,302,3652,'2021-03-02',3),(10011,29,'rita.swaniawski@gmail.com','https://imgur.com/gallery/teu189A',41647,484,16157,'2022-03-11',1),(10012,19,'mosciski.marta@gmail.com','https://imgur.com/gallery/bnu56F',47083,374,11335,'2022-06-27',2),(10013,0,'cummings.spencer@yahoo.com','https://imgur.com/gallery/prta34',38364,36,495,'2022-07-18',3),(10014,5,'ldeckow@yahoo.com','https://imgur.com/gallery/hutb12',21230,228,2742,'2021-02-11',3),(10015,25,'hessel.beth@gmail.com','https://imgur.com/gallery/bxd192',35099,71,12673,'2021-12-02',4),(10016,20,'herzog.kane@yahoo.com','https://imgur.com/gallery/vbu901',15730,10,10571,'2021-02-26',5),(10017,1,'victor35@hotmail.com','https://imgur.com/gallery/fgu123',739,337,2106,'2022-02-01',5),(10018,25,'isabel62@gmail.com','https://imgur.com/gallery/try182',31773,258,13361,'2022-02-22',5),(10019,5,'audie.yundt@gmail.com','https://imgur.com/gallery/egh102',16816,300,3645,'2022-10-28',5);
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
INSERT INTO `server` VALUES (30000,'China','Beijing',NULL,NULL),(10000,'China','Hong Kong','China','Beijing'),(10000,'China','Shanghai','China','Beijing'),(30000,'France','Paris','Germany','Berlin'),(50000,'Germany','Berlin',NULL,NULL),(20000,'India','Bombay',NULL,NULL),(10000,'India','Delhi','India','Bombay'),(7500,'India','Hyderabad','India','Bombay'),(30000,'Russia','Moscow',NULL,NULL),(20000,'Turkey','Istanbul',NULL,NULL),(30000,'UK','London','Germany','Berlin'),(25000,'USA','Chicago','USA','New York'),(20000,'USA','LA','USA','New York'),(40000,'USA','New York',NULL,NULL),(20000,'USA','Washington DC','USA','New York');
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
INSERT INTO `support` VALUES ('Bard',120),('Janna',150),('Lulu',150),('Morgana',130),('Nami',160);
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
INSERT INTO `tank` VALUES ('Aatrox',45),('Darius',40),('Kayle',55),('Malphite',60),('Olaf',60);
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
INSERT INTO `transaction` VALUES (10006,1,'Akali'),(10007,1,'Akali'),(10011,1,'Akali'),(10012,1,'Chester'),(10015,1,'Chester'),(10015,1,'Garcy'),(10017,1,'Chester'),(10017,1,'Sandra'),(10018,1,'Chester'),(10006,2,'Garcy'),(10007,2,'Garcy'),(10008,2,'Garcy'),(10011,2,'Garcy'),(10013,2,'Garcy'),(10019,2,'Garcy'),(10006,3,'Sandra'),(10007,3,'Sandra'),(10010,3,'Chester'),(10010,3,'Sandra'),(10011,3,'Chester'),(10017,3,'Chester'),(10018,3,'Chester'),(10000,4,'Garcy'),(10001,4,'Garcy'),(10001,4,'Sandra'),(10003,4,'Garcy'),(10005,4,'Garcy'),(10005,4,'Sandra'),(10010,4,'Garcy'),(10016,4,'Garcy'),(10019,4,'Garcy'),(10000,5,'Chester'),(10004,5,'Santa'),(10006,5,'Chester'),(10006,5,'Santa'),(10013,5,'Santa'),(10014,5,'Santa'),(10015,5,'Santa'),(10016,5,'Chester'),(10000,6,'Chester'),(10003,6,'Sandra'),(10004,6,'Lucy'),(10011,6,'Sandra'),(10014,6,'Chester'),(10019,6,'Chester'),(10000,7,'Akali'),(10000,7,'Garcy'),(10001,7,'Garcy'),(10003,7,'Garcy'),(10003,7,'Lucy'),(10011,7,'Garcy'),(10012,7,'Garcy'),(10017,7,'Garcy'),(10019,7,'Akali'),(10019,7,'Garcy'),(10001,8,'Chester'),(10001,8,'Garcy'),(10005,8,'Chester'),(10009,8,'Chester'),(10009,8,'Garcy'),(10010,8,'Chester'),(10011,8,'Chester'),(10012,8,'Chester'),(10001,9,'Garcy'),(10002,9,'Garcy'),(10003,9,'Garcy'),(10005,9,'Garcy'),(10007,9,'Garcy'),(10015,9,'Garcy'),(10002,10,'Lucy'),(10006,10,'Lucy'),(10007,10,'Lucy'),(10011,10,'Lucy'),(10012,10,'Lucy'),(10013,10,'Lucy'),(10019,10,'Lucy');
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
INSERT INTO `weapon` VALUES ('Bloodthirster',1,15,15),('Bloodthirster',2,20,25),('Bloodthirster',3,25,40),('Dark Seal',1,0,15),('Death’s Dance',1,10,15),('Death’s Dance',2,15,20),('Death’s Dance',3,20,25),('Divine Sunderer',1,20,10),('Divine Sunderer',2,25,15),('Divine Sunderer',3,30,20),('Dull Blade',1,5,10),('Eclipse',1,15,20),('Eclipse',2,25,30),('Galeforce',1,5,20),('Galeforce',2,10,30),('Galeforce',3,15,40),('Kraken Slayer',1,5,25),('Kraken Slayer',2,10,35),('Kraken Slayer',3,15,45),('Serrated Dirk',1,10,20),('Serrated Dirk',2,15,30),('Sheen',1,10,15),('Sheen',2,25,15),('Vampiric Scepter',1,10,10);
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
INSERT INTO `weaponeffects` VALUES ('Bloodthirster',1,'+15% lifesteal'),('Bloodthirster',2,'+20% lifesteal'),('Bloodthirster',3,'+25% lifesteal'),('Dark Seal',1,'+20 spell damage'),('Death’s Dance',1,'+10% damage red'),('Death’s Dance',2,'+15% damage red'),('Death’s Dance',3,'+20% damage red'),('Divine Sunderer',1,'+10 armor pen'),('Divine Sunderer',2,'+15 armor pen'),('Divine Sunderer',3,'+20 armor pen'),('Dull Blade',1,'+10 armor'),('Eclipse',1,'+10 lethality'),('Eclipse',1,'+10% lifesteal'),('Eclipse',2,'+15 lethality'),('Eclipse',2,'+15% lifesteal'),('Galeforce',1,'+10 lethality'),('Galeforce',1,'+10 movement speed'),('Galeforce',2,'+10 movement speed'),('Galeforce',2,'+15 lethality'),('Galeforce',3,'+10 movement speed'),('Galeforce',3,'+20 lethality'),('Kraken Slayer',1,'+10 pure damage'),('Kraken Slayer',1,'+10% armor pen'),('Kraken Slayer',2,'+15 pure damage'),('Kraken Slayer',2,'+15% armor pen'),('Kraken Slayer',3,'+20 pure damage'),('Kraken Slayer',3,'+20% armor pen'),('Serrated Dirk',1,'+10 lethality'),('Serrated Dirk',2,'+15 lethality'),('Sheen',1,'+10 pure damage'),('Sheen',2,'+15 pure damage'),('Vampiric Scepter',1,'+15% lifesteal');
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

-- Dump completed on 2022-11-27 11:37:36

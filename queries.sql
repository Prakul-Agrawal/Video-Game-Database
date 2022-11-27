-- Queries

SELECT * FROM Matches WHERE DATE(StartTime) >= '1947-08-15';

SELECT * FROM Characters WHERE MinimumPlayerLevel < 5;

SELECT Handle FROM (Player NATURAL JOIN Handles) WHERE Level > 10;

SELECT WeaponName, Level FROM Weapon WHERE AttackSpeed BETWEEN 1.5 AND 2.5 AND AttackDamage > 100;

SELECT PlayerID, Coins FROM PLAYER WHERE Coins IN (SELECT MAX(Coins) FROM PLAYER);

SELECT AVG(KillsScored) FROM PlayedWith WHERE PlayerID = '12345';

SELECT SUM(Capacity) FROM SERVER;

SELECT * FROM Characters WHERE Name LIKE "S%";

SELECT DISTINCT PlayerID FROM Handles WHERE Handle LIKE "%noob%";

SELECT AVG(KillsScored), CharacterName, MapName FROM (PlayedWith NATURAL JOIN Matches) WHERE PlayerID = '12345' GROUP BY MapName, CharacterName;

-- Create View RedKills As SELECT MatchID, SUM(KillsScored) as RKills from PlayedWith where SidePlayedOn = 'Red' group by MatchId;

-- Create View BlueKills As SELECT MatchID, SUM(KillsScored) as BKills from PlayedWith where SidePlayedOn = 'Blue' group by MatchId;

-- CREATE View WhoWon AS Select MatchID, IF(RKills > BKills, 'Red', (IF (RKills < BKills, 'Blue', 'Equal'))) FROM (RedKills NATURAL JOIN BlueKills);

-- Create View Count(*), MatchID, SidePlayedOn where CharacterName = 'abcd' GROUP By MatchID, SidePlayedOn

-- Analysis

SELECT COUNT(*) FROM (Matches AS M INNER JOIN Server AS S ON M.Country = S.Country AND M.City = S.City) WHERE M.Country = "abcd" and M.City = "wxyz";

-- SELECT A.PlayerID, A.MapName, A.CharacterName, A.WeaponName, Count(*) / (SELECT Count(*) FROM PlayedWith AS B WHERE B.PlayerID = A.PlayerID) FROM (PlayedWith NATURAL JOIN Matches) GROUP BY A.PlayerID, A.MapName, A.CharacterName, A.WeaponName;
-- SELECT A.PlayerID, A.MapName, A.CharacterName, A.WeaponName, Count(*) / (SELECT Count(*) FROM PlayedWith AS B WHERE B.PlayerID = A.PlayerID) FROM (SELECT PlayerID, MapName, CharacterName, WeaponName FROM (PlayedWith NATURAL JOIN Matches)) AS A GROUP BY A.PlayerID, A.MapName, A.CharacterName, A.WeaponName ORDER BY A.PlayerID;
SELECT A.PlayerID, A.CharacterName, Count(*) / (SELECT Count(*) FROM PlayedWith AS B WHERE B.PlayerID = A.PlayerID) FROM PlayedWith AS A GROUP BY A.PlayerID, A.CharacterName ORDER BY A.PlayerID;

-- Insertion

a = SELECT CURDATE(); --not required (maybe)
INSERT INTO Player(Email, ProfilePicture, AccountCreationDate) VALUES("abcd@gmail.com", "thisisaURL", CURDATE());
val = SELECT MAX(PlayerID) FROM Player;
INSERT INTO Handles VALUES(val, "handlename");

INSERT INTO Characters VALUES("CharName", 1234, 100, 1, "Mage");
INSERT INTO Mage VALUES("CharName", 12);
INSERT INTO Marksman VALUES("CharName", 13);
INSERT INTO Tank VALUES("CharName", 11);
INSERT INTO Support VALUES("CharName", 10);



INSERT INTO Server VALUES(12345, "CountryName", "CityName", "ParentCountry", "ParentCity"); --If both parent are null, then it can accept, but otherwise has to satisfy foreign key

-- Updation

UPDATE Player SET Level = 3, Email = "new@gmail.com", ProfilePicture = "newurl", Coins = 99999, TimePlayed = 2048, Rating = 69, ClanID = 1234 WHERE PlayerID = 10000;

UPDATE Characters SET HealthPoints = 1234, AttackDamage = 45, MinimumPlayerLevel = 2 WHERE Name = "EnterNameHere";
-- Depending on the Role:
UPDATE MAGE SET SpellDamage = 24 WHERE CharacterName = "SameName";
UPDATE MARKSMAN SET AttackRange = 24 WHERE CharacterName = "SameName";
UPDATE TANK SET Armour = 24 WHERE CharacterName = "SameName"; 
UPDATE SUPPORT SET Healing = 24 WHERE CharacterName = "SameName";

-- Deletion

DELETE FROM Server WHERE Country = "CountryName" AND City = "CityName";

DELETE FROM NPC WHERE NPCName = "Name" AND MapName = "MapName";

--Derived Attributes

SELECT AVG(Rating) FROM Player WHERE ClanID = 103 AND ClanID IS NOT NULL; -- Clan Rating

SELECT TIMESTAMPDIFF(MINUTE, StartTime, EndTime) FROM Matches WHERE MatchID = 2; -- Duration of Match

SELECT COUNT(*) FROM Matches WHERE Country = "CountryName" AND City = "CityName"; -- No. of matches played on a server

SELECT MAX(EndTime) FROM (PlayedWith NATURAL JOIN Matches) WHERE PlayerID = 10000; -- Last Played At Time (If NULL, no matches played so far)
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

SELECT COUNT(*) FROM (Matches AS M INNER JOIN Server AS S ON M.Country = S.Country AND M.City = S.City) WHERE M.Country = "abcd" and M.City = "wxyz";

SELECT A.PlayerID, A.MapName, A.CharacterName, A.Count(*) / (SELECT B.Count(*) FROM PlayedWith AS B WHERE B.PlayerID = A.PlayerID) FROM (PlayedWith NATURAL JOIN Matches) GROUP BY A.MapName, A.CharacterName;

a = SELECT CURDATE(); --not required (maybe)
INSERT INTO Player(Email, ProfilePicture, AccountCreationDate) VALUES("abcd@gmail.com", "thisisaURL", CURDATE());
val = SELECT MAX(PlayerID) FROM Player;
INSERT INTO Handles VALUES(val, "handlename");

INSERT INTO Characters VALUES("CharName", 1234, 100, 1, "Mage");
INSERT INTO Mage VALUES("CharName", 12);
INSERT INTO Marksman VALUES("CharName", 13);
INSERT INTO Tank VALUES("CharName", 11);
INSERT INTO Support VALUES("CharName", 10);


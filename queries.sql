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
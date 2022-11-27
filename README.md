# D&A Project Phase 4 - Team 22

- Arnav Negi
- Shiven Sinha
- Prakul Agrawal

## Requirements to run

 1. PyMySQL and Tabulate python libraries.
 2. Python - version 3 or higher

## How to run

 1. Run `$ python3 MiniWorld.py` to run the CLI python script.
 2. Choose from the options provided.
 3. Enter the required data.

## Functions Provided

### Retrieval

Selection:

 1. Gets all matches which started after an input date.
 2. Retrieve all Character tuples which are available for a given player level.

Projection:

 1. List all handles of all players with level greater than input level.
 2. List all weapons with attack damage greater than input damage and attack speed between input min-speed and input max-speed.

Aggregate:

 1. Output maximum coins owned by any player.
 2. Output average over several matches for a given player.
 3. Output sum of capacities of all servers.

Search:

 1. Data of characters whose names start with a particular letter.
 2. IDs of all players whose handles contain the supplied string.

### Modification

 Insertion:

 1. Insert data about newly registered accounts.
 2. Insert data about newly released characters.
 3. Insert details about a newly set up server.

Updates:

 1. Update player info when the player/admin changes it.
 2. Update the details of buffed / nerfed characters when new patches are released.

 Deletion:

 1. Delete the record of the server if its is taken down.
 2. Delete NPCs from maps if needed.

### Derived attributes

Derived attributes in the database requirements are provided as a set of functions.

 1. Get the last time the specified player played at.
 2. Compute and show the rating of a clan.
 3. Compute and show the duration of a given match.
 4. Count the number of matches played on a given server.

### Analysis

Functions to provided analysis on players, characters, etc.

 1. Analyse player preferences for characters.
 2. Analyse the total number of coins owned by the members of a specific clan.

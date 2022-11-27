import subprocess as sp
import pymysql
import pymysql.cursors


def show_query_error(e):
    print("Failed to execute query; ", e)


#################
# Retrieval
#################

# Query Functions

## 1. Selection

def get_matches_after_date():
    """
    Gets all matches which started after an input date
    """
    try:
        min_start_date = input("List all matches which have started since when? (YYYY-MM-DD): ")
        query = "SELECT * FROM Matches WHERE DATE(StartTime) >= %s"
        cur.execute(query, (min_start_date,))
        result = cur.fetchall()

        print("Results: ")
        for i in result:
            print(i)

    except Exception as ex:
        # con.rollback()
        show_query_error(ex)


def get_characters_available_for_level():
    """
    Retrieve all Character tuples which have minimum player level <= input level
    """
    try:
        level = int(input("For which level do you wish to retrieve that available characters? "))
        query = "SELECT * FROM Characters WHERE MinimumPlayerLevel < %s;"
        cur.execute(query, (level,))
        result = cur.fetchall()

        print("Results: ")
        for i in result:
            print(i)

    except Exception as ex:
        show_query_error(ex)


## 2. Projection

def get_players_with_greater_level():
    """
    List all handles of all players with level > input
    """
    try:
        level = int(input("Retrieve all players with which minimum level? "))
        query = "SELECT Handle FROM (Player NATURAL JOIN Handles) WHERE Level > %s;"
        cur.execute(query, (level,))
        result = cur.fetchall()

        print("Results: ")
        for i in result:
            print(i)

    except Exception as ex:
        show_query_error(ex)


def get_weapons_with_damage_and_speed():
    """
    List all weapons with attack damage > input dmg and attack speed between input min_speed and input max_speed
    """
    try:
        min_damage = int(input("Minimum damage: "))
        min_speed = int(input("Minimum attack speed: "))
        max_speed = int(input("Maximum attack speed: "))

        query = "SELECT WeaponName, Level FROM Weapon WHERE AttackSpeed BETWEEN %s AND %s AND AttackDamage > %s;"
        cur.execute(query, (min_speed, max_speed, min_damage))
        result = cur.fetchall()

        print("Results: ")
        for i in result:
            print(i)

    except Exception as ex:
        show_query_error(ex)


## 3. Aggregate

def get_max_coins_player():
    """
    Maximum coins owned by any player
    """
    try:
        query = "SELECT PlayerID, Coins FROM PLAYER WHERE Coins IN (SELECT MAX(Coins) FROM PLAYER);"
        cur.execute(query)
        result = cur.fetchone()

        print("Maximum coins owned by any player:", result)

    except Exception as ex:
        show_query_error(ex)


def get_player_average_kills():
    """
    Average/total kills over several matches for a given player
    """
    try:
        player_id = input("Player ID: ")
        query = "SELECT AVG(KillsScored) FROM PlayedWith WHERE PlayerID = %s;"
        cur.execute(query, (player_id,))
        result = cur.fetchone()

        print(result)

    except Exception as ex:
        show_query_error(ex)


def get_total_server_capacity():
    """
    Sum of capacities of all servers
    """
    try:
        query = "SELECT SUM(Capacity) FROM SERVER;"
        cur.execute(query)
        result = cur.fetchone()

        print("Total capacity of servers:", result)

    except Exception as ex:
        show_query_error(ex)


## 4. Search

def characters_starting_with():
    """
    Tuples of characters whose names start with a particular letter
    """
    try:
        first_char = input("Character name starts with which character? ")
        query = "SELECT * FROM Characters WHERE Name LIKE %s;"

        cur.execute(query, (first_char + "%",))
        result = cur.fetchall()

        print("Results: ")
        for i in result:
            print(i)

    except Exception as ex:
        show_query_error(ex)


def player_ids_with_handle_substring():
    """
    IDs of all players whose handles contain the supplied string
    """
    try:
        substring = input("Enter the substring to search for in player handles: ")
        query = "SELECT DISTINCT PlayerID FROM Handles WHERE Handle LIKE `%s`;"
        cur.execute(query, ("%" + substring + "%"))
        result = cur.fetchall()

        print("Results: ")
        for i in result:
            print(i)

    except Exception as ex:
        show_query_error(ex)


#################
# Modification
#################

# Insertion

def create_match():
    """
    Insert data about new matches and their results after they end
    """



def create_player():
    """
    Insert data about newly registered accounts
    """
    try:
        handle = input("Enter player handle: ")
        email = input("Enter E-mail: ")
        pfp = input("Enter URL of profile picture: ")
        query = "INSERT INTO Player(Email, ProfilePicture, AccountCreationDate) VALUES(\'" + email + "\', \'" + pfp + "\', CURDATE());"
        cur.execute(query)
        cur.execute("SELECT MAX(PlayerID) FROM Player;")
        val = cur.fetchone()
    
        query = "INSERT INTO Handles VALUES(" + str(val) + ", \'" + handle + "\');"
        cur.execute(query)
        con.commit()
        print("Player created.")

    except Exception as ex:
        show_query_error(ex)


def create_character():
    """
    Insert data about newly released characters
    """
    try:
        charname = input("Enter character name: ")
        hp = int(input("Enter character Health Points: "))
        ad = int(input("Enter character Attack Damage: "))
        lvl = int(input("Enter minimum lvl required to play character: "))
        role = int(input("Enter the following for the specified role: \n\
                        1 for Marksman, \n \
                        2 for Mage \n \
                        3 for Tank \n \
                        4 for Support."))
        role_list = ["Marksman", "Mage", "Tank", "Support"]
        stat_list = ["Attack Range", "Sepll Damage", "Armor", "Healing"]
        if role in [1, 2, 3, 4]:
            stat = int(input("Enter character " + stat_list[role] + ": "))
            query = "INSERT INTO Characters VALUES(\'" + str(charname) + "\', " + str(hp) + "," + str(ad) + ", " + str(lvl) + ", " + role_list[role] + ");"
            cur.execute(query)

            query = "INSERT INTO" + role_list[role] + "VALUES(\'" + charname + "\', " + stat + ");"
            cur.execute(query)
            cur.commit()

            print("Added character.")
        else:
            print("Invalid Role option.")

    except Exception as ex:
        show_query_error(ex)


def create_server():
    """
    Insert details about a newly set up server
    """
    try:
        cap = int(input("Enter server capacity: "))
        country = input("Enter country of server: ")
        city = input("Enter city of of server: ")
        hasparent = input("Does server have a parent server(y/n): ")
        if hasparent == "y":
            par_country = input("Enter parent server country: ")
            par_city = input("Enter parent server city: ")

            query = "INSERT INTO server VALUES (" + cap + ", \'" + country + "\', \'" + city + "\', \'" + par_country + "\', \'" + par_city + "\');"
            cur.execute(query)
            cur.commit()

        elif hasparent == "n":
            query = "INSERT INTO server VALUES (" + cap + ", \'" + country + "\', \'" + city + "\', NULL, NULL);"
            cur.execute(query)
            cur.commit()
        print("Server added.")

    except Exception as ex:
        show_query_error(ex)



# Updates

def update_player_info():
    """
    Update player info when the player changes it
    """
    


def update_character():
    """
    Update the details of buffed / nerfed characters when new patches are released
    """


# Deletion

def delete_server():
    """
    If a server is taken down, its record is deleted
    """


def delete_npc():
    """
    NPCs can be deleted from the game
    """


def hireAnEmployee():
    """
    This is a sample function implemented for the refrence.
    This example is related to the Employee Database.
    In addition to taking input, you are required to handle domain errors as well
    For example: the SSN should be only 9 characters long
    Sex should be only M or F
    If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
    HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new employee's details: ")
        name = (input("Name (Fname Minit Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Minit"] = name[1]
        row["Lname"] = name[2]
        row["Ssn"] = input("SSN: ")
        row["Bdate"] = input("Birth Date (YYYY-MM-DD): ")
        row["Address"] = input("Address: ")
        row["Sex"] = input("Sex: ")
        row["Salary"] = float(input("Salary: "))
        row["Dno"] = int(input("Dno: "))

        query = "INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Dno) VALUES('%s', '%c', '%s', '%s', '%s', '%s', '%c', %f, %d)" % (
            row["Fname"], row["Minit"], row["Lname"], row["Ssn"], row["Bdate"], row["Address"], row["Sex"],
            row["Salary"], row["Dno"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)


option_handlers = [get_matches_after_date, get_characters_available_for_level, get_players_with_greater_level,
                   get_weapons_with_damage_and_speed, get_max_coins_player, get_player_average_kills,
                   get_total_server_capacity, characters_starting_with, player_ids_with_handle_substring, create_match,
                   create_player, create_character, create_server, update_player_info, update_character, delete_server,
                   delete_npc]

option_count = len(option_handlers)


def cls():
    sp.call('clear', shell=True)


# Global
while True:
    cls()

    username = "root"
    password = "password"
    host = "192.168.208.1"

    # username = input("Username: ")
    # password = input("Password: ")
    # host = input("Host: ")

    try:
        con = pymysql.connect(host=host,
                              port=3306,
                              user=username,
                              password=password,
                              db="phase4",
                              cursorclass=pymysql.cursors.DictCursor)

        cls()

        if con.open:
            print("Connected to the database!")
        else:
            print("Failed to connect")

        with con.cursor() as cur:
            while True:
                cls()

                for idx, option in enumerate(option_handlers):
                    print(f"{idx + 1}: {option.__doc__.strip()}")

                print(f"{option_count + 1}: Exit")

                chosen_option_idx = int(input("Option number: ")) - 1
                cls()

                if chosen_option_idx == option_count:
                    break
                elif 0 <= chosen_option_idx < option_count:
                    option_handlers[chosen_option_idx]()
                else:
                    print("Invalid option :(")

                input("Press [ENTER] key to continue")

    except Exception as e:
        cls()
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        break

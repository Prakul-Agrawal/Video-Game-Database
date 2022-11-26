import subprocess as sp
import pymysql
import pymysql.cursors


#################
# Retrieval
#################

# Query Functions

## 1. Selection

def get_matches_after_date():
    """
    Gets all matches which started after an input date
    """


def get_characters_available_for_level():
    """
    Retrieve all Character tuples which have minimum player level <= input level
    """


## 2. Projection

def get_players_with_greater_level():
    """
    List all handles of all players with level > input
    """


def get_weapons_with_damage_and_speed():
    """
    List all weapons with attack damage > input dmg and attack speed between input min_speed and input max_speed
    """


## 3. Aggregate

def get_max_coins_player():
    """
    Maximum coins owned by any player
    """


def get_player_average_kills():
    """
    Average/total kills over several matches for a given player
    """


def get_total_server_capacity():
    """
    Sum of capacities of all servers
    """


## 4. Search

def characters_starting_with():
    """
    Tuples of characters whose names start with a particular letter
    """


def player_ids_with_handle_substring():
    """
    IDs of all players whose handles contain the supplied string
    """


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


def create_character():
    """
    Insert data about newly released characters
    """


def create_server():
    """
    Insert details about a newly set up server
    """


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

    return


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
                    option_handlers[chosen_option_idx][1]()
                else:
                    print("Invalid option :(")

    except Exception as e:
        cls()
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        break

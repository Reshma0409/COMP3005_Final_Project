import json
import os
import psycopg2

def create_connection(dbname, user, password, host, port):
#Create a connection to the PostgreSQL database.
    try:
        conn = psycopg2.connect(dbname=dbname, user=user, password=password, host=host, port=port)
        return conn
    except Exception as e:
        print(f"Error: Unable to connect to the database\n{e}")
        return None

def load_json_data(conn, filename, table_name):
#Load JSON data into the specified table.
    try:
        cursor = conn.cursor()

        # Load JSON data from file
        with open(filename, 'r') as file:
            data = json.load(file)

        # Insert data into the database
        for record in data:
            columns = ', '.join(record.keys())
            placeholders = ', '.join(['%s'] * len(record))
            sql = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
            cursor.execute(sql, list(record.values()))

        # Commit changes
        conn.commit()
        print(f"Data from {filename} loaded into {table_name} successfully.")
    except Exception as e:
        print(f"Error: Unable to load data from {filename} into {table_name}\n{e}")

def load_json_folder_data(conn, folder_path, table_name):
    """Load JSON data from all files in the specified folder into the specified table."""
    try:
        cursor = conn.cursor()

        # Iterate over all files in the folder
        for filename in os.listdir(folder_path):
            if filename.endswith(".json"):
                file_path = os.path.join(folder_path, filename)

                # Load JSON data from file
                with open(file_path, 'r',  encoding='utf-8') as file:
                    data = json.load(file)

                # Insert data into the database
                for record in data:
                    if table_name == 'lineups':
                        # Convert lineup data to JSON format
                        lineup_data = record['lineup']
                        json_lineup_data = json.dumps(lineup_data)
                        record['lineup'] = json_lineup_data

                    columns = ', '.join(record.keys())
                    placeholders = ', '.join(['%s'] * len(record))
                    sql = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
                    cursor.execute(sql, list(record.values()))

                # Commit changes after processing each file
                conn.commit()
                print(f"Data from {filename} loaded into {table_name} successfully.")
    except Exception as e:
        print(f"Error: Unable to load data from {folder_path} into {table_name}\n{e}")


def load_json_nested_folder_data(conn, folder_path, table_name):
    try:
        cursor = conn.cursor()

        # Recursively iterate over all files and subdirectories in the folder
        for root, dirs, files in os.walk(folder_path):
            for filename in files:
                if filename.endswith(".json"):
                    file_path = os.path.join(root, filename)

                    # Load JSON data from file
                    with open(file_path, 'r', encoding='utf-8') as file:
                        data = json.load(file)

                    # Insert data into the database
                    for record in data:
                        # Extract relevant keys from the record
                        match_id = record.get("match_id")
                        match_date = record.get("match_date")
                        kick_off = record.get("kick_off")
                        competition = record.get("competition")
                        competition_id = competition.get("competition_id") if competition else None
                        competition_country_name = competition.get("country_name") if competition else None
                        competition_name = competition.get("competition_name") if competition else None
                        
                        
                        # Execute SQL insert statement
                        cursor.execute(
                            f"INSERT INTO {table_name} (match_id, match_date, kick_off, competition_id, competition_country_name, competition_name) "
                            "VALUES (%s, %s, %s, %s, %s, %s)",
                            (match_id, match_date, kick_off, competition_id, competition_country_name, competition_name)
                        )

                    # Commit changes after processing each file
                    conn.commit()
                    print(f"Data from {file_path} loaded into {table_name} successfully.")
    except Exception as e:
        print(f"Error: Unable to load data from {folder_path} into {table_name}\n{e}")
        conn.rollback()  # Rollback changes if an error occurs
    finally:
        cursor.close()  # Close the cursor to release database resources


def main():
    # Database connection parameters
    dbname = "project_database"
    user = "postgres"
    password = "reshma2501"
    host = "localhost"
    port = "2003"

    # Connect to the database
    conn = create_connection(dbname, user, password, host, port)
    if conn is None:
        return

    try:
        # Load JSON data into the database tables
        load_json_data(conn, "C:\\Users\\Reshma\\Downloads\\3005_Project\\data\\competitions.json", "competitions")
        load_json_folder_data(conn, "C:\\Users\\Reshma\\Downloads\\3005_Project\\data\\lineups", "lineups")
        load_json_nested_folder_data(conn, "C:\\Users\\Reshma\\Downloads\\3005_Project\\data\\matches", "matches")

    except Exception as e:
        print(f"Error: {e}")


    # Close the database connection
    conn.close()

if __name__ == "__main__":
    main()

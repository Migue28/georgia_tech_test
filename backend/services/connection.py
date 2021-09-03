import psycopg2
from dotenv import load_dotenv
import os

# Get Env
load_dotenv()

def getCursor():
    try:
        conn = psycopg2.connect(
            user = os.getenv("PGUSER"),
            password = os.getenv("PGPASSWORD"),
            host = os.getenv("PGHOST"),
            port = os.getenv("PGPORT"),
            database = os.getenv("PGDATABASE")
        )
        return conn.cursor()

    except psycopg2.Error as e:
        return e
from services import connection as conn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import json

app = FastAPI()

origins = [
    "http://localhost:3000",
    "localhost:3000"
]


app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

@app.get("/getyears")
async def getYears():
    cursor = conn.getCursor()
    cursor.execute("SELECT import_year FROM Imports GROUP BY import_year ORDER BY import_year;")
    years_list = cursor.fetchall()
    years = json.dumps(years_list)
    return years

@app.get("/getcountries")
async def getCountries():
    cursor = conn.getCursor()
    cursor.execute("SELECT partner_name FROM Partners ORDER BY partner_name;")
    countries_list = cursor.fetchall()
    countries = json.dumps(countries_list)
    return countries

#(2008: {})


# cursor.execute("SELECT pr.product_name, im.import_value from Imports im, Products pr, Partners pa WHERE im.import_year = 2008 AND im.partner_code = 8;")


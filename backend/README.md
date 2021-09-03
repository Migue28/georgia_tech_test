# Backend 

## Overview

Backend side of the test, have the creation of the database and routes for the api

## Stacks and Services

- [Python](https://www.python.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [Psycopg2](https://pypi.org/project/psycopg2/)
- [FastAPI](https://fastapi.tiangolo.com/)
- [Poetry](https://python-poetry.org/docs/)

## Database

It's necessary that you have and database in postgres with the data in *data/panama_imports.csv* for the app to run correctly.

## Install and run 

To manage dependencies I use Poetry, so you will need it to install it.

```Bash
    ## Install dependencies
    poetry install
    ## Run FastAPI
    poetry run uvicorn app.main --reload
```
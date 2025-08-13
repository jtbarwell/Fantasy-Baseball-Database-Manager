# -*- coding: <UTF-8> -*-
from scanTables import getBattingDF
from scanTables import getPitchingDF
from scanTables import getFieldingDF
from queryDB import *
import numpy as np

def insertOneYear(urlFrame, getDF, table, team, year):
    url = f"{urlFrame}{team}/{year}.shtml"
    print(f"📡 Fetching: {url}")
    df = getDF(url)

    if df.empty:
        print(f"⚠️ No data for {team} in {year}")
        return ""
    
    # Add non-scraping columns
    df["Year"] = year
    df["Team"] = team
    
    column_order = [
        "Year", "Team", "Player", "Age", "Pos", 
        "WAR", "G", "PA", "AB", "R", "H", 
        "[2B]", "[3B]", "HR", "RBI", 
        "SB", "CS", "BB", "SO", "BA", 
        "OBP", "SLG", "OPS", "OPS_P", "rOBA", "Rbat_P", 
        "TB", "GIDP", "HBP", "SH", "SF", "IBB"
    ]
    df = df[[col for col in column_order if col in df.columns]]
    df = df.astype(object)
    df_json = df.to_json(orient='records')
    # print(df_json)
    
    
    
    
    # insert_query("DESKTOP-IEKNRR8\SQLEXPRESS", "baseball", "{ODBC Driver 17 for SQL Server}", "exec baseball.dbo.sp_insert" + table + f"Record({df_json})" + "}")
    query = f"""
    DECLARE @json NVARCHAR(MAX) = CAST(? AS NVARCHAR(MAX));
    EXEC baseball.dbo.sp_insert{table}Record @json;
    """
    insert_query(
        "DESKTOP-IEKNRR8\\SQLEXPRESS",
        "baseball",
        "{ODBC Driver 17 for SQL Server}",
        query,
        (df_json,)
    )
    
    print(f"✅ Inserted {len(df)} rows for {team} {year}")


def insertBatting(urlFrame, team, year):
    while int(year) >= 1990:
        insertOneYear(urlFrame, getBattingDF, "Batting", team, year)
        year = str(int(year)-1)


def insertPitching(urlFrame, team, year):
    while int(year) >= 1990:
        insertOneYear(urlFrame, getBattingDF, "Pitching", team, year)
        year = str(int(year)-1)


def insertFielding(urlFrame, team, year):
    while int(year) >= 1990:
        insertOneYear(urlFrame, getBattingDF, "Fielding", team, year)
        year = str(int(year)-1)
    
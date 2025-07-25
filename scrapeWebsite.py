# -*- coding: <UTF-8> -*-
import cloudscraper
import pandas as pd
from bs4 import BeautifulSoup
from scanTables import getBattingDF
from scanTables import getPitchingDF
from scanTables import getFieldingDF

def getInsertOneYear(urlFrame, getDF, table, team, year):
    url = urlFrame + team + '/' + year + '.shtml'
    print(url)
    df = getDF(url)

    if df.empty:
        print(f"⚠️ No data for {team} in {year}")
        return ""
    
    quote_columns=['Player', 'Pos']

    insertList = []
    for index, row in df.iterrows():
        values = []
        for col in df.columns:
            val = row[col]
            if col in quote_columns:
                val = f"'{val}'"
            else:
                if val == '':
                    val = 0
            values.append(str(val))
        insertList.append(f"insert into {table} (Year, Team, {', '.join(df.columns)}) values ({int(year)}, '{team}', {', '.join(values)}); \n")
    sql = ''.join(insertList)
    return sql


def getInsertBattingString(urlFrame, team, year):
    url = urlFrame + team + '/' + year + '.shtml'
    
    yearInsertList = []
    while int(year) >= 1990:
        yearInsertList.append(getInsertOneYear(urlFrame, getBattingDF, "BattingStats", team, year))
        year = str(int(year)-1)
    
    return ''.join(yearInsertList)


def getInsertPitchingString(urlFrame, team, year):
    url = urlFrame + team + '/' + year + '.shtml'
    
    yearInsertList = []
    while int(year) >= 1990:
        yearInsertList.append(getInsertOneYear(urlFrame, getPitchingDF, "PitchingStats", team, year))
        year = str(int(year)-1)
    
    return ''.join(yearInsertList)


def getInsertFieldingString(urlFrame, team, year):
    url = urlFrame + team + '/' + year + '.shtml'
    
    yearInsertList = []
    while int(year) >= 1990:
        yearInsertList.append(getInsertOneYear(urlFrame, getFieldingDF, "FieldingStats", team, year))
        year = str(int(year)-1)
    
    return ''.join(yearInsertList)


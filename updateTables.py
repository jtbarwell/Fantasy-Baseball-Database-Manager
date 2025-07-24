# -*- coding: <UTF-8> -*-
import cloudscraper
import pandas as pd
from bs4 import BeautifulSoup
from scanTables import getBattingDF
from scanTables import getPitchingDF
from scanTables import getFieldingDF
import time

def updateBatting(urlFrame, table, team, year):
    url = urlFrame + team + '/' + year + '.shtml'
    print(url)
    df = getBattingDF(url)

    if df.empty:
        print(f"⚠️ No data for {team} in {year}")
        return ""
    
    update_columns=['WAR', 'G', 'PA', 'AB', 'R', 'H', '[2B]', '[3B]', 'HR', 'RBI', 'SB', 'CS', 'BB', 'SO', 'BA', 'OBP', 'SLG', 'OPS', '[OPS+]', 'rOBA', '[Rbat+]', 'TB', 'GIDP', 'HBP', 'SH', 'SF', 'IBB']

    updateList = []
    for index, row in df.iterrows():
        sets = []
        for col in df.columns:
            if col == 'Player':
                player = row[col]
            if col in update_columns:
                val = row[col]
                if val == '':
                    val = '0'
                sets.append(f"{col} = {val}, ")
        updateList.append(f"UPDATE {table} SET {''.join(sets)} WHERE Year = {year} AND Team = '{team}' AND Player = '{player}'; \n")
    sql = ''.join(updateList)
    return sql




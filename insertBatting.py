import cloudscraper
import pandas as pd
from bs4 import BeautifulSoup
from scanTables import getBattingDF

def getInsertOneYear(urlFrame, team, year):
    url = urlFrame + team + '/' + year + '.shtml'
    print(url)
    df = getBattingDF(url)
    
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
        insertList.append(f"insert into BattingStats (Year, Team, {', '.join(df.columns)}) values ({int(year)}, '{team}', {', '.join(values)}); \n")
    sql = ''.join(insertList)
    return sql


def getInsertBattingString(urlFrame, team, year):
    url = urlFrame + team + '/' + year + '.shtml'
    
    yearInsertList = []
    while int(year) >= 1999:
        yearInsertList.append(getInsertOneYear(urlFrame, team, year))
        year = str(int(year)-1)
    
    return ''.join(yearInsertList)



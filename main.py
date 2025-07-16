import cloudscraper
import pandas as pd
from bs4 import BeautifulSoup
from insertBatting import getInsertBattingString

from scanTables import getBattingDF

def main():
    urlFrame = "https://www.baseball-reference.com/teams/"
    teamCodes = ['PHI', 'NYM', 'MIA', 'ATL', 'WSN', 'CHC', 'MIL', 'STL', 'CIN', 'PIT', 'LAD', 'SDP', 'SFG', 'ARI', 'COL', 'TOR', 'NYY', 'BOS', 'TBR', 'BAL', 'DET', 'MIN', 'CLE', 'KCR', 'CHW', 'HOU', 'SEA', 'TEX', 'LAA', 'ATH']
    for team in teamCodes:
        print(getInsertBattingString(urlFrame, team, '2025'))


if __name__ == "__main__":
    main()
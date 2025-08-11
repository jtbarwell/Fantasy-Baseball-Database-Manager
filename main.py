# -*- coding: <UTF-8> -*-
import cloudscraper
import pandas as pd
from bs4 import BeautifulSoup
from scrapeWebsite import getInsertBattingString
from scrapeWebsite import getInsertPitchingString
from insertDataIntoDB import *
from queryDB import *


def main():
    urlFrame = "https://www.baseball-reference.com/teams/"
    teamCodes = ['PHI', 'NYM', 'MIA', 'ATL', 'WSN', 'CHC', 'MIL', 'STL', 'CIN', 'PIT', 'LAD', 'SDP', 'SFG', 'ARI', 'COL', 'TOR', 'NYY', 'BOS', 'TBR', 'BAL', 'DET', 'MIN', 'CLE', 'KCR', 'CHW', 'HOU', 'SEA', 'TEX', 'LAA', 'ATH']
    # teamCodes = ['TOR']
    for team in teamCodes:
        insertBatting(urlFrame, team, '2025')

if __name__ == "__main__":
    main()
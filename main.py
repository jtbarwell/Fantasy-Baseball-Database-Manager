import cloudscraper
import pandas as pd
from bs4 import BeautifulSoup
from insertBatting import getInsertBattingString

from scanTables import getBattingDF

def main():
    urlFrame = "https://www.baseball-reference.com/teams/"
    # print(getInsertBattingString(urlFrame, 'ARI', '2025'))
    print(getBattingDF("https://www.baseball-reference.com/teams/TOR/2025.shtml"))


if __name__ == "__main__":
    main()
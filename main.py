import cloudscraper
import pandas as pd
from bs4 import BeautifulSoup
from scanTables import getBattingDF


def main():
    url = "https://www.baseball-reference.com/teams/TOR/2025.shtml"
    battingDF = getBattingDF(url)

    for r in battingDF.iterrows():
        print(r)

    # print(getPitchingDF(url))
    # print(getFieldingDF(url))

if __name__ == "__main__":
    main()
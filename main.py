import cloudscraper
import pandas as pd
from bs4 import BeautifulSoup
from scanTables import getBattingDF


def main():
    url = "https://www.baseball-reference.com/teams/TOR/2025.shtml"
    battingDF = getBattingDF(url)
    quote_columns=['Player', 'Pos']
    for index, row in battingDF.iterrows():
        values = []
        for col in battingDF.columns:
            val = row[col]
            if col in quote_columns:
                val = f"'{val}'"
            else:
                if val == '':
                    val = 0
            values.append(str(val))
        print(", ".join(values))
    

    # print(getPitchingDF(url))
    # print(getFieldingDF(url))

if __name__ == "__main__":
    main()
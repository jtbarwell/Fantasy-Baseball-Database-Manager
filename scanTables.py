# -*- coding: <UTF-8> -*-
import cloudscraper
import pandas as pd
from bs4 import BeautifulSoup
import time


def getBattingDF(url):
    try:
        scraper = cloudscraper.create_scraper(browser={'custom': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'})
        response = scraper.get(url)
        soup = BeautifulSoup(response.text, 'html.parser')


        roster_table = soup.find('table', {'id': 'players_standard_batting'})
        rows = []
        if roster_table is None:
            print(f"⚠️ No batting table found at {url}")
            with open('debug_output.html', 'w') as f:
                f.write(response.text)
            print(" - Saved HTML to debug_output.html")
            time.sleep(4)
            return pd.DataFrame()

        print("\n✅ Scraping result:")
        # with open('test.txt', 'w', 'utf-8') as f:
        #     f.write(roster_table.text)
        df = pd.DataFrame(columns=['Player', 'Age', 'Pos', 'WAR', 'G', 'PA', 'AB', 'R', 'H', '[2B]', '[3B]', 'HR', 'RBI', 'SB', 'CS', 'BB', 'SO', 'BA', 'OBP', 'SLG', 'OPS', '[OPS+]', 'rOBA', '[Rbat+]', 'TB', 'GIDP', 'HBP', 'SH', 'SF', 'IBB'])
        for row in roster_table.tbody.find_all('tr'):
            cols = row.find_all('td')
            if cols:
                rows.append({
                    'Player':   cols[0].text.strip("#*").replace("'", "''"),
                    'Age':      cols[1].text.strip(),
                    'Pos':      cols[2].text.strip("#*"),
                    'WAR':      cols[3].text.strip(),
                    'G':        cols[4].text.strip(),
                    'PA':       cols[5].text.strip(),
                    'AB':       cols[6].text.strip(),
                    'R':        cols[7].text.strip(),
                    'H':        cols[8].text.strip(),
                    '[2B]':     cols[9].text.strip(),
                    '[3B]':     cols[10].text.strip(),
                    'HR':       cols[11].text.strip(),
                    'RBI':      cols[12].text.strip(),
                    'SB':       cols[13].text.strip(),
                    'CS':       cols[14].text.strip(),
                    'BB':       cols[15].text.strip(),
                    'SO':       cols[16].text.strip(),
                    'BA':       cols[17].text.strip(),
                    'OBP':      cols[18].text.strip(),
                    'SLG':      cols[19].text.strip(),
                    'OPS':      cols[20].text.strip(),
                    '[OPS+]':   cols[21].text.strip(),
                    'rOBA':     cols[22].text.strip(),
                    '[Rbat+]':  cols[23].text.strip(),
                    'TB':       cols[24].text.strip(),
                    'GIDP':     cols[25].text.strip(),
                    'HBP':      cols[26].text.strip(),
                    'SH':       cols[27].text.strip(),
                    'SF':       cols[28].text.strip(),
                    'IBB':      cols[29].text.strip()
                })

        df = pd.DataFrame(rows)
        time.sleep(4)
        return df

    except Exception as e:
        print("\n❌ Error during scraping:")
        print(e)
        time.sleep(4)




def getPitchingDF(url):
    try:
        scraper = cloudscraper.create_scraper(browser={'custom': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'})
        response = scraper.get(url)
        soup = BeautifulSoup(response.text, 'html.parser')


        roster_table = soup.find('table', {'id': 'players_standard_pitching'})
        rows = []
        if roster_table is None:
            print(f"⚠️ No pitching table found at {url}")
            with open('debug_output.html', 'w') as f:
                f.write(response.text)
            print(" - Saved HTML to debug_output.html")
            time.sleep(4)
            return pd.DataFrame()

        print("\n✅ Scraping result:")
        # with open('test.txt', 'w', 'utf-8') as f:
        #     f.write(roster_table.text)
        df = pd.DataFrame(columns=['Player', 'Age', 'Pos', 'WAR', 'W', 'L', '[W-L%]', 'ERA', 'G', 'GS', 'GF', 'CG', 'SHO', 'SV', 'IP', 'H', 'R', 'ER', 'HR', 'BB', 'IBB', 'SO', 'HBP', 'BK', 'WP', 'BF', '[ERA+]', 'FIP', 'WHIP', 'H9', 'HR9', 'BB9', 'SO9', '[SO/BB]'])
        for row in roster_table.tbody.find_all('tr'):
            cols = row.find_all('td')
            if cols:
                rows.append({
                    'Player':   cols[0].text.strip("#*").replace("'", "''"),
                    'Age':      cols[1].text.strip(),
                    'Pos':      cols[2].text.strip("#*"),
                    'WAR':      cols[3].text.strip(),
                    'W':        cols[4].text.strip(),
                    'L':        cols[5].text.strip(),
                    '[W-L%]':   cols[6].text.strip(),
                    'ERA':      cols[7].text.strip(),
                    'G':        cols[8].text.strip(),
                    'GS':       cols[9].text.strip(),
                    'GF':       cols[10].text.strip(),
                    'CG':       cols[11].text.strip(),
                    'SHO':      cols[12].text.strip(),
                    'SV':       cols[13].text.strip(),
                    'IP':       cols[14].text.strip(),
                    'H':        cols[15].text.strip(),
                    'R':        cols[16].text.strip(),
                    'ER':       cols[17].text.strip(),
                    'HR':       cols[18].text.strip(),
                    'BB':       cols[19].text.strip(),
                    'IBB':      cols[20].text.strip(),
                    'SO':       cols[21].text.strip(),
                    'HBP':      cols[22].text.strip(),
                    'BK':       cols[23].text.strip(),
                    'WP':       cols[24].text.strip(),
                    'BF':       cols[25].text.strip(),
                    '[ERA+]':   cols[26].text.strip(),
                    'FIP':      cols[27].text.strip(),
                    'WHIP':     cols[28].text.strip(),
                    'H9':       cols[29].text.strip(),
                    'HR9':      cols[30].text.strip(),
                    'BB9':      cols[31].text.strip(),
                    'SO9':      cols[32].text.strip(),
                    '[SO/BB]':    cols[33].text.strip()
                })

        df = pd.DataFrame(rows)
        time.sleep(4)
        return df

    except Exception as e:
        print("\n❌ Error during scraping:")
        time.sleep(4)
        print(e)




def getFieldingDF(url):
    try:
        scraper = cloudscraper.create_scraper()
        response = scraper.get(url)
        soup = BeautifulSoup(response.text, 'html.parser')


        roster_table = soup.find('table', {'id': 'players_standard_fielding'})
        rows = []
        if roster_table is None:
            print(f"⚠️ No fielding table found at {url}")
            return pd.DataFrame()


        print("\n✅ Scraping result:")
        
        df = pd.DataFrame(columns=['Player', 'Age', 'G', 'GS', 'CG', 'Inn', 'Ch', 'PO', 'A', 'E', 'DP', 'Fld%', 'Rtot', 'Rtot/yr', 'RF/9', 'lgRF9', 'PB', 'WP', 'SB', 'CS', 'CS%', 'Pick'])
        for row in roster_table.tbody.find_all('tr'):
            cols = row.find_all('td')
            if cols:
                rows.append({
                    'Player':   cols[0].text.strip(),
                    
                })

        df = pd.DataFrame(rows)
        return df

    except Exception as e:
        print("\n❌ Error during scraping:")
        print(e)




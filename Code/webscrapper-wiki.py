import csv
import json
import pandas as pd
import pathlib
import pprint
import random
import requests
import re
import ssl
import time
from bs4 import BeautifulSoup
from googlesearch import search


def extract_city_data(page):
    city_data = {}
    soup = BeautifulSoup(page, 'html.parser')
    table = soup.find('table', class_='infobox ib-settlement vcard')
    for row in table.tbody.find_all('tr'):
        # # Find all data for each column
        town_name_tag = row.find(class_='infobox-above')
        if town_name_tag:
            city_data.setdefault("Town name", town_name_tag.getText())
            # town_name = town_name_tag.getText()

        labels = row.find(class_='infobox-label')
        data = row.find(class_='infobox-data')
        if labels and data:
            city_data.setdefault(re.sub(r'\[\d+]$', '',re.sub(r'[^a-zA-Z0-9 ()\[\]]', '', labels.getText())),
                                 re.sub(r'\[\d+]$', '', data.getText().replace(u'\xa0', u' ')))

    return city_data


def get_crime_city_state(input_data_uri, output_data_uri):
    try:
        scrapped_city_data_files = [f.name for f in pathlib.Path(output_data_uri).glob('**/*.json') if f.is_file()]
        with open(input_data_uri, 'r', encoding='utf-8') as f:
            return [i[0] for i in csv.reader(f) if f"{i[0].replace(' ', '_')}.json" not in scrapped_city_data_files]
    except FileNotFoundError:
        raise


def google_search(query):
    # get User-Agent from here: https://www.whatismybrowser.com/detect/what-is-my-user-agent/
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
                             ' (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36'}
    response = None
    for j in search(term=query,  num_results=1, lang="en"):
        try:
            response = requests.get(j, headers=headers)
            if response.status_code == 429:
                print("here")
                time.sleep(int(response.headers["Retry-After"]))
        except requests.exceptions.ConnectionError:
            raise
        except requests.exceptions.Timeout:
            raise
        except requests.exceptions.HTTPError:
            raise

    return response.text


def sanitize_zip_codes(zip_code_raw):
    sanitized_zip = []
    for zip_code in zip_code_raw:
        if '-' in zip_code:
            interpolated_zip = list(range(int(zip_code.split('-')[0]), int(zip_code.split('-')[1]) + 1))
            if zip_code.startswith('0'):
                sanitized_zip.extend([f"0{i}" for i in interpolated_zip])
            else:
                sanitized_zip.extend(interpolated_zip)
        else:
            sanitized_zip.extend([zip_code])
    return sanitized_zip


def gen_report(city_data):

    with open(r'data/crime_city_state_zip_enhanced.psv', 'w', encoding='utf-8') as f:
        for data in all_city_data:
            zip_code = []
            if 'ZIP Code' in data:
                zip_code_raw = [item.strip() for item in re.sub(r'\[\d+\]$', '', data['ZIP Code']).split(',')]
                zip_code.extend(sanitize_zip_codes(zip_code_raw))
            elif 'ZIP codes' in data:
                zip_code_raw = [item.strip()for item in data['ZIP codes'].split(',')]
                zip_code.extend(sanitize_zip_codes(zip_code_raw))

            f.write(f"{data['Search str']}|{data['Town name']}|{data['State']}|{zip_code}")
            # print(data['Search str'], data['Town name'], data['State'], zip_code, sep='|')
    # return


def main():
    ssl._create_default_https_context = ssl._create_unverified_context
    pp = pprint.PrettyPrinter(indent=4)
    sleep_time = 2  # 2 second sleep time so google does not block my ip address.
    input_data_uri = r'data/crime_city_state.csv'
    output_data_uri = r'data/scrapped_city_data'

    all_city_data = []
    for index, search_str in enumerate(get_crime_city_state(input_data_uri, output_data_uri)):
        wait = sleep_time * random.randint(1, 10)
        # time to sleep is random to avoid 429 error.
        print(f"{index} waiting for {wait}")
        time.sleep(wait)
        query = f"wikipedia + {search_str}"
        try:
            page = google_search(query)
        except Exception as e:
            print(f"Error|google_search|{index}|{search_str}|{e}")
            continue

        try:
            city_data = extract_city_data(page)
        except Exception as e:
            print(f"Error|extract city data|{index}|{search_str}|{e}")
            continue
        # Add search key so that we can tie this data back to crimes data.

        if city_data:
            city_data['Search str'] = search_str
            with open(pathlib.Path(output_data_uri, f"{search_str.replace(' ', '_')}.json"), "w") as outfile:
                json.dump(city_data, outfile)

        # if index == 5:
        #     break


if __name__ == '__main__':
    main()

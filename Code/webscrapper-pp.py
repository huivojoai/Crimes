import requests
from bs4 import BeautifulSoup
from pprint import pprint as pp

def get_page(url):
    page = requests.get(url)
    return page

root = r'https://www.plannedparenthood.org'

with open(r'./Data/pp-google-maps-urls', 'at', encoding='utf-8') as pp_addr_urls:

    with open(r'./data/state_list', 'rt', encoding='utf-8') as states:
        for index, state in enumerate(states):
            URL = f"{root}/health-center/{state.strip().lower()}"
            print(f"fetching url {URL}")
            page = requests.get(URL)
            soup = BeautifulSoup(get_page(URL).content, "html.parser")
            results = soup.find_all("ul", class_="quicklist-list")

            for element in results:
                li = [li for li in element.find_all('li')]

            for item in li:
                a_tag = item.find_all("a")[0]
                hc_url = f"{root}{a_tag['href']}"
                hc_soup = BeautifulSoup(get_page(hc_url).content, "html.parser")
                hc_results = hc_soup.find_all("a", class_="no-external condensed-map")

                if hc_results:
                    hc_a_tag = hc_results[0]
                else:
                    print(f"hc_results did not find map link. {item}")
                if hc_a_tag:
                    print(hc_a_tag['href'])
                    pp_addr_urls.write(f"{hc_a_tag['href']}\n")
                else:
                    print(f"Cannot find href for {hc_a_tag}")
                # print(hc_results)

import csv
from pprint import pprint as pp
with open(r'./Data/pp-google-maps-urls', 'rt', encoding='utf-8') as f:

    final_addr = []
    clean_address = []
    for url in f:
        url = url.strip().replace('http://maps.google.com/?daddr=', '')
        if url:
            url_parts = url.split(',')
            state = None
            zip = None
            if url_parts:
                for index, value in enumerate(url_parts):
                    url_parts[index] = url_parts[index].replace('+', ' ').strip()
                    try:
                        state = url_parts[2].split(' ')[0]
                        zip = url_parts[2].split(' ')[1]
                    except IndexError as e:
                        # print(e)
                        pass
            url_parts.extend([state, zip])

        clean_address.append(url_parts)

    print(len(clean_address))

with open(r'./Data/final-pp-address', 'wt', encoding='utf-8', newline='') as out:
    write = csv.writer(out)
    for i in clean_address:
        write.writerow(i)

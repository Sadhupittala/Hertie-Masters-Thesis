from dotenv import load_dotenv
import os
import requests
import datetime
import time
import csv

load_dotenv()

bearer_token = os.environ.get("BEARER_TOKEN")

volume_url = "https://api.twitter.com/2/tweets/counts/all"

cruz_query = 'ted cruz OR #cruz2016 lang:en -is:retweet'
bernie = 'bernie sanders OR #feelthebern OR #bernie2016 lang:en'

def bearer_oauth(r):
    """
    Method required by bearer token authentication.
    """

    r.headers["Authorization"] = f"Bearer {bearer_token}"
    r.headers["User-Agent"] = "v2FullArchiveSearchPython"
    return r

def get_query_params(query, start_time, end_time,next_page = None):
    params = {}
    params['query'] = query
    params['start_time'] = start_time.isoformat()
    params['end_time'] = end_time.isoformat()
    params ['granularity'] = 'day'
    if next_page is not None:
        params['next_token'] = next_page
    
    return params


def get_data(params):
    
    res = requests.get(volume_url, params=params, auth=bearer_oauth)
    
    return res


def get_tweets(query, start_date, end_date, data = []): 

    next_page = ""

    while next_page is not None:
        if next_page == "":
            next_page = None
        params = get_query_params(query, start_date,end_date, next_page)
        res = get_data(params)
            
        if res.status_code != 200:
            d = res.json()
            print(res.status_code)
            print(d)

            return data, next_page, start_date
        
        data += res.json().get('data',[])
        next_page = res.json().get('meta',{}).get('next_token')

        
    
    return data, next_page, start_date

if __name__ == "__main__":

    start_date = datetime.datetime(2015, 1, 1).astimezone()
    end_date = datetime.datetime(2016, 11, 30).astimezone()

    data, next_page, start_date = get_tweets(cruz_query, start_date, end_date)
    keys = data[0].keys()

    with open(f'data/cruz-tweet-volume.csv', 'w', newline="") as output:
        dict_writer = csv.DictWriter(output, keys, extrasaction='ignore')
        dict_writer.writeheader()
        dict_writer.writerows(data)
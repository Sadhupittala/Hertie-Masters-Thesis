from dotenv import load_dotenv
import os
import requests
import datetime
import time
from textblob import TextBlob
import csv

load_dotenv()

bearer_token = os.environ.get("BEARER_TOKEN")

search_url = "https://api.twitter.com/2/tweets/search/all"

def bearer_oauth(r):
    """
    Method required by bearer token authentication.
    """

    r.headers["Authorization"] = f"Bearer {bearer_token}"
    r.headers["User-Agent"] = "v2FullArchiveSearchPython"
    return r

def increment_day(date):
    if not isinstance(date, datetime.date):
        raise Exception("Not a datetime object")
    return date + datetime.timedelta(days=1)

def get_query_params(start_time, query, next_page = None):
    params = {}
    params['query'] = query
    params['tweet.fields'] = 'created_at'
    params['sort_order'] = 'relevancy'
    params['start_time'] = start_time.isoformat()
    params['end_time'] = increment_day(start_time).isoformat()
    params['max_results'] = 500
    if next_page is not None:
        params['next_token'] = next_page
    
    return params

def get_data(params):
    
    res = requests.get(search_url, params=params, auth=bearer_oauth)
    
    return res

### Bernie Sanders

def get_tweets(start_date, end_date, query, data = [], next_page = None): 

    while start_date <= end_date:
        ## now we do each day
        print(start_date.isoformat())
        for i in range(0,10):
            # make 10 requests
            params = get_query_params(start_date,query,next_page)
            res = get_data(params)
            
            if res.status_code != 200:
                d = res.json()
                print(res.status_code)
                print(d)
                if d.get('title') == "Too Many Requests":
                    print("Too many requests! Pausing for 15 min")
                    time.sleep(900)
                    continue
                return data, next_page, start_date
            
            data += res.json().get('data',[])
            next_page = res.json().get('meta',{}).get('next_token')
            time.sleep(1)
        
        ## clean up variables, increment the day
        next_page = None
        start_date = increment_day(start_date)
    
    return data, next_page, start_date


if __name__ == "__main__":

################### cruz 2020 ###############################
    start_date = datetime.datetime(2019, 1, 1).astimezone()
    end_date = datetime.datetime(2020, 11, 30).astimezone()
    cruz_query = 'ted cruz OR #cruz2016 lang:en -is:retweet'
    data, next_page, start_date = get_tweets(start_date, end_date, cruz_query)
    keys = data[0].keys()

    with open(f'cruz-{start_date.isoformat()}.csv', 'w', newline="") as output:
        dict_writer = csv.DictWriter(output, keys, extrasaction='ignore')
        dict_writer.writeheader()
        dict_writer.writerows(data)

####################### bernie sanders 2020 ######################
    start_date = datetime.datetime(2019, 1, 1).astimezone()
    end_date = datetime.datetime(2020, 11, 30).astimezone()
    bernie_query = 'bernie sanders OR #feelthebern lang:en -is:retweet'
    data, next_page, start_date = get_tweets(start_date, end_date, bernie_query)
    keys = data[0].keys()

    with open(f'bernie-{start_date.isoformat()}.csv', 'w', newline="") as output:
        dict_writer = csv.DictWriter(output, keys, extrasaction='ignore')
        dict_writer.writeheader()
        dict_writer.writerows(data)
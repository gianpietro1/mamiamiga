# -*- coding: utf-8 -*-
import sys
reload(sys)  # Reload is a hack
sys.setdefaultencoding('UTF8')
import unicodecsv as csv
import urllib
import json
from pprint import pprint

## get media_id
#shorthand = 'BOM4e_oDm0U'
shorthand = 'BOM4zc3AcG2'
media_id_url = 'http://api.instagram.com/oembed?url=http://instagram.com/p/'
media_id = json.load(urllib.urlopen(media_id_url+shorthand))['media_id']
## get comments
access_token = '245688425.1677ed0.112b1143ed9b474bbe1ca7a15f9ec2de'
comments_url = 'https://api.instagram.com/v1/media/'+ media_id + '/comments?access_token=' + access_token
comments = json.load(urllib.urlopen(comments_url))['data']

girl = ["niña","princesa","Niña","NIÑA"]
boy = ["niño","Niño","NIÑO"]

people = []
def get_table():
  for item in comments:
    username = item['from']['username']
    text = item['text']
    if any(x in text for x in girl):
      child = 'niña'
    elif any(x in text for x in boy):
      child = 'niño'
    else:
      child = text
    if '@' in text:
      opp = '+1'
    else:
      opp = ''
    person = [username,child.encode('utf-8'),opp]
    people.append(person)
  return people

with open("output.csv", "wb") as f:
    writer = csv.writer(f)
    writer.writerows(get_table())
'''
Used this to read in data from a .csv file
and then input that data into a JSON object
for loading into my database for a django app
'''

import csv
from random import randint

with open(r'BIGGGDATA_PART2.CSV') as csv_file:
    reader=csv.reader(csv_file, delimiter=',')
    for index,r in enumerate(reader):
        address = r[0]
        sqft = r[1]
        price = r[2]
        category = r[3]
        zipcode = randint(1,37)
        print("{\"model\": \"ll_app.listing\", \"pk\":" +str(index+1) + ", \"fields\": {\"user\":1, \"listing_zipcode\":"+ str(zipcode) + ", \"address\":\""+address+
"\", \"sqft\":"+sqft+", \"category\":"+category+", \"title\":\""+address+"\", \"price_currency\": \"USD\", \"price\":\""+price+"\", \"summary\":\"For Sale\"}},")

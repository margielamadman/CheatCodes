import csv
from sys import argv

'''
run through all latitudes and longitudes
checking for any value that has less 
than 4 decimal places

pipe the result into 'sort -n'
to get the list of ids to update
'''

filename = argv[1]
with open(filename, 'r') as csv_file:
        reader = csv.reader(csv_file, delimiter=',')
        for index,r in enumerate(reader):
            if index is not 0:
                lat = r[12].split('.')
                if len(lat[1]) < 4:
                    print(r[11])
                longitude = r[13].split('.')
                if len(longitude[1]) < 4:
                    print(r[11])

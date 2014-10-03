import os
import sys
import cgi
if 'QUERY_STRING' in os.environ:
    query = cgi.parse_qs(os.environ['QUERY_STRING'])
else:
    query = {}

line = int(query['line'][0])
filename = query['name'][0])

file = open(filename,"r")

i=0

for data in file:
    if i== line:
        print data
    i++
    
file.close()

import csv
import sys

fields=[]
rows=[]

with open("top-1m.csv",'r') as csvfile:
    csvreader=csv.reader(csvfile)
    
    for row in csvreader:
        rows.append(row)
    

file1=open("websites.txt","w")

for row in rows[:int(sys.argv[1])]:
    for col in row[1:]:
        file1.write("%s\n"%col)

file1.close()

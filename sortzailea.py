import csv
import os
import random as rm

def createFile(path):
    if not os.path.exists(path):
        os.makedirs(os.path.dirname(path), exist_ok=True)

author_paper_directory = "nips-papers/paper_authors.csv"
new_instance = "./new_instance.csv"
createFile(new_instance)

def instantzia_berria_sortu(k):
    #open csv files
    mycsv = open(author_paper_directory)
    kopurua = int(mycsv.readlines()[-1].split(",")[0])
    print(kopurua)
    mycsv = csv.reader(open(author_paper_directory))
    kasuak = rm.sample([i for i in range(1, kopurua+1)], k)
    cont = 0
    first_line = ["id", "paper_id", "author_id"]
    # open the csv file
    myFile = open(new_instance, 'a')
    writer = csv.writer(myFile)
    writer.writerow(first_line)
    for line in mycsv:
        cont += 1
        if cont in kasuak:
            # open the csv file
            myFile = open(new_instance, 'a')
            writer = csv.writer(myFile)
            writer.writerow(line)

instantzia_berria_sortu(100)


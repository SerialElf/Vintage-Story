import os
import csv

modsSite = "https://mods.vintagestory.at/"
downloadSite = "https://mods.vintagestory.at/download?fileid="
f = open('downloadList.txt', 'r')

modList = []
for line in f:
    # Split on any whitespace (including tab characters)
    row = line.split()
    # Append to our list of lists:
    modList.append(row)

print (modList)

def download(id, name):
    command = "wget " +downloadSite +id + " -O " +name +".zip"
    print(command)
    # os.system(command)

for id,name in modList:
    print(id, name)
    download(id, name)
#! /bin/bash

#ENDPOINTS CRAWLING

waymore -i subs -oU way

echo "--------running katana-----------"

proxychains4 urlfinder -list subs -all -v -o url


proxychains4 cat subs | katana -d 6 -s breadth-first  -r ./resolvers.txt  -jc -kf -fx -xhr -ef woff,css,png,svg,jpg,woff2,jpeg,gif,svg | tee -a katana


echo "=========RUNNING HAKRAWLER============"
proxychains4  cat katana | hakrawler -d 6 -subs -u -t 16 | tee -a hakr

cat katana hakr url way | uniq | tee -a endpoints




#!/bin/bash

curl -s https://query2.finance.yahoo.com/v8/finance/chart/$1 | grep -oP "\"regularMarketPrice\":[^,]+" | sed 's|.*:|$|'

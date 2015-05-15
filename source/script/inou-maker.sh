#!/bin/bash
curl http://c2maker.inou-anime.com/detail.php\?pid\=$RANDOM | grep yomi -A 1 | sed -e 's/<[^>]*>//g' | tr -d ' '

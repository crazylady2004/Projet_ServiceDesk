#!/bin/bash
page=$1

#récuperation de la racine de l'url $1
json="?rest_route=/wp/v2/"
URL_json=$1$json
racine=`curl $URL_json | jq '._links.up | .[0].href'`
sans_json=$(echo $racine | awk '{ print substr( $0, 1, length($0)-9 ) }' | sed 's/^.//')


# récuperation de l'id
id=`curl $sans_json'?rest_route=/wp/v2/pages/' | jq '.[] | select(.link=="'$1'") | .id'`
echo $id


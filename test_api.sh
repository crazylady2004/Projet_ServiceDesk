#!/bin/bash
URL="http://localhost/Dodos/index.php/"
page=$1
URL_page='"'$URL$page'/"'
echo $URL_page
id=`curl 'http://localhost/Dodos/?rest_route=/wp/v2/pages/' | jq '.[] | select(.link=='$URL_page') | .id'`
echo $id


json="?rest_route=/wp/v2/"
URL_json=$1$json
test=`curl $URL_json | jq '._links.up | .[0].href'`
echo $test;

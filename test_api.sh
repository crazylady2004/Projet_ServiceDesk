#!/bin/bash
URL="http://localhost/Dodos/"
page=$1
URL_page='"'$URL$page'/"'
echo $URL_page
id=`curl 'http://localhost/Dodos/?rest_route=/wp/v2/pages/' | jq '.[] | select(.link=='$URL_page') | .id'`
echo $id

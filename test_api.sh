#!/bin/bash
URL=$1
json="/?rest_route=/wp/v2/"
URL_json=$URL$json

#récuperation de la racine de l'url $1
original_url=`curl $URL_json | jq '._links.up | .[0].href'`
racine_url=$(echo $original_url | awk '{ print substr( $0, 1, length($0)-9 ) }' | sed 's/^.//')

# récuperation de l'id
id=`curl $racine_url'wp-json/wp/v2/pages/?per_page=20' | jq '.[] | select(.link=="'$URL'") | .id'`

#récup. date_modified / ID_Users
requet_tab=`wp db query --skip-column-names "SELECT post_author, post_modified FROM wp_posts WHERE post_parent=$id and post_type='revision' ORDER by post_date desc limit 1"`
Tableau=($requet_tab)



# récuperation du user_name
# "curl https://migration-wp.epfl.ch/emilie/wp-json/wp/v2/users/3 | jq '.name'"
user_name=`curl $racine_url'wp-json/wp/v2/users/'${Tableau[0]} | jq '.name'`

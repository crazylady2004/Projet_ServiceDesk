#!/bin/bash
URL=$1
json="/?rest_route=/wp/v2/"
URL_json=$URL$json

#récuperation de la racine de l'url $1
original_url=`curl $URL_json | jq '._links.up | .[0].href'`
racine_url=$(echo $original_url | awk '{ print substr( $0, 1, length($0)-9 ) }' | sed 's/^.//')

# récuperation de l'id
id=`curl $racine_url'wp-json/wp/v2/pages/' | jq '.[] | select(.link=="'$URL'") | .id'`
echo $id

#nom de la page
name_page=`curl $racine_url'wp-json/wp/v2/pages/'$id | jq '.slug'`
echo $name_page

#récup. date_modified / ID_Users
# Tab_wp=`wp db query --skip-column-names "SELECT post_author, post_modified FROM wp_posts WHERE post_parent=77 and post_type='revision' ORDER by post_date limit 1"`

# # récuperation de l'id_user
# id_user=`curl $sans_json'wp-json/wp/v2/' | jq '.[] | select(.link=="'$1'") | .author'`

# # récuperation du user_name
# User_name=`curl $1'wp-json/wp/v2/'$id_user | jq '.name'`
# echo $User_name

#  curl $sans_json'wp-json/wp/v2/pages' | jq '.[] | select(.link=="https://migration-wp.epfl.ch/emilie/education-fr/sous-page-fr-3/")'
#  curl $sans_json'wp-json/wp/v2/pages' | jq '.[] | select(.link=="https://migration-wp.epfl.ch/emilie/en/education-en/sous-page-en-1/")'  
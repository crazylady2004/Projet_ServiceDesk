<?php
function get_the_modified_author_epfl($id) {
    $last_id = get_post_meta( $id, '_edit_last', true );
 
    if ( $last_id ) {
        $last_user = get_userdata( $last_id );
 
       
         
        return apply_filters( 'the_modified_author', $last_user->display_name );
    }
}
echo "voici le user".get_the_modified_author_epfl(3);
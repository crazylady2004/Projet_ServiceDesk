<?php

add_action( 'rest_api_init', function() {
        register_rest_route( 'revisions/v2', 'epfl-funciton/(?<id>.*)', array (
                'method'   => WP_REST_Server::READABLE,
                'callback' => 'get_test'
        ) );
} );
function get_test($request) {
        $titre = get_the_title($request['id']);
        $modif = get_the_modified_date('Y-m-d H:i:s',$request['id']);
        $user = get_the_modified_author( $request['id']);

        return rest_ensure_response ($user -> display_name);


}

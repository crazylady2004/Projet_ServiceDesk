<?php
  
add_action( 'rest_api_init', function() {
        register_rest_route( 'test/v2', 'toto/(?<id>.*)', array (
                'method'   => WP_REST_Server::READABLE,
                'callback' => 'get_test'
        ) );
} );
function get_test($request) {
        $titre = get_the_title($request['id']);

        return rest_ensure_response ($titre);


}
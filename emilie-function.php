<?php
  
add_action( 'rest_api_init', function() {
        register_rest_route( 'test/v2', 'toto', array (
                'method'   => WP_REST_Server::READABLE,
                'callback' => 'awhitepixel_rest_route_getsomedata'
        ) );
} );
function awhitepixel_rest_route_getsomedata($post_ID) {
        $titre = get_the_title(135);
        return rest_ensure_response ($titre);

}
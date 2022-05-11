<?php
  
add_action( 'rest_api_init', function() {
        register_rest_route( 'test/v2', '/toto', [
                'method'   => WP_REST_Server::READABLE,
                'callback' => 'awhitepixel_rest_route_getsomedata',
        ] );
} );
function awhitepixel_rest_route_getsomedata( $request ) {
 $name = $request->get_param('name');

        return rest_ensure_response("hello {$name}!");
}
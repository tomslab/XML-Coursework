function clickSidebar() {
	$( '#category' ).click( function() {
		$( '#category-dropdown' ).slideToggle( 1000, "easeOutExpo" );
		$( '#certificate-dropdown' ).slideUp( 1000, "easeOutExpo" );
		$( '#rating-dropdown' ).slideUp( 1000, "easeOutExpo" );
	});
	$( '#certificate' ).click( function() {
		$( '#certificate-dropdown' ).slideToggle( 1000, "easeOutExpo" );
		$( '#category-dropdown' ).slideUp( 1000, "easeOutExpo" );
		$( '#rating-dropdown' ).slideUp( 1000, "easeOutExpo" );
	});
	$( '#rating' ).click( function() {
		$( '#rating-dropdown' ).slideToggle( 1000, "easeOutExpo" );
		$( '#certificate-dropdown' ).slideUp( 1000, "easeOutExpo" );
		$( '#category-dropdown' ).slideUp( 1000, "easeOutExpo" );
	});
}
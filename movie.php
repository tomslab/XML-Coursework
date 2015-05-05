<?php include('head.php'); ?>

<div class="container-fluid">
	<div class="row">
		<?php include('sidebar.php'); ?>
		<main class="col-xs-12 col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">

			<!-- <div class="col-xs-12"> -->

			<div class="row">

				<div id="content"></div>

			</div>

		</main>
	</div>
</div>



<footer>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
	<script type="text/javascript" src="m-xml.js"></script>
	<script type="text/javascript" src="js/sidebar.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/slick.js"></script>
	<script>
		$('document').ready(function() {

			var id = getQueryVariable('id');
			var id = id.replace(/%20/g, " ");
			window.console.log(id);

			updateSidebar();
			clickSidebar();

			// var artistValue = $( '#artistChoice' ).val();
			// window.console.log(artistValue);
			updateList(id);
			// console.log('run parse');
			// magicXML.parse();
			updateCast(id);

			slider();

			castOrganiser();

			$( ".rating" ).each(function( index ) {
				var filmRating = $( this ).text();
				if( filmRating != '' ) {
					var filmRating = parseFloat( filmRating );
					var filmRating = Math.round( filmRating );
					var filmRating = filmRating / 2;
					if( filmRating > 5 ) {
						filmRating = 5;
					}
					var decimalCheck = filmRating.toString();
					var decimalCheck = decimalCheck.indexOf(".");
					if( decimalCheck > -1 ) {
						var fullStars = Math.floor( filmRating );
						var filmRatingBuilder = '';
						for( var i = 0; i < fullStars; i++ ) {
							var filmRatingBuilder = filmRatingBuilder + ' <i class="fa fa-star"></i>';
						}
						var filmRatingBuilder = filmRatingBuilder + ' <i class="fa fa-star-half-o"></i>';
						if( filmRating != 5 ) {
							var filmRatingRemaining = 4 - filmRating;
							for( var i = 0; i < filmRatingRemaining; i++ ) {
								var filmRatingBuilder = filmRatingBuilder + ' <i class="fa fa-star-o"></i>';
							}
						}
					} else {
						var filmRatingBuilder = '';
						for( var i = 0; i < filmRating; i++ ) {
							var filmRatingBuilder = filmRatingBuilder + ' <i class="fa fa-star"></i>';
						}
						if( filmRating != 5 ) {
							var filmRatingRemaining = 5 - filmRating;
							for( var i = 0; i < filmRatingRemaining; i++ ) {
								var filmRatingBuilder = filmRatingBuilder + ' <i class="fa fa-star-o"></i>';
							}
						}
					}
					$( this ).html( filmRatingBuilder );
				} else {
					var filmRatingBuilder = '';
					for( var i = 0; i < 5; i++ ) {
						var filmRatingBuilder = filmRatingBuilder + ' <i class="fa fa-star-o" style="color: #999;"></i>';
					}
					$( this ).html( filmRatingBuilder );
				}
			});

});

function getQueryVariable(variable) {
	var query = window.location.search.substring(1);
	var vars = query.split("&");
	for (var i=0;i<vars.length;i++) {
		var pair = vars[i].split("=");
		if(pair[0] == variable){return pair[1];}
	}
	return(false);
}

function updateSidebar() {
	$( 'nav' ).html('<div id="nav-inner"></div>');
	magicXML.transformAndReplace("#nav-inner", "movies.xml", "sidebar.xslt");
};

function updateList(value) {
	$( '#content' ).html('<div id="content-inner"></div>');
	magicXML.transformAndReplace("#content-inner", "movies.xml", "film.xslt", [{ "name" : "id", "value": value }]);
};

function updateCast(value) {
	$( '#cast' ).html('<div id="cast-inner"></div>');
	magicXML.transformAndReplace("#cast-inner", "talent.xml", "cast.xslt", [{ "name" : "id", "value": value }]);
}

function watchTrailer() {
	//window.console.log('qwerty');
	$( '#trailer' ).slideToggle(1000, 'swing');
	if( $( '#trailer-button' ).text() == 'Watch trailer' ) {
		$( '#trailer-button' ).text( 'Close trailer' ).removeClass( 'btn-primary' ).addClass( 'btn-danger' );
		$( '#trailer-mobile-button' ).text( 'Close trailer' ).removeClass( 'btn-primary' ).addClass( 'btn-danger' );
	} else {
		$( '#trailer-button' ).text( 'Watch trailer' ).removeClass( 'btn-danger' ).addClass( 'btn-primary' );
		$( '#trailer-mobile-button' ).text( 'Watch trailer' ).removeClass( 'btn-danger' ).addClass( 'btn-primary' );
	}
	$( '.jumbotron' ).toggleClass( 'faded' );
};

function playSoundtrack() {
	//window.console.log('qwerty');
	$( '#soundtrack' ).slideToggle(1000, 'swing');
	if( $( '#soundtrack-button' ).text() == 'Play soundtrack' ) {
		$( '#soundtrack-button' ).text( 'Close soundtrack' ).removeClass( 'btn-info' ).addClass( 'btn-danger' );
	} else {
		$( '#soundtrack-button' ).text( 'Play soundtrack' ).removeClass( 'btn-danger' ).addClass( 'btn-info' );;
	}
	$( '.jumbotron' ).toggleClass( 'faded' );
};

function playSoundtrackMobile() {
	//window.console.log('qwerty');
	$( '#soundtrack-mobile' ).slideToggle(1000, 'swing');
	if( $( '#soundtrack-mobile-button' ).text() == 'Play soundtrack' ) {
		$( '#soundtrack-mobile-button' ).text( 'Close soundtrack' ).removeClass( 'btn-info' ).addClass( 'btn-danger' );
	} else {
		$( '#soundtrack-mobile-button' ).text( 'Play soundtrack' ).removeClass( 'btn-danger' ).addClass( 'btn-info' );;
	}
	$( '.jumbotron' ).toggleClass( 'faded' );
};

function slider() {
	$('.media-container').slick({
		infinite: true,
		speed: 300,
		slidesToShow: 2,
		slidesToScroll: 2,
		centerMode: false,
		arrows: false,
		dots: true,
		//variableWidth: true,
		autoplay: true,
		autoplaySpeed: 3000,
		responsive: [
		{
			breakpoint: 1024,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1,
				infinite: true,
				dots: true
			}
		},
		{
			breakpoint: 600,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1
			}
		},
		{
			breakpoint: 480,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1
			}
		}
		]
	});
};

function castOrganiser() {
	$( "#cast .row .cast-node:nth-child(6n)" ).after( "<div class='clearfix hidden-xs'></div>" );
}

function seeFullCast() {
	$( "#additionalCast" ).slideToggle(1000, 'swing');
}

</script>
</footer>

</body>

</html>
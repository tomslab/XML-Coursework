<?php include('head.php'); ?>

<div class="container-fluid">
	<div class="row">
		<?php include('sidebar.php'); ?>
		<main class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">

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
	<script>
		$('document').ready(function() {

			var id = getQueryVariable('id');
			var id = id.replace(/%20/g, " ");
			window.console.log(id);

			updateSidebar();

			// var artistValue = $( '#artistChoice' ).val();
			// window.console.log(artistValue);
			updateList(id);
			// console.log('run parse');
			// magicXML.parse();

			var filmRating = $('#ratingCalc').text();
			if( filmRating != NaN ) {
				var filmRating = parseFloat(filmRating);
				var filmRating = Math.round( filmRating );
				if( filmRating > 5 ) {
					filmRating = 5;
				}
				window.console.log( filmRating );
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
					// <i class="fa fa-star"></i>
					$( '#ratingContainer' ).html( filmRatingBuilder );
				} else {
					$( '#ratingContainer' ).html( "Not rated" );
				}

				$( '#category' ).click( function() {
					$( '#category-dropdown' ).slideToggle( 1000, "easeOutExpo" );
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
	magicXML.transformAndReplace("#nav-inner", "movies.xml", "genres.xslt");
};

function updateList(value) {
	$( '#content' ).html('<div id="content-inner"></div>');
	magicXML.transformAndReplace("#content-inner", "movies.xml", "film.xslt", [{ "name" : "id", "value": value }]);
};
</script>
</footer>

</body>

</html>
<?php include('head.php'); ?>

<div class="container-fluid">
	<div class="row">

		<?php include('sidebar.php'); ?>

		<main class="col-xs-12 col-sm-10 col-sm-offset-2">

			<div class="row">

				<div id="breadcrumbs"></div>

				<div id="talentName" class="col-xs-12"></div>

				<div id="infoBox" class="col-xs-12 col-sm-4 col-md-3"></div>

				<div id="content" class="col-xs-12 col-sm-8 col-md-9"></div>

			</div>

		</main>
	</div>
</div>



<footer>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="m-xml.js"></script>
	<script type="text/javascript" src="js/sidebar.js"></script>
	<script>
		$('document').ready(function() {

			var talent = getQueryVariable('name');
			var talent = talent.replace(/%20/g, " ");

				// var artistValue = $( '#artistChoice' ).val();
				// window.console.log(artistValue);
				updateSidebar();
				clickSidebar();
				updateBreadcrumbs(talent);
				updateTalentName(talent);
				updateInfoBox(talent);
				updateList(talent);

				$( '#category' ).click( function() {
					$( '#category-dropdown' ).slideToggle( 1000, "easeOutExpo" );
				});

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


function updateBreadcrumbs(value) {
	window.console.log(value);
	$( '#breadcrumbs' ).html('<div id="breadcrumbs-inner"></div>');
	magicXML.transformAndReplace("#breadcrumbs-inner", "movies.xml", "breadcrumb.xslt", [{ "name" : "element", "value": value }]);
};

function updateTalentName(value) {
	window.console.log(value);
	$( '#talentName' ).html('<div id="talentName-inner"></div>');
	magicXML.transformAndReplace("#talentName-inner", "talent.xml", "talentName.xslt", [{ "name" : "talent", "value": value }]);
};

function updateInfoBox(value) {
	window.console.log(value);
	$( '#infoBox' ).html('<div id="infoBox-inner"></div>');
	magicXML.transformAndReplace("#infoBox-inner", "talent.xml", "infoBox.xslt", [{ "name" : "talent", "value": value }]);
};

function updateList(value) {
	window.console.log(value);
	$( '#content' ).html('<div id="content-inner"></div>');
	magicXML.transformAndReplace("#content-inner", "movies.xml", "nameList.xslt", [{ "name" : "talent", "value": value }]);
};
</script>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

</footer>

</body>

</html>
<?php include('head.php'); ?>

<div class="container-fluid">
	<div class="row">

		<?php include('sidebar.php'); ?>

		<main class="col-xs-10 col-xs-offset-2 col-md-10 col-md-offset-2">

			<div class="row">

				<div id="content"></div>

			</div>

		</main>
	</div>
</div>



<footer>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="m-xml.js"></script>
	<script>
		$('document').ready(function() {
				// var artistValue = $( '#artistChoice' ).val();
				// window.console.log(artistValue);

				updateSidebar();

				updateList('releaseDate', 'descending');
				$( '#releaseDate' ).css('color','#333');
				$( '#releaseDate' ).css('font-weight','700');

				rebindEvents();

				// console.log('run parse');
				// magicXML.parse();
				$( '#category' ).click( function() {
					$( '#category-dropdown' ).slideToggle( 1000, "easeOutExpo" );
				});
			});

		function rebindEvents() {
			$( '#filter a' ).click( function() {
				var elementVal = $( this ).text();
				switch( elementVal ) {
					case "Alphabetical":
						updateList('titles', 'ascending');
						$( '#titles' ).css('color','#333');
						$( '#titles' ).css('font-weight','700');
						break;
					case "Highest rated":
						updateList('rating', 'descending');
						$( '#rating' ).css('color','#333');
						$( '#rating' ).css('font-weight','700');
						break;
					case "Most recent":
						updateList('releaseDate', 'descending');
						$( '#releaseDate' ).css('color','#333');
						$( '#releaseDate' ).css('font-weight','700');
						break;
					default:
						window.console.log('default');
				}
			});
		}

		function updateSidebar() {
			$( 'nav' ).html('<div id="nav-inner"></div>');
			magicXML.transformAndReplace("#nav-inner", "movies.xml", "genres.xslt");
		};

		function updateList(sort, order) {
			window.console.log(sort + ", " + order);
			$( '#content' ).html('<div id="content-inner"></div>');
			magicXML.transformAndReplace("#content-inner", "movies.xml", "home.xslt", [{ "name" : "sortBy", "value": sort }, { "name" : "order", "value" : order }]);
			rebindEvents()
		};
	</script>
</footer>

</body>

</html>
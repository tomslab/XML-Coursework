<?php include('head.php'); ?>

	<div class="container-fluid">
		<div class="row">

			<?php include('sidebar.php'); ?>

			<main class="col-md-10 col-md-offset-2">

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

				var talent = getQueryVariable('name');
				var talent = talent.replace(/%20/g, " ");
				window.console.log(talent);

				// var artistValue = $( '#artistChoice' ).val();
				// window.console.log(artistValue);
				updateList(talent);

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

			function updateList(value) {
				window.console.log(value);
				$( '#content' ).html('<div id="content-inner"></div>');
				magicXML.transformAndReplace("#content-inner", "movies.xml", "name.xslt", [{ "name" : "talent", "value": value }]);
			};
		</script>
	</footer>

</body>

</html>
<!DOCTYPE html>

<html>
	<head>
		<style>
			body {
				margin-top: 25vh;
				text-align: center;
				font: 2vw "Arial";
			}
		</style>
		<title>Christmas Tree</title>
	</head>
	
	<body>
		<?php
			for ($iRow = 1; $iRow <= 10; $iRow++) {
				for ($iCol = 0; $iCol < $iRow; $iCol++) {
					echo "*";
				}
				echo "<br>";
			}
		?>
	</body>
</html>
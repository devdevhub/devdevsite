<!DOCTYPE html>

<html>
	<head>
		<style>
			p {
				margin-top: 25vh;
				text-align: center;
				font: 2vw "Arial";
			}
		</style>
		<title>Busride</title>
	</head>
	
	<body>
		<?php
			function busride($age) {
				if ($age < 3) {
					return 0;
				}
				else if ($age <= 12 || $age > 65) {
					return 5;
				}
				else {
					return 10;
				}
			}
			
			echo "<p>Age: 10, price: €".busride(10).",-<br>";
			echo "Age: 2, price: €".busride(2).",-<br>";
			echo "Age: 65, price: €".busride(65).",-<br>";
			echo "Age: 12, price: €".busride(12).",-</p>";
		?>
	</body>
</html>
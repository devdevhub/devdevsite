<!DOCTYPE html>

<html>
	<head>
		<style>
			form, div {
				margin-top: 50px;
				text-align: center;
				font: 16px "Arial";
			}
			input[type="submit"] {
				margin: 5px 5px;
			}
			img {
				margin: 5px;
				border: 1px solid black;
				width: 200px;
				height: 120px;
			}
		</style>
		<title>Beasties</title>
	</head>
	
	<body>
		<form method="post">
			<?php
				$animalArray = array(
					"aap", "koe", "schaap", "vis", "vogel"
				);
				foreach ($animalArray as $animal) {
						echo '<input type="checkbox" name="animal[]" id="'.$animal.'" value="'.$animal.'">';
						echo '<label for="'.$animal.'">'.ucfirst($animal).'</label>';
						echo '<br>';
				}
			?>
			<input type="submit" value="Submit">
		</form>
		<?php
			if ($_POST != null) {
				foreach ($_POST["animal"] as $animal) {
					echo "<img src='beasties/".$animal.".png'>";
				}
			}
		?>
	</body>
</html>
<!DOCTYPE html>

<html>
	<head>
		<style>
			form, div {
				margin-top: 50px;
				text-align: center;
				font: 16px "Arial";
			}
			input[type="text"], [type="password"] {
				margin: 3px 5px;
			}
			input[type="submit"] {
				margin: 5px 5px;
			}
		</style>
		<title>Dynamical Website</title>
	</head>
	
	<body>
		<?php
			function isValid() {
				if ($_POST["name"] == ""
				|| $_POST["address"] == ""
				|| $_POST["email"] == ""
				|| $_POST["password"] == "") {
					return false;
				}
				else {return true;}
			}
			if (!$_POST["button"] || !isValid()) {
				echo '<form action="" method="post">';
					$valid = true;
					echo '<br><input type="text" name="name" placeholder="Name" value="'.$_POST["name"].'">';
					if ($_POST["button"] && $_POST["name"] == "") {
						echo "Field required.";
						$valid = false;
					}
					echo '<br><input type="text" name="address" placeholder="Adress" value="'.$_POST["address"].'">';
					if ($_POST["button"] && $_POST["address"] == "") {
						echo "Field required.";
						$valid = false;
					}
					echo '<br><input type="text" name="email" placeholder="E-mail" value="'.$_POST["email"].'">';
					if ($_POST["button"] && $_POST["email"] == "") {
						echo "Field required.";
						$valid = false;
					}
					echo '<br><input type="password" name="password" placeholder="Password" value="'.$_POST["password"].'">';
					if ($_POST["button"] && $_POST["password"] == "") {
						echo "Field required.";
						$valid = false;
					}
					echo '<br><input type="submit" name="button" value="Log in">';
				echo '</form>';
			}
			if ($_POST["button"] && isValid()) {
				echo "<div>";
					echo "<br>Name: ".$_POST["name"];
					echo "<br>Address: ".$_POST["address"];
					echo "<br>Email: ".$_POST["email"];
					echo "<br>Password: ";
					for ($i = 0; $i < iconv_strlen($_POST["password"]); $i++) {
						echo "&bull;";
					}
				echo "</div>";
			}
		?>
	</body>
</html>
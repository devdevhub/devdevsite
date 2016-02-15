<!DOCTYPE html>

<html>
	<head>
		<style>
			body {
				margin-top: 15vh;
				text-align: center;
				font: 2vw "Arial";
			}
			h1 {
				font: bold 3vw "Arial";
			}
			form, select, input, button {
				margin: 5px;
				font: 1vw "Arial";
				text-align: center;
			}
			table {
				margin: 50px auto;
			}
			th {
				text-decoration: underline;
				padding: 10px 30px;
			}
			td {
				padding: 5px 20px;
			}
		</style>
		<title>Hairdresser Sanders</title>
	</head>
	
	<body>
		<?php
			$kappersagenda = array(
					"9:00" => $_POST['array'][0],
					"9:15" => $_POST['array'][1],
					"9:30" => $_POST['array'][2],
					"9:45" => $_POST['array'][3],
					"10:00" => $_POST['array'][4],
					"10:15" => $_POST['array'][5],
					"10:30" => $_POST['array'][6],
					"10:45" => $_POST['array'][7]
			);
			if ($_POST['time'] != null) {
				$kappersagenda[$_POST['time']] = $_POST['name'];
			}
		?>
		
		<!-- FORMULIER -->
		<h1>Maak een afspraak:</h1>
		<form action="hairdressersanders" method="post">
			De volgende momenten zijn nog beschikbaar:
			<select name="time">
				<?php
					foreach($kappersagenda as $tijdstip => $klantnaam) {
						if($klantnaam == "") {
							print("<option>".$tijdstip."</option>");
						}
					}
				?>
			</select>
			<br>
			<input type="text" name="name" placeholder="Voor- en achternaam">
			<br>
			<button type="submit" name="submit">Submit</button>
			<?php
				foreach($kappersagenda as $klantnaam) {
					echo "<input type='hidden' name='array[]' value='".$klantnaam."'>";
				}
			?>
		</form>
		
		<!-- OVERZICHT -->
		<?php
			echo("<table>");
				echo "<tr><th>Tijdstip</th><th>Klantnaam</th></tr>";
				foreach($kappersagenda as $tijd => $afspraak) {
					if ($afspraak == "") {
						echo "<tr><td>".$tijd."</td></tr>";
					}
					else {
						echo("<tr><td>".$tijd."</td><td>".$afspraak."<td></tr>");
					}
				}
			echo("</table>");
		?>
	</body>
</html>
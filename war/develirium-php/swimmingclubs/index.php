<!DOCTYPE html>

<html>
	<head>
		<style>
			table {
				border-collapse: collapse;
				margin: 25vh auto;
				font: 2vw "Arial";
			}
			td {
				padding: 10px 20px;
				border: 1px solid black;
			}
			img {
				width: 25px;
				height: 25px;
				margin: 0px 2px;
			}
		</style>
		<title>Swimming Clubs</title>
	</head>
	
	<body>
		<?php
			$clublist = array(
				array("name" => "De spartelkuikens", "nMembers" => 25),
				array("name" => "De waterbuffels", "nMembers" => 32),
				array("name" => "Plonsmderin", "nMembers" => 11),
				array("name" => "Bommetje", "nMembers" => 23)
			);
			
			echo "<table>";
				foreach ($clublist as $club) {
					echo "<tr>";
						echo "<td>".$club["name"]."</td>";
						echo "<td>".$club["nMembers"]." ";
						$nImages = ($club["nMembers"]-($club["nMembers"]%5))/5;
							for ($i = 0; $i < $nImages; $i++) {
								echo "<img src='swimmingclubs/swimmer.png' alt=''>";
							}
						echo "</td>";
					echo "</tr>";
				}
			echo "</table>";
		?>
	</body>
</html>
<?php
	include 'functies.php';
	include 'header.php';
	
	echo "<table>";
		foreach (getArray() as $artistAlbum) {
			echo "<tr>";
				echo "<td>".$artistAlbum["artist"]."</td>";
				echo "<td>".$artistAlbum["album"]."</td>";
			echo "</tr>";
		}
	echo "</table>";
	
	include 'footer.php';
?>
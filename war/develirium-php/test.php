<?php
	$alle[0] = 12;
	$alle[3] = 5; //Tja, a[1] en a[2] bestaan dus niet!!
	$alle[4] = 6;

	foreach ($alle as $index => $enkele) {
		echo "&#36;alle&#91;$index&#93; = ".$enkele."<br>";
	}
	
	
	$x = 3;
	function telOp($a, $b) {
		global $x;
		$c = $a + $b * $x;
		return $c;
	}
	
	echo "<br>".telOp(12, 10);
	
	
	function debug_to_console($data) {
		if (is_array($data)) {
			$output = "<script>console.log('Debug Objects: ".implode(',', $data)."');</script>";
		}
		else {
			$output = "<script>console.log('Debug Objects: ".$data."');</script>";
		}
		echo $output;
	}
	// 					debug_to_console($tijd." ~ ".$afspraak);
?>
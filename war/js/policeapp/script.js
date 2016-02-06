var foreArray = ["forehead1.jpg", "forehead2.jpg", "forehead3.jpg", "forehead4.jpg", "forehead5.jpg"];
var midArray = ["midhead1.jpg", "midhead2.jpg", "midhead3.jpg", "midhead4.jpg", "midhead5.jpg"];
var underArray = ["underhead1.jpg", "underhead2.jpg", "underhead3.jpg", "underhead4.jpg", "underhead5.jpg"];
var indexFore = 0;
var indexMid = 0;
var indexUnder = 0;

$('#fore .next').click(function() {
	indexFore++;
	$('#fore img').animate(
		{"left": "-200%"},
		1000,
		function() {
			$('#imgPreviousFore').attr('src', foreArray[(indexFore+4)%foreArray.length]);
			$('#imgCurrentFore').attr('src', foreArray[indexFore%foreArray.length]);
			$('#imgNextFore').attr('src', foreArray[(indexFore+1)%foreArray.length]);
			$('#fore img').css("left", "-100%");
		}
	);
});
$('#mid .next').click(function() {
	indexMid++;
	$('#mid img').animate(
		{"left": "-200%"},
		1000,
		function() {
			$('#imgPreviousMid').attr('src', midArray[(indexMid+4)%midArray.length]);
			$('#imgCurrentMid').attr('src', midArray[indexMid%midArray.length]);
			$('#imgNextMid').attr('src', midArray[(indexMid+1)%midArray.length]);
			$('#mid img').css("left", "-100%");
		}
	);
});
$('#under .next').click(function() {
	indexUnder++;
	$('#under img').animate(
		{"left": "-200%"},
		1000,
		function() {
			$('#imgPreviousUnder').attr('src', underArray[(indexUnder+4)%underArray.length]);
			$('#imgCurrentUnder').attr('src', underArray[indexUnder%underArray.length]);
			$('#imgNextUnder').attr('src', underArray[(indexUnder+1)%underArray.length]);
			$('#under img').css("left", "-100%");
		}
	);
});

$('#fore .previous').click(function() {
	indexFore--;
	if (indexFore < 0) {indexFore += 5;}
	$('#fore img').animate(
		{"left": "0%"},
		1000,
		function() {
			$('#imgPreviousFore').attr('src', foreArray[(indexFore+4)%foreArray.length]);
			$('#imgCurrentFore').attr('src', foreArray[indexFore%foreArray.length]);
			$('#imgNextFore').attr('src', foreArray[(indexFore+1)%foreArray.length]);
			$('#fore img').css("left", "-100%");
		}
	);
});
$('#mid .previous').click(function() {
	indexMid--;
	if (indexMid < 0) {indexMid += 5;}
	$('#mid img').animate(
		{"left": "0%"},
		1000,
		function() {
			$('#imgPreviousMid').attr('src', midArray[(indexMid+4)%midArray.length]);
			$('#imgCurrentMid').attr('src', midArray[indexMid%midArray.length]);
			$('#imgNextMid').attr('src', midArray[(indexMid+1)%midArray.length]);
			$('#mid img').css("left", "-100%");
		}
	);
});
$('#under .previous').click(function() {
	indexUnder--;
	if (indexUnder < 0) {indexUnder += 5;}
	$('#under img').animate(
		{"left": "0%"},
		1000,
		function() {
			$('#imgPreviousUnder').attr('src', underArray[(indexUnder+4)%underArray.length]);
			$('#imgCurrentUnder').attr('src', underArray[indexUnder%underArray.length]);
			$('#imgNextUnder').attr('src', underArray[(indexUnder+1)%underArray.length]);
			$('#under img').css("left", "-100%");
		}
	);
});
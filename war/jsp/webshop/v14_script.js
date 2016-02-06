$(document).ready(function() {
	$('input[name="min"]').val("€ "+(0).formatMoney(0)+",-");
	$('input[name="max"]').val("€ "+(100000000).formatMoney(0)+",-");
	
	/*** MIN AND MAX RESET BUTTONS ***/
	$('#minLabel').click(minReset);
	$('#maxLabel').click(maxReset);
	$('#min').dblclick(minReset);
	$('#max').dblclick(maxReset);
	
	/*** RANGE SLIDER ***/
	$('#min').css("left", "0");
	$('#max').css("left", "1100");
	$('#mid div').eq(1).css("display", "none");
	var $draggingMin = null;
	var $draggingMax = null;
	var sliderX = 0;
	$('.carNote').css("left", "-=2px");
	$('#sliderWrapper').mousemove(function(e) {
		var width = $(this).width();
		var offset = $(this).offset().left;
		sliderX = (e.pageX-offset)/width*100;
		var mouseX = Math.min(e.pageX, width+offset);
		var price = ((Math.pow(10, (sliderX/12.5))));
		if ($draggingMin) {
			$draggingMin.offset({
				"top": "initial",
				"left": mouseX-10
			});
			$('#mid div').eq(0).offset({
				"top": "initial",
				"left": mouseX-10
			});
			$('input[name="minHidden"]').val(price);
			$('input[name="min"]').val("€ "+(price).formatMoney(0)+",-");
			postAjax();
		}
		if ($draggingMax) {
			$('#mid div').eq(1).css("display", "initial");
			$draggingMax.offset({
				"top": "initial",
				"left": mouseX-10
			});
			$('#mid div').eq(1).offset({
				"top": "initial",
				"left": mouseX-10
			});
			$('input[name="maxHidden"]').val(price);
			$('input[name="max"]').val("€ "+(price).formatMoney(0)+",-");
			postAjax();
		}
	});
	$(document).mousemove(function(e) {
		var width = $('#sliderWrapper').width();
		var offset = $('#sliderWrapper').offset().left;
		sliderX = (e.pageX-offset)/width*100;
		if ($draggingMin && sliderX <= 0) {
			minReset();
		}
		if ($draggingMax && sliderX >= 100) {
			maxReset();
		}
	});
	$('#min').mousedown("#min", function (e) {
		$draggingMin = $(e.target);
		$('input[name="min"]').css({
			"color": "red",
			"font-weight": "bold"
		});
	});
	$('#max').mousedown("#max", function (e) {
		$draggingMax = $(e.target);
		$('input[name="max"]').css({
			"color": "red",
			"font-weight": "bold"
		});
	});
	$(document).mouseup(function (e) {
		$draggingMin = null;
		$draggingMax = null;
		$('input[type="text"]').css({
			"color": "black",
			"font-weight": "normal"
		});
	});

	/*** CHECKBOXES ***/
	$('.carBrandLabel').click(function() {
		$('#allBrandsCheckbox').prop("checked", false);
		setTimeout(function() {
			postAjax();
		}, 300);
	});
	$('#allBrandsCheckbox + label').click(function() {
		$('#allBrandsCheckbox').prop("checked", false);
		$('.carBrandCheckbox').prop("checked", false);
		setTimeout(function() {
			postAjax();
		}, 300);
	});
	$('label').mouseup(function(e) {
		setTimeout(function() {
			if ($('input:checked').length == 0) {
				$('#allBrandsCheckbox').prop("checked", true);
			}
		}, 300);
	});
	
	/*** AJAX AND CONSOLE LOGGING ***/
	postAjax();
	$(window).mouseup(function(e) {
		//console.log(e.target);
		setTimeout(function() {
			//console.log(($('input:checked').length));
		}, 300);
	});
});
		
/*** SERVLET ***/
function postAjax() {
	var checkList = [];
	$('input:checked').each(function() {
		checkList.push($(this).val());
	});
	$.post(
		"x2025989",
		{
			"minHidden": $('[name="minHidden"]').val(),
			"min": $('[name="min"]').val(),
			"maxHidden": $('[name="maxHidden"]').val(),
			"max": $('[name="max"]').val(),
			"brand": JSON.stringify(checkList)
		},
		function(event) {
			$('#carsWrapper').html(event);
		}
	);
}

/*** MONEY FORMAT ***/
Number.prototype.formatMoney = function(c, d, t) {
	var n = this,
	c = isNaN(c = Math.abs(c)) ? 2 : c,
	d = d == undefined ? "," : d,
	t = t == undefined ? "." : t,
	s = n < 0 ? "-" : "",
	i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
	j = (j = i.length) > 3 ? j % 3 : 0;
	return s + (j ? i.substr(0, j) + t : "")+ i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};

/*** MINIMUM AND MAXIMUM RESET ***/
function minReset() {
	$('#min').css("left", "initial");
	$('#mid div').eq(0).css("left", "0%");
	$('input[name="minHidden"]').val("0");
	$('input[name="min"]').val("€ "+(0).formatMoney(0)+",-");
	postAjax();
}
function maxReset() {
	$('#max').css("left", "initial");
	$('#mid div').eq(1).css("left", "100%");
	$('#mid div').eq(1).css("display", "none");
	$('input[name="maxHidden"]').val("100000000");
	$('input[name="max"]').val("€ "+(100000000).formatMoney(0)+",-");
	postAjax();
}
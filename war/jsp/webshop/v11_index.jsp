<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="v11_style.css">
		<script src="../../2.1.4_jquery.min.js"></script>
		<%@page import="webshopToets.Auto"%>
		<%@page import="webshopToets.AutoLijst"%>
		<%AutoLijst list = new AutoLijst();%>
		<title>Webshop</title>
	</head>

	<body>
		<div id="pageWrapper">
		
			<!-- FORM FOR CAR SELECTION -->
			<form action="v11_index.jsp" method="post" id="form">
			
				<!-- PRICE SELECTION -->
				<div id="sliderWrapper">
					<div id="sliderOpaque">
						<div id="slider">
							<div id="min"></div>
							<div id="max"></div>
							<div id="mid">
								<div></div>
								<div></div>
							</div>
						</div>
					</div>
				</div>
				<p id="minLabel">Minimum price</p><br>
				<input type="hidden" name="minHidden" value="0">
				<input type="text" name="min" value="" readonly>
				<br><br>
				<p id="maxLabel">Maximum price</p><br>
				<input type="hidden" name="maxHidden" value="100000000">
				<input type="text" name="max" value="" readonly>
				<br><br>
				
				<!-- BRAND SELECTION -->
				<br>
				<div id="allBrandsWrapper">
					<input id="allBrandsCheckbox" type="checkbox" name="brand[]" value="All brands" checked>
					<label for="allBrandsCheckbox">All brands</label>
					<%
						for (String carBrand : list.getMerken()) {
							%>
								<input id="<%=carBrand%>" class="carBrandCheckbox" type="checkbox" name="brand[]" value="<%=carBrand%>">
								<label for="<%=carBrand%>" class="carBrandLabel"><%=carBrand%></label>
							<%
						}
					%>
				</div>
				
				<input type="submit" value="OK">
			</form>
			
			<!-- CARS OVERVIEW -->
			<div id="carsWrapper"></div>
		</div>
	</body>
	
	<!-- JQUERY SCRIPT -->
	<script>
		$(document).ready(function() {
			$('input[name="min"]').val("€ "+(0).formatMoney(0)+",-");
			$('input[name="max"]').val("€ "+(100000000).formatMoney(0)+",-");
			
			/*** MIN AND MAX RESET BUTTONS ***/
			$('#minLabel').click(function() {
				$('#min').css("left", "initial");
				$('#mid div').eq(0).css("left", "0");
				$('input[name="minHidden"]').val("0");
				$('input[name="min"]').val("€ "+(0).formatMoney(0)+",-");
				postAjax();
			});
			$('#maxLabel').click(function() {
				$('#max').css("left", "initial");
				$('#mid div').eq(1).css("left", "1100");
				$('#mid div').eq(1).css("display", "none");
				$('input[name="maxHidden"]').val("100000000");
				$('input[name="max"]').val("€ "+(100000000).formatMoney(0)+",-");
				postAjax();
			});
			
			/*** RANGE SLIDER ***/
			$('#min').css("left", "0");
			$('#max').css("left", "1100");
			$('#mid div').eq(1).css("display", "none");
			var $draggingMin = null;
			var $draggingMax = null;
			$('#sliderWrapper').mousemove(function(e) {
				var mouseX = Math.min(e.pageX, 1230);
				var price = Math.pow(10, (mouseX/123)-2)|0;
				if ($draggingMin) {
					$draggingMin.offset({
						"top": "initial",
						"left": mouseX
					});
					$('#mid div').eq(0).offset({
						"top": "initial",
						"left": mouseX
					});
					$('input[name="minHidden"]').val((Math.pow(10, (mouseX/123)-2))|0);
					$('input[name="min"]').val("€ "+(price).formatMoney(0)+",-");
					postAjax();
				}
				if ($draggingMax) {
					$('#mid div').eq(1).css("display", "initial");
					$draggingMax.offset({
						"top": "initial",
						"left": mouseX
					});
					$('#mid div').eq(1).offset({
						"top": "initial",
						"left": mouseX
					});
					$('input[name="maxHidden"]').val((Math.pow(10, (mouseX/123)-2))|0);
					$('input[name="max"]').val("€ "+(price).formatMoney(0)+",-");
					postAjax();
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
			$('.carBrandLabel').on("click", function() {
				$('#allBrandsCheckbox').prop("checked", false);
				setTimeout(function() {
					postAjax();
				}, 300);
			});
			$('#allBrandsCheckbox + label').on("click", function() {
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
					"minCoordinates": $('[name="minCoordinates"]').val(),
					"minHidden": $('[name="minHidden"]').val(),
					"min": $('[name="min"]').val(),
					"maxCoordinates": $('[name="maxCoordinates"]').val(),
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
			return s + (j ? i.substr(0, j) + t : "")+ i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t)+ (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
		};
	</script>
</html>
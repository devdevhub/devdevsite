<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="v9_style.css">
		<script src="../../2.1.4_jquery.min.js"></script>
		<%@page import="webshopToets.Auto"%>
		<%@page import="webshopToets.AutoLijst"%>
		<%@page import="webshopToets.MoneyFormat"%>
		<%AutoLijst list = new AutoLijst();%>
		<%MoneyFormat mf = new MoneyFormat();%>
		<title>Webshop</title>
	</head>

	<body>
		<div id="pageWrapper">
		
			<!-- FORM FOR CAR SELECTION -->
			<form action="v9_index.jsp" method="post" id="form">
			
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
				Minimum prijs<br>
				<input type="hidden" id="minCoordinates" name="minCoordinates" value="">
				<input type="hidden" name="minHidden" value="0">
				<input type="text" name="min" value="€ <%=mf.getPrijsFormat(0)%>" readonly>
				<br><br>
				Maximum prijs<br>
				<input type="hidden" id="maxCoordinates" name="maxCoordinates" value="">
				<input type="hidden" name="maxHidden" value="100000000">
				<input type="text" name="max" value="€ <%=mf.getPrijsFormat(100000000)%>" readonly>
				<br><br>
				
				<!-- BRAND SELECTION -->
				<br>
				<div id="brandSelectWrapper">
					<input id="allBrandsCheckbox" type="checkbox" name="brand[]" value="Alle merken" checked>
					<label for="allBrandsCheckbox">Alle merken</label>
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
		
		/*** RANGE SLIDER ***/
		$('#min').css("left", "0");
		$('#max').css("left", "1100");
		$('#mid div').eq(1).css("display", "none");
//		$('#min').css("left", "<%=request.getParameter("minCoordinates")%>");
//		$('#max').css("left", "<%=request.getParameter("maxCoordinates")%>");
//		$('#mid div').eq(0).css("left", "<%=request.getParameter("minCoordinates")%>");
//		<%
//			if (
//				request.getParameter("maxCoordinates") != null
//				&& !(request.getParameter("maxCoordinates").equals(""))
//				&& !(request.getParameter("maxCoordinates").equals("auto"))
//			) {
//				%>
//					$('#mid div').eq(1).css("display", "initial");
//					$('#mid div').eq(1).css("left", "<%=request.getParameter("maxCoordinates")%>");
//					$('#mid div').eq(1).css("left", "+="+$('#mid').css("width"));
//				<%
//			}
//		%>
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
			$('input[name="min"]').css("color", "red");
		});
		$('#max').mousedown("#max", function (e) {
			$draggingMax = $(e.target);
			$('input[name="max"]').css("color", "red");
			$('#mid div').eq(1).css("display", "initial");
		});
		$(document).mouseup(function (e) {
			$draggingMin = null;
			$draggingMax = null;
			$('input[type="text"]').css("color", "black");
		});

		/*** CHECKBOXES ***/
		$('.carBrandLabel').on("click", function() {
			$('#allBrandsCheckbox').prop("checked", false);
			setTimeout(function() {
				postAjax();
			}, 300);
		});
		$('#allBrandsCheckbox + label').on("click", function() {
			$('.carBrandCheckbox').prop("checked", false);
			setTimeout(function() {
				postAjax();
			}, 300);
		});
//		$('form').submit(function(event) {
//			$('#minCoordinates').val($('#min').css("left"));
//			$('#maxCoordinates').val($('#max').css("left"));
//			var formId = this.id, form = this;
//			event.preventDefault();
//			setTimeout(function() {
//				form.submit();
//			}, 300);
//		});
		postAjax();
	});
			
	/*** SERVLET ***/
	function postAjax() {
		var checkList = [];
		$('input:checked').each(function() {
			checkList.push($(this).val());
			console.log($(this).val());
		});
		console.log("--------");
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

		/*function getPrijsFormat(prijs) {
			DecimalFormat df = (DecimalFormat)(
				NumberFormat.getNumberInstance(new Locale("de", "DE"))
			);
			df.applyPattern("#,##0.-");
			return df.format(prijs);
		}*/
	</script>
</html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="v7_style.css">
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
			<form action="v7_index.jsp" method="post" id="form">
			
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
				<input type="hidden" name="minHidden" value="<%
					if (request.getParameter("minHidden") != null) {
						out.print(request.getParameter("minHidden"));
					}
					else {
						out.print("0");
					}
				%>">
				<input type="text" name="min" value="<%
					if (request.getParameter("minHidden") != null) {
						out.print("€ "+mf.getPrijsFormat(Double.parseDouble(request.getParameter("minHidden"))));
					}
					else {
						out.print("€ "+mf.getPrijsFormat(0));
					}
				%>" readonly>
				<br><br>
				Maximum prijs<br>
				<input type="hidden" id="maxCoordinates" name="maxCoordinates" value="">
				<input type="hidden" name="maxHidden" value="<%
					if (request.getParameter("maxHidden") != null) {
						out.print(request.getParameter("maxHidden"));
					}
					else {
						out.print("100000000");
					}
				%>">
				<input type="text" name="max" value="<%
					if (request.getParameter("maxHidden") != null) {
						out.print("€ "+mf.getPrijsFormat(Double.parseDouble(request.getParameter("maxHidden"))));
					}
					else {
						out.print("€ "+mf.getPrijsFormat(100000000));
					}
				%>" readonly>
				<br><br>
				
				<!-- BRAND SELECTION -->
				<br>
				<input id="allBrandsCheckbox" type="checkbox" name="brand" value="Alle merken">
				<label for="allBrandsCheckbox">Alle merken</label>
				<%
					for (String carBrand : list.getMerken()) {
						%>
							<input id="<%=carBrand%>" class="carBrandCheckbox" type="checkbox" name="brand" value="<%=carBrand%>">
							<label for="<%=carBrand%>" class="carBrandLabel"><%=carBrand%></label>
						<%
					}
				%>
				
				<input type="submit" value="OK">
			</form>
			
			<!-- CARS OVERVIEW -->
			<div id="carsWrapper">
				<%
					String[] checkList = new String[0];
					if (request.getParameterValues("brand") != null) {
						checkList = request.getParameterValues("brand");
						for (String item : checkList) {
							%>
								<script>
									$('input[value="<%=item%>"]').attr("checked", "checked");
								</script>
							<%
						}
					}
					else {
						%>
							<script>
								$('#allBrandsCheckbox').attr("checked", "checked");
							</script>
						<%
					}
					
					try {
						for (Auto car : list.getLijst()) {
							boolean foundBrand = false;
							for (int i = 0; i < checkList.length && foundBrand == false; i++) {
								if (car.getMerk().equalsIgnoreCase(checkList[i])) {
									foundBrand = true;
								} 
							}
							if (
								(
									foundBrand == true
									|| request.getParameter("brand") == null
									|| request.getParameter("brand").equalsIgnoreCase("Alle merken")
								)
								&& (
									request.getParameter("minHidden") == null
									|| request.getParameter("minHidden").equals("")
									|| Double.parseDouble(request.getParameter("minHidden")) <= car.getPrijs()
								)
								&& (
									request.getParameter("maxHidden") == null
									|| request.getParameter("maxHidden").equals("")
									|| Double.parseDouble(request.getParameter("maxHidden")) >= car.getPrijs()
								)
							) {
								%><div class="car"><%
									out.print("<div class='carTitle'>"+car.getMerk()+" "+car.getType()+"</div>");
									%><div class="carBody"><%
										out.print("<img src='"+car.getFoto()+"'></img>");
										out.print("<p class='price'>€ "+mf.getPrijsFormat(car.getPrijs())+"</p>");
									%></div><%
								%></div><%
							}
						}
					}
					catch (NumberFormatException e) {
						out.print("<p id='error'>Error. Try using an integer instead.</p>");
						%>
							<script>
								$('input[type="text"]').val("");
							</script>
						<%
					}
				%>
			</div>
		</div>
	</body>
	
	<script>
		$(document).ready(function() {
			
			/*** RANGE SLIDER ***/
			$('#min').css("left", "0");
			$('#max').css("left", "1100");
			$('#mid div').eq(1).css("display", "none");
			$('#min').css("left", "<%=request.getParameter("minCoordinates")%>");
			$('#max').css("left", "<%=request.getParameter("maxCoordinates")%>");
			$('#mid div').eq(0).css("left", "<%=request.getParameter("minCoordinates")%>");
			<%
				if (
					request.getParameter("maxCoordinates") != null
					&& !(request.getParameter("maxCoordinates").equals(""))
					&& !(request.getParameter("maxCoordinates").equals("auto"))
				) {
					%>
						$('#mid div').eq(1).css("display", "initial");
						$('#mid div').eq(1).css("left", "<%=request.getParameter("maxCoordinates")%>");
						$('#mid div').eq(1).css("left", "+="+$('#mid').css("width"));
					<%
				}
			%>
			var $draggingMin = null;
			var $draggingMax = null;
			$('#sliderWrapper').mousemove(function(e) {
				var mouseX = Math.min(e.pageX, 1230);
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
					$('input[name="min"]').val("€ "+mf.getPrijsFormat((Math.pow(10, (mouseX/123)-2))|0));
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
					$('input[name="max"]').val("€ "+mf.getPrijsFormat((Math.pow(10, (mouseX/123)-2))|0));
				}
			});
			$('#min').mousedown("#min", function (e) {
				$draggingMin = $(e.target);
			});
			$('#max').mousedown("#max", function (e) {
				$('#mid div').eq(1).css("display", "initial");
				$draggingMax = $(e.target);
			});
			$(document).mouseup(function (e) {
				if ($draggingMin || $draggingMax) {
					$('form').submit();
				}
				$draggingMin = null;
				$draggingMax = null;
			});
			$('#min').mouseup(function (e) {
				$('form').submit();
			});
			$('#max').mouseup(function (e) {
				$('form').submit();
			});
		
			/*** CHECKBOXES ***/
			$('.carBrandLabel').on("click", function() {
				$('#allBrandsCheckbox').prop("checked", false);
				$('form').submit();
			});
			$('#allBrandsCheckbox + label').on("click", function() {
				$('.carBrandCheckbox').prop("checked", false);
				$('form').submit();
			});
			$('form').submit(function(event) {
				$('#minCoordinates').val($('#min').css("left"));
				$('#maxCoordinates').val($('#max').css("left"));
				var formId = this.id, form = this;
				event.preventDefault();
				setTimeout(function() {
					form.submit();
				}, 300);
			});
		});
	</script>
</html>
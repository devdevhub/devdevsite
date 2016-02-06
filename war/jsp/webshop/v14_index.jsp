<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="v14_style.css">
		<script src="../../2.1.4_jquery.min.js"></script>
		<%@page import="webshopToets.Auto"%>
		<%@page import="webshopToets.AutoLijst"%>
		<%AutoLijst list = new AutoLijst();%>
		<title>Webshop</title>
	</head>

	<body>
		<div id="pageWrapper">
		
			<!-- FORM FOR CAR SELECTION -->
			<form action="v14_index.jsp" method="post" id="form">
			
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
							<%
								for (Auto car : list.getLijst()) {
									String carNoteID = (car.getMerk()+"-"+car.getType()).replaceAll(" ", "-");
									%>
										<div id="<%=carNoteID%>" class="carNote" style="left: <%=Math.log10(car.getPrijs())*12.5%>%"></div>
									<%
								}
							%>
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
	<script src="v14_script.js"></script>
</html>
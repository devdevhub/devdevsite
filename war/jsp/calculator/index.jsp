<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<style>
			body {
				padding-top: 10vw;
				text-align: center;
			}
			#input {
				margin-bottom: 4vw;
			}
			#input input {
				width: 5em;
				text-align: center;
				font: 2.5vw "Arial";
			}
			#buttons input {
				width: 1.5em;
				height: 1.5em;
				text-align: center;
				font: 2.5vw "Arial";
			}
			#error {
				position: relative;
				left: 0px;
				top: 0px;
				color: red;
				font: 1vw "Arial";
			}
			#error p {
				position: absolute;
				left: 42.5vw;
				top: 3vw;
			}
		</style>
		<title>Calculator</title>
	</head>
	
	<body>
		<%
			String error = "";
			double number1 = 0;
			double number2 = 0;
			String stringNumber1 = "";
			String stringNumber2 = "";
			String focus = "";
			try {
				if (request.getParameter("add") != null) {
					number1 = (
						Double.parseDouble(request.getParameter("number1"))
						+ Double.parseDouble(request.getParameter("number2"))
					);
					if (number1 == (int) (number1)) {
						stringNumber1 = String.format("%.0f", number1);
					}
					else {stringNumber1 = ""+ number1;}
					focus = "number2";
				}
				if (request.getParameter("subtract") != null) {
					number1 = (
						Double.parseDouble(request.getParameter("number1"))
						- Double.parseDouble(request.getParameter("number2"))
					);
					if (number1 == (int) (number1)) {
						stringNumber1 = String.format("%.0f", number1);
					}
					else {stringNumber1 = ""+ number1;}
					focus = "number2";
				}
				if (request.getParameter("multiply") != null) {
					number1 = (
						Double.parseDouble(request.getParameter("number1"))
						* Double.parseDouble(request.getParameter("number2"))
					);
					if (number1 == (int) (number1)) {
						stringNumber1 = String.format("%.0f", number1);
					}
					else {stringNumber1 = ""+ number1;}
					focus = "number2";
				}
				if (request.getParameter("divide") != null) {
					number1 = (
						Double.parseDouble(request.getParameter("number1"))
						/ Double.parseDouble(request.getParameter("number2"))
					);
					if (number1 == (int) (number1)) {
						stringNumber1 = String.format("%.0f", number1);
					}
					else {stringNumber1 = ""+ number1;}
					focus = "number2";
				}
			}
			catch (NumberFormatException e) {
				error = "Error. Try using an integer instead.";
				focus = "number1";
			}
		%>
		<div id="error"><p><%=error%></p></div>
		<form action="index.jsp" method="post">
			<div id="input">
				<input type="text" id="number1" name="number1" value="<%=stringNumber1%>">
				<input type="text" id="number2" name="number2" value="<%=stringNumber2%>">
			</div>
			<div id="buttons">
				<input type="submit" name="add" value="+">
				<input type="submit" name="subtract" value="-">
				<input type="submit" name="multiply" value="×">
				<input type="submit" name="divide" value="/">
			</div>
		</form>
	</body>
	<script src="../../2.1.4_jquery.min.js"></script>
	<%
		if (focus == "number2") {%><script>$('#number2').focus();</script><%}
		else {%><script>$('#number1').focus();</script><%}
	%>
</html>
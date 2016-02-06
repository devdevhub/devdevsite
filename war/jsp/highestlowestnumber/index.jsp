<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<style>
			body {
				text-align: center;
				padding-top: 3.5vw;
				font: 1.8vw "Arial";
			}
			p {display: block;}
			#error {
				color: red;
				font-size: 1vw;
			}
			div {margin-top: 5vw;}
			br {font-size: 2.5vw;}
		</style>
		<title>Highest &amp; Lowest Number</title>
	</head>

	<body>
		<form action="index.jsp" method="post" id="form">
			<input type="text" name="number">
			<input type="submit" name="submit" value="OK">
		</form>
		<%
			long highest = Long.MIN_VALUE;
			long lowest = Long.MAX_VALUE;
			String stringHigh = "";
			String stringLow = "";
			try {
				if (request.getParameter("submit") != null) {
					highest = Long.parseLong(request.getParameter("highest"));
					lowest = Long.parseLong(request.getParameter("lowest"));
					long number = Long.parseLong(request.getParameter("number"));
					if (number > highest) {highest = number;}
					if (number < lowest) {lowest = number;}
					stringHigh += "Highest number: "+ highest;
					stringLow += "Lowest number: "+ lowest;
				}
			}
			catch (NumberFormatException e) {
				if (Long.parseLong(request.getParameter("highest")) != Long.MIN_VALUE
				|| Long.parseLong(request.getParameter("lowest")) != Long.MAX_VALUE) {
					stringHigh += "Highest number: "+ highest;
					stringLow += "Lowest number: "+ lowest;
				}
				out.println("<p id='error'>Error. Try using an integer instead.</p>");
			}
		%>
		<div>
			<%
				out.println(stringHigh);
				%><br><%
				out.println(stringLow);
			%>
		</div>
		<input type="hidden" form="form" name="highest" value="<%=highest%>">
		<input type="hidden" form="form" name="lowest" value="<%=lowest%>">
	</body>
</html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="style.css">
		<title>Simple Temperature Conversion</title>
	</head>

	<body>
		<table>
			<tr>
				<td>
					<%
						try {
							if (request.getParameter("submitcelsius") != null) {
								int celsius = Integer.parseInt(request.getParameter("number"));
								out.println(celsius +" °C");
							}
						}
						catch (NumberFormatException e) {
							%>
								<form action="return.jsp" method="post">
									<input type="text" name="number" value=""> °C
									<input type="submit" name="submitcelsius" value="OK">
								</form>
								<style>
									td:nth-of-type(2) {
										display: none;
									}
								</style>
							<%
							out.println("<div class='error'><p>Error. Try using an integer instead.</p></div>");
						}
					%>
				</td>
				<td>
					<%
						String fahrenheit = "";
						try {
							if (request.getParameter("submitcelsius") != null) {
								int celsius = Integer.parseInt(request.getParameter("number"));
								fahrenheit += (Math.round(celsius*1.8+32));
								out.println(fahrenheit +" °F");
							}
						}
						catch (NumberFormatException e) {}
					%>
				</td>
			</tr>
		</table>
		<br><br>
		<a href="index.jsp">Go home</a>
	</body>
</html>
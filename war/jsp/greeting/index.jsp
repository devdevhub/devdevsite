<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<style>
			body {
				text-align: center;
				padding-top: 15vw;
				font: 1.8vw "Arial";
			}
			#greeting {
				font: 3vw "Arial";
			}
		</style>
		<%@page import="java.util.Calendar"%>
		<%
			Calendar nu = Calendar.getInstance();
			int currentHour = nu.get(Calendar.HOUR_OF_DAY);
			String greeting = "";
			if (currentHour >= 6 && currentHour < 12) {
				greeting = "Good morning";
			}
			if (currentHour >= 12 && currentHour < 18) {
				greeting = "Good afternoon";
			}
			if (currentHour >= 18 && currentHour < 24) {
				greeting = "Good evening";
			}
			if (currentHour >= 0 && currentHour < 6) {
				greeting = "Good night";
			}
		%>
		<title>Greeting</title>
	</head>

	<body>
		<p id="greeting"><%=greeting%></p>
		<p>Current hour: <%=currentHour%></p>
	</body>
</html>
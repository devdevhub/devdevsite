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
		</style>
		<title>Five Times Table</title>
	</head>

	<body>
		<%
			for (int i = 1; i <= 10; i++) {
				out.println("<p>"+ i +" × 5 = "+ (i*5) +"</p>");
			}
		%>
	</body>
</html>
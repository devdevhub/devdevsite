<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<style>
			body {
				text-align: center;
				padding-top: 5vw;
				font: 1.8vw "Arial";
			}
			div {
				margin: auto;
				width: 60vw;
			}
		</style>
		<%
			long a = 1L;
			long b = 0L;
			long c = 1L;
		%>
		<title>Fibonacci</title>
	</head>

	<body>
		<div>
			<%
				for (int i = 0; i < 92; i++) {
					out.println(c +"<br>");
					a = b;
					b = c;
					c = a+b;
				}
			%>
		</div>
	</body>
</html>
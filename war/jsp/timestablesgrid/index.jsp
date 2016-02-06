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
			table {
				margin: auto;
				border-collapse: collapse;
			}
			th {background-color: #F3F3F3;}
			th, td {
				padding: 1vw;
				border: 0.175vw solid black;
			}
		</style>
		<title>Times Tables Grid</title>
	</head>

	<body>
		<table>
			<%
				for (int iRow = 1; iRow <= 10; iRow++) {
					out.println("<tr>");
						for (int iCol = 1; iCol <= 10; iCol++) {
							if (iRow == 1 || iCol == 1) {out.println("<th>"+ (iRow*iCol) +"</th>");}
							else {out.println("<td>"+ (iRow*iCol) +"</td>");}
						}
					out.println("</tr>");
//					if (iRow < 8) {out.println("<br>");}
				}
			%>
		</table>
	</body>
</html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<style>
			body {
				text-align: center;
				padding-top: 15vw;
			}
			table {
				font: 1.8vw "Arial";
				margin: auto;
				border-collapse: collapse;
			}
			th, td {
				border: 0.175vw solid black;
				padding: 1vw;
			}
			p {
				margin-top: 5vw;
				font: 1vw "Arial";
			}
		</style>
		<%
			int second = 1;
			int minute = 60 * second;
			int hour = 60 * minute;
			int day = 24 * hour;
			int week = 7 * day;
			int year = (int) (365.25 * day);
		%>
		<title>Seconds</title>
	</head>

	<body>
		<table>
			<tr>
				<th>Eenheid</th>
				<th>Aantal seconden</th>
			</tr>
			<tr>
				<td>Minuut</td>
				<td><%=minute%></td>
			</tr>
			<tr>
				<td>Uur</td>
				<td><%=hour%></td>
			</tr>
			<tr>
				<td>Dag</td>
				<td><%=day%></td>
			</tr>
			<tr>
				<td>Week</td>
				<td><%=week%></td>
			</tr>
			<tr>
				<td>Jaar</td>
				<td><%=year%>*</td>
			</tr>
		</table>
		<p>*Gemiddeld aantal, als je rekening houdt met schrikkeljaren.</p>
	</body>
</html>
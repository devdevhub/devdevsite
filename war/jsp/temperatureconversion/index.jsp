<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="style.css">
		<script src="../../2.1.4_jquery.min.js"></script>
		<title>Temperature Conversion</title>
	</head>

	<body>
		<table>
			<tr>
				<th>Celsius</th>
				<th>Fahrenheit</th>
			</tr>
			<tr>
				<td>
					<%
						String celsius = "";
						String formCelsius = "<form action='index.jsp' method='post'><input type='text' id='inputCelsius' name='number' value='"+ celsius +"'> °C<input type='submit' name='submitcelsius' value='OK'></form>";
						String errorC = "";
						if (request.getParameter("submitfahrenheit") != null) {
							try {
								int fahrenheit = Integer.parseInt(request.getParameter("number"));
								celsius += (Math.round((fahrenheit-32)/1.8));
								%><div id="celsius"><p><%=celsius%> °C</p></div><%
							}
							catch (NumberFormatException e) {}
						}
						else if (request.getParameter("submitcelsius") != null) {
							try {
								celsius += Integer.parseInt(request.getParameter("number"));
								%><div id="celsius"><p><%=celsius%> °C</p></div><%
							}
							catch (NumberFormatException e) {
								out.println(formCelsius);
								%><script>$('#inputCelsius').focus();</script><%
								errorC = "Error. Try using an integer instead.";
							}
						}
						else {out.println(formCelsius);}
						formCelsius = "<form action='index.jsp' method='post'><input type='text' id='inputCelsius' name='number' value='"+ celsius +"'> °C<input type='submit' name='submitcelsius' value='OK'></form>";
					%>
					<div class="error"><p><%=errorC%></p></div>
				</td>
				<td>
					<%
						String fahrenheit = "";
						String formFahrenheit = "<form action='index.jsp' method='post'><input type='text' id='inputFahrenheit' name='number' value='"+ fahrenheit +"'> °F<input type='submit' name='submitfahrenheit' value='OK'></form>";
						String errorF = "";
						if (request.getParameter("submitcelsius") != null) {
							try {
								int celsiusInt = Integer.parseInt(request.getParameter("number"));
								fahrenheit += (Math.round(celsiusInt*1.8+32));
								%><div id="fahrenheit"><p><%=fahrenheit%> °F</p></div><%
							}
							catch (NumberFormatException e) {}
						}
						else if (request.getParameter("submitfahrenheit") != null) {
							try {
								fahrenheit += Integer.parseInt(request.getParameter("number"));
								%><div id="fahrenheit"><p><%=fahrenheit%> °F</p></div><%
							}
							catch (NumberFormatException e) {
								out.println(formFahrenheit);
								%><script>$('#inputFahrenheit').focus();</script><%
								errorF = "Error. Try using an integer instead.";
							}
						}
						else {out.println(formFahrenheit);}
						formFahrenheit = "<form action='index.jsp' method='post'><input type='text' id='inputFahrenheit' name='number' value='"+ fahrenheit +"'> °F<input type='submit' name='submitfahrenheit' value='OK'></form>";
					%>
					<div class="error"><p><%=errorF%></p></div>
				</td>
			</tr>
		</table>
	</body>
	<script>
		var formC = false;
		var formF = false;
		$('#celsius').on("click", function() {
			if (formC == false) {
				$(this).html("<%=formCelsius%>");
				$('#fahrenheit').html("<p><%=fahrenheit%> °F</p>");
				formC = true;
				formF = false;
				$('#inputCelsius').focus();
				var tmpStr = $('#inputCelsius').val();
				$('#inputCelsius').val('');
				$('#inputCelsius').val(tmpStr);
			}
		});
		$('#fahrenheit').on("click", function() {
			if (formF == false) {
				$(this).html("<%=formFahrenheit%>");
				$('#celsius').html("<p><%=celsius%> °C</p>");
				formF = true;
				formC = false;
				$('#inputFahrenheit').focus();
				var tmpStr = $('#inputFahrenheit').val();
				$('#inputFahrenheit').val('');
				$('#inputFahrenheit').val(tmpStr);
			}
		});
	</script>
</html>
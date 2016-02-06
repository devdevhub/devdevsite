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
			p {
				display: block;
				margin: 0.4vw;
			}
			#error {
				color: red;
				font-size: 1vw;
			}
			input[type="submit"] {
				margin: 0.3vw;
			}
		</style>
		<title>Times Table Next</title>
	</head>

	<body>
		<h3>Choose times table</h3>
		<form action="index.jsp" method="post" id="form">
			<input type="text" name="number">
			<input type="submit" name="submit" value="OK">
		</form>
		<%
			try {
				int number = 0;
				if (request.getParameter("submit") != null) {
					number = Integer.parseInt(request.getParameter("number"));
				}
				if (request.getParameter("previous") != null) {
					number = Integer.parseInt(request.getParameter("value"));
					number--;
				}
				if (request.getParameter("next") != null) {
					number = Integer.parseInt(request.getParameter("value"));
					number++;
				}
				if (request.getParameter("submit") != null
				|| request.getParameter("previous") != null
				|| request.getParameter("next") != null){
					for (int i = 1; i <= 10; i++) {
						out.println("<p>"+ i +" × "+ number +" = "+ (i*number) +"</p>");
					}
					out.println(
						"<input type='hidden' form='form' name='value' value='"+ number +"'>"
						+ "<input type='submit' form='form' name='previous' value='Previous'>"
						+ "<input type='submit' form='form' name='next' value='Next'>"
					);
				}
			}
			catch (NumberFormatException e) {
				out.println("<p id='error'>Error. Try using an integer instead.</p>");
			}
		%>
	</body>
</html>
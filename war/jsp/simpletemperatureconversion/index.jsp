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
					<form action="return.jsp" method="post">
						<input type="text" name="number" value=""> °C
						<input type="submit" name="submitcelsius" value="OK">
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>
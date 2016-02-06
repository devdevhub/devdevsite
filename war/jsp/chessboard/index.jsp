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
			div#boardEdge {
				display: flex;
				flex-flow: row wrap;
				margin: auto;
				width: 48vw;
				border: 0.3vw solid black;
			}
			div#boardEdge div {
				width: 6vw;
				height: 6vw;
			}
			div.black {background-color: black;}
			div.white {background-color: white;}
		</style>
		<title>Chessboard</title>
	</head>

	<body>
		<div id="boardEdge">
			<%
				String color = "black";
				
				for (int iRow = 1; iRow <= 8; iRow++) {
					for (int iCol = 1; iCol <= 8; iCol++) {
						if (iRow % 2 == 1 && iCol % 2 == 1) {color = "black";} //  oddRow &&  oddCol
						if (iRow % 2 == 1 && iCol % 2 == 0) {color = "white";} //  oddRow && evenCol
						
						if (iRow % 2 == 0 && iCol % 2 == 1) {color = "white";} // evenRow &&  oddCol
						if (iRow % 2 == 0 && iCol % 2 == 0) {color = "black";} // evenRow && evenCol
						
						out.println("<div class="+ color +"></div>");
					}
					if (iRow < 8) {out.println("<br>");}
				}
			%>
		</div>
	</body>
</html>
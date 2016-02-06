<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<script src="2.1.4_jquery.min.js"></script>
		
		<!-- SELECT CSS FILE DEPENDING ON WINDOW SIZE -->
		<script>
			var mq = window.matchMedia("(min-width: 1000px)");
			
			if (mq.matches) {
				// window width is at least 1000px
				document.write("<link rel='stylesheet' type='text/css' href='style.css'>");
			}
			else {
				// window width is less than 1000px
				document.write("<link rel='stylesheet' type='text/css' href='styleMobile.css'>");
			}
		</script>
		<title>Develirium Portfolio</title>
	</head>
	
	<body>
		<h1>Welcome to my portfolio on Software Development!</h1>
		
		<!-- NAVBAR -->
		<nav>
			<ul>
				<li><a href="./index.jsp">Home</a></li>
				<li><a href="./creations.jsp">Creations</a></li>
				<li><a href="./about.jsp">About</a></li>
				<li><a href="./contact.jsp">Contact</a></li>
			</ul>
		</nav>
		
		<!-- CONTENT -->
		<div id="content">
			<h2>It's all about programming.</h2>
			<br><br>
			<p>
				I'm currently working with Java, HTML, CSS, Javascript, JSP and SQL.<br>
				I'd also like to delve into C++, Ruby, Perl, PHP, ASP, Android, and many more languages! 
			</p>
		</div>
	</body>
</html>
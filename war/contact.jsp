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
			<h2>You can email me if you like.</h2>
			<br><br>
			<p>
				<a class="contact-link" href="mailto:develirium@gmail.com">develirium@gmail.com</a>
			</p>
			<br><br><br><br>
			<h2>I have LinkedIn too.</h2>
			<br><br>
			<p>
				<a class="contact-link" href="https://nl.linkedin.com/in/daniel-w-b36890112" target="_blank">LinkedIn profile</a>
			</p>
		</div>
	</body>
</html>
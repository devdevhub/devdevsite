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
		
		<!-- DROPDOWN MENU / CONTENT-->
		<div id="dropdown">
			<ul>
			
				<!-- GITHUB LINK -->
				<li id="github"><a target="_blank" href="http://github.com/2025989/">GitHub<img id="githubLogo" src="GitHub-Mark.png" alt="GitHub Logo"></a></li>
				
				<!-- APPLICATIONS -->
				<!-- <li id="apps">Applications<img src="openMenuArrow.png" alt=""></li>
				<div>
					<li>TEST<img src="openMenuArrow.png" alt=""></li>
					<div>
						<li><a target="display" href="./css/helloworld/index.html">Hello World</a></li>
					</div>
				</div> -->
				
				<!-- GAMES -->
				<li class="title">Games<img src="openMenuArrow.png" alt=""></li>
				<li>
					<ul class="menu">
					
						<!-- GREENFOOT GAMES -->
						<li class="subtitle">Greenfoot (Java)<img src="openMenuArrow.png" alt=""></li>
						<li>
							<ul class="submenu">
								<li><a target="display" href="./games/garpsgame/index.html">GarpsGame</a></li>
								<li><a target="display" href="./games/pong/index.html">Pong</a></li>
							</ul>
						</li>
					</ul>
				</li>
				
				<!-- WEB DEVELOPMENT / HTML HOMEWORK -->
				<li class="title">Web Development<img src="openMenuArrow.png" alt=""></li>
				<li>
					<ul class="menu">
					
						<!-- CSS -->
						<li class="subtitle">Cascading Style Sheets<img src="openMenuArrow.png" alt=""></li>
						<li>
							<ul class="submenu">
								<li><a target="display" href="./css/helloworld/index.html">Hello World</a></li>
								<li><a target="display" href="./css/simplewebsite/index.html">Simple Website</a></li>
								<li><a target="display" href="./css/table/index.html">Table</a></li>
								<li><a target="display" href="./css/css1-4/index.html">CSS 1-4</a></li>
								<li><a target="display" href="./css/float/index.html">Float</a></li>
								<li><a target="display" href="./css/loginform/index.html">Login Form</a></li>
								<li><a target="display" href="./css/exampleform/index.html">Example Form</a></li>
								<li><a target="display" href="./css/fonts/index.html">Fonts</a></li>
								<li><a target="display" href="./css/fullfeaturedwebsite/index.html">Full Featured Website</a></li>
								<li><a target="display" href="http://projectbierhier.appspot.com">Project Bierhier</a></li>
							</ul>	
						</li>
						
						<!-- JS -->
						<li class="subtitle">Javascript<img src="openMenuArrow.png" alt=""></li>
						<li>
							<ul class="submenu">
								<li><a target="display" href="./js/test/index.html">jQuery Test</a></li>
								<li><a target="display" href="./js/menu/index.html">jQuery Menu</a></li>
								<li><a target="display" href="./js/testevent/index.html">Test Event</a></li>
								<li><a target="display" href="./js/buttonevent/index.html">Button Event</a></li>
								<li><a target="display" href="./js/colorlists/index.html">Color Lists</a></li>
								<li><a target="display" href="./js/clickblock/index.html">Click Block</a></li>
								<li><a target="display" href="./js/animation/index.html">Animation</a></li>
								<li><a target="display" href="./js/variables/index.html">Javascript Variables</a></li>
								<li><a target="display" href="./js/typeof/index.html">typeof</a></li>
								<li><a target="display" href="./js/functions/index.html">Javascript functions</a></li>
								<li><a target="display" href="./js/functionsjquery/index.html">Javascript functions (jQuery)</a></li>
								<li><a target="display" href="./js/imageslider/index.html">Image Slider</a></li>
								<li><a target="display" href="./js/policeapp/index.html">Police App</a></li>
								<li><a target="display" href="./js/copyobject/index.html">Copy Object</a></li>
								<li><a target="display" href="./js/cargarage/index.html">Car Garage</a></li>
								<li><a target="display" href="./js/mobilehelloworld/index.html">Mobile Hello World</a></li>
							</ul>
						</li>
						
						<!-- JSP -->
						<li class="subtitle">Java Server Pages<img src="openMenuArrow.png" alt=""></li>
						<li>
							<ul class="submenu">
								<li><a target="display" href="./jsp/moneydivision/index.jsp">Money Division</a></li>
								<li><a target="display" href="./jsp/seconds/index.jsp">Seconds</a></li>
								<li><a target="display" href="./jsp/greeting/index.jsp">Greeting</a></li>
								<li><a target="display" href="./jsp/fibonacci/index.jsp">Fibonacci</a></li>
								<li><a target="display" href="./jsp/chessboard/index.jsp">Chessboard</a></li>
								<li><a target="display" href="./jsp/fivetimestable/index.jsp">Five Times Table</a></li>
								<li><a target="display" href="./jsp/timestablesgrid/index.jsp">Times Tables Grid</a></li>
								<li><a target="display" href="./jsp/timestableselect/index.jsp">Times Table Select</a></li>
								<li><a target="display" href="./jsp/timestablenext/index.jsp">Times Table Next</a></li>
								<li><a target="display" href="./jsp/simpletemperatureconversion/index.jsp">Simple Temperature Conversion</a></li>
								<li><a target="display" href="./jsp/highestlowestnumber/index.jsp">Highest &amp; Lowest Number</a></li>
								<li><a target="display" href="./jsp/temperatureconversion/index.jsp">Temperature Conversion</a></li>
								<li><a target="display" href="./jsp/calculator/index.jsp">Calculator</a></li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
			<div id="dockButton"></div>
		</div>
		
		<!-- IFRAME -->
		<div id="iframe">
			<h2 id="iframeTitle"></h2>
			<iframe name="display"></iframe>
		</div>
	</body>
	
	<!-- JQUERY SCRIPT -->
	<script>
		var mq = window.matchMedia("(min-width: 1000px)");
		
		if (mq.matches) {
			// window width is at least 1000px
			$.getScript("script.js", function() {});
		}
		else {
			// window width is less than 1000px
			$.getScript("scriptMobile.js", function() {});
		}
	</script>
</html>
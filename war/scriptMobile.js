//background color on hover
$('#github, .title').hover(
	function() {$(this).css("background-color", "rgba(0, 0, 0, 0.075)");},
	function() {$('#github, .title').css("background-color", "rgba(0, 0, 0, 0)");}
);
$('.subtitle').hover(
	function() {$(this).css("background-color", "rgba(0, 0, 0, 0.075)");},
	function() {$('.subtitle').css("background-color", "rgba(0, 0, 0, 0)");}
);
$('.submenu li').hover(
	function() {$(this).css("background-color", "rgba(0, 0, 0, 0.075)");},
	function() {$('.submenu li').css("background-color", "rgba(0, 0, 0, 0)");}
);

//make arrays to store the original text of the dropdown menu items
$('.menu, .submenu').slideUp();
var menuArray = new Array($('.title').length);
for (var i = 0; i < menuArray.length; i++) {
	menuArray[i] = $('.title').eq(i).html();
}
var submenuArray = new Array($('.subtitle').length);
for (var i = 0; i < submenuArray.length; i++) {
	submenuArray[i] = $('.subtitle').eq(i).html();
}

//show arrow images on hover
$('.title').hover( //menus
	function() {$('img', this).css("visibility", "initial");},
	function() {$('img', this).css("visibility", "hidden");}
);
$('.subtitle').hover( //submenus
	function() {$('img', this).css("visibility", "initial");},
	function() {$('img', this).css("visibility", "hidden");}
);



//main menu onclick
$('.title').click(function() {
	var length = $(this).html().length;

	//other menus & submenus revert .html() to initial
	for (var i = 0; i < menuArray.length; i++) {
		$('.title').eq(i).html(menuArray[i]);
	}
	for (var i = 0; i < submenuArray.length; i++) {
		$('.subtitle').eq(i).html(submenuArray[i]);
	}
	
	//if this menu is going down
	if ($('+ li .menu', this).css("display") == "none") {
		//other menus & submenus up
		$('.menu:not(this), .submenu:not(this)').slideUp();
		//change $(this).html()
		$(this).html($(this).html().substring(0, length-36));
		$(this).prepend("- ");
		$(this).append(" -");
	}
	
	//if this menu is going up, show arrow
	else {$('img', this).css("visibility", "initial");}
	
	//toggle this menu
	$('+ li .menu', this).slideToggle(
		400,
		function() {
			//if menu has been toggled up >> all menus are toggled up
			if ($(this).css("display") == "none") {
				//hide everything
				$('#dockButton').hide();
				$('#iframe').hide();
				$('#dropdown').animate(
					{"left": "20vw"},
					1500,
					function() {}
				);
				$("a").css("color", "black");
			}
		}
	);
});



//submenus onclick
$('.subtitle').click(function() {
	var length = $(this).html().length;
	
	//if this submenu is going down
	if ($('+ li .submenu', this).css("display") == "none") {
		//other submenus up
		$('.submenu:not(this)').slideUp();
		//other submenus revert .html() to initial
		for (var i = 0; i < submenuArray.length; i++) {
			$('.subtitle:not(this)').eq(i).html(submenuArray[i]);
		}
		//change $(this).html()
		$(this).html($(this).html().substring(0, length-36));
		$(this).prepend("- ");
		$(this).append(" -");
	}
	
	//if this submenu is going up
	else {
		//revert $(this).html() to initial
		$(this).html($(this).html().substring(2, length-2));
		$(this).append("<img src='openMenuArrow.png' alt=''>");
		$('img', this).css("visibility", "initial");
	}
	
	//toggle this submenu
	$('+ li .submenu', this).slideToggle();
});



//show iframe, dock menu
$('a[target="display"]').click(function() {
	$('a').css("color", "black");
	$(this).css("color", "#00AA00");
	$('#dockButton').show();
	$('#dockButton').css({
		"background": "url('dockNavArrow.png') no-repeat center",
		"background-size": "100%",
		"background-color": "rgba(0, 0, 0, 0.075)"
	});
	var title = $(this).text();
	$('#dropdown').animate(
			{"left": "-63vw"},
			1500,
			function() {
				$('#iframe').show();
				$('#iframeTitle').html(title);
				$('#dockButton').css("transform", "scaleX(-1)");
			}
	);
	$('#dockButton').animate(
			{
				"width": "5vw",
				"height": "56vh"
			},
			1500,
			function() {}
	);
	$('nav').animate(
			{"top": "-2.6em"},
			1500,
			function() {}
	);
	$('h1').animate(
			{"top": "-2em"},
			1500,
			function() {}
	);
	$('#iframe').animate(
			{
				"width": "72vw",
				"height": "70vh",
				"right": "14vw",
				"top": "5vh"
			},
			1500,
			function() {}
	);
});

//undock menu
$('#dockButton').click(function() {
	$('#iframe').hide();
	$('#dropdown').animate(
		{"left": "20vw"},
		1500,
		function() {
		}
	);
	$('#dockButton').css("transform", "scaleX(1)");
	$('#dockButton').animate(
			{
				"width": "1.5vw",
				"height": "100%"
			},
			1500,
			function() {
				$('#dockButton').hide();
			}
	);
	$('nav').animate(
		{"top": "7.5vh"},
		1500,
		function() {}
	);
	$('h1').animate(
		{"top": "5vh"},
		1500,
		function() {}
	);
});
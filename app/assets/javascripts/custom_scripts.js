//Filen innehåller alla jQueryfunstioner som finns med på sidan
$(document).ready(function(){
	
	$("#play_btn").hover(
		function(){	
			$("#maskot").css("background-image", "url(maskot_pointing.png)");
			$("#maskot").hide();
			$("#maskot_pointing").fadeIn();
		});
	
	function setActive(site){
		alert("test");
		switch(site){
			case "nav_home":
				$("#nav_home").addClass("active");
				$("#nav_help").removeClass("active");
				$("#nav_new").removeClass("active");
				$("#nav_login").removeClass("active");
				//$("container").fadeIn(600);
			break;
			case "nav_help":
				$("#nav_help").addClass("active");
				$("#nav_home").removeClass("active");
				$("#nav_new").removeClass("active");
				$("#nav_login").removeClass("active");
				//$("container").fadeIn(600);
			break;
			case "nav_new":
				$("#nav_new").addClass("active");
				$("#nav_home").removeClass("active");
				$("#nav_help").removeClass("active");
				$("#nav_login").removeClass("active");
				//$("container").fadeIn(600);
			break;
				case "nav_login":
				$("#nav_login").addClass("active");
				$("#nav_home").removeClass("active");
				$("#nav_help").removeClass("active");
				$("#nav_new").removeClass("active");
				//$("container").fadeIn(600);
			break;
	}
	}
});
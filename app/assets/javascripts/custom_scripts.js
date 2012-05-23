//Filen innehåller alla jQueryfunstioner som finns med på sidan
$(document).ready(function(){
	
	//Funktion som fade:ar in en annan bild på maskoten.
	$("#play_btn").hover(
		function(){	
			$("#maskot").css("background-image", "url(maskot_pointing.png)");
			$("#maskot").hide();
			$("#maskot_pointing").fadeIn();
		});
	
	//Funktion som sköter dropdown-menyn.
	$("#dropdown-toggle").click(function(){
			if($("#dropdown-menu").is(":visible")){
				$("#dropdown-menu").hide();
				$("#dropdown-toggle").removeClass("active");
			}
			else{
				$("#dropdown-menu").slideDown("slow");
				$("#dropdown-toggle").addClass("active");
			}
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
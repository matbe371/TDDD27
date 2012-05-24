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
		
});
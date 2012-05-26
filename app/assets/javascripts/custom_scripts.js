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
	
	//Funktion som fade:ar in browse-innehåll baerat på dropdown-menyn.
	$("#site_content_selector").change(function(){
		var content = document.getElementById("site_content_selector").value;
		if(content == 1){			
			$("#site_artists").fadeIn();
			$("#site_songs").hide();
			$("#site_albums").hide();
		}
		else if(content == 2){
			
			$("#site_artists").hide();
			$("#site_songs").fadeIn();
			$("#site_albums").hide();
		}
		else if(content == 3){
			$("#site_artists").hide();
			$("#site_songs").hide();
			$("#site_albums").fadeIn();
		}
	});
		
});
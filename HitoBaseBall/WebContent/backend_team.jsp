<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="fsit03_HitoBaseBall.TeamModel"%>
<%@page import="fsit03_HitoBaseBall.Teams"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

session = request.getSession();
String teamId = (String)session.getAttribute("teamId");

if(teamId==null){
	response.sendRedirect("check.jsp");
}else{
	
}

TeamModel team =(TeamModel) request.getAttribute("team");

%>


<!DOCTYPE html>
<html>
<head>
    <title>後台-球隊頁</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="css/backend_team.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel='stylesheet' href='css/modal.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    
    <!--api-->
    <link rel="stylesheet" href="css/api_bootstrap-3.3.2.min.css" type="text/css"/>
    <script type="text/javascript" src="js/bootstrap-3.3.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="css/api_bootstrap-multiselect.css" type="text/css"/>
</head>



<body>
	<!--頁籤 -->
	<div class="w3-bar w3-black">
    	<a href="#" class="w3-bar-item w3-button"></a>
    	<div class="w3-dropdown-hover">
    	
	    	<img alt="menu" src="imgs/ball03_512px_LOGO.png" style=" width: 32px; margin-bottom:10px ">
			<span style=" color: white; font-size: 32px ">HitoBaseball</span>
			
	      	<div class="w3-dropdown-content w3-bar-block w3-card-4">
	        	<a href="index.jsp" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon01_512px.png" style=" width: 24px; ">&nbsp;Hito首頁</a>
				<a href="MyTeam" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon02_512px.png" style=" width: 24px; ">&nbsp;編輯球隊</a>
				<a href="ShowPlayers" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon03_512px.png" style=" width: 24px; ">&nbsp;編輯球員</a>
				<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon04_512px.png" style=" width: 24px; ">&nbsp;造訪球隊</a>
				<a href="Main2" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon03_512px.png" style=" width: 24px; ">&nbsp;預覽球隊主頁</a>
				<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon05_512px.png" style=" width: 24px; ">&nbsp;登出</a>
	       </div>
    	</div>
    </div>

<div class="w3-container"><br><br>


<!--我的球隊圖片，圖片及資料要變更-->
<div class="container w3-white">

<div class="w3-container w3-half ">
	 <div class="w3-panel w3-leftbar w3-border-blue ">
  		<h2 class="w3-text-blue">Edit My TeamLogo</h2>
  	</div>

	<div class="w3-card-4 w3-gray" style="width:60%">
	    <div class="w3-container w3-center">
	      <img src="upload/<%= team.getTeamId() %>_logo.png" style="width:80%; margin-top: 10px;" alt="我的球隊logo">
		  
		  <form action="LogoUpload" enctype="multipart/form-data" method="post">
		      <div class="w3-section">
		        <div>
			        <img class="preview" style="max-width: 150px; max-height: 150px;margin-bottom: 15px;">
	    		</div>
			        <input type="file" title="logo" id="myFile" name="logo" data-filename-placement="inside" class="upl">
			        <button type="submit" class="w3-button w3-blue w3-round-large w3-small" >確定</button>
	       </form>
	        
	      </div>
	    </div>
  </div>
</div>

<!--可修改球隊資料的內容-->
<div class="w3-container w3-half ">
<div class="w3-panel w3-leftbar w3-border-blue">
  		<h2 class="w3-text-blue">Edit My Team Information</h2>
  		<p style="color: black;"><i>Change TeamName or FB_URL or E-mail_Address</i></p>
  	</div>
  	
	<form action="UpdateTeam">
	  <table class="w3-table-all w3-card-4 w3-animate-right">
	  
	    <thead>
	      <tr class="w3-light-grey">
	        <th>球隊名稱</th>
	        <th>FB_URL</th>
	        <th>E-mail_Address</th>
	      </tr>
	    </thead>
	  	
	    <tr>
	      <td contenteditable="true">
	      		<input class="w3-input" name="teamName" type="text"  value=<%= team.getTeamname() %>></td>
	      <td contenteditable="true">
	      		<input class="w3-input" name="fb" type="text" value=<%= team.getFb() %>></td>
	      <td contenteditable="true">
	      		<input class="w3-input" name="email" type="text" value=<%= team.getEmail() %>></td>
	  	</tr>
	  </table>
	  <br>
	  <p><button class="w3-button w3-blue w3-round-large w3-small" type="submit">儲存變更</button></p>
	   
	</form>
</div>

<div class="w3-container" >
<!--幻燈照片區--><hr>
	<div class="w3-panel w3-leftbar w3-border-blue">
		<h2 class="w3-text-blue">Edit Team's SlideShow Photo</h2>
		<p style="color: black;"><i>Edit My SlideShow Photo</i></p>
	</div>
</div>

<form action="PhotoUpload" enctype="multipart/form-data" method="post">
<div class="w3-container w3-quarter ">
	<div class="w3-card-4 w3-gray" style="width:100%">
	    <div class="w3-container w3-center">
	      <img src="upload/<%= team.getTeamId() %>_0_slides.png" style="width:80%; margin-top: 10px;" alt="Team's SlideShow">
	
	      <div class="w3-section">
	      	 <div>
			 	<img class="preview1" style="max-width: 150px; max-height: 150px;margin-bottom: 15px;">
	    	 </div>
	      	<input type="file" title="SlideShow" id="myFile" name="p1" data-filename-placement="inside" class="upl1">
	        <button class="w3-button w3-yellow w3-round-large w3-small">修改</button>
	      </div>
	    </div>
  </div>
</div>

<div class="w3-container w3-quarter ">

	<div class="w3-card-4 w3-gray" style="width:100%">
	    <div class="w3-container w3-center">
	      <img src="upload/<%= team.getTeamId() %>_1_slides.png" style="width:80%; margin-top: 10px;" alt="Team's SlideShow">
	
	      <div class="w3-section">
	         <div>
			 	<img class="preview2" style="max-width: 150px; max-height: 150px;margin-bottom: 15px;">
	    	 </div>
	        <input type="file" title="SlideShow" id="myFile" name="p2" data-filename-placement="inside" class="upl2">
	        <button class="w3-button w3-yellow w3-round-large w3-small">修改</button>
	      </div>
	    </div>
  </div>
</div>

<div class="w3-container w3-quarter ">

	<div class="w3-card-4 w3-gray" style="width:100%">
	    <div class="w3-container w3-center">
	      <img src="upload/<%= team.getTeamId() %>_2_slides.png" style="width:80%; margin-top: 10px;" alt="Team's SlideShow">
	      <div class="w3-section">
	         <div>
			 	<img class="preview3" style="max-width: 150px; max-height: 150px;margin-bottom: 15px;">
	    	 </div>
	        <input type="file" title="SlideShow" id="myFile" name="p3" data-filename-placement="inside" class="upl3">
	        <button class="w3-button w3-yellow w3-round-large w3-small">修改</button>
	      </div>
	    </div>
  </div>
</div>

<div class="w3-container w3-quarter ">

	<div class="w3-card-4 w3-gray" style="width:100%">
	    <div class="w3-container w3-center">
	      <img src="upload/<%= team.getTeamId() %>_3_slides.png" style="width:80%; margin-top: 10px;" alt="Team's SlideShow">
	
	      <div class="w3-section">
	         <div>
			 	<img class="preview4" style="max-width: 150px; max-height: 150px;margin-bottom: 15px;">
	    	 </div>
	        <input type="file" title="SlideShow" id="myFile" name="p4" data-filename-placement="inside" class="upl4">
	        <button class="w3-button w3-yellow w3-round-large w3-small">修改</button>
	      </div>
	    </div>
  </div>
</div>
	<div class="w3-container">
		<p class="w3-right">
			<button class="w3-button w3-teal w3-round-larg" type="submit" style="margin-top: 15px;">確定</button>
		</p>
	</div>
</form>

</div><br>


<footer class="w3-container w3-padding-20 w3-center w3-xlarge" style="background-color:#203562; color:white;">
  <div class="w3-section">
  	<i class="w3-medium">Copyright By
  		<a style="color:lightgray" href="mailto:hitobaseball2017@gmail.com" class="w3-hover-text-white">Ed, Double, Weizi</a></i>
    <i class="fa fa-facebook-official w3-hover-white"></i>
  </div>
</footer>


</body>


<script>
//reload



//logo
$(function (){
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
});


//p1
$(function (){
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.preview1').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl1", function (){
        preview(this);
    })
});

//p2
$(function (){
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.preview2').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl2", function (){
        preview(this);
    })
});

//p3
$(function (){
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.preview3').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl3", function (){
        preview(this);
    })
});

//p4
//p1
$(function (){
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.preview4').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl4", function (){
        preview(this);
    })
});



</script>




<script>
//上傳按鈕API
/*
Bootstrap - File Input
======================
This is meant to convert all file input tags into a set of elements that displays consistently in all browsers.
Converts all
<input type="file">
into Bootstrap buttons
<a class="btn">Browse</a>
*/

(function($) {
$.fn.bootstrapFileInput = function() {
  this.each(function(i,elem){
    var $elem = $(elem);

    // Maybe some fields don't need to be standardized.
    if (typeof $elem.attr('data-bfi-disabled') != 'undefined') {
      return;
    }

    // Set the word to be displayed on the button
    var buttonWord = 'Browse';

    if (typeof $elem.attr('title') != 'undefined') {
      buttonWord = $elem.attr('title');
    }

    var className = '';

    if (!!$elem.attr('class')) {
      className = ' ' + $elem.attr('class');
    }

    // Now we're going to wrap that input field with a Bootstrap button.
    // The input will actually still be there, it will just be float above and transparent (done with the CSS).
    $elem.wrap('<a class="file-input-wrapper btn btn-default ' + className + '"></a>').parent().prepend($('<span></span>').html(buttonWord));
  })

  // After we have found all of the file inputs let's apply a listener for tracking the mouse movement.
  // This is important because the in order to give the illusion that this is a button in FF we actually need to move the button from the file input under the cursor. Ugh.
  .promise().done( function(){

    // As the cursor moves over our new Bootstrap button we need to adjust the position of the invisible file input Browse button to be under the cursor.
    // This gives us the pointer cursor that FF denies us
    $('.file-input-wrapper').mousemove(function(cursor) {
      var input, wrapper,
        wrapperX, wrapperY,
        inputWidth, inputHeight,
        cursorX, cursorY;

      // This wrapper element (the button surround this file input)
      wrapper = $(this);
      // The invisible file input element
      input = wrapper.find("input");
      // The left-most position of the wrapper
      wrapperX = wrapper.offset().left;
      // The top-most position of the wrapper
      wrapperY = wrapper.offset().top;
      // The with of the browsers input field
      inputWidth= input.width();
      // The height of the browsers input field
      inputHeight= input.height();
      //The position of the cursor in the wrapper
      cursorX = cursor.pageX;
      cursorY = cursor.pageY;

      //The positions we are to move the invisible file input
      // The 20 at the end is an arbitrary number of pixels that we can shift the input such that cursor is not pointing at the end of the Browse button but somewhere nearer the middle
      moveInputX = cursorX - wrapperX - inputWidth + 20;
      // Slides the invisible input Browse button to be positioned middle under the cursor
      moveInputY = cursorY- wrapperY - (inputHeight/2);

      // Apply the positioning styles to actually move the invisible file input
      input.css({
        left:moveInputX,
        top:moveInputY
      });
    });

    $('body').on('change', '.file-input-wrapper input[type=file]', function(){

      var fileName;
      fileName = $(this).val();

      // Remove any previous file names
      $(this).parent().next('.file-input-name').remove();
      if (!!$(this).prop('files') && $(this).prop('files').length > 1) {
        fileName = $(this)[0].files.length+' files';
      }
      else {
        fileName = fileName.substring(fileName.lastIndexOf('\\') + 1, fileName.length);
      }

      // Don't try to show the name if there is none
      if (!fileName) {
        return;
      }

      var selectedFileNamePlacement = $(this).data('filename-placement');
      if (selectedFileNamePlacement === 'inside') {
        // Print the fileName inside
        $(this).siblings('span').html(fileName);
        $(this).attr('title', fileName);
      } else {
        // Print the fileName aside (right after the the button)
        $(this).parent().after('<span class="file-input-name">'+fileName+'</span>');
      }
    });

  });

};

// Add the styles before the first stylesheet
// This ensures they can be easily overridden with developer styles
var cssHtml = '<style>'+
  '.file-input-wrapper { overflow: hidden; position: relative; cursor: pointer; z-index: 1; }'+
  '.file-input-wrapper input[type=file], .file-input-wrapper input[type=file]:focus, .file-input-wrapper input[type=file]:hover { position: absolute; top: 0; left: 0; cursor: pointer; opacity: 0; filter: alpha(opacity=0); z-index: 99; outline: 0; }'+
  '.file-input-name { margin-left: 8px; }'+
  '</style>';
$('link[rel=stylesheet]').eq(0).before(cssHtml);

})(jQuery);

$('input[type=file]').bootstrapFileInput();
$('.file-inputs').bootstrapFileInput();


</script>
</html>
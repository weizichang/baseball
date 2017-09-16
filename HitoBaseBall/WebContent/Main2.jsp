<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fsit03_HitoBaseBall.*" %>
<%
	Team team = (Team)request.getAttribute("team");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title><%= team.getName() %></title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel='stylesheet' href='css/modal.css'>
  <link rel='stylesheet' href='css/index.css'>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

<div class="container">

  <div class="w3-content w3-display-container front_0" style=" max-width:100%; margin-bottom:20px;">
		<img class="mySlides headers" src="upload/<%= team.getTeamId() %>_0_slides.png" alt="Image"> 		<!-- w3-opacity-min -->
		<img class="mySlides headers" src="upload/<%= team.getTeamId() %>_1_slides.png" alt="Image">
		<img class="mySlides headers" src="upload/<%= team.getTeamId() %>_2_slides.png" alt="Image">
		<img class="mySlides headers" src="upload/<%= team.getTeamId() %>_3_slides.png" alt="Image">
		 <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style=" width:100% ">
		   <div class="w3-left w3-hover-text-khaki w3-xlarge" onclick="plusDivs(-1)">&#10094;</div>
		   <div class="w3-right w3-hover-text-khaki w3-xlarge" onclick="plusDivs(1)">&#10095;</div>
		   <span class="w3-badge demo w3-border w3-transparent w3-hover-yellow" onclick="currentDiv(1)"></span>
		   <span class="w3-badge demo w3-border w3-transparent w3-hover-yellow" onclick="currentDiv(2)"></span>
		   <span class="w3-badge demo w3-border w3-transparent w3-hover-yellow" onclick="currentDiv(3)"></span>
		   <span class="w3-badge demo w3-border w3-transparent w3-hover-yellow" onclick="currentDiv(4)"></span>
		 </div>
	</div>
<!-- 球隊資料 -->
<div >	
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
	      		<input class="w3-input" name="teamName" type="text"  value=<%= team.getName() %>></td>
	      <td contenteditable="true">
	      		<input class="w3-input" name="fb" type="text" value="https://zh-tw.facebook.com/weloveIII/"></td>
	      <td contenteditable="true">
	      		<input class="w3-input" name="email" type="text" value="iii.org@gmail.com"></td>
	  	</tr>
	  </table>
</div>
</div>
<footer class="w3-container w3-padding-20 w3-center w3-xlarge w3-bottom" style="background-color:#203562; color:white;">
  <div class="w3-section">
  	<i class="w3-medium">Copyright By
  		<a style="color:lightgray" href="mailto:hitobaseball2017@gmail.com" class="w3-hover-text-white">Ed, Double, Weizi</a></i>
    <i class="fa fa-facebook-official w3-hover-white"></i>
  </div>
</footer>

<script>
var myFunction = function (e) {
	this.onerror=null;
	e.src = "./upload/img/playerhead.png"
}

//Control of Headers's Change
var slideIndex = 1;
showDivs(slideIndex);		//1st Slide in headers
Slideshow();				//Slideshow start

function plusDivs(n) {
	clearTimeout(timer);		//Clear original Slideshow
  	showDivs(slideIndex += n);	//Change to user's choice
  	Slideshow();				//Start a NEW Slideshow
	}

function currentDiv(n) {
	clearTimeout(timer);		//Clear original Slideshow
 	showDivs(slideIndex = n);	//Change to user's choice
 	Slideshow();				//Start a NEW Slideshow
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}

function Slideshow(){
	timer = setTimeout(function(){
		slideIndex++;
		showDivs(slideIndex);
		timer = setTimeout(arguments.callee, 2500);
	} ,2500);
}

//Control of Headers's Height
getBodyWidthHeight();
function getBodyWidthHeight() {
	var w = document.body.scrollWidth;
	var h = document.body.scrollHeight;
	var	w_header = w * 0.60;
	var h_header = h * 0.60;
	//console.log('scrollWidth:' + w_header);
	//console.log('scrollHeight:' + h_header);
	var headers = document.getElementsByClassName("headers");
	for(var i =0; i<headers.length; i++){
		headers[i].style.height = h_header + 'px';
	}
}
setInterval(getBodyWidthHeight, 100);
</script>
</body>
</html>

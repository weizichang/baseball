<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="keywords" content="棒球,紀錄,baseball,record" />
	<meta name="description" content="歡迎來到「快速、簡易、即時的棒球球隊管理紀錄平台」" />
	<meta name="author" content="Ed, Double, Weizi">
	<meta name="URL" content="http://hitobaseball.com">
	
	<title>HitoBaseball</title>
	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Create an XMLHttpRequest Object -->
	<script>
		var xmlhttp;
		if (window.XMLHttpRequest) {
		    // code for modern browsers
		    xmlhttp = new XMLHttpRequest();
		 } else {
		    // code for old IE browsers
		    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	</script>
<!-- Create an XMLHttpRequest Object -->

<!-- Import CSS -->
	<link rel='stylesheet' href='css/modal.css'>
	<link rel='stylesheet' href='css/index.css'>
<!-- Import CSS -->

	<style>
/* 		body { */
/* 			font-family: Helvetica, Arial, "文泉驛正黑", "WenQuanYi Zen Hei", "儷黑 Pro", "LiHei Pro", Meiryo, "微軟正黑體", "Microsoft JhengHei", sans-serif; */
/* 		} */
		
/* 		.mySlides { display: none; } */
/* 		.w3-left, .w3-right, .w3-badge { cursor: pointer; } */
/* 		.w3-badge { height: 13px; width: 13px; padding: 0; } */
		
/* 		.front_10 { z-index: 10; position: absolute; } */
/* 		.front_0 { z-index: 0; position: relative; } */
		
/* 		.headers { width: 100%; object-fit: cover; height: 640px; } */
		
/* 		.myballs1, .myballs2, .myballs3 { display: none; } */
		
/* 		.hrstyle {  */
/* 			border : 0; */
/* 			height: 1px;  */
/* 			background-image: linear-gradient(to right, rgba(192, 192, 192, 0.1), rgba(192, 192, 192, 0.5), rgba(192, 192, 192, 0.1));			 */
/* 		} */
		
/* 		.linkbtn {  */
/* 			width: 100%;  */
/* 			margin: 0 auto;  */
/* 			padding: 20px; */
/* 			display: table; */
/* 		 }		 */
/* 		.linkimg0 { */
/* 			width: calc(100% / 3 - 80px); */
/* 			height: 260px; */
/* 			display: inline-block; */
/* 			margin: 20px 40px; */
/* 			/*border: 3px solid red;*/ */
/* 			border-radius: 5px; */
/* 			background:white url("imgs/button03.jpg") center no-repeat; */
/* 			background-size: cover; */
/* 			position: relative; */
/* 			cursor:pointer; */
/* 		} */
/* 		.linkimg1 { */
/* 			width: calc(100% / 3 - 80px); */
/* 			height: 260px; */
/* 			display: inline-block; */
/* 			margin: 20px 40px; */
/* 			/*border: 3px solid red;*/ */
/* 			border-radius: 5px; */
/* 			background:white url("imgs/button09.jpg") center no-repeat; */
/* 			background-size: cover; */
/* 			position: relative; */
/* 			cursor:pointer; */
/* 		}		 */
/* 		.linkimg2 { */
/* 			width: calc(100% / 3 - 80px); */
/* 			height: 260px; */
/* 			display: inline-block; */
/* 			margin: 20px 40px; */
/* 			/*border: 3px solid red;*/ */
/* 			border-radius: 5px; */
/* 			background:white url("imgs/button02.jpg") center no-repeat; */
/* 			background-size: cover; */
/* 			position: relative; */
/* 			cursor:pointer; */
/* 		}		 */
/* 		.linkimgtitle { 	 */
/* 			position: absolute;  */
/* 			width: 100%; */
/* 			bottom: 0px; right: 0px;  */
/* 			text-align: right;  */
/* 			border-radius: 0 0 5px 5px; */
/* 			color: white; */
/* 			background-color: black;  */
/* 			opacity: 0.7; filter: Alpha(opacity=70); /*IE8 and earlier*/ */
/* 			font-size: 3.5vh; */
/* 			cursor:pointer; */
/* 		} */
/* 		.linkimg0:hover > .linkimgtitle { display: none; } */
/* 		.linkimg1:hover > .linkimgtitle { display: none; } */
/* 		.linkimg2:hover > .linkimgtitle { display: none; }			 */
/* 		.linkimgtext { */
/* 			position: absolute; */
/* 			width: 100%; */
/* 			height: 100%; */
/* 			top: 0px; left: 0px; */
/* 			text-align: center; */
/* 			border-radius: 5px; */
/* 			color: transparent; */
/* 			background-color: black;  */
/* 			opacity: 0.0; filter: Alpha(opacity=0); /*IE8 and earlier*/ */
/* 			font-size: 5vh; */
/* 			cursor:pointer; */
/* 		} */
/* 		.linkimgtext:hover { */
/* 			color: white; */
/* 			opacity: 0.7; filter: Alpha(opacity=70); /*IE8 and earlier*/ */
/* 			overflow: hidden; */
/* 		} */
		

				
/* 		@media screen and (min-width: 768px) and (max-width: 1260px) { */
/* 			.linkimg0, .linkimg1, .linkimg2 { */
/* 				width: calc(100% - 240px); */
/* 				height: 460px; */
/* 				margin: 80px 120px; */
/* 			} */
/* 		} */
		
/* 		@media screen and (min-width: 0px) and (max-width: 768px) { */
/* 			.linkimg0, .linkimg1, .linkimg2 { */
/* 				width: calc(100% - 40px); */
/* 				height: 180px; */
/* 				margin: 20px 20px; */
/* 			} */
/* 		}			 */
		
	</style>
	
	

	
</head>

<body>
<!-- Header: Menu -->
	<div class="w3-container front_10">
		<p></p>
		<div class="w3-dropdown-hover">
			<img alt="menu" src="imgs/ball03_512px_LOGO.png" style=" width: 32px; ">
			<span style=" color: white; font-size: 32px ">HitoBaseball</span>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon01_512px.png" style=" width: 24px; ">&nbsp;Hito首頁</a>
				<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon02_512px.png" style=" width: 24px; ">&nbsp;建立球隊</a>
				<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon03_512px.png" style=" width: 24px; ">&nbsp;編輯球隊</a>
				<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon04_512px.png" style=" width: 24px; ">&nbsp;造訪球隊</a>
				<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon05_512px.png" style=" width: 24px; ">&nbsp;快速登入</a>
			</div>
		</div>
	</div>
<!-- Header: Menu -->


<!-- Header: Slideshow -->
	<div class="w3-content w3-display-container front_0" style=" max-width:100% ">
		<img class="mySlides headers" src="imgs/header01.jpg" >		<!-- w3-opacity-min -->
		<img class="mySlides headers" src="imgs/header06.jpg" >
		<img class="mySlides headers" src="imgs/header13.jpg" >
		<img class="mySlides headers" src="imgs/header14.jpg" >
		 <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style=" width:100% ">
		   <div class="w3-left w3-hover-text-khaki w3-xlarge" onclick="plusDivs(-1)">&#10094;</div>
		   <div class="w3-right w3-hover-text-khaki w3-xlarge" onclick="plusDivs(1)">&#10095;</div>
		   <span class="w3-badge demo w3-border w3-transparent w3-hover-yellow" onclick="currentDiv(1)"></span>
		   <span class="w3-badge demo w3-border w3-transparent w3-hover-yellow" onclick="currentDiv(2)"></span>
		   <span class="w3-badge demo w3-border w3-transparent w3-hover-yellow" onclick="currentDiv(3)"></span>
		   <span class="w3-badge demo w3-border w3-transparent w3-hover-yellow" onclick="currentDiv(4)"></span>
		 </div>
	</div>
	
	<div class="w3-row">	
		<div class="w3-col w3-red" style=" width: 7.5% ">
		<p></p>	
		</div>
		
		<div class="w3-col w3-orange" style=" width: 25% ">
		<p></p>	
		</div>

		<div class="w3-col w3-yellow" style=" width: 5% ">
		<p></p>	
		</div>
		
		<div class="w3-col w3-green" style=" width: 25% ">
		<p></p>	
		</div>
		
		<div class="w3-col w3-blue" style=" width: 5% ">
		<p></p>	
		</div>
										
		<div class="w3-col w3-indigo" style=" width: 25% ">
		<p></p>	
		</div>
		
		<div class="w3-col w3-purple" style=" width: 7.5% ">	
		<p></p>
		</div>							
	</div>	
	
	<script>
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
				timer = setTimeout(arguments.callee, 5000);
			} ,5000);
		}
		
		//Control of Headers's Height
		getBodyWidthHeight();
		function getBodyWidthHeight() {
			var w = document.body.scrollWidth;
			var h = document.body.scrollHeight;
			var	w_header = w * 0.40;
			var h_header = h * 0.40;
			//console.log('scrollWidth:' + w_header);
			//console.log('scrollHeight:' + h_header);
			var headers = document.getElementsByClassName("headers");
			for(var i =0; i<headers.length; i++){
				headers[i].style.height = h_header + 'px';
			}
		}
		setInterval(getBodyWidthHeight, 100);
	</script>
<!-- Header: Slideshow -->

	
<!-- Middle -->
	<div style=" text-align:center; height:246px; ">
		<div class="w3-container" style=" margin: 0px auto; ">
			<br>
			<span style=" font-size: 48px; color: #8E8B82; ">體驗即刻開始</span><br><br>
			<div style=" text-align:center; height:88px; ">
			<img class="myballs1" src="imgs/ball01_512px.jpg" style=" width: 12px; height: auto; "><br>
			<img class="myballs2" src="imgs/ball01_512px.jpg" style=" width: 20px; height: auto; "><br>
			<img class="myballs3" src="imgs/ball01_512px.jpg" style=" width: 30px; height: auto; "><br><br>
			</div>
			<span style=" font-size: 24px; color: #8E8B82; ">請先選擇您的身份</span>
		</div>
	</div>
	
	<script>
		function myballsSlide(){
			var myballs1 = document.getElementsByClassName("myballs1");
			var myballs2 = document.getElementsByClassName("myballs2");
			var myballs3 = document.getElementsByClassName("myballs3");
			setTimeout(function(){ myballs1[0].style.display = "inline"; }, 500);
			setTimeout(function(){ myballs2[0].style.display = "inline"; }, 1000);
			setTimeout(function(){ myballs3[0].style.display = "inline"; }, 1500);
			setTimeout(function(){ 
						myballs1[0].style.display = "none";
						myballs2[0].style.display = "none";
						myballs3[0].style.display = "none"; }
			, 2000);
		}
		setInterval(myballsSlide, 2500);		
	</script>
	
	<hr class="hrstyle">
	<div class="linkbtn">
	
<!-- Build Edit Team -->	
		<div class="linkimg0 w3-card-4" id="BuildTeamImg">
			<div class="linkimgtitle">
				<span>New Coach || Manager&nbsp;</span>
			</div>			
			<div class="linkimgtext">
				<p style=" text-decoration:underline; ">建立球隊網站</p>
				<p style=" color: yellow; font-size: 2.5vh; ">免費擁有<br>球隊專屬頁面</p>
			</div>
		</div>	

		<div class="linkimg1 w3-card-4" id="EditTeamImg">
			<div class="linkimgtitle">
				<span>Existing Coach || Manager&nbsp;</span>
			</div>			
			<div class="linkimgtext">
				<p style=" text-decoration:underline; ">編輯所屬球隊</p>
				<p style=" color: yellow; font-size: 2.5vh; ">登入後台<br>輕鬆管理球隊</p>
			</div>
		</div>

		<div class="w3-modal" id="LoginModal">
		
		<div class="container_m">
			<section id="content">		
				<span class="w3-button w3-display-topright w3-large" 
		        onclick="document.getElementById('LoginModal').style.display='none'">&times;</span>	
				<form action="Logging">
					<h1>歡迎登入</h1>
					<div>
						<input type="email" name='mail' placeholder="電子信箱" required=""  
						id="LoginAcc"/>
					</div>
					<div>
						<input type="password" name='password' placeholder="登入密碼" required="" 
						id="LoginPass" />
					</div>					
					<div>
						<input type="submit" value="登入" />
						<a href="#">忘記密碼?</a>
						<a href="#">註冊</a>
					</div>
				</form>
			</section>
		</div>	
  			
		</div>

		<script>
			//open the LoginModal
			var BuildTeamImg = document.getElementById("BuildTeamImg");
			var EditTeamImg = document.getElementById("EditTeamImg");
			var LoginModal = document.getElementById("LoginModal");
			
 			BuildTeamImg.onclick = function() { 
 				LoginModal.style.display = "block"; 
 			}
			EditTeamImg.onclick = function() { 
				LoginModal.style.display = "block"; 
			}
		</script>
<!-- Build Edit Team -->
		
<!-- Find Team -->
		<div class="linkimg2 w3-card-4" id="findTeamImg">
			<div class="linkimgtitle">
				<span>Family || Fans&nbsp;</span>
			</div>			
			<div class="linkimgtext">
				<p style=" text-decoration:underline; ">造訪支持球隊</p>
				<p style=" color: yellow; font-size: 2.5vh; ">聲援關注<br>您喜愛的球隊</p>
			</div>
		</div>

		<div class="w3-modal" id="findTeamModal">
		
		<div class="container_m">
			<section id="content">		
				<span class="w3-button w3-display-topright w3-large" 
		        onclick="document.getElementById('findTeamModal').style.display='none'">&times;</span>	
				<form action="">
					<h1>造訪支持球隊</h1>
					<div>
						<input type="text" placeholder="輸入球隊名稱..." required=""  
						id="findTeamInput" onkeyup="findTeamFilter()"/>
					</div>
					<div>
						<input type="submit" value="GO" />
					</div>
					
					<table class="w3-table-all " id="findTeamTable" 
					style=" table-layout: fixed; margin: 20px auto; display: block; overflow-y: auto; height: 190px; ">
					    <tr>
					      <th style=" width: 45%; ">球隊名稱</th>
					      <th style=" width: 45%; ">連絡電話</th>
					      <th style=" width: 90%; ">Facebook</th>
					    </tr> 
				  	</table>
				</form>
			</section>
		</div>	
  			
		</div>
		
		<script>
			//open the findTeamModal
			var findTeamImg = document.getElementById("findTeamImg");
			var findTeamModal = document.getElementById("findTeamModal");
			var findTeamInput = document.getElementById("findTeamInput");
			var findTeamTable = document.getElementById("findTeamTable");
			var tr = findTeamTable.getElementsByTagName("tr");
			
			findTeamImg.onclick = function() { 
				findTeamModal.style.display = "block"; 
			}
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			    if (event.target == findTeamModal) {
			    	findTeamModal.style.display = "none";
			    }else if (event.target == LoginModal) {
			    	LoginModal.style.display = "none";
			    }
			}
			
			//TeamName Filter
			function findTeamFilter() {
			  var filter = findTeamInput.value.toUpperCase();
			  
			  for (var i = 0; i < tr.length; i++) {
			    var td = tr[i].getElementsByTagName("td")[0];
			    if (td) {
			      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }
			  }
			}
			
			//Find existing Team list via AJAX(only execute once)
			findTeamStatic();
			function findTeamStatic(){
				xmlhttp.open("GET", "http://localhost:8080/HitoBaseBall/findTeam", true);
	        	xmlhttp.onreadystatechange = function () {
	        		if(xmlhttp.readyState == 4  && xmlhttp.status == 200){	        			
	        			var xml = xmlhttp.responseXML;
	        			for(var i = 0; i < xml.getElementsByTagName("team").length; i++){
	        				var name = xml.getElementsByTagName("name")[i].childNodes[0].nodeValue;
	        				var tel = xml.getElementsByTagName("tel")[i].childNodes[0].nodeValue;
	        				var fb = xml.getElementsByTagName("fb")[i].childNodes[0].nodeValue;
	        				
        					var tr_new = findTeamTable.insertRow(-1);
	                        var td0_new = tr_new.insertCell(0);
	                        var td1_new = tr_new.insertCell(1);
	                        var td2_new = tr_new.insertCell(2);
	                        
	                        td0_new.innerHTML = name;
	                        if(tel == "null" || tel == "NULL"){
	                        	td1_new.innerHTML = "尚未建立";
	                        }else{
		                        td1_new.innerHTML = tel;
	                        }	                        
	                        if(fb == "null" || fb == "NULL"){
	                        	td2_new.innerHTML = "尚未建立";
	                        }else{
		        				var fb_tag = document.createElement("a");
		        				var fb_text = document.createTextNode("Link FB !!!");
		        				fb_tag.setAttribute("href", fb.toString());
		        				fb_tag.setAttribute("target", "_blank");
		        				fb_tag.appendChild(fb_text);
		                        td2_new.appendChild(fb_tag);
	                        }
	                        td0_new.style.width = "45%";
	                        td1_new.style.width = "45%";
	                        td2_new.style.width = "90%";
	        			}
	        		}        		
	        	};
	        	xmlhttp.send();				
			}

			//Find new Team list via AJAX(dynamic execute)
			function findTeamDynam(){
				xmlhttp.open("GET", "http://localhost:8080/HitoBaseBall/findTeam", true);
	        	xmlhttp.onreadystatechange = function () {
	        		if(xmlhttp.readyState == 4  && xmlhttp.status == 200){	        			
	        			var xml = xmlhttp.responseXML;
	        			var xml_L = xml.getElementsByTagName("team").length;
	        			var tr_L = tr.length - 1;
	        			var differ_L = xml_L - tr_L;
	        			
	        			if(differ_L > 0 ){
	        				for(var i = tr_L; i < xml_L; i++){
		        				var name = xml.getElementsByTagName("name")[i].childNodes[0].nodeValue;
		        				var tel = xml.getElementsByTagName("tel")[i].childNodes[0].nodeValue;
		        				var fb = xml.getElementsByTagName("fb")[i].childNodes[0].nodeValue;
		        				
	        					var tr_new = findTeamTable.insertRow(-1);
		                        var td0_new = tr_new.insertCell(0);
		                        var td1_new = tr_new.insertCell(1);
		                        var td2_new = tr_new.insertCell(2);
		                        
		                        td0_new.innerHTML = name;
		                        if(tel == "null" || tel == "NULL"){
		                        	td1_new.innerHTML = "尚未建立";
		                        }else{
			                        td1_new.innerHTML = tel;
		                        }	                        
		                        if(fb == "null" || fb == "NULL"){
		                        	td2_new.innerHTML = "尚未建立";
		                        }else{
			        				var fb_tag = document.createElement("a");
			        				var fb_text = document.createTextNode("Link FB !!!");
			        				fb_tag.setAttribute("href", fb.toString());
			        				fb_tag.setAttribute("target", "_blank");
			        				fb_tag.appendChild(fb_text);
			                        td2_new.appendChild(fb_tag);
		                        }
		                        td0_new.style.width = "45%";
		                        td1_new.style.width = "45%";
		                        td2_new.style.width = "90%";
	        				}
	        			}
	        		}        		
	        	};
	        	xmlhttp.send();				
			}
			setInterval(findTeamDynam, 5000);
		</script>
<!-- Find Team -->		
		
	</div>										
	<hr class="hrstyle">
<!-- Middle -->
	
<!-- Footer -->
	<div style=" text-align: center; background-color: #203562; color: white ">
		<div class="w3-container" >
			<h1>&nbsp;</h1> 
			<p>Footer Text</p> 
		</div>
	</div>
<!-- Footer -->



</body>
</html>
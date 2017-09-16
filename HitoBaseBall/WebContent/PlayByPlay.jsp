<%@page import="fsit03_HitoBaseBall.BoxModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoxModel box = (BoxModel)request.getAttribute("box");
	ArrayList<String> broadcast = (ArrayList<String>)request.getAttribute("broadcast");
	/*ArrayList<Integer> homeBatterTotal = new ArrayList<>();
	ArrayList<Integer> awayBatterTotal = new ArrayList<>();
	ArrayList<Integer> homePitcherTotal = new ArrayList<>();
	ArrayList<Integer> awayPitcherTotal = new ArrayList<>();
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>BoxScore</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="box_style.css" type="text/css" />
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
   /* Add a gray background color and some padding to the footer */
   body {
		font-family: Helvetica, Arial, "��瘜�撽�甇�暺�", "WenQuanYi Zen Hei", "�琿� Pro", "LiHei Pro", Meiryo, "敺株�甇�暺�擃�", "Microsoft JhengHei", sans-serif;
		background: url("./imgs/3.jpg") center no-repeat;
		background-size: cover;
	}
	.table{
	  background-color:#BDF1F6;
	}
</style>
</head>
<body>

<!--��bar��-->
<div class="w3-bar w3-black">
	<a href="#" class="w3-bar-item w3-button"></a>
	<div class="w3-dropdown-hover">
	
	 	<img alt="menu" src="imgs/ball03_512px_LOGO.png" style=" width: 32px; margin-bottom:10px ">
		<span style=" color: white; font-size: 32px ">HitoBaseball</span>
	
	   	<div class="w3-dropdown-content w3-bar-block w3-card-4">
	     	<a href="index.jsp" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon01_512px.png" style=" width: 24px; ">&nbsp;Hito首頁</a>
			<a href="MyTeam" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon02_512px.png" style=" width: 24px; ">&nbsp;編輯球隊</a>
			<a href="ShowPlayers" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon03_512px.png" style=" width: 24px; ">&nbsp;編輯球員</a>
			<a href="Main" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon04_512px.png" style=" width: 24px; ">&nbsp;造訪球隊</a>
			<a href="ShowPlayer" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon03_512px.png" style=" width: 24px; ">&nbsp;球員列表</a>
			<a href="Schedule" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<i class="fa fa-calendar" style="font-size:26px"></i>&nbsp;賽程</a>
			<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon05_512px.png" style=" width: 24px; ">&nbsp;登出</a>
	    </div>
	    
	</div>
</div><br>
<!--��bar��-->
	  
<!--��all��-->
<div class="container">
<!--��瘥�鞈質����踱��-->

<div class="date_pick_bar">2017-09-20</div>
	<div class="date_pick">
		<div class="arr_left">
	   		<a href="#">
	     		<img src="imgs/icon_arrow2_left.png" width="50" height="50" align="absmiddle"; />
	   		</a>
	 	</div>
	 
	 <ul class="vs_box_bar" id="vs_blue_board_contextbox_bar">
		<li class="game" id="box_team_151" >
			<a href="#" class=  "vs_box_focus" >
				<div class="vs_team">
					<img src="imgs/no.jpg" width="30" height="30" align="absmiddle" />
				</div>
				
				<div class="vs_info">
					&nbsp;							
					<div class="vs_score">
						0<span class="vs_final">Live</span>
						0
					</div>
				</div>
				<div class="vs_team">
					<img src="imgs/freestyle.jpg" width="30" height="30" align="absmiddle" />
				</div>
			</a>
		</li>
	</ul>
	
	<div class="arr_right">
	  <a href="#">
	    <img src="imgs/icon_arrow2_right.png" width="50" height="50" align="absmiddle"; />
	  </a>
	</div>
	
</div>
<!--��瘥�鞈質����踱��-->
	
<!--��PLAY BY PLAY��-->
<div class="gray_tab_bar">
	<a href="BoxScore?iid=1" class="gray_tab gray_tab_focus">BOX</a>
	<a href="PlayByPlay" class="gray_tab">PLAY BY PLAY</a>
</div>
<!--��PLAY BY PLAY��-->
	
<!--��憭�撅�閮����踱��-->
<div class="blue_board">
	<div class="container">
		
		<div class="team_part">
			<div class="m_cell"><img src="imgs/no.jpg" width="120" height="120" /></div>
		</div>
			
		<div class="score_part">
			<div class="m_cell">
				<div class="score_board">
					<div class="score_board_side gap_l20">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="score_table w3-card-4">
							<tr>
								<th>&nbsp;</th>
							</tr>
							<tr>
								<td align="left" class="team">我覺得不行</td>
							</tr>
							<tr>
								<td align="left" class="team">你有FreeStyle嗎</td>
							</tr>
						</table>
					</div>
					
					<div class="score_board_main">
						<table border="0" cellspacing="0" cellpadding="0" class="score_table w3-card-4 " id="game_score_board"  align="center">
							<tr>
								<%
									for(int i = 0 ; i < 9; i ++){%>
										<th><%= i + 1 %></th>
									<%}
								%>
							</tr>
							<tr>
								<%
									for(int i = 0 ; i <9; i ++){%>
										<td>
											<span></span>
										</td>
									<%}
								%>
							</tr>
							<tr>
								<%
									for(int i = 0 ; i < 9; i ++){%>
										<td>
											<span></span>
										</td>
									<%}
								%>
							</tr>
						</table>
					</div>
					
					<div class="score_board_side">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="score_table  w3-card-4 " align="center">
							<tr>
								<th >R</th>
								<th >H</th>
								<th >E</th>
							</tr>
							<tr>
								<%
									for(int i = 0 ; i < 3; i ++){%>
										<td>
											0
										</td>
									<%}
								%>
							</tr>
							<tr>
								<%
									for(int i = 0 ; i < 3; i ++){%>
										<td>
											0
										</td>
									<%}
								%>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
			<div class="team_part">
				<div class="m_cell"><img src="imgs/freestyle.jpg" width="120" height="120" /></div>
			</div>
			<div class="clean"></div>
	</div>
</div>

<!-- <div class="container">... -->
 <div class="w3-tag w3-round w3-blue w3-animate-top" style="padding:5px; width:970px; margin-bottom:10px;">
		    <div class="w3-tag w3-round w3-blue w3-border w3-border-white" style="width:960px">
		  		<h4>即時賽況</h4>
		  	</div>
  	  </div>
<div class='broadcast w3-tag w3-round w3-black' style="padding:5px; width:970px; margin-bottom:20px;">
<div class="w3-tag w3-round w3-black w3-border w3-border-white" style="width:960px">
		  	<% 
		  		for(String text : broadcast){%>
		  			<h4 align='left'><%= text %></h4><br>
		  		<%}
		  	%>
		  	</div>
		  	</div>  	  

<footer class="w3-container w3-padding-20 w3-center w3-xlarge" style="background-color:#203562; color:white;">
  <div class="w3-section">
  	<i class="w3-medium">Copyright By
  		<a style="color:lightgray" href="mailto:hitobaseball2017@gmail.com" class="w3-hover-text-white">Ed, Double, Weizi</a></i>
    <i class="fa fa-facebook-official w3-hover-white"></i>
  </div>
</footer>
<script>
//定義XMLHttpRequest物件

function test() { 
	$.get("BroadcastAjax", function(responseText) { 
	    //$(".broadcast").text(responseText);
	    var b = document.getElementsByClassName("broadcast");
	    console.log(b);
	    var h = document.createElement("H4");                // Create a <h1> element
	    var t = document.createTextNode(responseText);     // Create a text node
	    h.appendChild(t);
	    h.style.textAlign = "left";
	    if(responseText.length != 0){
	    	b[0].appendChild(h);
		    var br = document.createElement("br");
		    b[0].appendChild(br);	
	    }
	    	   
	});
}
setInterval(test, 2* 1000);
</script>
</body>
</html>
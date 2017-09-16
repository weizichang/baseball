<%@page import="fsit03_HitoBaseBall.BoxModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoxModel box = (BoxModel)request.getAttribute("box");
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
		font-family: Helvetica, Arial, "文泉驛正黑", "WenQuanYi Zen Hei", "儷黑 Pro", "LiHei Pro", Meiryo, "微軟正黑體", "Microsoft JhengHei", sans-serif;
		background: url("./imgs/3.jpg") center no-repeat;
		background-size: cover;
	}
	.table{
	  background-color:#BDF1F6;
	}
</style>
</head>
<body>

<!--↓bar↓-->
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
<!--↑bar↑-->
	  
<!--↓all↓-->
<div class="container">
<!--↓比賽記分板↓-->

<div class="date_pick_bar"><%= box.getBoard().getDate() %></div>
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
						<%= box.getBoard().getAwayRHE()[0] %><span class="vs_final">F</span>
						<%= box.getBoard().getHomeRHE()[0] %>
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
<!--↑比賽記分板↑-->
	
<!--↓PLAY BY PLAY↓-->
<div class="gray_tab_bar">
	<a href="BoxScore?iid=<%= box.getBoard().getIid() %>" class="gray_tab gray_tab_focus">BOX</a>
	<a href="PlayByPlay" class="gray_tab">PLAY BY PLAY</a>
</div>
<!--↑PLAY BY PLAY↑-->
	
<!--↓多局記分板↓-->
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
								<td align="left" class="team"><%= box.getBoard().getAwayTeam() %></td>
							</tr>
							<tr>
								<td align="left" class="team"><%= box.getBoard().getHomeTeam() %></td>
							</tr>
						</table>
					</div>
					
					<div class="score_board_main">
						<table border="0" cellspacing="0" cellpadding="0" class="score_table w3-card-4 " id="game_score_board"  align="center">
							<tr>
								<%
									for(int i = 0 ; i < box.getBoard().getAwayInningScore().size(); i ++){%>
										<th><%= i + 1 %></th>
									<%}
								%>
							</tr>
							<tr>
								<%
									for(int i = 0 ; i < box.getBoard().getAwayInningScore().size(); i ++){%>
										<td>
											<span><%= box.getBoard().getAwayInningScore().get(i) %></span>
										</td>
									<%}
								%>
							</tr>
							<tr>
								<%
									for(int i = 0 ; i < box.getBoard().getHomeInningScore().size(); i ++){%>
										<td>
											<span><%= box.getBoard().getHomeInningScore().get(i) %></span>
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
									for(int i = 0 ; i < box.getBoard().getAwayRHE().length; i ++){%>
										<td>
											<%= box.getBoard().getAwayRHE()[i] %>
										</td>
									<%}
								%>
							</tr>
							<tr>
								<%
									for(int i = 0 ; i < box.getBoard().getHomeRHE().length; i ++){%>
										<td>
											<%= box.getBoard().getHomeRHE()[i] %>
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
<!--↑多局記分板↑-->



<!--↓打擊成績↓-->
<!--↓打擊左球隊↓-->
<!-- <div class="container">... -->
 <div class="w3-tag w3-round w3-blue w3-animate-top" style="padding:5px; width:970px; margin-bottom:10px;">
		    <div class="w3-tag w3-round w3-blue w3-border w3-border-white" style="width:960px">
		  		<h4>打擊成績</h4>
		  	</div>
  	  </div>
<div class="w3-row-padding">
<div class="w3-half">
	 
	    
	  <table class=" w3-card-4 w3-table-all w3-hoverable">
	  
	      <tr class="w3-blue">
	      	<th><%= box.getBoard().getAwayTeam() %></th>
	      	<th>AB</th>
	      	<th title='安打' >H</th>
	      	<th title='打點' >RBI</th>
	      	<th title='四壞球' class="respone">BB</th>
	      	<th title='被三振' class="respone">SO</th>
	      	<th title='盜壘' class="respone">SB</th>
	      	<th title='打擊率=安打/打數' class="respone">AVG</th>
	      </tr>
	      
	      <%
	      	for(int i = 0 ; i < box.getAwayBatter().size(); i++){%>
	      		<tr >
	      			<td>
			      		<a href=""><%= box.getAwayBatter().get(i).get("name") %></a>
			      	</td>
			      	<td><%= box.getAwayBatter().get(i).get("AB") %></td>
			      	<td><%= box.getAwayBatter().get(i).get("H") %></td>
			      	<td><%= box.getAwayBatter().get(i).get("RBI") %></td>
			      	<td class="respone"><%= box.getAwayBatter().get(i).get("BB") %></td>
			      	<td class="respone"><%= box.getAwayBatter().get(i).get("SO") %></td>
			      	<td class="respone"><%= box.getAwayBatter().get(i).get("SB") %></td>
			      	<td class="respone"><%= box.getAwayBatter().get(i).get("AVG") %></td>
			  	</tr>
			      	
	      	<%}
	      %>
	      
      	<tr>
		    <td>Total</td>
	      	<td>34</td>
	      	<td>8</td>
	      	<td>1</td>
	      	<td class="respone">4</td>
	      	<td class="respone">9</td>
	      	<td class="respone">0</td>
	      	<td class="respone">&nbsp;</td>
	  	</tr>
	  </table>
	</div>
<!--↑打擊左球隊↑-->
	
<!--↓打擊右球隊 start↓-->
<div class="w3-half">
  	
  	<table class=" w3-card-4 w3-table-all w3-hoverable">
	      <tr class="w3-blue">
	      	<th><%= box.getBoard().getHomeTeam() %></th>
	      	<th>AB</th>
	      	<th title='安打' >H</th>
	      	<th title='打點' >RBI</th>
	      	<th title='四壞球' class="respone">BB</th>
	      	<th title='被三振' class="respone">SO</th>
	      	<th title='盜壘' class="respone">SB</th>
	      	<th title='打擊率=安打/打數' class="respone">AVG</th>
	      </tr>
	      
	       <%
	      	for(int i = 0 ; i < box.getHomeBatter().size(); i++){%>
	      		<tr>
	      			<td>
			      		<a href=""><%= box.getHomeBatter().get(i).get("name") %></a>
			      	</td>
			      	<td><%= box.getHomeBatter().get(i).get("AB") %></td>
			      	<td><%= box.getHomeBatter().get(i).get("H") %></td>
			      	<td><%= box.getHomeBatter().get(i).get("RBI") %></td>
			      	<td class="respone"><%= box.getHomeBatter().get(i).get("BB") %></td>
			      	<td class="respone"><%= box.getHomeBatter().get(i).get("SO") %></td>
			      	<td class="respone"><%= box.getHomeBatter().get(i).get("SB") %></td>
			      	<td class="respone"><%= box.getHomeBatter().get(i).get("AVG") %></td>
			  	</tr>
			      	
	      	<%}
	      %>
	      
	    <tr>
		    <td>Total</td>
	      	<td>34</td>
	      	<td>3</td>
	      	<td>8</td>
	      	<td class="respone">2</td>
	      	<td class="respone">3</td>
	      	<td class="respone">9</td>
	      	<td class="respone">&nbsp;</td>
    	</tr>
		    
	</table>
</div>
</div><br>
<!-- </div><br> -->
<!--↑打擊右球隊↑-->
<!--↑打擊成績↑-->


<!--↓投手成績↓-->
<!--↓左球隊投手↓-->
<!-- <div class="container"> -->
	<div class="w3-tag w3-round w3-yellow w3-animate-top" style="padding:5px; width:960px; margin-bottom:10px;">
	   	<div class="w3-tag w3-round w3-yellow w3-border w3-border-white" style="width:950px">
			<h4>投手成績</h4>
		</div>
  	</div>
<div class="w3-row-padding">
<div class="w3-half">

	<table class="w3-card-4 w3-table-all w3-hoverable">
	      <tr class="w3-yellow">
	        <th><%= box.getBoard().getAwayTeam() %></th>
	        <th title='投球局數' >IP</th>
	        <th class="respone" title='被安打' >H</th>
	        <th class="respone" title='失分' >R</th>
	        <th class="respone" title='四壞球' >BB</th>
	        <th title='奪三振' >SO</th>
	        <th class="respone" title='被全壘打' >HR</th>
	        <th class="respone" title='防禦率=自責分*9/投球局數' >ERA</th>
	        <th class="respone" title='每局被上壘率=(安打+四壞球)/投球局數' >WHIP</th>
	      </tr>
	    
	      <%
	      	for(int i = 0; i < box.getAwayPitcher().size(); i++){%>
				<tr>
					<td >
						<a href=""><%= box.getAwayPitcher().get(i).get("name") %></a></td>
					<td><%= box.getAwayPitcher().get(i).get("IP") %></td>
					<td class="respone"><%= box.getAwayPitcher().get(i).get("H") %></td>
					<td class="respone"><%= box.getAwayPitcher().get(i).get("R") %></td>
					<td class="respone"><%= box.getAwayPitcher().get(i).get("BB") %></td>
					<td><%= box.getAwayPitcher().get(i).get("SO") %></td>
					<td class="respone"><%= box.getAwayPitcher().get(i).get("HR") %></td>
					<td class="respone"><%= box.getAwayPitcher().get(i).get("ERA") %></td>
					<td class="respone"><%= box.getAwayPitcher().get(i).get("WHIP") %></td>
				</tr>
	      	<%}
	      %>
	
	    <tr>
	      	<td>Total</td>
	      	<td>8.0</td>	
	      	<td class="respone">8</td>
	      	<td class="respone">7</td>
	      	<td>7</td>
	      	<td class="respone">8</td>
	      	<td>1</td>
	      	<td class="respone">&nbsp;</td>
	      	<td class="respone">&nbsp;</td>
		</tr>
	</table>
</div>
<!--↑左球隊投手↑-->

<!--↓右球隊投手↓-->
<div class="w3-half">
	<table class="w3-card-4 w3-table-all w3-hoverable">
  	  		
	      <tr class="w3-yellow">
	        <th><%= box.getBoard().getHomeTeam() %></th>
	        <th title='投球局數' >IP</th>
	        <th class="respone" title='被安打' >H</th>
	        <th class="respone" title='失分' >R</th>
	        <th class="respone" title='四壞球' >BB</th>
	        <th title='奪三振' >SO</th>
	        <th class="respone" title='被全壘打' >HR</th>
	        <th class="respone" title='防禦率=自責分*9/投球局數' >ERA</th>
	        <th class="respone" title='每局被上壘率=(安打+四壞球)/投球局數' >WHIP</th>
	      </tr>
	      
	      <%
	      	for(int i = 0; i < box.getHomePitcher().size(); i++){%>
				<tr>
					<td >
						<a href=""><%= box.getHomePitcher().get(i).get("name") %></a></td>
					<td><%= box.getHomePitcher().get(i).get("IP") %></td>
					<td class="respone"><%= box.getHomePitcher().get(i).get("H") %></td>
					<td class="respone"><%= box.getHomePitcher().get(i).get("R") %></td>
					<td class="respone"><%= box.getHomePitcher().get(i).get("BB") %></td>
					<td><%= box.getHomePitcher().get(i).get("SO") %></td>
					<td class="respone"><%= box.getHomePitcher().get(i).get("HR") %></td>
					<td class="respone"><%= box.getHomePitcher().get(i).get("ERA") %></td>
					<td class="respone"><%= box.getHomePitcher().get(i).get("WHIP") %></td>
				</tr>
	      	<%}
	      %>
      <tr>
      	<td>Total</td>
      	<td>9.0</td>	
      	<td class="respone">8</td>
      	<td class="respone">3</td>
      	<td>3</td>
      	<td class="respone">9</td>
      	<td>0</td>
      	<td class="respone">&nbsp;</td>
      	<td class="respone">&nbsp;</td>
      </tr>
	</table><br>
</div>
</div>
<!-- </div> -->
<!--↑右球隊投手↑-->
</div>
<!--↑all↑-->


<footer class="w3-container w3-padding-20 w3-center w3-xlarge" style="background-color:#203562; color:white;">
  <div class="w3-section">
  	<i class="w3-medium">Copyright By
  		<a style="color:lightgray" href="mailto:hitobaseball2017@gmail.com" class="w3-hover-text-white">Ed, Double, Weizi</a></i>
    <i class="fa fa-facebook-official w3-hover-white"></i>
  </div>
</footer>

</body>
</html>
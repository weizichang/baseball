<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="fsit03_HitoBaseBall.*" %>
 <%
 	ArrayList<ScoreBoardModel> boards = 
 			(ArrayList<ScoreBoardModel>)request.getAttribute("boards");  
 	/*
 	if(board != null){
 		out.print("ok");
 	}else{
 		out.print("xX");
 	}
 	*/
 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>賽程</title>
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
    /* Hide the carousel text when the screen is less than 600 pixels wide */
     body {
		font-family: Helvetica, Arial, "文泉驛正黑", "WenQuanYi Zen Hei", "儷黑 Pro", "LiHei Pro", Meiryo, "微軟正黑體", "Microsoft JhengHei", sans-serif;
		background: url("./imgs/3.jpg") center no-repeat;
		background-size: 100%;
	}
    
    
    @media (max-width: 920px) {
      .gap_l20 {
        width:40px;
      }
      .score_board {
        width:90%;
      }
    }
    
    @media (max-width: 650px) {
      .score_board_main{
        display:none;
      }
      .score_board {
        margin:auto;
        width: 80%;
        height: 120px;
      }
      .score_board_side {
        width: 100px;
        float: left;
      }
    }
    
    @media (max-width: 360px) {
      .score_board_side {
        width: 80px;
      }
    }
  
  </style>
</head>
<body>
    
<!--bar-->
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
</div>

<div class="container">
	<div class="panel-group" id="accordion">
<% 
	for(int i = 0; i < boards.size(); i++){%>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%= i+1 %>">
            <%= boards.get(i).getDate() %>  <%= boards.get(i).getAwayTeam() %> V.S. <%= boards.get(i).getHomeTeam() %> 
            <a href="BoxScore?iid=<%= boards.get(i).getIid() %>">
              <span class="glyphicon glyphicon-info-sign" style="float:right"></span>
            </a>
          </a>
        </h4>
      </div>
     <!--  -->
      <div id="collapse<%= i+1 %>" class="panel-collapse collapse">
        <div class="panel-body">
          <div class="score_board">
  					<!-- 球隊 start -->
  					<div class="score_board_side gap_l20">
  						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="score_table">
  							<tr>
  								<th>&nbsp;</th>
  							</tr>
  							<tr>
  								<td align="left" class="team"><%= boards.get(i).getAwayTeam() %></td>
  							</tr>
  							<tr>
  								<td align="left" class="team"><%= boards.get(i).getHomeTeam() %></td>
  							</tr>
  						</table>
  					</div>
  					<!-- score_board_side --> 
  					<!-- 球隊 end --> 
  					<!-- 分數 start -->
  					<div class="score_board_main">
  						<table border="0" cellspacing="0" cellpadding="0" class="score_table" id="game_score_board"  align="center">
  							<tr>
	  							<%
	  								for(int j =0; j < boards.get(i).getAwayInningScore().size(); j++){%>
			  								<th><%= j + 1 %></th>
	  								<%}
	  							%>
  							</tr>
  							<tr>
	  							<%
	  								for(int j =0; j < boards.get(i).getAwayInningScore().size(); j++){%>
			  								<td align="center"><span><%= boards.get(i).getAwayInningScore().get(j) %></span></td>
	  								<%}
	  							%>
  							</tr>
  							<tr>
	  							<%
	  								for(int j =0; j < boards.get(i).getHomeInningScore().size(); j++){%>
			  								<td align="center"><span><%= boards.get(i).getHomeInningScore().get(j) %></span></td>
	  								<%}
	  							%>
  							</tr>
  						</table>
  					</div>
  					<!-- score_board_side --> 
  					<!-- 分數 end --> 
  					<!-- 加總 start -->
  					<div class="score_board_side right_side">
  						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="score_table" align="center">
  							<tr>
  								<th >R</th>
  								<th >H</th>
  								<th >E</th>
  							</tr>
  							<tr>
	  							<%
	  								for(int j =0; j < boards.get(i).getAwayRHE().length; j++){%>
			  								<td align="center"><%= boards.get(i).getAwayRHE()[j] %></td>
	  								<%}
	  							%>
  							</tr>
  							<tr>
	  							<%
	  								for(int j =0; j < boards.get(i).getHomeRHE().length; j++){%>
			  								<td align="center"><%= boards.get(i).getHomeRHE()[j] %></td>
	  								<%}
	  							%>
  							</tr>
  						</table>
  					</div>
  					<!-- score_board_side --> 
  					<!-- 加總 end --> 
  				</div>
  				<!-- score_board --> 
				  <!-- 局數分數板 end --> 
			</div>
        </div>
      </div>
     <!--  -->
	<%}
%>
	
	<div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
            		2017-09-20 我覺得不行 V.S. 你有FreeStyle嗎 
            <a href="PlayByPlay">
              <span class="glyphicon glyphicon-hand-left" style="float:right"></span>
            </a>
          </a>
        </h4>
      </div>
     <!--  -->
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">
          <div class="score_board">
  					<!-- 球隊 start -->
  					<div class="score_board_side gap_l20">
  						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="score_table">
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
  					<!-- score_board_side --> 
  					<!-- 球隊 end --> 
  					<!-- 分數 start -->
  					<div class="score_board_main">
  						<table border="0" cellspacing="0" cellpadding="0" class="score_table" id="game_score_board"  align="center">
  							<tr>
	  							<%
	  								for(int j =0; j < 9; j++){%>
			  								<th><%= j + 1 %></th>
	  								<%}
	  							%>
  							</tr>
  							<tr>
	  							<%
	  								for(int j =0; j < 9; j++){%>
			  								<td align="center"><span></span></td>
	  								<%}
	  							%>
  							</tr>
  							<tr>
	  							<%
	  								for(int j =0; j < 9; j++){%>
			  								<td align="center"><span></span></td>
	  								<%}
	  							%>
  							</tr>
  						</table>
  					</div>
  					<!-- score_board_side --> 
  					<!-- 分數 end --> 
  					<!-- 加總 start -->
  					<div class="score_board_side right_side">
  						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="score_table" align="center">
  							<tr>
  								<th >R</th>
  								<th >H</th>
  								<th >E</th>
  							</tr>
  							<tr>
	  							<%
	  								for(int j =0; j < 3; j++){%>
			  								<td align="center">0</td>
	  								<%}
	  							%>
  							</tr>
  							<tr>
	  							<%
	  								for(int j =0; j < 3; j++){%>
			  								<td align="center">0</td>
	  								<%}
	  							%>
  							</tr>
  						</table>
  					</div>
  					<!-- score_board_side --> 
  					<!-- 加總 end --> 
  				</div>
  				<!-- score_board --> 
				  <!-- 局數分數板 end --> 
			</div>
        </div>
      </div>
     <!--  -->
	</div>
</div>

</body>

<footer class="w3-container w3-padding-20 w3-center w3-xlarge w3-bottom" style="background-color:#203562; color:white;">
  <div class="w3-section">
  	<i class="w3-medium">Copyright By
  		<a style="color:lightgray" href="mailto:hitobaseball2017@gmail.com" class="w3-hover-text-white">Ed, Double, Weizi</a></i>
    <i class="fa fa-facebook-official w3-hover-white"></i>
  </div>
</footer>

</html>
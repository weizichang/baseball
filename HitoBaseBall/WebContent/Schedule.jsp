<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="FSIT03_HitoBaseBall.*" %>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Hide the carousel text when the screen is less than 600 pixels wide */
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
    
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a href="Main"><img src="imgs/icon_brothers_sub.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="Main">球隊主頁</a></li>
        <li><a href="Players">球員列表</a></li>
        <li class="active"><a href="Schedule">賽程</a></li>
        <!--<li><a href="#">Contact</a></li>-->
      </ul>
      <!--<ul class="nav navbar-nav navbar-right">-->
      <!--  <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
      <!--</ul>-->
    </div>
  </div>
</nav>

<div class="container">
	<div class="panel-group" id="accordion">
<% 
	for(int i = 0; i < boards.size(); i++){%>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%= i+1 %>">
            <%= boards.get(i).getDate() %>  <%= boards.get(i).getAwayTeam() %> V.S. <%= boards.get(i).getHomeTeam() %> 
            <a href="BoxScore.html">
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
	</div>
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
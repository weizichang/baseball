<%@page import="fsit03_HitoBaseBall.BoxModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoxModel box = (BoxModel)request.getAttribute("box");
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
   /* Add a gray background color and some padding to the footer */
   body {
		font-family: Helvetica, Arial, "文泉驛正黑", "WenQuanYi Zen Hei", "儷黑 Pro", "LiHei Pro", Meiryo, "微軟正黑體", "Microsoft JhengHei", sans-serif;
	}
	.table{
	  background-color:#BDF1F6;
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
      <a href="Main"><img src="./upload/img/A21.png" style="width:70px;height:70px;"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="Main">球隊主頁</a></li>
        <li><a href="ShowPlayer">球員列表</a></li>
        <li class="active"><a href="Schedule">賽程</a></li>
        <!--<li><a href="#">Contact</a></li>-->
      </ul>
      <!--<ul class="nav navbar-nav navbar-right">-->
      <!--  <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
      <!--</ul>-->
    </div>
  </div>
</nav>
	  
<!---->
<div class="container">
	<!---->
	<h1>
	  BOX SCORE <span>比賽記分板</span>
	</h1>
	<div class="date_pick_bar"><%= box.getBoard().getDate() %></div>
	
	<div class="date_pick">
		<div class="arr_left">
		  <a href="#">
		     <img src="imgs/icon_arrow2_left.png" width="50" height="50" align="absmiddle"; />
		   </a>
		 </div>
		 <ul class="vs_box_bar" id="vs_blue_board_contextbox_bar">
					<!--	只有未比賽 or 比賽結束出現	-->
					<!-- 一則賽事 start -->
			<li class="game" id="box_team_151" >
				<a href="#" class=  "vs_box_focus" >
				<div class="vs_team"><img src="imgs/E02_logo_01.png" width="30" height="30" align="absmiddle" /></div>
				<div class="vs_info">
					&nbsp;							
					<div class="vs_score">
						<%= box.getBoard().getAwayRHE()[0] %><span class="vs_final">F</span>
						<%= box.getBoard().getHomeRHE()[0] %>
					</div>
					<!--<div class="vs_field">斗六</div>-->
				</div>
				<div class="vs_team"><img src="imgs/L01_logo_01.png" width="30" height="30" align="absmiddle" /></div>
				</a>
			</li>
			<!-- 一則賽事 end -->
						</ul>
		<div class="arr_right">
		  <a href="#">
		    <img src="imgs/icon_arrow2_right.png" width="50" height="50" align="absmiddle"; />
		    </a>
		 </div>
	</div>
	<!---->
	<!-- 計分版 -->
	<div class="gray_tab_bar">
		<a href="BoxScore?iid=<%= box.getBoard().getIid() %>" class="gray_tab gray_tab_focus">BOX</a>
		<a href="PlayByPlay.html" class="gray_tab">PLAY BY PLAY</a>
	</div>
	<!---->
	<div class="blue_board">
		<div class="container">
		  <!-- 左邊球隊 start -->
		<div class="team_part">
			<!--<div class="t_cell">2017/08/01</div>-->
			<div class="m_cell"><img src="imgs/E02_logo_01.png" width="120" height="120" /></div>
			<!--<div class="b_cell">-->
			<!--				<div class="board_l_box">35W - 36L</div>-->
			<!--			</div>-->
		</div>
		<!-- team_part --> 
		<!-- 左邊球隊 end --> 
		<!-- 中間分數 start -->
		<div class="score_part">
			<!--<div class="t_cell">中信兄弟<span>3 : 7 </span> 統一7-ELEVEn </div>-->
			<div class="m_cell">
				<!-- 局數分數板 start -->
				<div class="score_board">
					<!-- 球隊 start -->
					<div class="score_board_side gap_l20">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="score_table">
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
					<!-- score_board_side --> 
					<!-- 球隊 end --> 
					<!-- 分數 start -->
					<div class="score_board_main">
						<table border="0" cellspacing="0" cellpadding="0" class="score_table" id="game_score_board"  align="center">
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
					<!-- score_board_side --> 
					<!-- 分數 end --> 
					<!-- 加總 start -->
					<div class="score_board_side">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="score_table" align="center">
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
					<!-- score_board_side --> 
					<!-- 加總 end --> 
				</div>
				<!-- score_board --> 
				<!-- 局數分數板 end --> 
			</div>
			<!--<div class="b_cell">-->
			<!--	<span>W：潘 威 倫</span> 			-->
			<!--	<span>L：伍 鐸</span> 			 -->
							
			<!--</div>-->
		</div>
		<!-- score_part --> 
		<!-- 中間分數 end --> 
		<!-- 右邊球隊 start -->
		<div class="team_part">
			<!--<div class="t_cell">斗六</div>-->
			<div class="m_cell"><img src="imgs/L01_logo_01.png" width="120" height="120" /></div>
			<!--<div class="b_cell">			32W - 40L		</div>-->
		</div>
		<!-- team_part --> 
		<!-- 右邊球隊 end -->
		<div class="clean"></div>
		</div>
	</div>
	<!-- 打擊成績 start -->
	<div class="container">
	<!-- 左球隊 start -->
	  <div class="half_block left">
	    <h3>打擊成績</h3>
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="std_tb mix_x">
	    <!--	box 打者紀錄	-->
	    
	      <tr>
	      	<th><%= box.getBoard().getAwayTeam() %></th>
	      	<th>AB</th>
	      	<!--<th title='得分' >R</th>-->
	      	<th title='安打' >H</th>
	      	<th title='打點' >RBI</th>
	      	<th title='四壞球' class="respone">BB</th>
	      	<th title='被三振' class="respone">SO</th>
	      	<th title='盜壘' class="respone">SB</th>
	      	<th title='打擊率=安打/打數' class="respone">AVG</th>
	      </tr>
	      
	      <%
	      	for(int i = 0 ; i < box.getAwayBatter().size(); i++){%>
	      		<tr>
	      			<td>
			      		<a href=""><%= box.getAwayBatter().get(i).get("name") %></a>
			      		<span>,	LF</span>
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
	      <tr class="total">
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
	<!-- half_block -->
	<!-- 左球隊 end -->
	
	<!-- 右球隊 start -->
	<div class="half_block right">
		<h3>&nbsp;</h3>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="std_tb mix_x">
	    <!--	box 打者紀錄	-->
	    
	      <tr>
	      	<th><%= box.getBoard().getHomeTeam() %></th>
	      	<th>AB</th>
	      	<!--<th title='得分' >R</th>-->
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
			      		<span>,	LF</span>
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
	      <tr class="total">
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
	</div>
	<!--投手成績-->
	<div class="container">
					<!-- 左球隊 start -->
		<div class="half_block left">
			<h3>投手成績</h3>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="std_tb mix_x">
			  <!--	box 投手紀錄	-->
	      <tr>
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
	
	      <tr class="total">
	      	<!--	投手 投球局數	-->
	      	<!--	IP = (p09 + int(p10/3)) + (p10%3)/10	-->
	      	<td>Total</td>
	      	<td>8.0</td>	
	      	<td class="respone">8</td>
	      	<td class="respone">7</td>
	      	<td>5</td>
	      	<td class="respone">7</td>
	      	<td>8</td>
	      	<td class="respone">&nbsp;</td>
	      	<td class="respone">&nbsp;</td>
	      	<td class="respone">&nbsp;</td>
	      </tr>
	    </table>
	  </div>
	  <!---->
	  <div class="half_block right">
			<h3>&nbsp;</h3>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="std_tb mix_x">
			  <!--	box 投手紀錄	-->
	      <tr>
	        <th><%= box.getBoard().getHomeTeam() %></th>
	        <th title='投球局數' >IP</th>
	        <th class="respone" title='被安打' >H</th>
	        <th class="respone" title='失分' >R</th>
	        <th title='自責分' >ER</th>
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
	      <tr class="total">
	      	<!--	投手 投球局數	-->
	      	<!--	IP = (p09 + int(p10/3)) + (p10%3)/10	-->
	      	<td>Total</td>
	      	<td>8.0</td>	
	      	<td class="respone">8</td>
	      	<td class="respone">7</td>
	      	<td>5</td>
	      	<td class="respone">7</td>
	      	<td>8</td>
	      	<td class="respone">&nbsp;</td>
	      	<td class="respone">&nbsp;</td>
	      	<td class="respone">&nbsp;</td>
	      </tr>
	    </table>
	  </div>
	</div>
	<!---->
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
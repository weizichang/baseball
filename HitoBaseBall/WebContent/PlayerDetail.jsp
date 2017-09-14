<%@ page import="fsit03_HitoBaseBall.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MyPlayerModel player = (MyPlayerModel)request.getAttribute("player");
		//out.print(player.getName());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>球員個人紀錄</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Add a gray background color and some padding to the footer */
    body {
		font-family: Helvetica, Arial, "文泉驛正黑", "WenQuanYi Zen Hei", "儷黑 Pro", "LiHei Pro", Meiryo, "微軟正黑體", "Microsoft JhengHei", sans-serif;
	}
    
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    .navbar{
    	background-color:#203562;
    }

    .content {
	    width: 70%;
	    margin: 0 auto;
	    background-color: #FFF;
		}
    
    .player_info{
      border-top: #023f80 solid 5px;
      background-color: #f8f8f8;
      padding: 10px 20px 10px 10px;
      margin-bottom: 30px;
    }
    
    .player_info_row1 {
      padding: 6px 0 15px;
      border-bottom: #e2e2e2 solid 1px;
      margin-bottom: 8px;
      overflow: hidden;
    }
    
    .player_info_row2 {
      background-color:blue;
      
    }
    
    .player_info_pic{
      float: left;
      height: 170px;
      overflow: hidden;
      margin: 0 30px 0 0;
    }
    
    .player_num, .player_info_name{
      float:left;
    }
    
    #nums{
    	font-family:Impact;
    	font-size:4.5em;
    }
    
    .player_info_name{
      color: #2d4792;
      font-size: 22px;
      letter-spacing: 3px;
      line-height: 1.5;
      text-align: left;
      margin-top: 12px;
      margin-left: 50px;
    }
    .player_info_other{
      color: #333;
      font-size: 15px;
      line-height: 1.6;
    }
    .info_detail{
    	margin-top:20px;
    }
   
    .container-fluid{
      clear: both;
    }
    
    h1{
      font-family: "Times New Roman", Times, serif;
      font-size: 28px;
      font-weight: normal;
      color: #171717;
      text-align: left;
      text-shadow: 0 1px rgba(0,0,0,.25);
      margin: 25px 0 10px;
      position: relative;
    }
    
    h1 span{
		  font-size: 20px;
		}
    
    th, td{
    	text-align:center;
    }
   	
    @media screen and (max-width: 600px) {
    	.player_info_row1 {
	      padding: 6px 0 5px;
	      border-bottom: #e2e2e2 solid 1px;
	      margin-bottom: 5px;
	      overflow: hidden;
	    }
    	.player_info_pic{
    		width:180px;
    		height:100%;
    		float:none;
    		margin:auto;
    	}
    	.player_info_name{
	      margin-left: 10px;
	    }
 
      .test{
      	margin:auto;
      }
      .test thead { 
      	display: none; 
      }
      
      .test tbody td { 
        display: block; 
        padding: .6rem; 
      }
  
    	.test tbody td:before { 
        content: attr(data-th); 
        font-weight: bold;
        display: inline-block;
        width: 6rem;  
        float:left;
      }
      
      .tr_even{
      	background-color:#D4D6C8;
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


<!---->
<div class="container">
<h1>PLAYER 
	<span>球員個人紀錄</span>
</h1>
<!---->
<div class="player_info">
  <div class="player_info_pic">
  	<img width="120" height="160" class='player_img' onerror="myFunction(this)" src="./upload/img/363_1.png"></img>
  </div>
  <div class="player_info_row1">
    <div class="player_num">
      <p id="nums"><%= player.getNumber() %></p>
    </div>
    <div class="player_info_name">
      <div><%= player.getName() %></div>
      <span><%= player.getTeamName() %></span>
    </div>
  </div>
  <div class="info_detail">
    <table border="0" cellspacing="0" cellpadding="0" class="player_info_other test">
      <thead>
      	<tr> 	
      			<th>位置</th>
  				<th>投/打</th>
  				<th>身高</th>
  				<th>體重</th>
  				<th>生日</th>	
      	</tr>
      </thead> 	
      <tbody>  	
        <tr>
         		<td><%= player.getPos() %></td>
  				<td><%= player.getBt() %></td>
  				<td><%= player.getHeight() %>(CM)</td>
  				<td><%= player.getWeight() %>(KG)</td>
  				<td><%= player.getDob() %></td>
        </tr>  
      </tbody>
    </table>
  </div>
</div>

<!----> 
	<table width="100%" cellspacing="0" cellpadding="0" border="1" class="std_tb mix_x test">
	  <thead>
	    <tr>
	  		<th>YEAR</th>
	  		<th>TEAM</th>
	  		<th title="出賽數"><a href="#">G</a></th>
	  		<th title="打席"><a href="#">PA</a></th>
	  		<th title="打數"><a href="#">AB</a></th>
	  		<th title="打點"><a href="#">RBI</a></th>
	  		<th title="得分"><a href="#">R</a></th>
	  		<th title="安打"><a href="#">H</a></th>						
	  		<th title="一壘安打"><a href="#">1B</a></th>
	  		<th title="二壘安打"><a href="#">2B</a></th>
	  		<th title="三壘安打"><a href="#">3B</a></th>
	  		<th title="全壘打"><a href="#">HR</a></th>						
	  		<th title="壘打數"><a href="#">TB</a></th>
	  		<th title="被三振"><a href="#">SO</a></th>						
	  		<th title="盜壘"><a href="#">SB</a></th>
	  		<th title="上壘率=(安打+四死球)/(打數+四死球+犧牲飛球)"><a href="#">OBP</a></th>
	  		<th title="長打數=壘打數/打數"><a href="#">SLG</a></th>
	  		<th title="打擊率=安打/打數"><a href="#">AVG</a></th>
	    </tr>
	   </thead>
	   <tbody>
	    <tr>
	  		<td align="center">2017</td>
	  			<td align="center">統一7-ELEVEn</td>
	  			<td align="center">84</td>
	  			<td align="center">387</td>
	  			
	  			<td align="center">326</td>
	  			<td align="center">36</td>
	  			<td align="center">89</td>
	  			<td align="center">134</td>
	  			<td align="center">102</td>
	  			<td align="center">25</td>
	  			<td align="center">5</td>
	  			<td align="center">2</td>
	  
	  			<td align="center">175</td>
	  			<td align="center">26</td>
	  			<td align="center">13</td>
	  			<td align="center">0.487</td>
	  			<td align="center">0.537</td>
	  			<td align="center">0.411</td>
	    </tr>
	  </tbody>
	</table>
	<hr>
	
	<table width="100%" cellspacing="0" cellpadding="0" border="1" class="std_tb mix_x test">
     <thead>
	     	<tr>
					<th title="雙殺打"><a href="#">GIDP</a></th>
					<th title="犧牲短打"><a href="#">SAC</a></th>
					<th title="犧牲飛球"><a href="#">SF</a></th>
					<th title="四壞球"><a href="#">BB</a></th>
					<th title="故意四壞"><a href="#">IBB</a></th>
					<th title="死球"><a href="#">HBP</a></th>
					<th title="盜壘刺"><a href="#">CS</a></th>
					<th title="滾地出局"><a href="#">GO</a></th>
					<th title="高飛出局"><a href="#">AO</a></th>
					<th title="滾飛出局比"><a href="#">G/F</a></th>
					<th title="盜壘率=盜壘/(盜壘+盜壘刺)"><a href="#">SB%</a></th>
					<th title="攻擊指數=(壘打數+盜壘+四死球)/(打數-安打+盜壘刺+雙殺打)"><a href="#">TA</a></th>
					<th title="銀棒指數=打擊率*1000+全壘打*20+打點*5+壘打數"><a href="#">SSA</a></th>
    	</tr>
    </thead>
    <tbody>
	    <tr>
	      <td>5</td>
				<td>3</td>
				<td>5</td>
				<td>43</td>
				<td>3</td>
				<td>7</td>
				<td>10</td>
				<td>105</td>
				<td>66</td>
				<td>1.591</td>
				<td>0.56</td>
				<td>1.164</td>
				<td>806.04</td>
	    </tr>
  	</tbody>
	</table>
	<!---->
	<h1>逐場成績表</h1>
	<div class="table-responsive">
		<table width="100%" cellspacing="0" cellpadding="0" border="1" class="std_tb mix_x test">
			<thead>
			<tr>
				<th>DATE(GAME)</th>
				<th>OPP</th>
				<th title="打席"><a href="#">PA</a></th>
				<th	title="打數"><a href="#">AB</a></th>
				<th	title="打點"><a href="#">RBI</a></th>
				<th title="得分"><a href="#">R</a></th>
				<th	title="安打"><a href="#">H</a></th>
				<th	title="二壘安打"><a href="#">2B</a></th>
				<th	title="三壘安打"><a href="#">3B</a></th>
				<th	title="全壘打"><a href="#">HR</a></th>
				<th	title="壘打數"><a href="#">TB</a></th>
				<th	title="三振"><a href="#">SO</a></th>
				<th	title="盜壘"><a href="#">SB</a></th>
				<th	title="盜壘失敗"><a href="#">CS</a></th>
				<th	title="打擊率=安打/打數"><a href="#">AVG</a></th>
				
				<th title="犧短"><a href="#">SAC</a></th>
				<th title="犧飛"><a href="#">SF</a></th>
				<th title="四壞球"><a href="#">BB</a></th>
				<th title="故意四壞"><a href="#">IBB</a></th>
				<th title="死球"><a href="#">HBP</a></th>
				<th title="雙殺打"><a href="#">GIDP</a></th>
				<th title="三殺打"><a href="#">TP</a></th>
				<th title="殘壘"><a href="#">LOB</a></th>
				<th title="刺殺"><a href="#">PO</a></th>
				<th title="助殺"><a href="#">A</a></th>
				<th title="雙殺"><a href="#">DP</a></th>
				<th title="三殺"><a href="#">TP</a></th>
				<th title="失誤"><a href="#">E</a></th>
				<th title="盜壘阻殺"><a href="#">CS</a></th>
				<th title="捕逸"><a href="#">PB</a></th>
			</tr>
			</thead>
			<tbody>
				<tr class="tr_odd">
					<td>08/15(171)</td>
					<td><a href="/web/team_brief.php?&team=A02">Lamigo</a></td>
					<td>5</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>3</td>
					<td>0</td>
					<td>0</td>
					<td>0.288</td>
				
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
				</tr>
				<tr class="tr_even">
					<td>08/15(171)</td>
					<td><a href="/web/team_brief.php?&team=A02">Lamigo</a></td>
					<td>5</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>3</td>
					<td>0</td>
					<td>0</td>
					<td>0.288</td>
				
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
				</tr>
				<tr class="tr_odd">
					<td>08/15(171)</td>
					<td><a href="/web/team_brief.php?&team=A02">Lamigo</a></td>
					<td>5</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>3</td>
					<td>0</td>
					<td>0</td>
					<td>0.288</td>
				
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
				</tr>
				<tr class="tr_even">
					<td>08/15(171)</td>
					<td><a href="/web/team_brief.php?&team=A02">Lamigo</a></td>
					<td>5</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>3</td>
					<td>0</td>
					<td>0</td>
					<td>0.288</td>
				
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
				</tr>
				<tr class="tr_odd">
					<td>08/15(171)</td>
					<td><a href="/web/team_brief.php?&team=A02">Lamigo</a></td>
					<td>5</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>3</td>
					<td>0</td>
					<td>0</td>
					<td>0.288</td>
				
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
	</div>
	
</div>
<!---->

<footer class="w3-container w3-padding-20 w3-center w3-xlarge" style="background-color:#203562; color:white;">
  <div class="w3-section">
  	<i class="w3-medium">Copyright By
  		<a style="color:lightgray" href="mailto:hitobaseball2017@gmail.com" class="w3-hover-text-white">Ed, Double, Weizi</a></i>
    <i class="fa fa-facebook-official w3-hover-white"></i>
  </div>
</footer>



<script>
var tables = document.getElementsByTagName('table');
//console.log(tables[1].children[0].children);
for(var k = 0; k < tables.length; k++){
	var headertext = [];
  var headers = tables.item(k).children[0].children[0].children;
  console.log(headers);
  //tablerows = document.querySelectorAll(".test th");
  var tablebody = tables[k].children[1];
  
  for(var i = 0; i < headers.length; i++) {
    var current = headers[i];
    headertext.push(current.textContent.replace(/\r?\n|\r/,""));
  } 
  for (var i = 0, row; row = tablebody.rows[i]; i++) {
    for (var j = 0, col; col = row.cells[j]; j++) {
      col.setAttribute("data-th", headertext[j]);
      col.setAttribute("class", "table_header");
      //console.log(col);
    } 
  }
}

var myFunction = function (e) {
	this.onerror=null;
// 	e.src = "./upload/img/playerhead.png"
}
</script>
</body>
</html>
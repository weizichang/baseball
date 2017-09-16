<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%
	ArrayList<String> broadcast = (ArrayList<String>)request.getAttribute("broadcast");
	//out.print(broadcast.size());

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>中信兄弟</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="box_style.css" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
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
    
    .play{
    	padding-left:20px;
    }
    
    .title{
    	width:100%;
    	background:#393E46;
    	color:white;
    }
    
    .event{
    	background:#8787A3;
    }
    
</style>
</head>
<body>
<!--導覽列-->

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
        <li ><a href="ShowPlayers">球員列表</a></li>
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
	<h1>
	  BOX SCORE <span>比賽記分板</span>
	</h1>
	<div class="date_pick_bar">2017-08-01 </div>

	<div class="date_pick">
		<div class="arr_left">
		  <a href="#">
		     <img src="http://cpbl-elta.cdn.hinet.net/web/images/icon_arrow2_left.png" width="50" height="50" align="absmiddle"; />
		   </a>
		 </div>
		 <ul class="vs_box_bar" id="vs_blue_board_contextbox_bar">
					<!--	只有未比賽 or 比賽結束出現	-->
					<!-- 一則賽事 start -->
			<li class="game" id="box_team_151" >
				<a href="#" class=  "vs_box_focus" >
				<div class="vs_team"><img src="http://cpbl-elta.cdn.hinet.net/pad/images/team/E02_logo_01.png" width="30" height="30" align="absmiddle" /></div>
				<div class="vs_info">
					&nbsp;							
					<div class="vs_score">
						3<span class="vs_final">F</span>7
					</div>
					
				</div>
				<div class="vs_team"><img src="http://cpbl-elta.cdn.hinet.net/pad/images/team/L01_logo_01.png" width="30" height="30" align="absmiddle" /></div>
				</a>
			</li>
			<!-- 一則賽事 end -->
						</ul>
		<div class="arr_right">
		  <a href="#">
		    <img src="http://cpbl-elta.cdn.hinet.net/web/images/icon_arrow2_right.png" width="50" height="50" align="absmiddle"; />
		    </a>
		 </div>
	</div>
<!---->
	<div class="gray_tab_bar">
		<a href="BoxScore" class="gray_tab">BOX</a>
		<a href="PlayByPlay" class="gray_tab">PLAY BY PLAY</a>
	</div>
<!---->
	<span class='title'>1上  統一7-ELEVEn獅先發投手：潘威倫&nbsp;</span>
	<ol class='play'>
	<%for(String text : broadcast){ %>
		<li><%= text %></li>
		<%} %>
	</ol>
	<hr/>
<!--
	<span class='title'>1下  中信兄弟先發投手：伍鐸&nbsp;</span>
	<ol class='play'>   	
		<li>第一棒 SS 陳傑憲：四壞球保送</li>
		<li>第二棒 2B 林志祥：中間方向平飛安打，一二壘有人</li>
		<li>第三棒 DH 潘武雄：右外野方向三分全壘打</li>
		<span class='event'>中信兄弟(0)：(3)統一7-ELEVEn獅&nbsp;</span>
		<li>第四棒 LF 蘇智傑：穿越一二壘防線的滾地安打上到一壘</li>
		<span class='event'>中信兄弟喊出暫停&nbsp;</span>
		<li>第五棒 3B 陳鏞基：三振，一出局</li>
		<span class='event'>壘上跑者成功盜上二壘&nbsp;</span>
		<li>第六棒 CF 唐肇廷：一壘反彈球遭到刺殺，兩出局，跑者上到三壘</li>
		<li>第七棒 1B 買嘉儀：右外野平飛球遭到美技接殺，三人出局</li>
	</ol>
	<span>中信兄弟(0)：(3)統一7-ELEVEn獅&nbsp;</span>
	<hr/>
	<span class='title'>2上</span>
	<ol class='play'>   	
		<li>第六棒 RF 詹子賢：右外野飛球落地形成一壘安打</li>
		<li>第七棒 3B 曾陶鎔：飛越游擊上空的平飛安打，一三壘有人</li>
		<li>第八棒 C 黃鈞聲：游擊滾地球形成雙殺(6-4-3)，兩出局，三壘跑者回來得分</li>
		<span class='event'>中信兄弟(1)：(3)統一7-ELEVEn獅&nbsp;</span>
		<li>第九棒 SS 吳東融：三壘反彈球遭到刺殺，三人出局</li>
	</ol>
	<span>中信兄弟(1)：(3)統一7-ELEVEn獅&nbsp;</span>
 	-->
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
<!---->
<script>
//定義XMLHttpRequest物件

var xmlHTTP;

function verify(){
	//創建XMLHttpRequest物件

	if(window.XMLHttpRequest){
	//針對FireFox,Mozillar,Opera,Safari,IE7,IE8
	xmlHTTP = new XMLHttpRequest();

	//對某些特定版本的mozillar瀏覽器的bug進行修正
		if(xmlHTTP.overrideMineType){
			xmlHTTP.overrideMineType("text/xml");
		}
	}else if(window.ActiveXObject){
	//針對IE5，IE5.5，IE6
	//兩個可以用於創建XMLHTTPRequest物件的控制項名稱。保存在一個JS陣列中。
		var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
		for(var i = 0; i<activeName.length; i++){
	//取出一個控制項名進行創建，如果成功就終止迴圈
			try{
				xmlHTTP = new ActiveXObject(activexName[i]);
				break;
			}catch(e){}
		}
	}

	if(xmlHTTP){
		//alert("XMLHttpRequest物件創建成功！");
		return;
	}else{
		//alert("XMLHttpRequest物件創建失敗！");
	}
	
	//註冊回呼函數,只寫函數名，不能寫括弧，寫括弧表示調用函數。
	xmlHTTP.onreadystatechange = callback;
	//設置連接資訊(請求方式，請求的url,true表示非同步方式交互)
	xmlHTTP.open("GET","BroadastAjax?option="+1, true);
	//發送資料，開始和伺服器進行交互。
	xmlHTTP.send(null);
	//使用POST方式請求，需要手動設置HTTP的請求頭
	//xmlHTTP.setRequestHeader("Content-Type","aplication/x-www-form-urlencoded");
	//xmlHTTP.send("name=" + username);
}

//回呼函數
function callback(){
	//判斷物件的狀態是否交互完成
	if(xmlHTTP.readyState == 4){
		//判斷HTTP的交互是否成功
		if(xmlHTTP.status == 200){
			//獲取伺服器端返回的資料（文本）
			var resbonseText = xmlHTTP.responseText;	
			//將資料顯示在頁面上
			alert(resbonseText);
		}
	}
}

setInterval(verify, 5000);

</script>
</body>
</html>
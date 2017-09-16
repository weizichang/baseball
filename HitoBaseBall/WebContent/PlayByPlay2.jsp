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
<title>���H�S��</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="box_style.css" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	body {
			font-family: Helvetica, Arial, "��u�楿��", "WenQuanYi Zen Hei", "�׶� Pro", "LiHei Pro", Meiryo, "�L�n������", "Microsoft JhengHei", sans-serif;
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
<!--�����C-->

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
        <li><a href="Main">�y���D��</a></li>
        <li ><a href="ShowPlayers">�y���C��</a></li>
        <li class="active"><a href="Schedule">�ɵ{</a></li>
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
	  BOX SCORE <span>���ɰO���O</span>
	</h1>
	<div class="date_pick_bar">2017-08-01 </div>

	<div class="date_pick">
		<div class="arr_left">
		  <a href="#">
		     <img src="http://cpbl-elta.cdn.hinet.net/web/images/icon_arrow2_left.png" width="50" height="50" align="absmiddle"; />
		   </a>
		 </div>
		 <ul class="vs_box_bar" id="vs_blue_board_contextbox_bar">
					<!--	�u�������� or ���ɵ����X�{	-->
					<!-- �@�h�ɨ� start -->
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
			<!-- �@�h�ɨ� end -->
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
	<span class='title'>1�W  �Τ@7-ELEVEn����o���G��­�&nbsp;</span>
	<ol class='play'>
	<%for(String text : broadcast){ %>
		<li><%= text %></li>
		<%} %>
	</ol>
	<hr/>
<!--
	<span class='title'>1�U  ���H�S�̥��o���G���M&nbsp;</span>
	<ol class='play'>   	
		<li>�Ĥ@�� SS ���ǾˡG�|�a�y�O�e</li>
		<li>�ĤG�� 2B �L�Ӳ��G������V�����w���A�@�G�S���H</li>
		<li>�ĤT�� DH ��Z���G�k�~����V�T�����S��</li>
		<span class='event'>���H�S��(0)�G(3)�Τ@7-ELEVEn��&nbsp;</span>
		<li>�ĥ|�� LF Ĭ���ǡG��V�@�G�S���u���u�a�w���W��@�S</li>
		<span class='event'>���H�S�̳ۥX�Ȱ�&nbsp;</span>
		<li>�Ĥ��� 3B ���`��G�T���A�@�X��</li>
		<span class='event'>�S�W�]�̦��\�s�W�G�S&nbsp;</span>
		<li>�Ĥ��� CF ��F�ʡG�@�S�ϼu�y�D�����A��X���A�]�̤W��T�S</li>
		<li>�ĤC�� 1B �R�Ż��G�k�~�������y�D����ޱ����A�T�H�X��</li>
	</ol>
	<span>���H�S��(0)�G(3)�Τ@7-ELEVEn��&nbsp;</span>
	<hr/>
	<span class='title'>2�W</span>
	<ol class='play'>   	
		<li>�Ĥ��� RF ��l��G�k�~�����y���a�Φ��@�S�w��</li>
		<li>�ĤC�� 3B ������G���V�����W�Ū������w���A�@�T�S���H</li>
		<li>�ĤK�� C ���v�n�G�����u�a�y�Φ�����(6-4-3)�A��X���A�T�S�]�̦^�ӱo��</li>
		<span class='event'>���H�S��(1)�G(3)�Τ@7-ELEVEn��&nbsp;</span>
		<li>�ĤE�� SS �d�F�ġG�T�S�ϼu�y�D�����A�T�H�X��</li>
	</ol>
	<span>���H�S��(1)�G(3)�Τ@7-ELEVEn��&nbsp;</span>
 	-->
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
<!---->
<script>
//�w�qXMLHttpRequest����

var xmlHTTP;

function verify(){
	//�Ы�XMLHttpRequest����

	if(window.XMLHttpRequest){
	//�w��FireFox,Mozillar,Opera,Safari,IE7,IE8
	xmlHTTP = new XMLHttpRequest();

	//��Y�ǯS�w������mozillar�s������bug�i��ץ�
		if(xmlHTTP.overrideMineType){
			xmlHTTP.overrideMineType("text/xml");
		}
	}else if(window.ActiveXObject){
	//�w��IE5�AIE5.5�AIE6
	//��ӥi�H�Ω�Ы�XMLHTTPRequest���󪺱���W�١C�O�s�b�@��JS�}�C���C
		var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
		for(var i = 0; i<activeName.length; i++){
	//���X�@�ӱ���W�i��ЫءA�p�G���\�N�פ�j��
			try{
				xmlHTTP = new ActiveXObject(activexName[i]);
				break;
			}catch(e){}
		}
	}

	if(xmlHTTP){
		//alert("XMLHttpRequest����Ыئ��\�I");
		return;
	}else{
		//alert("XMLHttpRequest����Ыإ��ѡI");
	}
	
	//���U�^�I���,�u�g��ƦW�A����g�A���A�g�A����ܽեΨ�ơC
	xmlHTTP.onreadystatechange = callback;
	//�]�m�s����T(�ШD�覡�A�ШD��url,true��ܫD�P�B�覡�椬)
	xmlHTTP.open("GET","BroadastAjax?option="+1, true);
	//�o�e��ơA�}�l�M���A���i��椬�C
	xmlHTTP.send(null);
	//�ϥ�POST�覡�ШD�A�ݭn��ʳ]�mHTTP���ШD�Y
	//xmlHTTP.setRequestHeader("Content-Type","aplication/x-www-form-urlencoded");
	//xmlHTTP.send("name=" + username);
}

//�^�I���
function callback(){
	//�P�_���󪺪��A�O�_�椬����
	if(xmlHTTP.readyState == 4){
		//�P�_HTTP���椬�O�_���\
		if(xmlHTTP.status == 200){
			//������A���ݪ�^����ơ]�奻�^
			var resbonseText = xmlHTTP.responseText;	
			//�N�����ܦb�����W
			alert(resbonseText);
		}
	}
}

setInterval(verify, 5000);

</script>
</body>
</html>
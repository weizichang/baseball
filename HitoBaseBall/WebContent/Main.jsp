<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="FSIT03_HitoBaseBall.*" %>
<%
	Team team = (Team)request.getAttribute("team");
	Top3 top3 = (Top3)request.getAttribute("top3");
	if(top3 != null) {
		//out.print(top3.getHits().get(0).get("name"));
		//out.print(top3.getHits().get(0).get("hits"));
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title><%= team.getName() %></title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
    .navbar{
    	background-color:#203562;
    }

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      /*min-height: 200px;*/
    }
    
    .content {
	    width: 1000px;
	    margin: 0 auto;
	    background-color: #FFF;
		}
		
		.well {
		  background-color:#F1F6F8;
		  text-align:center;
		}
		
		#myCarousel{
      margin-bottom: 10px;
    }
	
		#player_img{
		  /*position:relative;*/
		  height:65px;
		  width:55px;
		}
		
		.table{
		  background-color:#ACBDC5;
		}
		
		.table > tbody > tr > td {
      vertical-align: middle;
    }
    
		
		th{
		  font-family: "Times New Roman", Times, serif;
		  color:white;
		  font-size: 20px;
		  background-color:#314A52;
		}
		
		th > span{
		  font-size: 10px;
		}

    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
      
      #myCarousel{
        height:100%;
        /*overflow:hidden;*/
      }
      
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
      <a href="Main.html"><img src="imgs/icon_brothers_sub.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="Main">球隊主頁</a></li>
        <li><a href="Players?teamID=<%= team.getTeamId()%>">球員列表</a></li>
        <li><a href="Schedule.html">賽程</a></li>
        <!--<li><a href="#">Contact</a></li>-->
      </ul>
      <!--<ul class="nav navbar-nav navbar-right">-->
      <!--  <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
      <!--</ul>-->
    </div>
  </div>
</nav>

<!--<div class="content">-->
  <!--幻燈片-->
  
<div class="container">
<!--<div class="row">-->
  <!--<div class="col-sm-10">-->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <!--<li data-target="#myCarousel" data-slide-to="3"></li>-->
      </ol>

      <!-- Wrapper for slides -->
      <div id="img" class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="img-responsive" style="width:100%" src="imgs/slide01.jpg" alt="Image">
          <div class="carousel-caption">
            <!--<h3>Sell $</h3>-->
            <!--<p>Money Money.</p>-->
          </div>      
        </div>
        
        <div class="item">
          <img class="img-responsive" style="width:100%" src="imgs/slide02.jpg" alt="Image">
          <div class="carousel-caption">
            <!--<h3>Sell $</h3>-->
            <!--<p>Money Money.</p>-->
          </div>      
        </div>
        
        <div class="item">
          <img class="img-responsive" style="width:100%" src="imgs/slide03.jpg" alt="Image">
          <div class="carousel-caption">
            <!--<h3>Sell $</h3>-->
            <!--<p>Money Money.</p>-->
          </div>      
        </div>
        
        <!--<div class="item">-->
        <!--  <img src="imgs/slide04.jpg" alt="Image">-->
        <!--  <div class="carousel-caption">-->
            <!--<h3>Sell $</h3>-->
            <!--<p>Money Money.</p>-->
        <!--  </div>      -->
        <!--</div>-->

        
      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  <!--</div>-->
  <div class="row">
    <div class="col-sm-1"></div>
    <div class="col-sm-4 well">
      <a><%= team.getName() %></a>
      
    </div>
    <div class="col-sm-3 well">
       <a href="https://www.facebook.com/Brotherelephants" target="_blank">球隊粉絲團</a>
    </div>
    <div class=" col-sm-3 well">
       <a href="mailto:<%= team.getMail() %>">聯絡信箱</a>
    </div>
    <div class="col-sm-1"></div>
  </div>
<!--</div>-->
<!---->
</div>
<!--各項成績-->
<div class="container text-center">    
  <h3>STATS 數據統計</h3><br>
  <div class="row">
    <div class="col-sm-4">
        <table class="table table-hover" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4">AVG <span>打擊率</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getAvg().get(i).get("playerID") %>">
	                        		<img id="player_img" src="imgs/H929.jpg"></img>
	                        	</a>
	                        </td>
	                        <td width="100"><%= top3.getAvg().get(i).get("name") %></td></td>
	                        <td width="80"><%= top3.getAvg().get(i).get("AVG") %></td>
	                    </tr>			
                	<%}
              	%>    
            </tbody>
        </table>
    </div>
    <div class="col-sm-4 player">
        <table class="table table-hover" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4">H  <span>安打數</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getHits().get(i).get("playerID") %>">
                        			<img id="player_img" src="imgs/H929.jpg"></img>
	                        	</a></td>
	                        <td width="100"><%= top3.getHits().get(i).get("name") %></td></td>
	                        <td width="80"><%= top3.getHits().get(i).get("hits") %></td>
	                    </tr>			
                	<%}
              	%>    
            </tbody>
        </table>
    </div>
    <div class="col-sm-4" >
        <table class="table table-hover" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4">RBI <span>打點</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getRbi().get(i).get("playerID") %>">
	                        		<img id="player_img" src="imgs/H929.jpg"></img>
	                        	</a>
	                        </td>
	                        <td width="100"><%= top3.getRbi().get(i).get("name") %></td></td>
	                        <td width="80"><%= top3.getRbi().get(i).get("rbi") %></td>
	                    </tr>			
                	<%}
              	%>    
            </tbody>
        </table>
    </div>
  </div>
<!---->
  <div class="row">
    <div class="col-sm-4" >
        <table class="table table-hover" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4">ERA <span>自責分率</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getEra().get(i).get("playerID") %>">
	                        		<img id="player_img" src="imgs/H929.jpg"></img>
	                        	</a>
	                        </td>
	                        <td width="100"><%= top3.getEra().get(i).get("name") %></td></td>
	                        <td width="80"><%= top3.getEra().get(i).get("era") %></td>
	                    </tr>			
                	<%}
              	%>    
            </tbody>
        </table>
    </div>
    <div class="col-sm-4">
        <table class="table table-hover" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4">SO <span>奪三振</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getSo().get(i).get("playerID") %>">
	                        		<img id="player_img" src="imgs/H929.jpg"></img>
	                        	</a>
	                        </td>
	                        <td width="100"><%= top3.getSo().get(i).get("name") %></td></td>
	                        <td width="80"><%= top3.getSo().get(i).get("so") %></td>
	                    </tr>			
                	<%}
              	%>    
            </tbody>
        </table>
    </div>
    <div class="col-sm-4">
        <table class="table table-hover" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4">WHIP <span>每局被上壘率</span></th>
                </tr>
                 <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getAvg().get(i).get("playerID") %>">
	                        		<img id="player_img" src="imgs/H929.jpg"></img>
	                        	</a>
	                        </td>
	                        <td width="100"><%= top3.getWhip().get(i).get("name") %></td></td>
	                        <td width="80"><%= top3.getWhip().get(i).get("whip") %></td>
	                    </tr>			
                	<%}
              	%>    
            </tbody>
        </table>
    </div>
  </div>
</div>
  <!---->
<!--</div>-->
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
<script>
  var img = document.getElementById('')
</script>
</body>
</html>

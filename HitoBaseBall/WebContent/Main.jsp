<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fsit03_HitoBaseBall.*" %>
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
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style>
    /* Add a gray background color and some padding to the footer */
    body {
		font-family: Helvetica, Arial, "文泉驛正黑", "WenQuanYi Zen Hei", "儷黑 Pro", "LiHei Pro", Meiryo, "微軟正黑體", "Microsoft JhengHei", sans-serif;
		background-color:#000000;
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
	  background-color:#000000;
	  text-align:center;
/* 	  #F1F6F8 */
	}
	
	#myCarousel{
      margin-bottom: 10px;
    }

	
	.player_img{
		border-radius:100%;
	  	width:70px;
	}
	
	.table{
	  background-color:#fff;
/* 	  #BDF1F6 */
	}
	
	.table > tbody > tr > td {
      vertical-align: middle;
      font-size:18px;
    }
    
	th{
	  color:white;
	  font-size: 20px;
	  background-color:#203562;
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

<!--幻燈片-->
<div class="container">
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div id="img" class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="img-responsive" style="width:100%" src="imgs/slide01.jpg" alt="Image">
          <div class="carousel-caption">
          
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
</div>

  	<div class="w3-center">
	   	<div class="w3-tag w3-round w3-blue w3-animate-top" style="padding:6px; width:300px;">
		    <div class="w3-tag w3-round w3-blue w3-border w3-border-white" style="width:290px">
		  		<h2><%= team.getName() %></h2>
		  		<h4>STATS 數據統計</h4>
		  	</div>
	  	</div>
	</div><br>

<!--各項成績-->
<div class="container text-center">    
<!--   <h3>STATS 數據統計</h3><br> -->
  <div class="row">
    <div class="col-sm-4 ">
        <table class="table table-hover w3-card-4 " width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4">AVG <span>打擊率</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td class='td_text' width="50"><%= i + 1 %></td>
	                        <td class='td_text'>
	                        	<a href="PlayerDetail?playerID=<%= top3.getAvg().get(i).get("playerID") %>">
	                        		<img class='player_img'  onerror="myFunction(this)" src="./upload/img/player_<%= top3.getAvg().get(i).get("playerID") %>.png"></img>
	                        	</a>
	                        </td>
	                        <td class='td_text' width="100"><%= top3.getAvg().get(i).get("name") %></td></td>
	                        <td class='td_text' width="80"><%= top3.getAvg().get(i).get("AVG") %></td>
	                    </tr>			
                	<%}
              	%>    
            </tbody>
        </table>
    </div>
    <div class="col-sm-4 player">
        <table class="table table-hover w3-card-4" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4" class="w3-blue">H  <span>安打數</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getHits().get(i).get("playerID") %>">
	                        		<img class='player_img'  onerror="myFunction(this)" src="./upload/img/player_<%= top3.getHits().get(i).get("playerID") %>.png"></img>
	                        	</a>
	                        </td>
	                        <td width="100"><%= top3.getHits().get(i).get("name") %></td></td>
	                        <td width="80"><%= top3.getHits().get(i).get("hits") %></td>
	                    </tr>			
                	<%}
              	%>    
            </tbody>
        </table>
    </div>
    <div class="col-sm-4" >
        <table class="table table-hover w3-card-4" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4" class="w3-blue">RBI <span>打點</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getRbi().get(i).get("playerID") %>">
	                        		<img class='player_img'  onerror="myFunction(this)" src="./upload/img/player_<%= top3.getRbi().get(i).get("playerID") %>.png"></img>
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
        <table class="table table-hover w3-card-4" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4" class="w3-blue">ERA <span>自責分率</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getEra().get(i).get("playerID") %>">
	                        		<img class='player_img'  onerror="myFunction(this)" src="./upload/img/player_<%= top3.getEra().get(i).get("playerID") %>.png"></img>
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
        <table class="table table-hover w3-card-4" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4" class="w3-blue">SO <span>奪三振</span></th>
                </tr>
                <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getSo().get(i).get("playerID") %>">
	                        		<img class='player_img'  onerror="myFunction(this)" src="./upload/img/player_<%= top3.getSo().get(i).get("playerID") %>.png"></img>
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
        <table class="table table-hover w3-card-4" width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th colspan="4">WHIP <span>每局被上壘率</span></th>
                </tr>
                 <%
                	for(int i = 0; i < 3; i++){ %>
                		<tr>
	                        <td width="50"><%= i + 1 %></td>
	                        <td>
	                        	<a href="PlayerDetail?playerID=<%= top3.getWhip().get(i).get("playerID") %>">
	                        		<img class='player_img'  onerror="myFunction(this)" src="./upload/img/player_<%= top3.getWhip().get(i).get("playerID") %>.png"></img>
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


<footer class="w3-container w3-padding-20 w3-center w3-xlarge" style="background-color:#203562; color:white;">
  <div class="w3-section">
  	<i class="w3-medium">Copyright By
  		<a style="color:lightgray" href="mailto:hitobaseball2017@gmail.com" class="w3-hover-text-white">Ed, Double, Weizi</a></i>
    <i class="fa fa-facebook-official w3-hover-white"></i>
  </div>
</footer>


<script>
var myFunction = function (e) {
	this.onerror=null;
	e.src = "./upload/img/playerhead.png"
}
</script>

</body>
</html>

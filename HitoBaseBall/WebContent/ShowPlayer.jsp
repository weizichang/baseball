<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="fsit03_HitoBaseBall.*" %>
 <%
	ArrayList<MyPlayerModel> pitchers = (ArrayList<MyPlayerModel>)request.getAttribute("pitchers");
	ArrayList<MyPlayerModel> catchers = (ArrayList<MyPlayerModel>)request.getAttribute("catchers");
	ArrayList<MyPlayerModel> infielders = (ArrayList<MyPlayerModel>)request.getAttribute("infielders");
	ArrayList<MyPlayerModel> outfielders = (ArrayList<MyPlayerModel>)request.getAttribute("outfielders");
 	if(catchers != null) {
 		//out.print("ok");
 	}else{
 		//out.print("XX");
 	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>球員列表</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
		
    #photoBG > img{
      width: 100%;
      margin:auto;
    }
    
    th{
      text-align:center;
    }
    
    h2{
      font-family: "Times New Roman", Times, serif;
    }
    
    h2 span{
      font-size:18px;
    }
    
    @media (max-width: 600px) {
      .content {
  	    width: 100%;
  	    margin: 0 auto;
  	    background-color: #FFF;
  		}
       #photoBG > img{
        width:100%;
        margin:auto;
      }
      th{
        display:none;
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
      <a href="Main"><img src="./upload/img/A21.png" style="width:70px;height:70px;"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="Main">球隊主頁</a></li>
        <li class="active"><a href="ShowPlayer">球員列表</a></li>
        <li><a href="Schedule">賽程</a></li>
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
  <div id="photoBG">
      <img src="imgs/slide04.jpg"></img>
  </div>
  <!--標頭-->
  <h2>Player List  <span>球員點將錄</span></h2>
  <div>
      <table class="table table-hover" width="100%" border="0">
        <tbody>
          <tr bgcolor="Gray">
              <th title="背號">#</th>
              <th title="投手">PITCHERS</th>
              <th title="位置">POSITION</th>
              <th title="投打">B/T</th>
          </tr>
          <%
          		for(int i =0; i < pitchers.size(); i++){%>
          			<tr>
			              <td td align="center"><%= pitchers.get(i).getNumber() %></td>
			              <td td align="center">
			              	<a href="PlayerDetail?playerID=<%= pitchers.get(i).getPlayerId() %>">
			              		<%= pitchers.get(i).getName() %>
			              	</a>
			              </td>
			              <td td align="center"><%= pitchers.get(i).getPos() %></td>
			              <td td align="center"><%= pitchers.get(i).getBt() %></td>
			    	</tr>
          		<%}
          %>
          
          <tr bgcolor="Gray">
              <th align="center" title="背號">#</th>
              <th align="center" title="捕手">CATCHERS</th>
              <th align="center" title="位置">POSITION</th>
              <th align="center" title="投打">B/T</th>
          </tr>
          <%
          		for(int i =0; i < catchers.size(); i++){%>
          			<tr>
			              <td td align="center"><%= catchers.get(i).getNumber() %></td>
			              <td td align="center">
			              	<a href="PlayerDetail?playerID=<%= catchers.get(i).getPlayerId() %>">
			              		<%= catchers.get(i).getName() %>
			              	</a>
			              </td>
			              <td td align="center"><%= catchers.get(i).getPos() %></td>
			              <td td align="center"><%= catchers.get(i).getBt() %></td>
			    	</tr>
          		<%}
          %>
          <tr bgcolor="Gray">
              <th align="center" title="背號">#</th>
              <th align="center" title="內野手">INFIELDERS</th>
              <th align="center" title="位置">POSITION</th>
              <th align="center" title="投打">B/T</th> 
          </tr>
          <%
          		for(int i =0; i < infielders.size(); i++){%>
          			<tr>
			              <td td align="center"><%= infielders.get(i).getNumber() %></td>
			              <td td align="center">
			              	<a href="PlayerDetail?playerID=<%= infielders.get(i).getPlayerId() %>">
			              		<%= infielders.get(i).getName() %>
			              	</a>
			              </td>
			              <td td align="center"><%= infielders.get(i).getPos() %></td>
			              <td td align="center"><%= infielders.get(i).getBt() %></td>
			    	</tr>
          		<%}
          %>
         
          <tr bgcolor="Gray">
              <th align="center" title="背號">#</th>
              <th align="center" title="外野手">OUTFIELDERS</th>
              <th align="center" title="位置">POSITION</th>
              <th align="center" title="投打">B/T</th>
          </tr>
         <%
          		for(int i =0; i < outfielders.size(); i++){%>
          			<tr>
			              <td td align="center"><%= outfielders.get(i).getNumber() %></td>
			              <td td align="center">
			              	<a href="PlayerDetail?playerID=<%= outfielders.get(i).getPlayerId() %>">
			              		<%= outfielders.get(i).getName() %>
			              	</a>
			              </td>
			              <td td align="center"><%= outfielders.get(i).getPos() %></td>
			              <td td align="center"><%= outfielders.get(i).getBt() %></td>
			    	</tr>
          		<%}
          %>
        </tbody>
      
      </table>
  </div>
<!---->
</div>


<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
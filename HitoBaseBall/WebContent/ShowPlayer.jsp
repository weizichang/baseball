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
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    /* Add a gray background color and some padding to the footer */
    body {
		font-family: Helvetica, Arial, "文泉驛正黑", "WenQuanYi Zen Hei", "儷黑 Pro", "LiHei Pro", Meiryo, "微軟正黑體", "Microsoft JhengHei", sans-serif;
		background: url("./imgs/3.jpg") center no-repeat;
		background-size: 100%;
		background-repeat: repeat-y;
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

<!--標頭-->
<div class="w3-tag w3-round w3-blue w3-animate-left" style="padding:5px; width:1140px; margin-bottom:10px;">
    <div class="w3-tag w3-round w3-blue w3-border w3-border-white" style="width:1130px">
  		<h5>Player List 球員點將錄</h5>
	</div>
</div>


<!--照片-->
<div id="photoBG">
	<img src="imgs/slide_a.jpg"></img>
</div><br>
  
<!--table-->
  <div>
      <table class=" w3-card-4 w3-table-all w3-hoverable">
        <tbody>
          <tr class=" w3-blue">
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
</div><br>

<footer class="w3-container w3-padding-20 w3-center w3-xlarge" style="background-color:#203562; color:white;">
  <div class="w3-section">
  	<i class="w3-medium">Copyright By
  		<a style="color:lightgray" href="mailto:hitobaseball2017@gmail.com" class="w3-hover-text-white">Ed, Double, Weizi</a></i>
    <i class="fa fa-facebook-official w3-hover-white"></i>
  </div>
</footer>

</body>
</html>
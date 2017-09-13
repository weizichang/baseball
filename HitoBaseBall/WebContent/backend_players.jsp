<%@page import="com.mysql.jdbc.ResultSetRow"%>
<%@page import="fsit03_HitoBaseBall.PlayerModel"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="fsit03_HitoBaseBall.Teams"%>
<%@page import="fsit03_HitoBaseBall.TeamModel"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>


<%

session = request.getSession();
String teamId = (String)session.getAttribute("teamId");
LinkedList sqlplayers = (LinkedList)session.getAttribute("sqlplayers");

if(sqlplayers == null){
	response.sendRedirect("check.jsp");
}

if(teamId == null){
	response.sendRedirect("check.jsp");
}

Class.forName("com.mysql.jdbc.Driver");
Properties prop = new Properties();
prop.setProperty("user", "root");
prop.setProperty("password", "root");
	
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/hitobaseball", prop);
	
Statement stmt = conn.createStatement();
String sql ="select * from teams where teamId=" + teamId;
ResultSet rs =  stmt.executeQuery(sql);
TeamModel team = new TeamModel();
	
if(rs.next()) {
	team.setTeamId(teamId);
	team.setTeamname(rs.getString("teamname"));
	team.setFb(rs.getString("fb"));
	team.setEmail(rs.getString("email"));
	}



%>
    
<!DOCTYPE html>
<html>
<head>
    <title>後台-球員頁</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="css/players.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    
    <!--api-->
    <link rel="stylesheet" href="css/api_bootstrap-3.3.2.min.css" type="text/css"/>
    <script type="text/javascript" src="js/bootstrap-3.3.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="css/api_bootstrap-multiselect.css" type="text/css"/>
</head>


<body>
<!--頁籤 -->
   	<div class="w3-bar w3-black">
    	<a href="#" class="w3-bar-item w3-button"></a>
    	<div class="w3-dropdown-hover">
    	
	    	<img alt="menu" src="imgs/ball03_512px_LOGO.png" style=" width: 32px; margin-bottom:10px ">
			<span style=" color: white; font-size: 32px ">HitoBaseball</span>
			
	      	<div class="w3-dropdown-content w3-bar-block w3-card-4">
	        	<a href="index.jsp" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon01_512px.png" style=" width: 24px; ">&nbsp;Hito首頁</a>
				<a href="MyTeam" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon02_512px.png" style=" width: 24px; ">&nbsp;編輯球隊</a>
				<a href="ShowPlayers" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon03_512px.png" style=" width: 24px; ">&nbsp;編輯球員</a>
				<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon04_512px.png" style=" width: 24px; ">&nbsp;造訪球隊</a>
				<a href="Main2" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon03_512px.png" style=" width: 24px; ">&nbsp;預覽球隊主頁</a>
				<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon05_512px.png" style=" width: 24px; ">&nbsp;登出</a>
	       </div>
    	</div>
    	 <a class="w3-bar-item w3-button w3-right" >
    	 	<img src="upload/<%= team.getTeamId() %>_logo.png" style=" width: 40px; "></a>
    </div>

<div class="container"><!--ALLdiv-->

    
<!--我的球隊圖片-->
<!-- <div class="w3-container"> -->
	<div class="w3-container w3-half ">
	  <div class="w3-panel w3-leftbar w3-border-blue w3-white w3-round-xlarge"  style="width:40%">
	  	<h2 class="w3-text-black">players</h2>
	  	<p style="color: black;"><i>players</i></p>
	  </div>
	</div>
	
<!-- 	<div class="w3-container w3-third"> -->
<!-- 	  <div class="w3-card-4" style="width:20%" > -->
<%-- 	    <img src="upload/<%= team.getTeamId() %>_logo.png" style="width:100%" class="w3-animate-left"> --%>
<!-- 	  </div> -->
<!-- 	</div> -->
	
	<div class="w3-container w3-rest ">
	      	  <div class="w3-panel w3-rightbar w3-border-blue w3-text-black w3-container w3-right w3-white w3-round-xlarge"  style="width:40%"">
	      		<span style="font-size:40px;font-weight:bold;" class="w3-animate-left"><%= team.getTeamname() %></span><br>
	      		<span style="font-size:20px;font-weight:bold;" class="w3-animate-left"><%= team.getEmail() %></span>
	      	  </div>
	</div>
<!-- </div> -->

<!--從資料庫列出多筆資料-->
<div class="w3-container">



  

  <table class="w3-table w3-card-4 w3-centered ">
    <thead>
    <% 
 	if(sqlplayers.size() >0){%>
    <tr class="w3-light-grey">
     <th>背號</th>
     <th>姓名</th></th>
     <th>守備位置</th>
     <th>打擊</th>
     <th>投球</th>
     <th>身高</th>
     <th>體重</th>
     <th>生日</th>
     <th>照片</th>
     <th></th>
   </tr>
   <%
 for(int i=0;i<sqlplayers.size();i++){
 	PlayerModel player = (PlayerModel)sqlplayers.get(i);
 %>
   </thead>
   
    <tr class="w3-white">
      <td contenteditable="true" >
      <input name="teamName" type="text" class="w3-input" style="text-align:center;" value=<%= player.getNumber() %>>
      </td>
        
      <td contenteditable="true">
      <input type="text" class="w3-input" style="text-align:center;" value=<%= player.getName() %>>
      </td>
        
      <td contenteditable="true">
      <input type="text" class="w3-input" style="text-align:center;" value=<%= player.getPosition() %>>
      </td>
      
      <td contenteditable="true">
      <input type="text" class="w3-input" style="text-align:center;" value=<%= player.getHit() %>>
      </td>
      
      <td contenteditable="true">
      <input type="text" class="w3-input" style="text-align:center;" value=<%= player.getThr() %>>
      </td>
      
      <td contenteditable="true">
      <input type="text" class="w3-input" style="text-align:center;" value=<%= player.getHeight() %>>
      </td>
      
      <td contenteditable="true">
      <input type="text" class="w3-input" style="text-align:center;" style="text-align:center;" value=<%= player.getWeight() %>>
      </td>
      
      <td contenteditable="true">
      <input type="text" class="w3-input" style="text-align:center;" value=<%= player.getBirthday() %>>
      </td>
      
      <td class="photo_td">
       <img src="upload\<%= team.getTeamId() %>_<%= player.getNumber() %>.png" alt="photo" style="width:50px" >
      </td>
      
      <td contenteditable="true">
      <button class="w3-button w3-red w3-round-large w3-small">刪除</button>
      </td>
      
    </tr>
    <% }}%>
    
  </table><br>
<!--  <div class="scbutton"> -->
<!--     <p class="w3-right"> -->
<!--     	<button type="submit" class="w3-button w3-teal w3-round-large">儲存變更</button> -->
<!--     </p> -->
<!--  </div> -->
</div>

<hr>

<div>
<form action="AddPlayer" accept-charset="UTF-8"  enctype="multipart/form-data" method="post">
<div id="table" class=" w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
<div class="tabless "><br>
  	
  	<div class="w3-container w3-blue"><i class="fa fa-address-card" ></i>
    </div>
  
    <div class="w3-row w3-section">
	    <div class="w3-row-padding" >
		    <!--背號-->
		    <div class="w3-half">
			    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user" style="font-size:30px"></i></div>
				<div class="w3-rest"><input type="text" class="w3-input w3-border" placeholder="背號" name="number01"/></div>
			</div>
			
			
			<!--姓名-->
			<div class="w3-half">
			    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user" style="font-size:30px"></i></div>
				<div class="w3-rest"><input type="text" class="w3-input w3-border" placeholder="姓名" name="name01"/></div>
			</div>
		</div>
	</div>
	
		
	<div class="w3-row w3-section">
	<div class="w3-row-padding">
	<!--身高-->
	<div class="w3-quarter">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user" style="font-size:30px"></i></div>
		<div class="w3-rest"><input type="text" class="w3-input w3-border" placeholder="身高" name="height01"/></div>
	</div>
		    
	<!--體重-->    
	<div class="w3-quarter">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user " style="font-size:30px"></i></div>     
	    <div class="w3-rest"><input type="text" class="w3-input w3-border" placeholder="體重" name="weight01"/></div>
	</div> 
		    
	<!--生日-->
	<div class="w3-quarter">
		<div class="w3-col" style="width:50px"><i class="fa fa-calendar " style="font-size:30px"></i></div>                
		<div class="w3-rest">生日：<input type="date" class="w3-input w3-border" placeholder="生日" name="birthday01"/></div> 
	</div>
	  
	 <!--球員照片上傳-->
	 <div class="w3-quarter">
	    <div class="w3-col" style="width:50px"><i class="fa fa-file-image-o " style="font-size:30px"></i></div> 
        <div class="w3-rest">照片：<input title="球員照片上傳" type="file" name='photo01' data-filename-placement="inside"/></div> <!--照片-->
     </div>
     </div>
     </div>
      
      <div class="w3-row">
	  <!--投-->
	  <div class="w3-col" style="width:25%">
	  <p>投球方式：
            <input class="w3-radio" type="radio" name="hit01" value="R"/><label>R</label>
            <input class="w3-radio" type="radio" name="hit01" value="L"/><label>L</label>
            <input class="w3-radio" type="radio" name="hit01" value="R/L"/><label>R/L</label>
      </p>
      </div>
      
      
            
        <!--打--> 
	    <div class="w3-col" style="width:25%">
	    <p>打擊方式：
            <input class="w3-radio" type="radio" name="thr01" value="R"/><label>R</label>
            <input class="w3-radio" type="radio" name="thr01" value="L"/><label>L</label>
            <input class="w3-radio" type="radio" name="thr01" value="R/L"/><label>R/L</label>
        </p>
     </div> 
     </div>
      
      
      <div class="w3-row">
	  <!--守備位置-->
	  <div class="w3-col" style="width:100%">
	  <p>守備位置：
          <input class="w3-check" type="checkbox" name="position01" value="投手"/>投手
          <input class="w3-check" type="checkbox" name="position01" value="捕手"/>捕手
          <input class="w3-check" type="checkbox" name="position01" value="一壘手"/>一壘手
          <input class="w3-check" type="checkbox" name="position01" value="二壘手"/>二壘手
          <input class="w3-check" type="checkbox" name="position01" value="三壘手"/>三壘手
          <input class="w3-check" type="checkbox" name="position01" value="游擊手"/>游擊手
          <input class="w3-check" type="checkbox" name="position01" value="右外野"/>右外野
          <input class="w3-check" type="checkbox" name="position01" value="中外野"/>中外野
          <input class="w3-check" type="checkbox" name="position01" value="左外野"/>左外野
      </p>
	  </div>
	  </div>
      
       <!--隱藏欄位-->
      <div><input type="hidden" name="end" value="end"/></div>
      
      <!--刪除表單-->
       <div> 
       		<button class="w3-button w3-blue w3-round" >刪除</button>
       </div>
       
       </div><!--tabless-->
	
<!--兩個案鈕-->
 
 
 </div>
 </div>
 	 <div class="w3-container">
 	 <button class="w3-button w3-teal w3-round-large" type="submit">儲存</button>
 	 <button class="w3-button w3-yellow addsection w3-round-large">多筆新增</button> 
 	 </div><br>

</form>
</div>

 
</div><!--ALL-div-->

<footer class="w3-container w3-padding-20 w3-center w3-xlarge" style="background-color:#203562; color:white;">
  <div class="w3-section">
  	<i class="w3-medium">Copyright By
  		<a style="color:lightgray" href="mailto:hitobaseball2017@gmail.com" class="w3-hover-text-white">Ed, Double, Weizi</a></i>
    <i class="fa fa-facebook-official w3-hover-white"></i>
  </div>
</footer>





<script>
//Clone
//var original = $('.tabless').last().find(':checked');
var template = $('#table .tabless:first').clone();
var sectionsCount = 1;

$('body').on('click', '.addsection', function() {
    sectionsCount++;
    var section = template.clone().find(':input').each(function(){
    var newId = this.id + sectionsCount;
    if(newId < 10){
    	newId = "0" + (newId).toString();
    }
    console.log(newId);
    
        $(this).attr('for', newId);
        
        //name++
	    if ($(this).attr('type') == 'radio'&& $(this).prop('name') == 'hit01') {
	        $(this).prop('name',"hit"+newId);
	    } else if ($(this).attr('type') == 'radio'&& $(this).prop('name') == 'thr01'){
	    	$(this).prop('name',"thr"+newId);
	    } else if ($(this).attr('type') == 'text'&& $(this).prop('name') == 'number01'){
	    	$(this).prop('name',"number"+newId);
	    } else if ($(this).attr('type') == 'text'&& $(this).prop('name') == 'name01'){
	    	$(this).prop('name',"name"+newId);
	    } else if ($(this).attr('type') == 'text'&& $(this).prop('name') == 'height01'){
	    	$(this).prop('name',"height"+newId);
	    } else if ($(this).attr('type') == 'text'&& $(this).prop('name') == 'weight01'){
	    	$(this).prop('name',"weight"+newId);
	    } else if ($(this).attr('type') == 'date'&& $(this).prop('name') == 'birthday01'){
	    	$(this).prop('name',"birthday"+newId);
	    } else if ($(this).attr('type') == 'checkbox'&& $(this).prop('name') == 'position01'){
	    	$(this).prop('name',"position"+newId);
	    } else if ($(this).attr('type') == 'hidden'&& $(this).prop('name') == 'end'){
		    	$(this).prop('name',"end");
	    } else if ($(this).attr('type') == 'file'&& $(this).prop('name') == 'photo01'){
	    	$(this).prop('name',"photo"+newId);
	    } else{
	        $(this).val('');
	    }
// check if there's a checked radio button, and restore it
//       if (original.length == 1) {
//           original.prop('checked',true);
//       }
    }).end().appendTo('#table');
    return false;
});

//remove
$('#table').on('click', '.remove', function() {
    //fade out section
    $(this).parent().fadeOut(100, function(){
        //remove parent element (main section)
        $(this).parent().parent().empty();
        return false;
    });
    return false;
});

//setNewId
function setNewId(){
	
}


</script>

<!--checkboxAPI-->
<script type="text/javascript">
  $('#example-getting-started0').multiselect({
    buttonWidth: '150px',
    dropRight: true
  });
    
  $('#example-multiple-selected1').multiselect();
  $('#example-getting-started2').multiselect();
  

//上傳按鈕API
/*
Bootstrap - File Input
======================
This is meant to convert all file input tags into a set of elements that displays consistently in all browsers.
Converts all
<input type="file">
into Bootstrap buttons
<a class="btn">Browse</a>
*/

(function($) {
$.fn.bootstrapFileInput = function() {
  this.each(function(i,elem){
    var $elem = $(elem);

    // Maybe some fields don't need to be standardized.
    if (typeof $elem.attr('data-bfi-disabled') != 'undefined') {
      return;
    }

    // Set the word to be displayed on the button
    var buttonWord = 'Browse';

    if (typeof $elem.attr('title') != 'undefined') {
      buttonWord = $elem.attr('title');
    }

    var className = '';

    if (!!$elem.attr('class')) {
      className = ' ' + $elem.attr('class');
    }

    // Now we're going to wrap that input field with a Bootstrap button.
    // The input will actually still be there, it will just be float above and transparent (done with the CSS).
    $elem.wrap('<a class="file-input-wrapper btn btn-default ' + className + '"></a>').parent().prepend($('<span></span>').html(buttonWord));
  })

  // After we have found all of the file inputs let's apply a listener for tracking the mouse movement.
  // This is important because the in order to give the illusion that this is a button in FF we actually need to move the button from the file input under the cursor. Ugh.
  .promise().done( function(){

    // As the cursor moves over our new Bootstrap button we need to adjust the position of the invisible file input Browse button to be under the cursor.
    // This gives us the pointer cursor that FF denies us
    $('.file-input-wrapper').mousemove(function(cursor) {
      var input, wrapper,
        wrapperX, wrapperY,
        inputWidth, inputHeight,
        cursorX, cursorY;

      // This wrapper element (the button surround this file input)
      wrapper = $(this);
      // The invisible file input element
      input = wrapper.find("input");
      // The left-most position of the wrapper
      wrapperX = wrapper.offset().left;
      // The top-most position of the wrapper
      wrapperY = wrapper.offset().top;
      // The with of the browsers input field
      inputWidth= input.width();
      // The height of the browsers input field
      inputHeight= input.height();
      //The position of the cursor in the wrapper
      cursorX = cursor.pageX;
      cursorY = cursor.pageY;

      //The positions we are to move the invisible file input
      // The 20 at the end is an arbitrary number of pixels that we can shift the input such that cursor is not pointing at the end of the Browse button but somewhere nearer the middle
      moveInputX = cursorX - wrapperX - inputWidth + 20;
      // Slides the invisible input Browse button to be positioned middle under the cursor
      moveInputY = cursorY- wrapperY - (inputHeight/2);

      // Apply the positioning styles to actually move the invisible file input
      input.css({
        left:moveInputX,
        top:moveInputY
      });
    });

    $('body').on('change', '.file-input-wrapper input[type=file]', function(){

      var fileName;
      fileName = $(this).val();

      // Remove any previous file names
      $(this).parent().next('.file-input-name').remove();
      if (!!$(this).prop('files') && $(this).prop('files').length > 1) {
        fileName = $(this)[0].files.length+' files';
      }
      else {
        fileName = fileName.substring(fileName.lastIndexOf('\\') + 1, fileName.length);
      }

      // Don't try to show the name if there is none
      if (!fileName) {
        return;
      }

      var selectedFileNamePlacement = $(this).data('filename-placement');
      if (selectedFileNamePlacement === 'inside') {
        // Print the fileName inside
        $(this).siblings('span').html(fileName);
        $(this).attr('title', fileName);
      } else {
        // Print the fileName aside (right after the the button)
        $(this).parent().after('<span class="file-input-name">'+fileName+'</span>');
      }
    });

  });

};

// Add the styles before the first stylesheet
// This ensures they can be easily overridden with developer styles
var cssHtml = '<style>'+
  '.file-input-wrapper { overflow: hidden; position: relative; cursor: pointer; z-index: 1; }'+
  '.file-input-wrapper input[type=file], .file-input-wrapper input[type=file]:focus, .file-input-wrapper input[type=file]:hover { position: absolute; top: 0; left: 0; cursor: pointer; opacity: 0; filter: alpha(opacity=0); z-index: 99; outline: 0; }'+
  '.file-input-name { margin-left: 8px; }'+
  '</style>';
$('link[rel=stylesheet]').eq(0).before(cssHtml);

})(jQuery);

$('input[type=file]').bootstrapFileInput();
$('.file-inputs').bootstrapFileInput();

</script>

</body>
</html>
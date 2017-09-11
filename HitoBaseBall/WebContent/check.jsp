<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<form>
    <input type='file' class="upl">
    <div>
        <img class="preview" style="max-width: 150px; max-height: 150px;">
        <div class="size"></div>
    </div>
        <input type='file' class="upl2">
    <div>
        <img class="preview2" style="max-width: 150px; max-height: 150px;">
        <div class="size2"></div>
    </div>
    
</form>

<script>
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 		var str = input.
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl2", function (){
    	console.log(this);
        preview(this);
    })
    
})



</script>
</body>
</html>
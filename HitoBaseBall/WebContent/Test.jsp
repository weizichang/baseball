<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Test" 
	enctype='multipart/form-data' method='post' >
	<input type='file' name='upload'>
	<input type='text' name='name01' value='Ed'>
	<input type='text' name='number01' value='43'>
	<input type='text' name='height01' value='111'>
	<input type='text' name='weight01' value='222'>
	<input type='text' name='birthday01' value='1987-08-07'>
	<input type='radio' name='batting01' value='right'>
	<input type='radio' name='throw01' value='right'>
	<input type='checkbox' name='pos01' value='pitcher'>
	<input type='checkbox' name='pos01' value='catcher'>
	<input type='checkbox' name='pos01' value='first'>
	<input type='hidden' name='end01' value='end'>
	<hr/>
	
	<input type='file' name='upload'>
	<input type='text' name='name02' value='Ed'>
	<input type='text' name='number02' value='43'>
	<input type='text' name='height02' value='111'>
	<input type='text' name='weight02' value='222'>
	<input type='text' name='birthday02' value='1987-08-07'>
	<input type='radio' name='batting02' value='right'>
	<input type='radio' name='throw02' value='right'>
	<input type='checkbox' name='pos02' value='pitcher'>
	<input type='checkbox' name='pos02' value='catcher'>
	<input type='checkbox' name='pos02' value='first'>
	<input type='hidden' name='end02' value='end'>
	
	<input type='submit' value='upload'>
</form>

</body>
</html>
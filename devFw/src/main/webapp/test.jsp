<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
		$("#button").click(function(){
			alert('click');
			var number = $("#test").val();
			alert(number);
			document.getElementById("result").innerHTML = number;
			console.log('dddd');
		})
	})
</script>
</head>
<body>
	<button id="button">ddd</button>
	<input type="number" name="result" min="0" max="2" id="test" value="1">
	<div id="result" name="result">0</div>
</body>
</html>
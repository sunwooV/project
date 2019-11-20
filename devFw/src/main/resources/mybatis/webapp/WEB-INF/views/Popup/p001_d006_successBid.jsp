<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).on('click', '#close', function(){
		opener.location.reload(); //팝업창을 띄우기 전의 부모창을 새로고침한다.
		close();
	});
</script>
<style>
.out{
	border: 1px solid lightgray;
    width: 100%;
    padding-top: 50%;
    padding-bottom: 50%;
    margin-top: 20px;
}
#text{
	text-align: center;
}
#close{
	margin-top:3%;
}
</style>
</head>
<body>
	<div class="out">
		<div id="text">입찰이 완료되었습니다.</div><br>
		
		<input type="button" class="btn btn-default" id="close" value="창 닫기" style="border:2px solid #dd5850; margin-left: 208px; margin-top:10px;">
	</div>
</body>
</html>
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
</head>
<body>
	프로필 수정이 완료되었습니다.
	<input type="button" id="close" value="창 닫기"/>
</body>
</html>
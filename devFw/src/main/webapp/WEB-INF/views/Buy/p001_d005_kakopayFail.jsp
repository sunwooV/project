<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="Path" value="${pageContext.request.ContextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼은도끼|결제 실패</title>
</head>
<body>
결제에 실패하셨습니다.<br><br>
<input type="button" value="이전화면으로" onClick="${Path}/payInfo.do">&nbsp&nbsp&nbsp&nbsp
<input type="button" value="메인화면으로" onClick="${Path}/main.do">
</body>
</html>
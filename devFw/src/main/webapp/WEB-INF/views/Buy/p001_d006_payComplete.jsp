<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼은도끼|결제완료</title>
</head>
<body>
결제가 완료되었습니다.<br><br>
<input type="button" value="메인화면"  onClick="${Path}/main.do">&nbsp&nbsp&nbsp
<input type="button" value="마이페이지" onClick="#">
</body>
</html>
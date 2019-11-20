<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
session.removeAttribute("member");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
#checkBtn{
    width: 100px;
}
</style>
</head>
<body>
<h3> 비밀번호 확인 </h3>
<form id="checkBtn" action="./out.do" method="post">
<input type="hidden" name="memberid" value="<%= session.getAttribute("memberid") %>"/>
<input id="pw" name="pw" type="password" required>
<button type="submit" id="checkBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" required>Join</button>
</form>
</body>

</html>
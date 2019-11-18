<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 낙찰하기</title>
</head>
<body>
	<c:forEach var="bidProduct" items="${bidProduct }" varStatus="status" >
		${bidProduct.prod_title }
	</c:forEach>
</body>
</html>
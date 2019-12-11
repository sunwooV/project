<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MIU|수량 선택 후 장바구니로</title>
<link rel ="stylesheet" href="${contextPath}/resources/css/Cart.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript">

  
</script>
</head>
<body>
<div id = "optionProd" class="optionProd">
<c:set var ="prod_title" items="${dataList}" />

</div>
</body>
</html>
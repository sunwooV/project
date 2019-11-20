<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼은도끼|결제성공</title>
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.12.min.js" type="application/javascript"></script>
<script type="text/javascript">
function PaySuccess(){
	
}

</script>
</head>
<body>
<form method="get" action="PaySuccess()">
 결제가 정상적으로 완료되었습니다.
</form>
</body>
</html>
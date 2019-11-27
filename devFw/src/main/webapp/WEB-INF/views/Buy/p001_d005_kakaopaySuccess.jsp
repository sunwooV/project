<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼은도끼|결제성공</title>
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.12.min.js" type="application/javascript"></script>
<script type="text/javascript">
function PaySuccess(){
	var frm = document.frmPayOk;
	frm.method ="post";
	frm.action="./payComplete.do";
	frm.submit();
	moveToAnotherPage();
}
//리뷰 제출 시 리뷰 팝업창 닫고 부모창의 다른페이지 이동
function moveToAnotherPage(){
	
	if(window.opener && !window.opener.closed){ //부모창이 존재하고 닫혀있지 않을때 
	window.opener.location = "${contextPath}/reviewComplete.do"; // 부모창에서 해당주소로 이동해라
	window.close(); //그리고 열려있는 창을 닫아라
	}
}
</script>
</head>
<body>
<form name="frmPayOk" action="PaySuccess()">

</form>
</body>
</html>
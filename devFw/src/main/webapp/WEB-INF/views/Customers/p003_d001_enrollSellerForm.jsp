<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
var now = window.location.href;

$(document).ready(function(){
	if($("#msg").val() != ""){
		alert($("#msg").val());
	}
})

//일반 판매자 등록
$(document).on('click', '#basicSeller', function(){
	
	document.getElementsByName("redirectURL")[0].value=now;
	var frm = document.selectSeller;
	
	frm.method="POST";
	frm.action="./sellerBasic.do";
	frm.submit();
});

//전문 판매자 등록
$(document).on('click', '#specialSeller', function(){
	
	document.getElementsByName("redirectURL")[0].value=now;
	var frm = document.selectSeller;
	
	frm.method="POST";
	frm.action="./specialSeller.do";
	frm.submit();
});
</script>
<style>
.sellerSelect{
	border: 1px solid lightgray;
    width: 500px;
    float: left;
    margin-top: 50px;
    border-radius:10%;
    margin-left: 50px;
}
#WriteImg{
	margin-right: 15px;
}
#WriteImg, #left .explainSeller{
	float:left;
}
.explainSeller{
	padding:20px;
}
.chooseSeller{
	padding:30px;
	border-top-left-radius:6% 18%;
	border-top-right-radius: 6% 18%;
	cursor:pointer;
}
#basicSeller{
	background:linear-gradient( to bottom, #FE9A2E, lightcoral);
}
#basicSeller:hover{
	background:linear-gradient( to top, #FE9A2E, lightcoral);
}
#specialSeller{
	background:linear-gradient( to bottom, lightblue, #58ACFA);
}
#specialSeller:hover{
	background:linear-gradient( to top, lightblue, #58ACFA);
}
#right{
	float: right;
    width: 30px;
    height: 30px;
    margin-top: -56px;
}
#explain{
	margin-left:23px;
}
</style>
<body>
<form name="selectSeller">
<c:set var="msg" value="${msg }" />
<c:if test="${msg == null }">
	<input type="hidden" id="msg" value="">
</c:if>
<c:if test="${msg != null }">
	<input type="hidden" id="msg" value="${msg }">
</c:if>
<input type="hidden" name="redirectURL" value="">
<div class="container">
	<br><br>
	<h1>판매자 등록</h1>
	<br>
	<h3>쉽고 간단하게 등록하는 SELL BASIC, 전문 판매자를 위한 SPECIAL PLUS</h3>
	<h3>알맞은 유형을 선택하여 등록해주세요.</h3>
	<p>(SELL BASIC 등록 후 추후에 스토어 등록을 통해 SPECIAL PLUS 등록 가능)</p>
	<br>
	<hr>
	<div class="sellerSelect">
		<div class="chooseSeller" id="basicSeller">
			<img src="${contextPath }/resources/img/write.png" width="75px" height="75px" id="WriteImg">
			<h1 id="left">SELL BASIC</h1>
			<h2 id="left">일반 판매자 등록</h2>
			<img id="right" src="${contextPath }/resources/img/right.png" width="65px" height="65px;">
		</div>
		<br>
		<div class="explainSeller" id="left">
			<h3>1. 일반 판매자란?</h3>
			<p id="explain">'마켓인유'회원이면 누구나 5분정도의 짧은 시간만 있으면</p>
			<p id="explain">중고와 경매에 물품을 등록할 수 있습니다.</p>
			<br>
			<h3>2. 개인 물품 판매를 위한</h3>
			<p id="explain">구형 노트북이나 스마트폰, 쓰지 않는 육아용품 등을</p>
			<p id="explain">쉽고 편하게 현금으로 바꿔보세요.</p>
			<br>
			<h3>3. 경매로 판매 가능</h3>
			<p id="explain">하나뿐인 내 물품을 경매로 등록하고, 많은 입찰을</p>
			<p id="explain">통해 판매해보세요!</p>
			<br>
			<h3>4. 결제, 배송, 송금까지 안전</h3>
			<p id="explain">'마켓인유' 시스템을 통해 판매가 일어난 후 송금까지 모든 과정이</p>
			<p id="explain">안전하게 조회/관리 됩니다.</p>
			<br>
		</div>
	</div>
	<div class="sellerSelect" >
		<div class="chooseSeller" id="specialSeller">
			<img src="${contextPath }/resources/img/write.png" width="75px" height="75px" id="WriteImg">
			<h1 id="left">SPECIAL PLUS</h1>
			<h2 id="left">전문 판매자 등록</h2>
			<img id="right" src="${contextPath }/resources/img/right.png" width="65px" height="65px;">
		</div>
		<br>
		<div class="explainSeller" id="left">
			<h3>1. 전문 판매자란?</h3>
			<p id="explain">중고, 경매와 더불어 직접 플리마켓을 운영하거나</p>
			<p id="explain">다른 플리마켓에 참여하여 물품을 등록할 수 있습니다.</p>
			<br>
			<h3>2. 참여형 플리마켓</h3>
			<p id="explain">플리마켓을 개최하고 참가자들을 모집하여
			<p id="explain">더욱 알찬 플리마켓을 열 수 있습니다.</p>
			<br>
			<h3>3. 플리마켓 정보 입력</h3>
			<p id="explain">플리마켓이 열릴 날짜와 주소를 등록하여</p>
			<p id="explain">쉽고 편하게 홍보해보세요!</p>
			<br>
			<h3>4. 미리 결제 서비스</h3>
			<p id="explain">플리마켓에 어떤 상품이 나올 것인지 미리 알리고,</p>
			<p id="explain">미리 결제할 수 있어 재고를 예측하는데 도움이 됩니다.</p>
			<br>
		</div>
	</div>
</div>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/css/detail.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
</head>
<body>
	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container-fluid"
		style="padding-left: 16%; padding-top: 3%; margin-right: -4%;">
		<div class="col-sm-2" id="col">

			<div class="table" id="sidebar"
				style="font-size: 13px; border: 1px solid black;">
				<h1 style="font-size: 21px;">✔이용 안내</h1>
				<li><a href="${contextPath}/detail1.do">회사 소개</a></li>
				<li><a href="${contextPath}/detail2.do">고객보호서비스</a></li>
				<li><a href="${contextPath}/detail3.do">안전하게 이용하기</a></li>
				<li><a href="${contextPath}/detail4.do">이용방법</a></li>
			</div>
		</div>
		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
		<div class="col-sm-10" style="padding-left: 3%; font-size: 37px;">
			<h1 style="padding-bottom: 2%;">
				<span class="glyphicon glyphicon-refresh"></span> 고객보호 서비스
			</h1>


			<div class="row">
				<div class="jumbotron"
					style="margin-left: 3%; background-color: #d3d3d363; width: 86%; height: auto;">
					
					<h2>☝ 안전거래 보장 서비스</h2>
					<br>
					<h4>◎ 구매자가 상품을 받기 전까지 결제 대금은 '마켓인유'에서 안전하게 보관합니다.</h4>
					<h4>◎ 구매자가 상품을 받은 후 구매확정을 하면 판매자에게 결제 대금이 지급됩니다.</h4>
					
					<br><br>
					
					<h2>✌ 회원 인증 서비스</h2>
					<br>
					<h4>◎ '마켓인유'는 판매, 구매 모두 인증된 회원만 이용이 가능합니다.</h4>
					<h4>◎ 인증 서비스로 이메일 인증 서비스를 제공합니다.</h4>


				</div>
			</div>


		
		</div>
	</div>
</body>
</html>
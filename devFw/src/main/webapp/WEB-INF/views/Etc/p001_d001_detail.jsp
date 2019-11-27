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
				<li><a href="${contextPath}/detail2.do">중고거래</a></li>
				<li><a href="${contextPath}/detail3.do">경매</a></li>
				<li><a href="${contextPath}/detail4.do">플리마켓</a></li>
			</div>
		</div>
		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
		<div class="col-sm-10" style="padding-left: 3%; font-size: 37px;">
			<h1 style="padding-bottom: 2%;">
				<span class="glyphicon glyphicon-briefcase"></span> 회사소개
			</h1>


			<div class="row">
				<img id="img" src="${contextPath }/resources/img/logo.jpg" />
				<div class="jumbotron"
					style="margin-left: 3%; background-color: #d3d3d363; width: 86%;">
					<p>금도끼은도끼는 중고거래,경매,플리마켓을 한번에 이용하는 MULTI IN 1 마켓입니다</p>
					<h6>또한 구매자와 판매자가 안전거래를 할 수 있도록 안전거래 방식을 이용 합니다</h6>
					<br>
					<p>★고객 환급 방법★</p>
					<h6>판매자가 상품을 발송함과 동시에 구매자의 마이페이지에는 구매완료 버튼이 생성됩니다</h6>
					<h6>구매자가 상품수령 후 구매완료 버튼을 클릭하면 상품금액은 사이트로 입금 되었다가 매월 말일 환급을 받을
						수 있습니다</h6>


				</div>
			</div>
		</div>
	</div>
</body>
</html>
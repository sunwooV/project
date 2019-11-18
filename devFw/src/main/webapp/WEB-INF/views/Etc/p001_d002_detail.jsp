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
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
</head>
<body>
	<div class="container" style="padding-top: 4%;">
		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
		<h1 style="font-size: 35px;">중고거래</h1>
		<div class="row" style="margin-top: -1%;">
			<div class="table" id="cs">
				<img src="${contextPath }/resources/img/logo.jpg" width=100%;
					height=100%; />
			</div>
			<div class="table" id="cs_view">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action">중고거래
					</a> <a href="#" class="list-group-item list-group-item-action">경매절차</a>
					<a href="#" class="list-group-item list-group-item-action">플리마켓
						유형 및 참여방법</a> <a href="#"
						class="list-group-item list-group-item-action">판매자 입금절차 안내</a> <a
						href="#" class="list-group-item list-group-item-action">중고거래방법</a>
				</div>
			</div>
		</div>
		<div class="row">
			<img
				src=https://dimg.donga.com/ugc/CDB/SHINDONGA/Article/5c/eb/73/61/5ceb73611a8ad2738de6.jpg
				width=50%; height=50%; />


			<div class="card border-secondary mb-3" style="width: 48%;">
				<div class="card-body">
					<h4 class="card-title">단 ☝번의 등록으로 경매,중고,플리마켓을 이용하세요!</h4>

				</div>





			</div>
		</div>
	</div>
</body>
</html>
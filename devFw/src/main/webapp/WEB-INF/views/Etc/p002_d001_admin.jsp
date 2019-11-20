<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/css/admin.css">
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
	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container"
		style="padding-bottom: 92px; padding-left: 75px;">
		<div id="myshopMain">
			<h1 style="padding-bottom: 27px; font-size: 32px;">
				<a href=#>ADMIN</a>
			</h1>
			<div class="myshopMain_sub1">
				<div id="list">
					<h3>
						<a href="./자체검사.jsp"><strong>플리마켓 자체검사</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/order/list.html">플리마켓 개설검사 </a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub2">
				<div id="list">
					<h3>
						<a href="/member/modify.html"><strong>블랙리스트 관리</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/member/modify.html">회원 블랙 관리 </a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub3">
				<div id="list">
					<h3>
						<a href="/myshop/wish_list.html"><strong>탈퇴 회원관리</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/wish_list.html">탈퇴기록</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub4">
				<div id="list">
					<h3>
						<a href="/myshop/mileage/historyList.html"><strong>판매자
								등급 관리</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/mileage/historyList.html">등급 </a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub3">
				<div id="list">
					<h3>
						<a href="/myshop/deposits/historyList.html"><strong>포인트
								관리</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/deposits/historyList.html">포인트 지급 </a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub4">
				<div id="list">
					<h3>
						<a href="/myshop/coupon/coupon.html"><strong>판매자 점수
								관리</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/coupon/coupon.html">고객님이 보유하고 계신 쿠폰내역을
							보여드립니다.</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub3">
				<div id="list">
					<h3>
						<a href="/myshop/deposits/historyList.html"><strong>게시판
								관리</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/deposits/historyList.html">환불금액등으로 적립된 예치금으로
							상품구매가 가능합니다<br>예치된 금액은 현금으로 환불이 가능합니다.
						</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub4">
				<div id="list">
					<h3>
						<a href="/myshop/coupon/coupon.html"><strong>회원 관리</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/coupon/coupon.html">고객님이 보유하고 계신 쿠폰내역을
							보여드립니다.</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub5">
				<div id="list">
					<h3>
						<a href="/myshop/coupon/coupon.html"><strong>상품 배송 조회
								리스트</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/coupon/coupon.html">고객님이 보유하고 계신 쿠폰내역을
							보여드립니다.</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub6">
				<div id="list">
					<h3>
						<a href="/myshop/coupon/coupon.html"><strong>플리마켓 개설
								승인</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/coupon/coupon.html">고객님이 보유하고 계신 쿠폰내역을
							보여드립니다.</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
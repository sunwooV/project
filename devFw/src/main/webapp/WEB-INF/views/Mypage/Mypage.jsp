<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/Mypage.css">
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
			<h1 style="padding-bottom: 27px; font-size: 32px;">MY PAGE</h1>
			<div class="myshopMain_sub1">
				<div id="list">
					<h3>
						<a href="/myshop/order/list.html"><strong>order -
								list</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/order/list.html">고객님께서 주문하신 상품의 주문내역을 확인하실 수
							있습니다.<br>비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.
						</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub2">
				<div id="list">
					<h3>
						<a href="${contextPath}/InfoInit.do"><strong>my info</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="${contextPath}/InfoInit.do">회원이신 고객님의 개인정보를 관리하는 공간입니다.<br>개인정보를
							최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.
						</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub3">
				<div id="list">
					<h3>
						<a href="/myshop/wish_list.html"><strong>wish item</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/wish_list.html">관심상품으로 등록하신 상품의 목록을 보여드립니다.</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub4">
				<div id="list">
					<h3>
						<a href="/myshop/mileage/historyList.html"><strong>my
								point</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/mileage/historyList.html">적립금은 상품 구매 시 사용하실 수
							있습니다.<br>적립된 금액은 현금으로 환불되지 않습니다.
						</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub5">
				<div id="list">
					<h3>
						<a href="/myshop/deposits/historyList.html"><strong>my
								deposits</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/deposits/historyList.html">환불금액등으로 적립된 예치금으로
							상품구매가 가능합니다<br>예치된 금액은 현금으로 환불이 가능합니다.
						</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub6">
				<div id="list">
					<h3>
						<a href="/myshop/coupon/coupon.html"><strong>my
								coupon</strong></a>
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
<script>
	$('.tree-toggle').click(function() {
		$(this).parent().children('ul.tree').toggle(200);
	});
	$(function() {
		$('.tree-toggle').parent().children('ul.tree').toggle(200);
	})
</script>
</html>
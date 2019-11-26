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
						<a href="${contextPath}/mypageBuyerOrderList.do"><strong>주문 조회</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/order/list.html">고객님께서 주문하신 상품의 주문내역을 확인하실 수
							있습니다.
						</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub2">
				<div id="list">
					<h3>
						<a href="${contextPath}/InfoInit.do"><strong>내 정보</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="${contextPath}/InfoInit.do">회원이신 고객님의 개인정보를 관리하는 공간입니다.
						</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub3">
				<div id="list">
					<h3>
						<a href="/myshop/wish_list.html"><strong>장바구니</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="/myshop/wish_list.html">관심상품으로 등록하신 상품의 목록을 보여드립니다.</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub4">
				<div id="list">
					<h3>
						<a href="${contextPath}/memberPoint.do"><strong>포인트</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="${contextPath}/memberPoint.do">적립금은 상품 구매 시 사용하실 수
							있습니다.<br>적립된 금액은 현금으로 환불되지 않습니다.
						</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub5">
				<div id="list">
					<h3>
						<a href="${contextPath}/mypageQA.do"><strong>내가 쓴 게시글 확인</strong></a>
					</h3>
					<p style="font-size: 11px;">
						<a href="${contextPath}/mypageQA.do"> 구매후기 / Q&A
						</a>
					</p>
				</div>
			</div>
			<div class="myshopMain_sub6">
				<div id="list">
					<h3>
						<a href="/myshop/coupon/coupon.html"><strong>관심 상품</strong></a>
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
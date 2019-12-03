<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<style type="text/css">
.orderHistoryContainer {
	/* padding: 위 오른쪽 아래 왼쪽;*/
	padding: 1% 15% 10% 15%;
}

.orderHistoryHeader {
	padding-top: 3%;
	margin-left: 15%;
}

.OHT_ttl, .OHC_cont {
	font-size: 13px;
	padding: 0.5%;
	text-align: center;
	border-bottom: 1px solid lightgray;
}

.orderHistoryTable {
	text-align: center;
	width: -webkit-fill-available;
	border-top: 1px solid lightgray;
	border-collapse: collapse;
}

.OHtableTitle {
	background-color: #f9f9f9;
}

.expectCost {
	width: -webkit-fill-available;
}

.cta {
	margin-left: 50%;
}

.goToPayButton {
	padding: 5%;
}
</style>
<script type="text/javascript">
	
	//품목 삭제
	function delOption(){
		
	}
	
	
	//수량 업데이트
	function updateQuantity(){
		
		
	}

	//결제를 원하는 상품정보 및 예상 결제금액을 주문정보 입력하는 곳으러 넘김~~+페이지 이동
	function moveToPayInfo() {

	}
</script>
</head>
<body>
	<input type="hidden" id="memberId" value="${member.getMemberid()}">
	<c:set var="size" value="${size}" />
	<input type="hidden" id="size" value="${size}">
	<!-- 주문내역 상단 -->
	<div class="orderHistoryHeader">
		<h3>장바구니</h3>
	</div>
	<div class="orderHistoryContainer">
		<!-- 주문 상품 정보 테이블 시작  -->
		<table class="orderHistoryTable" id="orderHistoryTable">
			<!-- 주문 상품 정보 테이블 상단 제목   -->
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><input type="checkbox" id="allCheck"></th>
					<th class="OHT_ttl"><span>상품번호</span></th>
					<th class="OHT_ttl"><span>상품이미지</span></th>
					<th class="OHT_ttl"><span>상품정보</span></th>
					<th class="OHT_ttl"><span>수량</span></th>
					<th class="OHT_ttl"><span>상품금액</span></th>
					<th class="OHT_ttl"><span>배송비</span></th>
				</tr>
			</thead>
			<tbody>
				<!-- 상품 내용 cif 처리하기 -->
				<c:forEach var="cartList" items="${cartList}">
					<tr class="orderHistoryContents">
						<td class="OHC_cont"><input type="checkbox" name="checkProd"
							id="checkProd" value="${cartList.prod_number}"></td>
						<td class="OHC_cont"><img src="${cartList.represent_image}"
							name="represent_image"></td>
						<td class="OHC_cont"><span class="${cartList.prod_name}"
							name="prod_name" value=""></span></td>
						<td class="OHC_cont"><span class="${cartList.cart_count}"
							name="cart_count"></span></td>
						<td class="OHC_cont"><span class="ttl_eachProd_price"
							name="ttl_eachProd_price" id="ttl_eachProd_price"></span></td>
						<td class="OHC_cont"><span class="shippingFee"
							name="shippingFee"></span></td>
					</tr>
				</c:forEach>
				<!-- 2번째 상품 내용 -->
			</tbody>
		</table>
	</div>
	<div class="orderHistoryContainer">
		<div class="cartExpectCost" id="cartExpectCost">
			<table class="expectCost">
				<tbody>
					<tr class="OHtableTitle">
						<th class="OHT_ttl">총 상품금액</th>
						<th class="OHT_ttl">배송비</th>
						<th class="OHT_ttl"><strong>총 금액</strong></th>
					</tr>
					<tr>
						<td class="OHC_cont" id="subtotal"></td>
						<td class="OHC_cont" id="shippingFee"></td>
						<td class="OHC_cont" id="orderTotal"></td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="goToPayButton">
			<button class="cta" onClick="moveToPayInfo()">주문하기</button>
		</div>
	</div>

	<!-- End Content -->
</body>
</html>
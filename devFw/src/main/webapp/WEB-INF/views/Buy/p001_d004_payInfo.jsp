<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>

<style type="text/css">
orderHistoryContainer {
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


</style>
<script type="text/javascript">
function kakaopayPC(){
	
	var url="http://localhost:8090/devFw/kakaopay.do/oauth";
	var name="카카오페이";
	var option ="width = 500, height = 500, top = 100, left = 200, location = no"
	
	window.open(url,name,option);
}
</script>
</head>
<body>

<input type="hidden" id="memberId" value="${member.getMemberid()}">
	<div class="orderHistoryHeader">
		<h3>주문 및 결제 정보</h3>
	</div>

	<div class="shipping" style="margin-left: 30%">
		<h2>배송지 정보</h2>
		<br>
		<!-- 배송정보 테이블 -->
		<table class="shipInfoTable">
			<tr class="tableTr">
				<th>배송지 선택</th>
				<td><input type="select" id="selectShipAddress"  width="200px">
				</td>
				<td><input type="button" value="새로운 주소+" id="input_new_Address"></td>
			</tr>

			<tr class="tableTr">
				<th>이름</th>
				<td>신주연</td>
			</tr>

			<tr class="tableTr">
				<th>연락처</th>
				<td>000-0000-0000</td>
			</tr>

			<tr class="tableTr">
				<th>주소</th>
				<td>(00000)00시 00구 00로 00길(00동 00아파트) 000동 000호</td>
			</tr>

			<tr class="tableTr">
				<th>배송메모</th>
				<td>
				<input type="text"
					placeholder="배송메모를 선택해주세요"></td>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="paymentChoice" style="margin-left: 30%">
		<!--결제하기 포인트 적용-->
		<h2>결제 수단 선택</h2>
		<br>
		<table class="paymentChoice">
			<tr class="tableTr">
				<th>결제 수단</th>
				<td>&nbsp&nbsp<input type="radio" name="size" id="size_1"
					value="small" /> <label for="size_1">카카오페이</label>&nbsp&nbsp&nbsp&nbsp
					<input type="radio" name="size" id="size_2" value="small" /> <label
					for="size_2">무통장입금</label>&nbsp&nbsp&nbsp&nbsp <input type="radio"
					name="size" id="size_3" value="small" /> <label for="size_3">핸드폰
						결제</label>
				</td>
			</tr>

			<tr class="tableTr">
				<th>포인트</th>
				<td><input type="number" id="custPoint">&nbsp&nbspP</td>
			</tr>

		</table>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 주문상품 정보 -->
	<div class="custOrderItem" style="margin-left: 30%">
	<h2>주문 상품 정보</h2>
	<br>
		<table class="orderItems">
			<tr class="tableTr">
				<th><img></th>
				<td>00</td>
			</tr>
			<tr class="tableTr">
			<th>상품 금액</th>
			<td id="prod_price">원</td>
			</tr>
			<tr class="tableTr">
			<th>배송비</th>
			<td id="discount_price">원</td>
			</tr>
			<tr class="tableTr">
			<th>총 주문 금액</th>
			<td id="total_price">원</td>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<div class="payForOrder" style="margin-left: 30%"> 
	<input type="button" value="결제하기" onClick="kakaopayPC()">
	</div>
</body>
</html>
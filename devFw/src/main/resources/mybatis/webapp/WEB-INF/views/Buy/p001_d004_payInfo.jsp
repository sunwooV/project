<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<style type="text/css">
.headerForPayInfo {
    margin-left: 10%;
    padding-top: 2%;
}
.tableTr th{
width:150px;
height: 28px;
padding:2%;
font-size:18px;
}

.tableTr td{
width:500px;
height: 28px;
padding:2%;
font-size:18px;
}
.payForOrder{
text-align:center;
font-size:15px;
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
<!-- css 손보기 table 내부 간격 수정 필요 -->
	<div class="headerForPayInfo">
		<h1>주문정보 입력</h1>
		<br> <br> <br>
		<!--배송정보 테이블  -->
	</div>

	<div class="shipping" style="margin-left: 30%">
		<h2>배송지 정보</h2>
		<br>
		<table class="shipInfoTable">
			<tr class="tableTr">
				<th>배송지 선택</th>
				<td><input type="select" id="selectShipAddress"  width="200px"/></td>
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
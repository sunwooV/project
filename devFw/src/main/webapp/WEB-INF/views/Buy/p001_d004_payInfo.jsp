<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<% 
request.setCharacterEncoding("UTF-8"); 
String img = (String) request.getAttribute("represent_image");
String ttlPrice = (String) request.getAttribute("totalPrice");
String title = (String) request.getAttribute("prod_title");

%>
<!DOCTYPE html>
<html lang="en">
<head>

<style type="text/css">
.headerForPayInfo {
	margin-left: 10%;
	padding-top: 2%;
}

.tableTr th {
	width: 150px;
	height: 28px;
	padding: 2%;
	font-size: 18px;
}

.tableTr td {
	width: 500px;
	height: 28px;
	padding: 2%;
	font-size: 18px;
}

.payForOrder {
	text-align: center;
	font-size: 15px;
}

.OHT_ttl, .OHC_cont {
	font-size: 13px;
	padding: 0.5%;
	text-align: center;
	border-bottom: 1px solid lightgray;
}
</style>
<script type="text/javascript">
	function kakaopayPC() {

		var url = "http://localhost:8090/devFw/kakaopay.do/oauth";
		var name = "카카오페이";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"

		window.open(url, name, option);
	}
</script>
</head>
<body>

	<input type="hidden" id="memberId" value="${member.getMemberid()}">
	<form name="payInfo">
		<div class="orderHistoryHeader">
			<h2>주문 및 결제 정보</h2>
		</div>

		<div class=orderHistoryContainer style="margin-left: 30%">
			<h3>배송지 정보</h3>
			<!-- 배송정보 테이블 -->
			<c:forEach var="orderInfo" items="${dataList}">
				<table class="orderHistoryTable" id="orderHistoryTable">
					<tr class="tableTr">
						<th class="OHT_ttl">배송지 선택</th>
						<td class="OHC_cont">
						<td class="OHC_cont"><input type="button" value="새로운 주소+"
							id="input_new_Address" onClick="newAddress()"></td>
					</tr>

					<tr class="tableTr">
						<th class="OHT_ttl">이름</th>
						<td class="OHC_cont">신주연</td>
					</tr>

					<tr class="tableTr">
						<th class="OHT_ttl">연락처</th>
						<td class="OHC_cont">000-0000-0000</td>
					</tr>

					<tr class="tableTr">
						<th class="OHT_ttl">주소</th>
						<td class="OHC_cont">(00000)00시 00구 00로 00길(00동 00아파트) 000동 000호</td>
					</tr>

					<tr class="tableTr">
						<th class="OHT_ttl">배송메모</th>
						<td class="OHC_cont"><input type="text" placeholder="배송메모를 선택해주세요"></td>
					</tr>
				</table>
			</c:forEach>
		</div>
		<br> <br> <br> <br> <br> <br>
		<div class="paymentChoice" style="margin-left: 30%">
			<!--결제하기 포인트 적용-->
			<h3>결제 수단 선택</h3>
			<br>
			<table class="paymentChoice">
				<tr class="tableTr">
					<th class="OHT_ttl">결제 수단</th>
					<td>&nbsp&nbsp<input type="radio" name="size" id="size_1"
						value="small" /> <label for="size_1">카카오페이</label>&nbsp&nbsp&nbsp&nbsp
						<input type="radio" name="size" id="size_2" value="small" /> <label
						for="size_2">무통장입금</label>&nbsp&nbsp&nbsp&nbsp <input type="radio"
						name="size" id="size_3" value="small" /> <label for="size_3">핸드폰
							결제</label>
					</td>
				</tr>

				<tr class="tableTr">
					<th class="OHT_ttl">포인트</th>
					<td><input type="number" id="custPoint">&nbsp&nbspP</td>
				</tr>

			</table>
		</div>
		<br> <br> <br> <br> <br> <br>
		<!-- 주문상품 정보 -->
		<div class="custOrderItem" style="margin-left: 30%">
			<h2>주문 상품 정보</h2>
			<br>
			<table class="orderItems">
				<tr class="tableTr">
					<th><img value="<%=img %>"></th>
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
		<br> <br>
		<div class="payForOrder" style="margin-left: 30%">
			<input type="button" value="결제하기" onClick="kakaopayPC()">
		</div>

		<div class="orderHistoryContainer">
			<!-- 주문 상품 정보 테이블 시작  -->
			<table class="orderHistoryTable" id="orderHistoryTable">
				<!-- 주문 상품 정보 테이블 상단 제목   -->
				<thead class="orderHistoryTableTitles">
					<tr class="OHtableTitle">
						<th class="OHT_ttl"><input type="checkbox" id="allCheck"></th>
						<th class="OHT_ttl"><span>상품이미지</span></th>
						<th class="OHT_ttl"><span>상품정보</span></th>
						<th class="OHT_ttl"><span>수량</span></th>
						<th class="OHT_ttl"><span>단가</span></th>
						<th class="OHT_ttl"><span>총 상품 금액</span></th>
					</tr>
				</thead>
				<tbody>
					<!-- 상품 내용 cif 처리하기 -->
					<c:set var="total" value="0" />
					<c:forEach var="cartList" items="${dataList}">
						<input type="hidden" id="prod_price"
							value="${cartList.prod_price}">
						<tr class="orderHistoryContents">
							<td class="OHC_cont"><input type="checkbox" name="checkProd"
								id="checkProd" value=""> <input type="hidden"
								name="prod_number" value="${cartList.prod_number}"></td>
							<td class="OHC_cont"><img src="${cartList.represent_image}"
								name="represent_image" style="width: 100px; height: 125px;"></td>
							<td class="OHC_cont">${cartList.prod_title}<input
								type="hidden" name="prod_title" value="${prod_title}"></td>
							<td class="OHC_cont"><span id="cart_count"> <input
									type="button" id="minus" onClick="updateCount('minus')"
									value="-"><input type="number" id="cart_count" min="1"
									max="${product.prod_amount}"
									style="width: 8%; height: auto; text-align: right;"
									value="${cartList.cart_count}"><input type="button"
									id="plus" onClick="updateCount('plus')" value="+">
							</span></td>
							<td class="OHC_cont" id="prod_price"><fmt:formatNumber
									value="${cartList.prod_price}" />원</td>
							<td class="OHC_cont"><span id="prod_ttl_price"><fmt:formatNumber
										value="${cartList.prod_price * cartList.cart_count}" />원</span></td>

						</tr>
						<c:set var="total"
							value="${total+ cartList.prod_price*cartList.cart_count}" />
					</c:forEach>
					<tr>
						<td class="OHC_cont" colspan="6"
							style="height: 100px; font-size: 35px; text-align: right;">
							예상 결제 금액 = <span id="subTotal"><c:out value="${total}" />원</span>
							<input type="hidden" name="totalPrice" value="${total}">
						</td>

					</tr>

				</tbody>
			</table>
		</div>
		<div class="goToPayButton">
			<button class="cta" onClick="moveToPayInfo()">결제하기</button>
		</div>

		<!-- End Content -->
	</form>
</body>
</html>
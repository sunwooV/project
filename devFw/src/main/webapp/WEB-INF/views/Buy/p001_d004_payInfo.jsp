<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	int ttlPrice = Integer.parseInt(request.getParameter("totalPrice"));
	String title = (String) request.getParameter("prod_title");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="${contextPath }/resources/css/main.css">

<style type="text/css">
.orderHistoryHeader {
	padding: 5%;
}

.headerForPayInfo {
	margin-left: 10%;
	padding-top: 2%;
	y
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

.OHT_ttl {
	border-right: 1px solid lightgray;
	font-size: 13px;
	text-align: center;
	padding:1%;
}

.OHC_cont {
	font-size: 13px;
	text-align: center;
	
}

#pay {
	padding-top: 2%;
}

#form {
	width: 108%;
}

#d1 {
	border-bottom: 1px solid lightgray;
}

</style>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	function requestPay() {
		var name = document.getElementById('buyerName').value; // 주문자 이름
		var postCode = document.getElementById('postcode').value; // 우편번호
		var detailAddr = document.getElementById('detailAddr').value; //상세주소
		var email = document.getElementById('email').value; //주문자 이메일
		var phoneNum = document.getElementById('buyerPhone').value; //주문자 연락처
		var product = document.getElementById('title').value;

		var finalPrice = document.getElementById('prod_price').value;

		alert(finalPrice);

		// IMP.request_pay(param, callback) 호출
		IMP.init("imp43398102"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
		IMP.request_pay({ // param
			pg : "inicis",
			pay_method : "card",
			merchant_uid : "ORD20180131-0000012",
			name : product,
			amount : 100,
			buyer_email : email,
			buyer_name : name,
			buyer_tel : phoneNum,
			buyer_addr : detailAddr,
			buyer_postcode : postCode
		}, function(rsp) { // callback
			if (rsp.success) {

				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;

			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});

	}

	function calcFinalPrice() {
		var form = document.payInfo;
		var prod_price = document.getElementById("prod_price").value;
		console.log(prod_price);

		var ttlPrice = document.getElementById("total_price");
		ttlPrice.value = prod_price + 2500;
		return ttlPrice.value;
	}
</script>
</head>
<body>
	<input type="hidden" id="memberId" value="${member.getMemberid()}">
	<form name="payInfo">
		<h2 style="padding-left: 18%; padding-top: 4%;">주문 및 결제 정보</h2>
		<div class="container" id="pay">
			<h3>배송지 정보</h3>
			<!-- 배송정보 테이블 -->
			<input type="hidden" id="email" name="email"
				value=<%=session.getAttribute("email")%>>
			<table id="form">
				<tr id="d1">
					<th class="OHT_ttl">배송지 선택</th>
					<td class="OHC_cont"><input type="button"value="새로운 주소+"
						id="input_new_Address" onClick="newAddress()"></td>
				</tr>


				<tr id="d1">
					<th class="OHT_ttl">이름</th>
					<td class="OHC_cont"><span id="buyerName"><%=session.getAttribute("name")%></span></td>
				</tr>

				<tr id="d1">
					<th class="OHT_ttl">연락처</th>
					<td class="OHC_cont"><span id="buyerPhone"><%=session.getAttribute("phonenumber")%></span></td>
				</tr>

				<tr id="d1">
					<th class="OHT_ttl">주소</th>
					<td class="OHC_cont"><span id="postcode">(<%=session.getAttribute("address")%>)
					</span><span id="detailAddr"> <%=session.getAttribute("roadAddress")%>
							<%=session.getAttribute("detailAddress")%></span></td>
				</tr>
				<tr>
					<th class="OHT_ttl">배송메모</th>
					<td class="OHC_cont"><input type="text"
						placeholder="배송메모를 작성해주세요.(200자이내)"></td>
				</tr>
			</table>

			<br> <br> <br> <br> <br> <br>

			<!--결제하기 포인트 적용-->
			<h3>결제 수단 선택</h3>
			<br>
			<table id="form">
				<tr>
					<th class="OHT_ttl">결제 수단</th>

					<td>&nbsp&nbsp<input type="radio" name="size" id="size_1"
						value="small" /> <label for="size_1">카카오페이</label>&nbsp&nbsp&nbsp&nbsp
						<input type="radio" name="size" id="size_2" value="small" /> <label
						for="size_2">신용카드</label>&nbsp&nbsp&nbsp&nbsp <input type="radio"
						name="size" id="size_3" value="small" /> <label for="size_3">핸드폰

							결제</label>
					</td>
				</tr>

				<tr>

					<th class="OHT_ttl">포인트</th>
					<td class="OHC_cont"><input type="number" id="custPoint">&nbsp&nbspP</td>
				</tr>

			</table>

			<br> <br> <br> <br> <br> <br>
			<!-- 주문상품 정보 -->

			<h3>주문 상품 정보</h3>
			<br>
			<table id="form">
				<tr>

					<th class="OHT_ttl">상품정보</th>
					<td class="OHC_cont"><%=title%></td>
				</tr>
				<tr>

					<th class="OHT_ttl">상품 금액</th>
					<td class="OHC_cont" id="prod_price"><%=ttlPrice%>원</td>
				</tr>
				<tr>

					<th class="OHT_ttl">총 주문 금액</th>
					<td class="OHC_cont" id="finalPrice"></td>
				</tr>
			</table>

			<br> <br>
			<div class="payForOrder" style="margin-left: 30%">
				<input type="button" value="결제하기" onClick="requestPay()">
			</div>
		</div>
		<!-- End Content -->
	</form>
</body>
</html>
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
<script type="text/javascript">


/* function calcTtlPrice(){
	var orderTotal = document.getElementById("").value();
}

function updateCount(param){
	var count = document.getElementById('cart_count').value;
	var memberId = document.getElementById('memberId').value;
	var prod_number = document.getElementById('prod_number').value;
	var amount = document.getElementById('prod_amount').value;
	
	
	
	if(param == 'minus'){
		if(count>0|| count <= amount){
			count = count--;
			var updateCartInfo ={
					memberId:memberId,
					cart_count:count,
					prod_number:product
			}
			
			$.ajax({
				type:"post",
				async:false,
				url:"/devFw/editCart.do",
				data: updateCartInfo,
				dataType:"text",
				success: function(responseData){
					
					
				},
				error:function(data, textStatus){
					alert("장바구니 품목 수량 수정 실패.")
				},
				complete(data, textStaus){
					
				}
				
			})//ajax end
			}else{
					return false;
			}
		
	}else{
		if(count>0|| count  amount)
		count = count++;
		
	}
	
	
} */

function moveToPayInfo(){
	var frm = document.Mycart;
	
	frm.method="post";
	frm.submit();
	frm.action ="/devFw/payInfo.do";
	
}

</script>

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

</head>
<body>

	<input type="hidden" id="memberId" value="${member.getMemberid()}">
	<form name = "Mycart" method="post" action="./payInfo.do">
	<!-- 장바구니 상단 -->
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
					<th class="OHT_ttl"><span>상품이미지</span></th>
					<th class="OHT_ttl"><span>상품정보</span></th>
					<th class="OHT_ttl"><span>수량</span></th>
					<th class="OHT_ttl"><span>단가</span></th>
					<th class="OHT_ttl"><span>총 상품 금액</span></th>
				</tr>
			</thead>
			<tbody>
				<!-- 상품 내용 cif 처리하기 -->
				<c:set var ="total" value="0" />
				<c:set var ="firstTitle" value="0"/>
				<c:set var = "countProd" value="0" />
				<c:forEach var="cartList" items="${dataList}" varStatus="status">
				<input type="hidden" id="prod_price" value="${cartList.prod_price}">
					<tr class="orderHistoryContents">
						<td class="OHC_cont"><input type="checkbox" name="checkProd" id="checkProd" value="">
							<input type="hidden" name="prod_number" value="${cartList.prod_number}"></td>
						<td class="OHC_cont"><img src="${cartList.represent_image}"
							name="represent_image" style="width:100px; height:125px;"></td>
						<td class="OHC_cont">${cartList.prod_title}<input type="hidden" name="prod_title" value="${prod_title}">
						<input type="hidden" ></td>
						<td class="OHC_cont"><span id="cart_count">
						<input type="button" id="minus" onClick="updateCount('minus')" value="-"><input type="number" id="cart_count" min="1" max="${product.prod_amount}" style="width:8%; height:auto; text-align:right;" value="${cartList.cart_count}"><input type="button"  id="plus" onClick="updateCount('plus')" value="+">
						</span></td>
						<td class="OHC_cont" id="prod_price"><fmt:formatNumber value="${cartList.prod_price}" />원</td>
						<td class="OHC_cont"><span id="prod_ttl_price"><fmt:formatNumber value="${cartList.prod_price * cartList.cart_count}" />원</span>
						</td>
						
					</tr>
					<c:if test="" />
					<c:set var ="total" value="${total+ cartList.prod_price*cartList.cart_count}" />
					
				</c:forEach>
				<tr>
				<td class="OHC_cont" colspan="6" style="height:100px; font-size:35px; text-align:right;" >
				예상 결제 금액 = <span id="subTotal"><c:out value="${total}" />원</span>
				<input type="hidden" name="totalPrice" value="${total}">
				</td>
				
				</tr>
		
			</tbody>
		</table>
	</div>
		<div class="goToPayButton">
			<button class="cta" onClick="moveToPayInfo()">주문하기</button>
		</div>
	
	<!-- End Content -->
	</form>
</body>
</html>
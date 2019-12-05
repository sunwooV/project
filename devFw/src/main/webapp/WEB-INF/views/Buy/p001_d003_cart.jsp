<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
.updateStatus{
	padding: 1% 3% 3% 0%;
}
</style>
<script type="text/javascript">
function abuttonClick(pm){ 
	
	var price = document.getElementById("prod_price").value;
	var amount = document.getElementById("prod_amount");
	var count = document.getElementById("cart_count").value;

	if(pm == 'minus'){
		if(count.value <=0 ){ 
			return false;
		}else{
			count.value--;
		}
	} else { //plus 버튼 눌렀을 때
		if(count.value > amount.max){ //재고 수량보다 더 많이 주문할 수 없도록 설정
			return false;
		}else{
			count.value++;
		}
	}

	//상세정보, Q&A, 상품후기 나누는 탭
	function tab_menu(num){
		 var f = $('.menu_tab').find('li');
		 for ( var i = 0; i < f.length; i++ ) {
			  if ( i == num) {
			   f.eq(i).addClass('active');
			   $('.menu_tab0' + i ).show();
			  } else {
			   f.eq(i).removeClass('active');  
			   $('.menu_tab0' + i ).hide();
			  }
		}
	}
</script>
</head>
<body>
	<input type="hidden" id="memberId" value="${member.getMemberid()}">

	<form name = "Mycart">
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
					<th class="OHT_ttl" style="width:30%;"><span>상품이미지</span></th>
					<th class="OHT_ttl" style="width:40%;"><span>상품정보</span></th>
					<th class="OHT_ttl" style="width:10%;"><span>수량</span></th>
					<th class="OHT_ttl" style="width:10%;"><span>상품금액</span></th>
					<th class="OHT_ttl" style="width:10%;"><span>배송비</span></th>
				</tr>
			</thead>
			<tbody>
				<!-- 상품 내용 cif 처리하기 -->
				<!-- items ="controller mav의 담은 리스트 이름" -->
				<c:forEach var="cartList" items="${dataList}"> 
				<c:if test = "${dataList == null}"> 장바구니에 담긴 상품이 없습니다. </c:if>
					<tr class="orderHistoryContents">
						<td class="OHC_cont"><input type="checkbox" name="checkProd"
							id="checkProd" value="${cartList.prod_number}">
							<input type="hidden" name="prod_number" value="${cartList.prod_number}"></td>
						<td class="OHC_cont"><img src="${cartList.represent_image}" style="width:50px; height:50px;
							name="represent_image"></td>
						<td class="OHC_cont">${cartList.prod_title}</td>
						<td class="OHC_cont">
						<input type="button" onclick="abuttonClick('minus');" value="-">
						<input type="number" id="cart_count"  value="${cartList.cart_count}" max="${cartList.prod_amount}" style="width:4%; height:auto; text-align:right;" >
						<input type="button" onclick="abuttonClick('plus');" value="+"></td>
						<td class="OHC_cont" id="prod_price"><fmt:formatNumber value="${cartList.prod_price}" type="number" />원</td>
						<td class="OHC_cont"><span class="shippingFee"
							name="shippingFee"></span></td>
					</tr>
						<!-- 2번째 상품 내용 -->
				</c:forEach>			
			</tbody>
		</table>
		<div id="updateStatus" class ="updateStatus">
		<button id ="delOption">상품삭제</button>
		<button id ="moveToLikeProd">관심상품으로이동</button>
		 </div>
	</div>
	<div class="orderHistoryContainer">
		<div class="cartExpectCost" id="cartExpectCost">
			<table class="expectCost">
				<tbody>
					<tr class="OHtableTitle">
						<th class="OHT_ttl" style="width:30%;">총 상품금액</th>
						<th class="OHT_ttl" style="width:30%;">배송비</th>
						<th class="OHT_ttl" style="width:40%;"><strong>총 금액</strong></th>
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
	</form>
</body>
</html>
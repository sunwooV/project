<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/main.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">


	//check box 전체 선택 
	$(document).ready(function(){
		$("#allCheck").prop
		
		$("#allCheck").click(function(){
			if($("#allCheck").prop("checked")){
				$("input[name=checkProd]").prop("checked",true);
			}else{
				$("input[name=checkProd]").prop("checked",false);
			}
		})

	});
	
	//선택 상품 삭제 
	$(document).on('click','#delProd',function(){
		var memberId = $("#memberId").val();
		var delProd = [];
		$("input[name=checkProd]:checked").each(function(i){
			delProd[i] = $(this).val();
			console.log(delProd);
		})
		
		var delCartInfo ={
			delProd:delProd,
			memberId:memberId
		};
		
		if(confirm("선택한 상품을 삭제하시겠습니까?\n")){
			
			$.ajax({
				type:"post",
				async:false,
				url:"/devFw/delCart.do",
				data: delCartInfo,
				success:function(responseData){
					alert("삭제 성공");
					location.reload();
					
				},
				error:function(data, textStaus){
				 alert("삭제 실패");
				 return false;
				},
				complete:function(data,textStatus){
				
				}
			})//end of ajax
		}//end of if
		
	})
	//check된 값에 따라 가격 계산해주기
	
			
	//수량 옵션 클릭 시 up & down
	$
	//관심상품 이동 후 카트에서 삭제
	
			
	//click 시 주문결제로~~
	function moveToPayInfo() {
		var frm = document.Mycart;
		frm.method = "post";
		frm.submit();
		frm.action = "/devFw/payInfo.do";

	}

</script>

<style type="text/css">
.orderHistoryContainer {
	/* padding: 위 오른쪽 아래 왼쪽;*/
	padding: 1% 15% 1% 15%;
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
	padding-left: 48%;
}
.choiceOrder{
margin-left: 15%
}
</style>

</head>
<body>

	<input type="hidden" id="memberId" value="${member.getMemberid()}">
	<form name="Mycart" method="post" action="./payInfo.do">
		<!-- 장바구니 상단 -->
		<div class="orderHistoryHeader">
			<h2>👜장바구니</h2>
		</div>
		<div class="orderHistoryContainer">
			<!-- 주문 상품 정보 테이블 시작  -->
			<table class="orderHistoryTable" id="orderHistoryTable">
				<!-- 주문 상품 정보 테이블 상단 제목   -->
				<thead class="orderHistoryTableTitles">
					<tr class="OHtableTitle">
						<th class="OHT_ttl"><input type="checkbox" id="allCheck" name="allCheck" ></th>
						<th class="OHT_ttl"><span>상품이미지</span></th>
						<th class="OHT_ttl"><span>상품정보</span></th>
						<th class="OHT_ttl"><span>수량</span></th>
						<th class="OHT_ttl"><span>단가</span></th>
						<th class="OHT_ttl"><span>총 상품 금액</span></th>
					</tr>
					<!-- 상품 내용 cif 처리하기 -->
					<c:set var="total" value="0" />
					<c:set var="firstProdTitle" value="" />
					<c:forEach var="cartList" items="${dataList}" varStatus="status">
						<input type="hidden" id="prod_price" value="${cartList.prod_price}">
						<tr class="orderHistoryContents">
							<td class="OHC_cont"><input type="checkbox" name="checkProd" id="checkProd" value="${cartList.prod_number}" > 
				<%-- 			<input type="hidden" name="prod_number" value="${cartList.prod_number}"> --%>
							</td>
							<td class="OHC_cont"><a href ="${contextPath}/detail.do?prod_number=${cartList.prod_number}"><img src="${cartList.represent_image}" name="represent_image" style="width: 100px; height: 125px;">
							</a></td>
							<td class="OHC_cont">${cartList.prod_title}
							<c:if test="${status.index eq 0 }">
							<c:set var="firstProdTitle" value="${cartList.prod_title}" />
							</c:if>
						<input type="hidden" name="prod_title" value="${firstProdTitle}">
							</td>
							<td class="OHC_cont"><span id="cart_count">
							<input type="button" id="minus" onClick="updateCount('minus')" value="-">
							<input type="number" id="cart_count" min="1" max="${product.prod_amount}" style="border: 1px solid white;width: 8%;height: auto;text-align: right;" value="${cartList.cart_count}">
							<input type="button" id="plus" onClick="updateCount('plus')" value="+">
							</span></td>
							<td class="OHC_cont" id="prod_price">${cartList.real_prod_price}원
							</td>
							<td class="OHC_cont"><span id="prod_ttl_price"><fmt:formatNumber value="${cartList.real_prod_price * cartList.cart_count}" />원
							</span></td>

						</tr>
						<c:set var="total" value="${total + cartList.real_prod_price*cartList.cart_count}" />
						
					</c:forEach>
					<tr>
						<td class="OHC_cont" colspan="6" style="height: 100px; font-size: 35px; text-align: right;">
							<h3 style="color: #da2626;">
								예상 결제 금액 = <span id="subTotal"></span>
							</h3> 
							
						</td>

					</tr>
				</tbody>
			</table>
		</div>
		<div class ="choiceOrder">
		<input type="button" id="delProd" value="선택상품 삭제하기">&nbsp&nbsp
		<input type="button" id="gotoLikeprod" value="관심상품으로 이동">
		</div>
		<div class="goToPayButton">
			<input type="button" class="btn btn-dark" onClick="moveToPayInfo()" style="font-size: 16px;" value="주문하기">
		</div>


		<!-- End Content -->
	</form>
</body>
</html>
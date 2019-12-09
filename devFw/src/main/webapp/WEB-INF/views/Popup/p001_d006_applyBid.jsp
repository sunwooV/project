<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 낙찰하기</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script type="text/javascript">

	$(document).on('click', '#bidding', function(){
		var bidForm = document.bid;
		
		var now_price = $("#now_price").val(); //현재가
		var minPrice = $("#minPrice").val(); //최소 입찰금액
		
		var amount = $("#amount").val(); //입찰 수량
		var bid_price = $("#bid_price").val(); //입찰 금액
		
		//입력한 입찰 금액이 100원 단위인지 확인
		if(bid_price % 100 != 0){ 
			alert("입찰금액은 100원 단위로 입력해주세요.");
			document.getElementById("bid_price").focus();
			return false;
		}
		
		//입력한 입찰 금액이 최소 입찰 금액보다 더 높지 않은 경우
		minPrice = Math.floor(minPrice); //소수점 제거
		if(bid_price < minPrice){
			alert("현재가보다 낮게 입찰하실 수 없습니다.");
			document.getElementById("bid_price").focus();
			return false;
		}
		
		bidForm.method = "POST";
		bidForm.action = "./insertBid.do";
		bidForm.submit();
		
	});

</script>
<style>
.title{
	border-radius: 30px;
    background: #dd5850;
    color: white;
    text-align: center;
    border-left: 1px;
    font-size: large;
    padding: 5px;
    margin:5px;
    margin-top: 15px;
}
.subtitle{
	padding-bottom: 5px;
    font-size: small;
    margin-left:20px;
}

#Ptable>tr{
	backgroud:#FAFAFA;
	border-right:1px solid lightgray;
}
#bidding{
	margin:0px auto;
}
</style>
</head>
<body>
<form name="bid">
	<c:forEach var="bidProduct" items="${bidProduct }" varStatus="status" >
		<input type="hidden" name="memberId" value="${member.getMemberid() }"/>
		<input type="hidden" name="prod_number" value="${bidProduct.prod_number }"/>
		
		<div class="title">경매 입찰</div>
		<br>
		<div class="subtitle">입찰 상품</div>
		<table class="table" id="Ptable" style="width:90%; text-align:left; margin:0px auto; border:1px solid lightgray;">
			<tr>
				<td style="background:#FAFAFA">상품명</td>
				<td>${bidProduct.prod_title }</td>
			</tr>
			<tr>
				<td style="background:#FAFAFA">경매 마감 일자</td>
				<td>${bidProduct.auction_end_date }</td>
			</tr>
			<tr>
				<td style="background:#FAFAFA">최대 구매가능 수량</td>
				<td>${bidProduct.prod_amount }</td>
			</tr>
			<tr>
				<td style="background:#FAFAFA">거래 방법</td>
				<c:if test="${bidProduct.send_way == 'direct' }">
					<td>직거래(${bidProduct.direct_area })</td>
				</c:if>
				<c:if test="${bidProduct.send_way == 'delivery' }">
					<td>택배거래</td>
				</c:if>
				<c:if test="${bidProduct.send_way == 'direct delivery ' }">
					<td>직거래(${bidProduct.direct_area }), 택배거래</td>
				</c:if>
			</tr>
		</table>
		<br><br>
		
		<div class="subtitle">입찰하기</div>
		<table class="table" id="Ptable" style="width:90%; text-align:left; margin:0px auto; border:1px solid lightgray;">
			<tr>
				<td style="background:#FAFAFA">현재가</td>
				<td>${bidProduct.auction_bid }</td>
				<input type="hidden" id="now_price" value="${bidProduct.auction_bid }"/> <!-- 현재가 -->
			</tr>
			<tr>
				<td style="background:#FAFAFA">입찰수량</td>
				<td><input type="number" id="amount" name="bid_amount" value="1" max="${bidProduct.prod_amount }">개</td>
			</tr>
			<tr>
				<td style="background:#FAFAFA; padding-top: 30px;">입찰금액</td>
				<td>현재 <fmt:formatNumber value="${bidProduct.auction_bid + Math.pow(10, (fn:length(bidProduct.auction_price) - 2 ))}" type="number" />원 부터 입찰하실 수 있습니다.<br><input type="number" id="bid_price" name="bid_price" value="0">원 (콤마(",")없이 100원 단위로 입력하세요.)</td>
				<input type="hidden" id="minPrice" value="${bidProduct.auction_bid + Math.pow(10, (fn:length(bidProduct.auction_price) - 2 ))}"/>
				<!-- 천원 단위면 -> 100원 단위로 오르고, 만원 단위면 -> 1,000원 단위로 오르고.... -->
			</tr>
		</table>
		<br>
		<input type="button" class="btn btn-default" id="bidding" value="입찰하기 >" style="border:2px solid #dd5850; margin-left: 191px; margin-top:10px;">
	</c:forEach>
</form>
</body>
</html>
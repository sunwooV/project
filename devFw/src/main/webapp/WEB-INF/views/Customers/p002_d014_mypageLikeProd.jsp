<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).on('click', '#deleteLikeProd', function(){
		if(confirm("정말 삭제하시겠습니까?")){

			var prod_number = $(this).attr("name");
			var memberId = $("#memberId").val();
			var command = "dislike";
			
			var deleteLikeProd = {
					prod_number:prod_number,
					memberId:memberId,
					command:command
			}
			
			$.ajax({
				type: "post",
				async: false,
				url: "/devFw/detailLikeProd.do",
				data: deleteLikeProd,
				dataType : 'text',
				success: function(responseData){
	
					var data = JSON.parse(responseData);
					
					
		           
				},
				error: function(data, textStatus){
					alert("다시 시도해주세요.");
				},
				complete : function (data, textstatus){
				}
			});
		} else{
			return false;
		}
		
	});
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
	background-color: #ccc;
}
.represent_img{
    width: 100px;
    height: 125px;
}
.orderButton{
	border-radius: 5%;
	margin-top:3px;
}
#order{
	background:#424242;
	color:white;
	border:1px solid #424242;
	
}
#basket, #delete{
	background:white;
	color:#424242;
	border:1px solid #A4A4A4;
}
#basket:hover, #delete:hover{
	border:1px solid #424242;
}
</style>
</head>
<body>
<input type="hidden" id="memberId" value="${member.getMemberid() }">
<!-- 주문내역 상단 -->
	<div class="orderHistoryHeader">
		<h3>관심 상품 조회</h3>
	</div>
	<div class="orderHistoryContainer">
		<!-- 주문 상품 정보 테이블 시작  -->
		<table class="orderHistoryTable" id="orderHistoryTable">
			<!-- 주문 상품 정보 테이블 상단 제목   -->
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><input type="checkbox" id="allProduct"></th>
					<th class="OHT_ttl"><span>상품이미지</span></th>
					<th class="OHT_ttl"><span>상품정보</span></th>
					<th class="OHT_ttl"><span>판매가</span></th>
					<th class="OHT_ttl"><span>거래방법</span></th>
					<th class="OHT_ttl"><span>선택</span></th>
				</tr>
			</thead>
			<tbody>
				<!-- 첫 번째 상품 내용 -->
				<c:forEach var="myLikeProd" items="${myLikeProd }">
				<tr class="orderHistoryContents">
				
					<td class="OHC_cont"><input type="checkbox" id="checkProd" value="${myLikeProd.prod_number }"></td>
					<td class="OHC_cont"><img src="${myLikeProd.represent_image }" class="represent_img"></td>
					<td class="OHC_cont">${myLikeProd.prod_title }</td>
					<td class="OHC_cont">
					<c:if test="${myLikeProd.auction_yn == 'y' }"> <!-- 경매면 경매 최고 입찰액 표시 -->
						<fmt:formatNumber value="${myLikeProd.auction_bid }" type="number" />원
					</c:if>
					<c:if test="${myLikeProd.auction_yn != 'y' }"> <!-- 경매가 아니면 상품 가격 표시 -->
						<fmt:formatNumber value="${myLikeProd.prod_price }" type="number" />원
					</c:if>
					</td>
					<td class="OHC_cont">
					<c:if test="${myLikeProd.send_way == 'direct'}">
						직거래
					</c:if>
					<c:if test="${myLikeProd.send_way == 'delivery'}">
						택배거래
					</c:if>
					<c:if test="${myLikeProd.send_way == 'direct delivery'}">
						직거래<br>택배거래
					</c:if>
					</td>

					<td class="OHC_cont">
						<input type="button" value="주문하기" class="orderButton" id="order">
						<br>
						<input type="button" value="장바구니담기" class="orderButton" id="basket"> 
						<br> 
						<input type="button" value="X 삭제" class="orderButton" id="delete" name="${myLikeProd.prod_number }">
					</td>
				
				</tr>
				</c:forEach>
				<!-- 2번째 상품 내용 -->
			</tbody>
		</table>
	</div>
</body>
</html>
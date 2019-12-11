<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼 은도끼|회원구매목록</title>
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
</style>
<script type="text/javascript">

	//취소 및 교환 신청 팝업 뜨게 하기
	function changeProdPopup() {
		window.open("${contextPath}/changeProduct.do", "a",
		"width=800, height=600");
	};

	//리뷰 팝업 뜨게 하기
	function reviewPopup() {
		window.open("${contextPath}/review.do", "a", "width=700, height=700");
	};
	
	//구매확정 팝업 뜨게 하기
	function confirmBuyPopup() {
		window.open("${contextPath}/confirmBuy.do", "a",
				"width=600, height=500");
	};
</script>
</head>
<body>

<div class="container">
<br><br>
<h1>상품 조회</h1>
<br><hr><br>
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#buyProd">구매 상품</a></li>
		<li><a data-toggle="tab" href="#sellProd">판매 상품</a></li>
		<li><a data-toggle="tab" href="#auctionProd">경매 상품</a></li>
	</ul>
	<div class="tab-content">
		<div id="buyProd" class="tab-pane fade in active">
		<br><br>
			<!-- 주문내역 상단 -->
			<h3>주문 내역 조회</h3>
				<!-- 주문 상품 정보 테이블 시작  -->
				<table class="orderHistoryTable" id="orderHistoryTable">
					<!-- 주문 상품 정보 테이블 상단 제목   -->
					<thead class="orderHistoryTableTitles">
						<tr class="OHtableTitle">
							<th class="OHT_ttl"><span>주문일자<br>[주문번호]
							</span></th>
							<th class="OHT_ttl"><span>상품이미지</span></th>
							<th class="OHT_ttl"><span>상품정보</span></th>
							<th class="OHT_ttl"><span>수량</span></th>
							<th class="OHT_ttl"><span>상품구매금액</span></th>
							<th class="OHT_ttl"><span>주문처리상태</span></th>
							<th class="OHT_ttl"><span>제품상태처리</span></th>
						</tr>
					</thead>
					<tbody>
						<!-- 첫 번째 상품 내용 -->
						<tr class="orderHistoryContents">
							<td class="OHC_cont"><span class="orderDate" id="orderDate">2019-11-20</span>
								<br> <a href="#" class="orderNum" id="orderNum">[20191120-0000000]</a></td>
		
							<td class="OHC_cont"><span class="prod_1st_img"
								id="prod_1st_img">이미지</span></td>
							<td class="OHC_cont"><span class="prod_short_detail"
								id="prod_short_detail">상품 정보 설명들어감 제목 + 선택한 옵션</span></td>
							<td class="OHC_cont"><span class="prod_cnt" id="prod_cnt">2</span></td>
							<td class="OHC_cont"><span class="ttl_eachProd_price"
								id="ttl_eachProd_price">29,000원</span></td>
							<td class="OHC_cont"><span class="order_state"
								id="order_state">배송준비중</span></td>
		
							<td class="OHC_cont"><input type="button" value="취소신청 및 교환 신청"
								class="orderButton" id="cancel_order" onClick="changeProdPopup()">
								<br> <input type="button" value="리뷰쓰기" class="orderButton"
								id="review_order" onClick="reviewPopup()"> <br> <input
								type="button" value="구매확정하기" class="orderButton"
								id="confirmBuy_order" onClick="confirmBuyPopup()"></td>
						</tr>
						<!-- 2번째 상품 내용 -->
					</tbody>
				</table>

		</div>
		<div id="sellProd" class="tab-pane fade">
			<br><br>
			<!-- 주문내역 상단 -->
			<h3>판매 내역 조회</h3>
				<!-- 주문 상품 정보 테이블 시작  -->
				<table class="orderHistoryTable" id="orderHistoryTable">
					<!-- 주문 상품 정보 테이블 상단 제목   -->
					<thead class="orderHistoryTableTitles">
						<tr class="OHtableTitle">
							<th class="OHT_ttl"><span>주문일자<br>[주문번호]
							</span></th>
							<th class="OHT_ttl"><span>상품이미지</span></th>
							<th class="OHT_ttl"><span>상품정보</span></th>
							<th class="OHT_ttl"><span>수량</span></th>
							<th class="OHT_ttl"><span>상품구매금액</span></th>
							<th class="OHT_ttl"><span>주문처리상태</span></th>
							<th class="OHT_ttl"><span>제품상태처리</span></th>
						</tr>
					</thead>
					<tbody>
						<!-- 첫 번째 상품 내용 -->
						<tr class="orderHistoryContents">
							<td class="OHC_cont"><span class="orderDate" id="orderDate">2019-11-20</span>
								<br> <a href="#" class="orderNum" id="orderNum">[20191120-0000000]</a></td>
		
							<td class="OHC_cont"><span class="prod_1st_img"
								id="prod_1st_img">이미지</span></td>
							<td class="OHC_cont"><span class="prod_short_detail"
								id="prod_short_detail">상품 정보 설명들어감 제목 + 선택한 옵션</span></td>
							<td class="OHC_cont"><span class="prod_cnt" id="prod_cnt">2</span></td>
							<td class="OHC_cont"><span class="ttl_eachProd_price"
								id="ttl_eachProd_price">29,000원</span></td>
							<td class="OHC_cont"><span class="order_state"
								id="order_state">배송준비중</span></td>
		
							<td class="OHC_cont"><input type="button" value="취소신청 및 교환 신청"
								class="orderButton" id="cancel_order" onClick="changeProdPopup()">
								<br> <input type="button" value="리뷰쓰기" class="orderButton"
								id="review_order" onClick="reviewPopup()"> <br> <input
								type="button" value="구매확정하기" class="orderButton"
								id="confirmBuy_order" onClick="confirmBuyPopup()"></td>
						</tr>
						<!-- 2번째 상품 내용 -->
					</tbody>
				</table>
			
		</div>
		<div id="auctionProd" class="tab-pane fade">
			<br><br>
			<!-- 주문내역 상단 -->
			<h3>경매 내역 조회</h3>
			<p>참여한 경매에 대한 입찰, 낙찰 내역/결제를 보여줍니다.</p>
				<!-- 주문 상품 정보 테이블 시작  -->
				<table class="orderHistoryTable" id="orderHistoryTable">
					<!-- 주문 상품 정보 테이블 상단 제목   -->
					<thead class="orderHistoryTableTitles">
						<tr class="OHtableTitle">
							<th class="OHT_ttl"><span>상품<br>경매마감일자</span></th>
							<th class="OHT_ttl"><span>입찰일자</span></th>
							<th class="OHT_ttl"><span>입찰수량</span></th>
							<th class="OHT_ttl"><span>입찰금액</span></th>
							<th class="OHT_ttl"><span>경매상황</span></th>
							<th class="OHT_ttl"><span>기타</span></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bidList" items="${myBidList }">
						<tr class="orderHistoryContents">
							<td class="OHC_cont"><span class="orderDate" id="orderDate"><a href="./detail.do?prod_number=${bidList.prod_number }"><img src="${bidList.represent_image }" width="100px" height="125px"></a></span>
								<br><br>
								<c:if test="${bidList.endChk != 1}"> <!-- 경매가 끝난 경우 -->
									${bidList.auction_end_date } <span style="color:red;">(종료)</span>
								</c:if>
								<c:if test="${bidList.endChk == 1}"> <!-- 경매가 끝나지 않은 경우 -->
									${bidList.auction_end_date }
								</c:if>
							</td>
							<td class="OHC_cont"><span class="prod_1st_img"
								id="prod_1st_img">${bidList.bid_date }</span></td>
							<td class="OHC_cont"><span class="prod_1st_img"
								id="prod_1st_img">${bidList.bid_amount }</span></td>
							<td class="OHC_cont"><span class="prod_1st_img"
								id="prod_1st_img"><fmt:formatNumber value="${bidList.bid_price }" type="number" /> 원</span></td>
							<td class="OHC_cont"><span class="prod_short_detail"
								id="prod_short_detail">
								<c:if test="${bidList.endChk == 1 and bidList.cnt == 1 }"> <!-- 경매가 끝나지 않은 상태에서 가장 최고가 입찰액을 한 경우 -->
									<span style="color:blue; font-weight:bold;">낙찰예정자</span>
								</c:if>
								<c:if test="${bidList.endChk == 1 and bidList.cnt != 1 }"> <!-- 경매가 끝나지 않은 상태에서 가장 최고가 입찰액을 하지 않은 경우 -->
									미낙찰자
								</c:if>
								<c:if test="${bidList.endChk != 1 and bidList.cnt == 1 }"> <!-- 경매가 끝나고 낙찰자인 경우 -->
									<span style="color:red; font-weight:bold;">낙찰!!!<br>결제를 진행해주세요.</span>
								</c:if>
								<c:if test="${bidList.endChk != 1 and bidList.cnt != 1 }"> <!-- 경매가 끝나고 낙찰자가 아닌 경우 -->
									낙찰실패
								</c:if>
								</span></td>
							
		
							<td class="OHC_cont">
								<c:if test="${bidList.endChk != 1 and bidList.cnt == 1 }"> <!-- 경매가 끝나고 낙찰자인 경우 -->
									<p style="color:red; font-weight:bold;">결제금액:<fmt:formatNumber value="${bidList.bid_price }" type="number" /> 원</p>
									<input type="button" value="결제하기" class="orderButton" id="review_order" onClick="reviewPopup()">
								</c:if></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
</div>	
	
	
	
	
	
</body>
</html>
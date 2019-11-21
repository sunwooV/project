<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	border-bottom:1px solid darkgray;
}

.orderHistoryTable {
	text-align: center;
	width: -webkit-fill-available;
	border-top:1px solid darkgray;
	border-collapse:collapse;
}

.OHtableTitle{
background-color:#faf5f1;
}

</style>
<script type="text/javascript">
	$('#usi-orderHistory').stacktable();
</script>
</head>
<body>
	<!-- 주문내역 상단 -->
	<div class="orderHistoryHeader">
		<h3>주문 내역 조회</h3>
	</div>
	<div class="orderHistoryContainer">
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

					<td class="OHC_cont"><span class="prod_1st_img" id="prod_1st_img">이미지</span></td>
					<td class="OHC_cont"><span class="prod_short_detail"
						id="prod_short_detail">상품 정보 설명들어감 제목 + 선택한 옵션</span></td>
					<td class="OHC_cont"><span class="prod_cnt" id="prod_cnt">2</span></td>
					<td class="OHC_cont"><span class="ttl_eachProd_price"
						id="ttl_eachProd_price">29,000원</span></td>
					<td class="OHC_cont"><span class="order_state"
						id="order_state">배송준비중</span></td>

					<td class="OHC_cont"><input type="button" value="취소신청 및 교환 신청"
						class="orderButton" id="cancel_order" onClick="location.href='${contextPath}/changeProduct.do'">
						<br>
						<input type="button" value="리뷰쓰기"
						class="orderButton" id="review_order" onClick="location.href='${contextPath}/review.do'">
						<br>
						<input type="button" value="구매확정하기"
						class="orderButton" id="confirmBuy_order" onClick="location.href='${contextPath}/confirmBuy.do'">
						</td>
				</tr>
				<!-- 2번째 상품 내용 -->
			</tbody>
		</table>
	</div>
</body>
</html>
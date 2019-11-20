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
	padding: 3% 15% 0% 15%;

	
}

.orderHistoryHeader {
	padding-top:3%;
	margin-left:15%;
}
</style>
<script type="text/javascript">
	$('#usi-orderHistory').stacktable();
</script>
</head>
<body>
<!-- 주문내역 상단 -->
	<div class="orderHistoryHeader">
		<h1>주문내역</h1>
	</div>
	<div class="orderHistoryContainer">
		<table class="orderHistoryTable" id="orderHistoryTable">
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><span>주문일자[주문번호]</span></th>
					<th class="OHT_ttl"><span>상품이미지</span></th>
					<th class="OHT_ttl"><span>상품정보</span></th>
					<th class="OHT_ttl"><span>수량</span></th>
					<th class="OHT_ttl"><span>상품구매금액</span></th>
					<th class="OHT_ttl"><span>주문처리상태</span></th>
					<th class="OHT_ttl"><span>취소/교환/반품</span></th>
				</tr>
			</thead>
			<tbody>
				<tr class="orderHistoryContents">
					<td class="OHC_cont"><a href="#"
						class="usi-dataCellMobile">125892</a></td>
					<td class="OHC_cont"><span
						class="usi-dataCellMobile">Some Awesome Event</span></td>
					<td class="OHC_cont"><span
						class="usi-dataCellMobile">10</span></td>
					<td class="OHC_cont"><span
						class="usi-dataCellMobile">$20.00</span></td>
					<td class="OHC_cont"><span
						class="usi-dataCellMobile">Active</span></td>
					<td class="usi-containerOrderCell usi-buttonsCell">
						<button href="#"
							class="usi-dataCellMobile usi-button secondary small">Edit
							Order</button>
					</td>
					<td class="usi-containerOrderCell usi-buttonsCell">
						<button href="#"
							class="usi-dataCellMobile usi-button secondary small">Re-Order</button>
					</td>
				</tr>
				<tr class="usi-containerOrder">
					<td class="usi-containerOrderCell"><a href="#"
						class="usi-dataCellMobile">1234k5</a></td>
					<td class="usi-containerOrderCell"><span
						class="usi-dataCellMobile">Some Awesome Event</span></td>
					<td class="usi-containerOrderCell"><span
						class="usi-dataCellMobile">8544D, 1234, 2243, 55.4, 2209,
							43A, 223, 9985</span></td>
					<td class="usi-containerOrderCell"><span
						class="usi-dataCellMobile">$2000.00</span></td>
					<td class="usi-containerOrderCell"><span
						class="usi-dataCellMobile">Open</span></td>
					<td class="usi-containerOrderCell"></td>
					<td class="usi-containerOrderCell">
						<button href="#"
							class="usi-dataCellMobile usi-button secondary small usi-buttonsCell">Re-Order</button>
					</td>
				</tr>
				<tr class="usi-containerOrder">
					<td class="usi-containerOrderCell"><a href="#"
						class="usi-dataCellMobile">4444444</a></td>
					<td class="usi-containerOrderCell"><span
						class="usi-dataCellMobile">Some Awesome Event</span></td>
					<td class="usi-containerOrderCell"><span
						class="usi-dataCellMobile">2.228</span></td>
					<td class="usi-containerOrderCell"><span
						class="usi-dataCellMobile">$1052.00</span></td>
					<td class="usi-containerOrderCell"><span
						class="usi-dataCellMobile">Closed</span></td>
					<td class="usi-containerOrderCell">
						<button href="#"
							class="usi-dataCellMobile usi-button secondary small usi-buttonsCell">Edit
							Order</button>
					</td>
					<td class="usi-containerOrderCell">
						<button href="#"
							class="usi-dataCellMobile usi-button secondary small usi-buttonsCell">Re-Order</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
.total{
	margin-top:350px;
	width:450px;
	margin:0px auto;
	margin-top: 60px;
}
h1{
	text-align:center;
}
</style>
</head>
<body>

	<c:forEach var="product_info" items="${product_info }">
	<br><br>
	<h1>"${product_info.prod_title }" 경매 기록</h1>
	<div class="total">
	<div class="subtitle">입찰 상품</div>
	<div>
		<table class="table" style="width:100%; text-align:left; margin:0px auto; border:1px solid lightgray;">
			<tr>
				<td style="background:#FAFAFA">상품명</td>
				<td>${product_info.prod_title }</td>
			</tr>
			<tr>
				<td style="background:#FAFAFA">경매마감일자</td>
				<td>${product_info.auction_end_date }
				<c:if test="${product_info.auction_yn == 'w' or product_info.auction_yn == 'f' }">
				<span style="color:red;">(종료)</span>
				</c:if>
				</td>
			</tr>
			<tr>
				<td style="background:#FAFAFA">최대 구매가능 수량</td>
				<td>${product_info.prod_amount }</td>
			</tr>
			<tr>
				<td style="background:#FAFAFA">거래방법</td>
				<c:if test="${product_info.send_way == 'direct' }">
					<td>직거래(${product_info.direct_area })</td>
				</c:if>
				<c:if test="${product_info.send_way == 'delivery' }">
					<td>택배거래</td>
				</c:if>
				<c:if test="${product_info.send_way == 'direct delivery' }">
					<td>직거래(${product_info.direct_area }), 택배거래</td>
				</c:if>
			</tr>
		</table>
	</div>
	<br><br>
	<div class="subtitle" style="text-align:right"><span style="color:orange">●낙찰자</span> <span style="color:blue;">●낙찰가능자</span></div>
	<div>
		<table class="table" style="width:100%; text-align:center; margin:0px auto; border:1px solid lightgray;">
			<tr style="background:#E6E6E6">
				<td>입찰자 ID</td>
				<td>입찰일자</td>
				<td>입찰가격</td>
				<td>수량</td>
			</tr>
		<c:forEach var="bidRecord" items="${bidRecord }" varStatus="index">
			<c:if test="${index.first }"> <!-- 낙찰가능자 파란색으로 표시 -->
				<c:choose>
				<c:when test="${product_info.auction_yn == 'w' }">
					<tr style="color:orange;">
						<td>${bidRecord.secretMember }</td>
						<td>${bidRecord.bid_date }</td>
						<td><fmt:formatNumber value="${bidRecord.bid_price }" type="number" /> 원</td>
						<td>${bidRecord.bid_amount }</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr style="color:blue;">
						<td>${bidRecord.secretMember }</td>
						<td>${bidRecord.bid_date }</td>
						<td><fmt:formatNumber value="${bidRecord.bid_price }" type="number" /> 원</td>
						<td>${bidRecord.bid_amount }</td>
					</tr>
				</c:otherwise>
				</c:choose>
			</c:if>
			<c:if test="${!index.first }"> <!-- 낙찰가능자가 아니면 -->
				<tr>
					<td>${bidRecord.secretMember }</td>
					<td>${bidRecord.bid_date }</td>
					<td><fmt:formatNumber value="${bidRecord.bid_price }" type="number" /> 원</td>
					<td>${bidRecord.bid_amount }</td>
				</tr>
			</c:if>
		</c:forEach>
		</table>

	</div>
	</div>
	</c:forEach>
	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="Path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" type="text/css" href="https://img4.tmon.kr/fe/release/service/static/checkout/p/css/checkout.css?v=1573093728175">
</head>
<body>
<div class="container" 
    style="margin-left:30%">
<form name="payInfo" id="payInfo">

<h1>주문정보 입력</h1><br><br><br>
<h2>배송지 정보 </h2>
<!--배송정보 테이블  -->
<div id="shippingInfo">
<table id="shipInfoTable">
<tr>
<td>배송지 선택</td>
<td><input type="text" id="selectShipAddress"></td>
<td><input type="button" value="새로운 주소+" id="input_new_Address"></td>
</tr>

<tr>
<td>이름</td>
<td> 신주연</td>
</tr>

<tr>
<td>연락처</td>
<td>000-0000-0000</td>
</tr>

<tr>
<td>주소</td>
<td>(00000)00시 00구 00로 00길(00동 00아파트) 000동 000호</td>
</tr>

<tr>
<td>배송메모</td>
<td><input type="text" placeholder="배송메모를 선택해주세요"></td>
</tr>

</table>
</div>


<!--할인 쿠폰 및 적립헤택-->
<table>

<!-- 주문상품 정보 -->
</table>

<table>

</table>
</form>
</div>
</body>
</html>
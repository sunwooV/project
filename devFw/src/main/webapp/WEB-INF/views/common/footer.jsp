<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼은도끼</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/main.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
</head>
<body>
	<!-- 풋터 -->
	<div class="footer" style="width: 77%; margin-left: 11%;">
		<footer class="footer-inner">
			<div class="container" id="con1">
				<div class="row" id="foot">
					<div class="col-md-4" id="kkk1">
						<h3 class="footer" style="font-size: 22px;">ABOUT</h3>
						<ul class="footer-list" id="ftlist" style="font-size: 14px;">
							<li><a href="./main.do" id="ftlist">HOME</a></li>
							<li><a href="./detail1.do" id="ftlist">ABOUT US</a></li>
							<li><a href="./detail4.do" id="ftlist">STORE GUIDE</a></li>
						</ul>
					</div>
					<div class="col-md-4" id="kkk1">
						<h3 class="footer" style="font-size: 22px;">COMPANY INFORMATION</h3>
						<ul class="footer-list" id="ftlist" style="font-size: 14px;">
							<li>MIU(Market In U)</li>
							<li>서울시 서초구 서초동</li>
							<li>070-000-0000</li>
						</ul>
					</div>
					<div class="col-md-4" id="kkk1">
						<h3 class="footer" style="font-size: 22px;">CUSTOMER CENTER</h3>
						<ul class="footer-list" id="ftlist" style="font-size: 14px;">
							<li>T.02-5678-1234</li>
							<li>OPENING HOURS : AM11:00-
									PM06:00</li>
							<li>SAT, SUN, HOLIDAY OFF</li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</div>

</body>
</html>
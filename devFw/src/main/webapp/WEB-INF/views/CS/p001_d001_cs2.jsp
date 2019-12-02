<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/CS.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
<script type="text/javascript">
	//질문 리스트 열기

	$(document).on('click', '.faq_open', function() {
		var num = $(this).attr("id");

		var target = document.getElementById("n" + num);

		if (target.style.display == 'none') { //접혀있는데 눌렀을 경우
			$('#n' + num).css("display", "");
		} else { //펴져있는데 눌렀을 경우
			$('#n' + num).css("display", "none");
		}

	});
</script>
<style>
.faq_open4 {
	cursor: pointer;
}
</style>
</head>
<body>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container-fluid"
		style="padding-left: 16%; padding-top: 3%; margin-right: -4%;">
		<div class="col-sm-2" id="col">
			<div class="table" id="sidebar"
				style="font-size: 13px; border: 1px solid black;">
				<ul class="nav nav-tabs">
					<h1 style="padding-bottom: 6%; font-size: 18px;">FAQ/자주묻는질문</h1>
					<li class="active"><a data-toggle="tab" href="#home" id="tab">구매관련</a></li>
					<li><a data-toggle="tab" href="#menu1" id="tab">판매관련</a></li>
				</ul>

				<div class="tab-content" style="font-size: 13px;">
					<div id="home" class="tab-pane fade in active">
						<li><a href="#">배송문의</a></li>
						<li><a href="#">교환/환불/반품/AS</a></li>
						<li><a href="#">주문/결제/입금</a></li>
						<li><a href="#">영수증</a></li>
						<li><a href="#">이벤트/할인쿠폰</a></li>
						<li><a href="#">안전거래</a></li>
						<li><a href="#">자동로그인</a></li>

					</div>
					<div id="menu1" class="tab-pane fade">
						<li><a href="#">배송문의</a></li>
						<li><a href="#">교환/환불/반품/AS</a></li>
						<li><a href="#">주문/결제/입금</a></li>
						<li><a href="#">영수증</a></li>
						<li><a href="#">이벤트/할인쿠폰</a></li>
						<li><a href="#">안전거래</a></li>
						<li><a href="#">자동로그인</a></li>
					</div>
				</div>
			</div>

			<div class="table" id="sidebar1"
				style="font-size: 13px; border: 1px solid black;">
				<h1 style="font-size: 19px;">마이페이지</h1>
				<li><a href="#">포인트 조회</a></li>
				<li><a href="#">회원정보조회/수정</a></li>
				<li><a href="#">ID조회/비밀번호 찾기</a></li>
			</div>
		</div>
		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
		<div class="col-sm-10" id="csmain">
			<h1 style="font-size: 37px;">고객센터</h1>

			<div class="row" id="cscs1">
				<h2 style="padding-bottom: 2%;">🗣공지사항</h2>
				<table class="table table-hover" style="width: 98%;">
					<tr>
						<th>제목</th>
						<th>게시일</th>
					</tr>

					<c:forEach var="event" items="${noticeList}" varStatus='notice'>
						<tr id=${notice.count } class="faq_open">
							<td>${event.no_title}</td>
							<td>${event.no_writedate}</td>
						</tr>
						<tr style="display: none;" id="n${notice.count }">
							<td colspan="2">${event.no_contents}</td>
						</tr>
					</c:forEach>
				</table>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "${contextPath}/event.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		style="padding-left: 18%; padding-top: 3%; margin-right: -4%;">
		<div class="col-sm-2" id="col">
		<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action active">
					마이페이지 </a> <a href="#" class="list-group-item list-group-item-action"><h6>포인트
					조회 </h6></a> <a href="#" class="list-group-item list-group-item-action"><h6>회원정보조회/수정</h6>
				</a> <a href="#" class="list-group-item list-group-item-action"><h6>ID조회/비밀번호
					찾기 </h6></a>
			</div>



			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action active">
					게시판 </a> <a href="#" class="list-group-item list-group-item-action"><h6>1:1게시판</h6>
				</a> <a href="#" class="list-group-item list-group-item-action"><h6>교환 및
					환불 </h6></a> <a href="#" class="list-group-item list-group-item-action"><h6>배송문의</h6>
				</a> <a href="#" class="list-group-item list-group-item-action"><h6>기타</h6> </a>
			</div>

		</div>
		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
		<div class="col-sm-10" id="csmain">
			<h1 style="font-size: 37px;">고객센터</h1>

			<div class="row" id="cscs1">
				<h2 style="font-size: 23px; padding-bottom: 2%;">👩‍🏫공지사항</h2>
				<table class="table table-hover" style="width: 98%;">
					<tr  class="table-active">
						<th style="width: 78%;">제목</th>
						<th>게시일</th>
					</tr>

					<c:forEach var="event" items="${noticeList}" varStatus='notice'>
						<tr id=${notice.count } class="faq_open">
							<td><h6>${event.no_title}</h6></td>
							<td><h6><fmt:formatDate value="${event.no_writedate}" pattern="yyyy-MM-dd" /></h6></td>
						</tr>
						<tr style="display: none;" id="n${notice.count }">
							<td colspan="2"><h6>${event.no_contents}</h6></td>
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
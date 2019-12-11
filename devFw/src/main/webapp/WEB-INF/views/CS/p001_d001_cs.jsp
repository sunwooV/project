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
	$(document).on('click', '.faq_open1', function() {
		var num = $(this).attr("id");

		var target = document.getElementById("a" + num);

		if (target.style.display == 'none') { //접혀있는데 눌렀을 경우
			$('#a' + num).css("display", "");
		} else { //펴져있는데 눌렀을 경우
			$('#a' + num).css("display", "none");
		}

	});

	$(document).on('click', '.faq_open2', function() {
		var num = $(this).attr("id");

		var target = document.getElementById("b" + num);

		if (target.style.display == 'none') { //접혀있는데 눌렀을 경우
			$('#b' + num).css("display", "");
		} else { //펴져있는데 눌렀을 경우
			$('#b' + num).css("display", "none");
		}

	});

	$(document).on('click', '.faq_open3', function() {
		var num = $(this).attr("id");

		var target = document.getElementById("c" + num);

		if (target.style.display == 'none') { //접혀있는데 눌렀을 경우
			$('#c' + num).css("display", "");
		} else { //펴져있는데 눌렀을 경우
			$('#c' + num).css("display", "none");
		}

	});

	$(document).on('click', '.faq_open4', function() {
		var num = $(this).attr("id");

		var target = document.getElementById("d" + num);

		if (target.style.display == 'none') { //접혀있는데 눌렀을 경우
			$('#d' + num).css("display", "");
		} else { //펴져있는데 눌렀을 경우
			$('#d' + num).css("display", "none");
		}

	});
</script>
<style>
.faq_open1, .faq_open2, .faq_open3, .faq_open4, .notice {
	cursor: pointer;
}
</style>
</head>
<body>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container-fluid"
		style="padding-left: 16%; padding-top: 3%; margin-right: -4%;">
		<div class="col-sm-2" id="col">


			<div class="list-group">
				<!-- <h1 style="padding-bottom: 3%; font-size: 21px;">마이페이지</h1> -->
				<a href="#" class="list-group-item list-group-item-action active">
					마이페이지 </a> <a href="#" class="list-group-item list-group-item-action">포인트
					조회 </a> <a href="#" class="list-group-item list-group-item-action">회원정보조회/수정
				</a> <a href="#" class="list-group-item list-group-item-action">ID조회/비밀번호
					찾기 </a>
			</div>



			<div class="list-group">
			<a href="#" class="list-group-item list-group-item-action active">
					게시판 </a>
				<c:forEach var="board" items="${boardlist}">
					<a class="list-group-item list-group-item-action"
						href="${contextPath}/privateInit.do?board_num=${board.board_num }">${board.board_name }</a>
				</c:forEach>
			</div>
		</div>
		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
		<div class="col-sm-10" id="csmain">
			<h1 style="font-size: 37px;">고객센터</h1>

			<div class="row" id="cscs">
				<div class="container" id="cs2">
					<h2 class="notice" style="padding-bottom: 2%; font-size: 23px;">
						🔔공지사항🔔 <span class="glyphicon glyphicon-plus"
							onclick="location.href='./csnotice.do'"></span>
					</h2>
					<table class="table table-hover">
						<tr class="table-active">
							<th>제목</th>
							<th>게시일</th>
						</tr>

						<c:forEach var="event" items="${eventList}" varStatus='notice'>
							<tr id=${notice.count } class="faq_open4">
								<td>${event.no_title}</td>
								<td>${event.no_writedate}</td>
							</tr>
							<tr style="display: none;" id="d${notice.count }">
								<td colspan="2">${event.no_contents}</td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<div id="myshopMain">
					<div class="myshopMain_sub1">
						<img src="${contextPath }/resources/img/중고.png"
							style="padding-top: 13%; padding-left: 23%; width: 78%;" />
						<h3 style="font-size: 17px; padding-top: 9%; padding-left: 25%;">
							<a href="${contextPath}/mpBuyerOrderList.do">중고거래</a>
						</h3>

					</div>
					<div class="myshopMain_sub2">
						<img src="${contextPath }/resources/img/경매.png"
							style="padding-top: 13%; padding-left: 23%; width: 78%;" />
						<h3 style="font-size: 17px; padding-top: 9%; padding-left: 25%;">
							<a href="${contextPath}/InfoInit.do"><strong>경매절차</strong></a>
						</h3>
					</div>
					<div class="myshopMain_sub5">
						<img src="${contextPath }/resources/img/플리.png"
							style="padding-top: 13%; padding-left: 23%; width: 78%;" />
						<h3 style="font-size: 17px; padding-top: 9%; padding-left: 25%;">
							<a href="${contextPath}/mypageQA.do"><strong>플리마켓 </strong></a>
						</h3>
					</div>
					<div class="myshopMain_sub6">
						<img src="${contextPath }/resources/img/환급.png"
							style="padding-top: 13%; padding-left: 23%; width: 78%;" />
						<h3 style="padding-top: 11%; font-size: 16px;">
							<a href="/myshop/coupon/coupon.html"><strong>판매자
									입금절차 </strong></a>
						</h3>

					</div>
				</div>

			</div>
			<div class="table" id="cs">
				<div class="row" style="padding-left: 11%; padding-bottom: 2%;">

					<img src="${contextPath }/resources/img/qa.png" style="width: 13%;" />
					<h1
						style="padding-left: 5%; font-size: 46px; padding-top: 3.5%; padding-right: 1%;">무엇이든
						물어보세요</h1>
					<form class="form-inline my-2 my-lg-0" id="searchdiv">
						<input class="form-control mr-sm-2" type="text" id="searchbar2"
							placeholder="검색어를 입력하세요"> <a href="#"><span
							class="glyphicon glyphicon-search" style="font-size: 24px;"></span></a>
					</form>
				</div>
			</div>
			<div class="row" style="padding-left: 1%;">
				<ul class="nav nav-tabs" style="width: 98%;">
					<li class="active"><a data-toggle="tab" href="#FAQ1">자주 묻는
							질문</a></li>
					<li><a data-toggle="tab" href="#FAQ2">교환/환불</a></li>
					<li><a data-toggle="tab" href="#FAQ3">배송문의</a></li>
					<li><a data-toggle="tab" href="#FAQ4">이벤트/할인쿠폰</a></li>
					<li><a data-toggle="tab" href="#FAQ5">주문결제</a></li>
				</ul>
			</div>
			<div class="tab-content">
				<!--컨텐츠  -->
				<div id="FAQ1" class="tab-pane fade in active">
					<table class="table table-hover">
						<tr class="table-active">
							<th>자주 묻는 질문 <span class="glyphicon glyphicon-plus"
								onclick="location.href='./cslist1.do'"
								style="padding-left: 83%;"></span></th>
						</tr>

						<c:forEach var="top" items="${topList}" varStatus='FAQ1'>
							<tr id=${FAQ1.count } class="faq_open1">
								<td>❓${top.title}</td>
							</tr>
							<tr style="display: none;" id="a${FAQ1.count }">
								<td colspan="2">☞${top.contents}</td>
							</tr>
						</c:forEach>
					</table>

				</div>
				<div id="FAQ2" class="tab-pane fade">
					<table class="table table-hover">
						<tr class="table-active">
							<th style="width: 12%;">분류</th>
							<th>제목<span class="glyphicon glyphicon-plus"
								onclick="location.href='./cslist2.do'"
								style="padding-left: 91%;"></span></th>
						</tr>

						<c:forEach var="refund" items="${refundList}" varStatus='FAQ2'>
							<tr id=${FAQ2.count } class="faq_open2">
								<td>${refund.division}</td>
								<td>${refund.title}</td>
							</tr>
							<tr style="display: none;" id="b${FAQ2.count }">
								<td colspan="2">${refund.contents}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="FAQ3" class="tab-pane fade">
					<table class="table table-hover">
						<tr class="table-active">
							<th style="width: 12%;">분류</th>
							<th>제목<span class="glyphicon glyphicon-plus"
								onclick="location.href='./cslist3.do'"
								style="padding-left: 91%;"></span></th>
						</tr>

						<c:forEach var="deilvery" items="${deliveryList}" varStatus='FAQ3'>
							<tr id=${FAQ3.count } class="faq_open3">
								<td>${deilvery.division}</td>
								<td>${deilvery.title}</td>
							</tr>
							<tr style="display: none;" id="c${FAQ3.count }">
								<td colspan="2">${deilvery.contents}</td>
							</tr>
						</c:forEach>
					</table>
				</div>



				<div id="FAQ4" class="tab-pane fade">
					<table class="table table-hover">
						<tr class="table-active">
							<th style="width: 12%;">분류</th>
							<th>제목<span class="glyphicon glyphicon-plus"
								onclick="location.href='./cslist3.do'"
								style="padding-left: 91%;"></span></th>
						</tr>

						<c:forEach var="deilvery" items="${deliveryList}" varStatus='FAQ3'>
							<tr id=${FAQ3.count } class="faq_open3">
								<td>${deilvery.division}</td>
								<td>${deilvery.title}</td>
							</tr>
							<tr style="display: none;" id="c${FAQ3.count }">
								<td colspan="2">${deilvery.contents}</td>
							</tr>
						</c:forEach>
					</table>

				</div>

				<div id="FAQ5" class="tab-pane fade">
					<table class="table table-hover">
						<tr class="table-active">
							<th style="width: 12%;">분류</th>
							<th>제목<span class="glyphicon glyphicon-plus"
								onclick="location.href='./cslist3.do'"
								style="padding-left: 91%;"></span></th>
						</tr>

						<c:forEach var="deilvery" items="${deliveryList}" varStatus='FAQ3'>
							<tr id=${FAQ3.count } class="faq_open3">
								<td>${deilvery.division}</td>
								<td>${deilvery.title}</td>
							</tr>
							<tr style="display: none;" id="c${FAQ3.count }">
								<td colspan="2">${deilvery.contents}</td>
							</tr>
						</c:forEach>
					</table>
				</div>










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
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
</script>
<style>
.faq_open1, .faq_open2, .faq_open3 {
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

			<div class="row" id="cscs">
				<h2>
					🔔공지사항🔔 <span class="glyphicon glyphicon-plus"></span>
				</h2>
				<table class="table table-hover" style="margin-right: 51%;">
					<tr>
						<th>제목</th>
						<th>게시일</th>
					</tr>

					<c:forEach var="event" items="${eventList}" varStatus='index'>
						<tr>
							<td>📍${event.no_title}</td>
							<td>${event.no_writedate}</td>
						</tr>
					</c:forEach>
				</table>




				<div id="myshopMain">
					<div class="myshopMain_sub1">
						<div id="list">
							<h3>
								<a href="${contextPath}/mpBuyerOrderList.do"><strong>✔중고거래</strong></a>
							</h3>
						</div>
					</div>
					<div class="myshopMain_sub2">
						<div id="list">
							<h3>
								<a href="${contextPath}/InfoInit.do"><strong>✔경매절차</strong></a>
							</h3>

						</div>
					</div>
					<div class="myshopMain_sub5">
						<div id="list">
							<h3>
								<a href="${contextPath}/mypageQA.do"><strong>내가 쓴
										게시글 확인</strong></a>
							</h3>
							<p style="font-size: 11px;">
								<a href="${contextPath}/mypageQA.do"> 구매후기 / Q&A </a>
							</p>
						</div>
					</div>
					<div class="myshopMain_sub6">
						<div id="list">
							<h3>
								<a href="/myshop/coupon/coupon.html"><strong>관심 상품</strong></a>
							</h3>
							<p style="font-size: 11px;">
								<a href="/myshop/coupon/coupon.html">고객님이 보유하고 계신 쿠폰내역을
									보여드립니다.</a>
							</p>
						</div>
					</div>
				</div>
			</div>




			<%-- 		<div class="list-group"
						style="font-family: 'Do Hyeon', sans-serif; font-size: 24px; width: 30%; padding-top: 8%; margin-left: -3%;">
						<a href="${contextPath}/detail2.do"
							class="list-group-item list-group-item-action">✔중고거래 </a> <a
							href="${contextPath}/detail3.do"
							class="list-group-item list-group-item-action">✔경매절차</a> <a
							href="${contextPath}/detail4.do"
							class="list-group-item list-group-item-action">✔플리마켓 유형 및
							참여방법</a> <a href="${contextPath}/detail1.do"
							class="list-group-item list-group-item-action">✔판매자 입금절차 안내</a>
					</div> --%>

			<div class="table" id="cs">

				<h1 style="font-size: 43px;">무엇이든 물어보세요</h1>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="text" id="searchbar"
						placeholder="검색어를 입력하세요"> <a href="#"><span
						class="glyphicon glyphicon-search" style="font-size: 21px;"></span></a>
				</form>
			</div>

			<div class="row" style="padding-left: 1%;">
				<ul class="nav nav-tabs" style="width: 90%;">
					<li class="active"><a data-toggle="tab" href="#FAQ1">자주 묻는
							질문</a></li>
					<li><a data-toggle="tab" href="#FAQ2">교환/환불</a></li>
					<li><a data-toggle="tab" href="#FAQ3">배송문의</a></li>
					<li><a data-toggle="tab" href="#FAQ4">공지사항</a></li>
				</ul>
			</div>
			<div class="tab-content">
				<!--컨텐츠  -->
				<div id="FAQ1" class="tab-pane fade in active">
					<table class="table table-hover">
						<tr>
							<th>분류</th>
							<th>제목</th>
						</tr>

						<c:forEach var="top" items="${topList}" varStatus='FAQ1'>
							<tr id=${FAQ1.count } class="faq_open1">
								<td>${top.division}</td>
								<td>${top.title}</td>
							</tr>
							<tr style="display: none;" id="a${FAQ1.count }">
								<td colspan="2">${top.contents}</td>
							</tr>
						</c:forEach>
					</table>

				</div>
				<div id="FAQ2" class="tab-pane fade">
					<table class="table table-hover">
						<tr>
							<th>분류</th>
							<th>제목</th>
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
						<tr>
							<th>분류</th>
							<th>제목</th>
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
					<%-- 		<div style="float: right;">
						<select id="cntPerPage" name="sel" onchange="selChange()">
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
								보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
								보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
								보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
								보기</option>
						</select>
					</div> --%>
					<!-- 옵션선택 끝 -->
					<table class="table table-hover">
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>게시자</th>
							<th>게시일</th>
							<th>조회수</th>
						</tr>

						<c:forEach var="event" items="${eventList}" varStatus='index'>
							<tr>
								<td>${event.no_number}</td>
								<td>${event.no_title}</td>
								<td>${event.no_writer}</td>
								<td>${event.no_writedate}</td>
								<td>${event.no_view_cnt}</td>
							</tr>
						</c:forEach>
					</table>

					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="${contextPath}/event.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="${contextPath}/event.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="${contextPath}/event.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>

				</div>
			</div>
			<div class="row" style="padding-top: 8%">
				<h2 style="padding: 0% 71% 2% 1%;">나의 문의/답변내역</h2>

				<div class="jumbotron" style="width: 93%; margin-left: 1%;">문의내역
					없</div>

				<p>
					<button type="button" class="btn btn-warning"
						style="margin-left: 754%; font-size: 17px;"
						onClick="location.href='${contextPath}/csWrite.do'">1:1
						문의하기</button>
				</p>
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
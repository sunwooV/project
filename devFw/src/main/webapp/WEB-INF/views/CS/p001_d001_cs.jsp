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
		<div class="col-sm-10">
			<h1 style="font-size: 37px;">고객센터</h1>
			<div class="row" style="margin-top: -1%;">
				<div class="table" id="cs">
					<h1 style="font-size: 25px;">무엇이든 물어보세요</h1>
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="text" id="searchbar"
							placeholder="검색어를 입력하세요"> <a href="#"><span
							class="glyphicon glyphicon-search" style="font-size: 21px;"></span></a>
					</form>
				</div>
				<div class="table" id="cs_view">
					<div class="list-group">
						<a href="${contextPath}/detail2.do"
							class="list-group-item list-group-item-action">중고거래 </a> <a
							href="${contextPath}/detail3.do"
							class="list-group-item list-group-item-action">경매절차</a> <a
							href="${contextPath}/detail4.do"
							class="list-group-item list-group-item-action">플리마켓 유형 및 참여방법</a>
						<a href="${contextPath}/detail1.do"
							class="list-group-item list-group-item-action">판매자 입금절차 안내</a>
					</div>
					<!-- .my_point_list -->

				</div>
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
					<table>
						<tr>
							<th scope="row">tr 메뉴 숨김 처리</th>
							<td><a href="#" id="viewhidden" onclick="return false;"
								class="button">클릭</a></td>
						</tr>
						<tr id="hidden" style="display: none;">
							<th>숨김메뉴</th>
							<td><input type="text" /></td>
						</tr>
						<tr>
							<th>하단</th>
							<td>하단</td>
						</tr>
					</table>

				</div>
				<div id="FAQ2" class="tab-pane fade">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">Type</th>
								<th scope="col">Column heading</th>
								<th scope="col">Column heading</th>
								<th scope="col">Column heading</th>
							</tr>
						</thead>
						<tbody>

							<tr class="table-secondary">
								<th scope="row">Secondary</th>
								<td>Column content</td>
								<td>Column content</td>
								<td>Column content</td>
							</tr>
							<tr class="table-secondary">
								<th scope="row">Secondary</th>
								<td>Column content</td>
								<td>Column content</td>
								<td>Column content</td>
							</tr>
							<tr class="table-secondary">
								<th scope="row">Secondary</th>
								<td>Column content</td>
								<td>Column content</td>
								<td>Column content</td>
							</tr>


						</tbody>
					</table>
				</div>
				<div id="FAQ3" class="tab-pane fade">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">Type</th>
								<th scope="col">Column heading</th>
								<th scope="col">Column heading</th>
								<th scope="col">Column heading</th>
							</tr>
						</thead>
						<tbody>

							<tr class="table-secondary">
								<th scope="row">Secondary</th>
								<td>Column content</td>
								<td>Column content</td>
								<td>Column content</td>
							</tr>
							<tr class="table-secondary">
								<th scope="row">Secondary</th>
								<td>Column content</td>
								<td>Column content</td>
								<td>Column content</td>
							</tr>
							<tr class="table-secondary">
								<th scope="row">Secondary</th>
								<td>Column content</td>
								<td>Column content</td>
								<td>Column content</td>
							</tr>


						</tbody>
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
					<table class="table table-hover" id="evnet_td">
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>게시자</th>
							<th>게시일</th>
							<th>조회수</th>
						</tr>

						<c:forEach var="event" items="${eventList}" varStatus='index'>
							<tr align="center"
								onclick="location.href='${contextPath}/eventDetail.do?no_number=${event.no_number}'">
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
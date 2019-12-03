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
<link rel="stylesheet" href="${contextPath }/resources/css/Mypage.css">
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
		style="padding-left: 19%; padding-top: 3%; margin-right: -4%;">
		<div class="col-sm-2" id="col">

			<div class="table" id="sidebar"
				style="font-size: 13px; border: 1px solid black;">
				<h1 style="font-size: 21px;">✔마이페이지</h1>
				<li><a href="${contextPath}/detail1.do">주문 조회</a></li>
				<li><a href="${contextPath}/detail2.do">장바구니</a></li>
				<li><a href="${contextPath}/detail3.do">포인트</a></li>
				<li><a href="${contextPath}/detail4.do">관심상품</a></li>
				<li><a href="${contextPath}/mypageQnA.do">Q&A내역</a></li>
				<li><a href="${contextPath}/mypagereview.do">상품 REVIEW 작성내역</a></li>
				<li><a href="${contextPath}/detail4.do">탈퇴 하기</a></li>
			</div>
		</div>
		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
		<div class="col-sm-10"
			style="padding-right: 11%; padding-left: 2%; font-size: 37px;">
			<h1>게시글 관리</h1>
			<form name="frm" method="post" encType="UTF-8">
				<h2 align="center">상품 REVIEW 작성내역</h2>
				<div class="container" style="padding-top: 3%;">



					<table class="table table-hover" style="padding-left: 7%;">
						<tr>
							<th>번호</th>
							<th>상품</th>
							<th>제목</th>
						</tr>

						<c:forEach var="review" items="${reviewList}" varStatus='index'>
							<tr id=${index.count } class="open">
								<td>${review.review_number}</td>
								<td>${review.prod_number}</td>
								<td>${review.review_title}</td>
							</tr>
							<tr style="display: none;" id="a${index.count }">
								<td colspan="2">${review.review_content}</td>
							</tr>
						</c:forEach>
					</table>



					<div style="padding-left: 46%; font-size: 12px;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="${contextPath}/event.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"><span
								class="glyphicon glyphicon-triangle-left" aria-hidden="true">
							</span></a>
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
			</form>
		</div>
	</div>
</body>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "${contextPath}/event.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}

	$(document).on('click', '.open', function() {
		var num = $(this).attr("id");

		var target = document.getElementById("a" + num);

		if (target.style.display == 'none') { //접혀있는데 눌렀을 경우
			$('#a' + num).css("display", "");
		} else { //펴져있는데 눌렀을 경우
			$('#a' + num).css("display", "none");
		}

	});
</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- 상단바 -->
		<a class="navbar-brand" href="#"><img src=./img/로고.jpg
			width=180px; height=50px; /></a>
		<button class="navbar-toggler collapsed" type="button"
			data-toggle="collapse" data-target="#navbarColor03"
			aria-controls="navbarColor03" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="navbarColor03" style="">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Join</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="#">shopping
						list</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" id="searchbar"
					placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" id="btnsearch"
					type="submit">Search</button>
			</form>
		</div>
	</nav>
	<!--  -->
	<div class="menubar">
		<ul>
			<li><a href="./중고메인.jsp" id="current"
				style="font-family: 'Nanum Gothic Coding', monospace;">중고 거래</a>
				<ul>
					<li><a href="#">패션의류</a></li>
					<li><a href="#">뷰티 잡화</a></li>
					<li><a href="#">유아 용품</a></li>
					<li><a href="#">가구 생활</a></li>
					<li><a href="#">취미 컬렉션</a></li>
					<li><a href="#">디지털</a></li>
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">스포츠 레저</a></li>
					<li><a href="#">뷰티</a></li>
					<li><a href="#">생활 가전</a></li>
					<li><a href="#">자동차 공구</a></li>
					<li><a href="#">도서 기타</a></li>
				</ul></li>
			<li><a href="#" id="current"
				style="font-family: 'Nanum Gothic Coding', monospace;">경매</a>
				<ul>
					<li><a href="#">패션의류</a></li>
					<li><a href="#">뷰티 잡화</a></li>
					<li><a href="#">유아 용품</a></li>
					<li><a href="#">가구 생활</a></li>
					<li><a href="#">취미 컬렉션</a></li>
					<li><a href="#">디지털</a></li>
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">스포츠 레저</a></li>
					<li><a href="#">뷰티</a></li>
					<li><a href="#">생활 가전</a></li>
					<li><a href="#">자동차 공구</a></li>
					<li><a href="#">도서 기타</a></li>
				</ul></li>
			<li><a href="#" id="current"
				style="font-family: 'Nanum Gothic Coding', monospace;">플리 마켓</a>
				<ul>
					<li><a href="#">패션의류</a></li>
					<li><a href="#">뷰티 잡화</a></li>
					<li><a href="#">유아 용품</a></li>
					<li><a href="#">가구 생활</a></li>
					<li><a href="#">취미 컬렉션</a></li>
					<li><a href="#">디지털</a></li>
					<li><a href="#">컴퓨터</a></li>
					<li><a href="#">스포츠 레저</a></li>
					<li><a href="#">뷰티</a></li>
					<li><a href="#">생활 가전</a></li>
					<li><a href="#">자동차 공구</a></li>
					<li><a href="#">도서 기타</a></li>
				</ul></li>
		</ul>
	</div>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container-fluid" style="padding-top: 7%;">
		<div class="col-sm-2">
			<div class="table" id="sidebar"
				style="font-size: 13px; border: 1px solid black;">
				<ul class="nav nav-tabs">
					<h1 style="padding-bottom: 6%; font-size: 17px;">FAQ/자주묻는질문</h1>
					<li class="active"><a data-toggle="tab" href="#home">구매관련</a></li>
					<li><a data-toggle="tab" href="#menu1">판매관련</a></li>
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
				<h1>마이페이지</h1>
				<li><a href="#">포인트 조회</a></li>
				<li><a href="#">회원정보조회/수정</a></li>
				<li><a href="#">ID조회/비밀번호 찾기</a></li>
			</div>
		</div>
		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
		<div class="col-sm-10">
			<h1 style="font-size: 32px;">고객센터</h1>
			<div class="row" style="margin-top: -1%;">
				<div class="table" id="cs" style="border: 1px solid black;">
					<h1>무엇이든 물어보세요</h1>
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="text" id="searchbar"
							placeholder="검색어를 입력하세요"> <a href="#"><span
							class="glyphicon glyphicon-search" style="font-size: 21px;"></span></a>
					</form>
				</div>
				<div class="table" id="cs_view">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action active">가용적립금
						</a> <a href="#" class="list-group-item list-group-item-action">사용적립금
						</a> <a href="#" class="list-group-item list-group-item-action">쿠폰</a>
						<a href="#" class="list-group-item list-group-item-action">등급</a>
						<a href="#" class="list-group-item list-group-item-action">총
							주문</a>
					</div>
					<!-- .my_point_list -->

				</div>
			</div>
			<div class="row" style="padding-left: 1%;">
				<ul class="nav nav-tabs" style="width: 98%;">
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
					<p>히이아아sddsfs앙</p>
				</div>
				<div id="FAQ3" class="tab-pane fade">
					<p>히이sfs아아앙</p>
				</div>
				<div id="FAQ4" class="tab-pane fade">
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
			</div>
			<div class="row" style="padding-top: 8%">
				<h2 style="padding: 0% 71% 2% 1%;">나의 문의/답변내역</h2>

				<div class="jumbotron" style="width: 100%;">문의내역 없</div>

				<p>
					<button type="button" class="btn btn-warning"
						style="margin-left: 425%; font-size: 17px;">1:1 문의하기</button>
				</p>



			</div>
		</div>
	</div>
	<!-- 풋터 -->
	<div class="footer">
		<footer class="footer-inner">
			<div class="container" id="con1">
				<div class="row" id="foot">
					<div class="col-md-4" id="kkk1">
						<h3 class="footer">회사소개</h3>
						<ul class="footer-list" style="font-size: 14px;">
							<li><a href="#" id="ftlist">Our story</a></li>
							<li><a href="#" id="ftlist">Venue</a></li>
							<li><a href="#" id="ftlist">Other</a></li>
						</ul>
					</div>
					<div class="col-md-4" id="kkk1">
						<h3 class="footer">고객센터</h3>
						<ul class="footer-list" id="ftlist" style="font-size: 14px;">
							<li><a href="#" id="ftlist">IKEA</a></li>
							<li><a href="#" id="ftlist">MIO</a></li>
							<li><a href="#" id="ftlist">BAUHAUS</a></li>
						</ul>
					</div>
					<div class="col-md-4" id="kkk1">
						<h3 class="footer">메일문의</h3>
						<ul class="footer-list" id="ftlist" style="font-size: 14px;">
							<li><a href="#" id="ftlist">Chat with us</a></li>
							<li><a href="#" id="ftlist">+46(0)2453 352</a></li>
							<li><a href="#" id="ftlist">E-mail us</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() { // 페이지 document 로딩 완료 후 스크립트 실행
		$("#viewhidden").click(function() {
			status = $("#hidden").css("display");
			if (status == "none") {
				$("#hidden").css("display", "");
			} else {
				$("#hidden").css("display", "none");
			}
		});
	});
</script>
<script>
	$(document).on("click", ".guideBox > p", function() {
		if ($(this).next().css("display") == "none") {
			$(this).next().show();
			$(this).children("span").text("[닫기]");
		} else {
			$(this).next().hide();
			$(this).children("span").text("[열기]");
		}
	});
</script>
</html>
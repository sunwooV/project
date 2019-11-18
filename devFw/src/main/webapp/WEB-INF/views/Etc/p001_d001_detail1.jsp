<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/css/detail.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
</head>
<body>
	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="row">
		<div class="col-sm-3">
			<div class="toc">
				<ul>

					<li><a style="font-size: 20px;" href="#intro">♡마켓 소개♡</a>
						<ul>
							<li><a href="#intro-1">- 판매자 입금방법</a></li>
						</ul></li>
					<li><a href="#desc1">중고 거래</a>
						<ul>
							<li><a href="#desc1-1">- 중고거래 과정</a></li>
						</ul></li>
					<li><a href="#desc2">경매</a>
						<ul>
							<li><a href="#desc2-1">- 경매절차</a></li>
						</ul></li>
					<li><a href="#desc3">플리마켓</a>
						<ul>
							<li><a href="#desc3-1">- 플리마켓 유형</a></li>
							<li><a href="#desc3-2">- 참여방법</a></li>
						</ul></li>
				</ul>
				<svg class="toc-marker" width="200" height="200"
					xmlns="http://www.w3.org/2000/svg">
    <path stroke="#444" stroke-width="3" fill="transparent"
						stroke-dasharray="0, 0, 0, 1000" stroke-linecap="round"
						stroke-linejoin="round" transform="translate(-0.5, -0.5)" />
  </svg>
			</div>
		</div>


		<div class="col-sm-9">
			<article class="contents">
				<section id="intro">
					<h1>♡우리 마켓 소개</h1>
					<p>동네 이웃 간의 연결을 도와 따뜻하고 활발한 교류가 있는 지역 사회를 꿈꾸고 있어요.</p>
					<h2>연혁</h2>
					<p>#2019.12</p>
					<p>월 방문자수 300만 명 돌파</p>
					<p>#2019. 12</p>
					<p>누적 다운로드 600만. 월 방문자 수 250만 명</p>
					<p>#2019.12</p>
					<p>금도끼 은도끼 오픈</p>

					<div id="intro-1">
						<h3>판매자 환급방법</h3>
						<p>구매자가 물건 확인 후 구매 완료 버튼 누르면 환급가능</p>
						<h2>---------------------------------------------------</h2>
					</div>
				</section>

				<section>
					<div id="desc1">
						<h2>♡중고 거래 이용안내</h2>
						<p>1.환불불가</p>
						<p>2.환불불가</p>
						<p>3.환불불가</p>
						<p>4.환불불가</p>
						<p>5.환불불가</p>
						<p>6.환불불가</p>
					</div>

					<div id="desc1-1">
						<h3>중고거래 과정</h3>
						<p>판매자 -> 회사 -> 구매자</p>
						<h2>---------------------------------------------------</h2>
					</div>
				</section>

				<section>
					<div id="desc2">
						<h2>♡경매 이용안내</h2>
						<p>판매자가 물건올리고 구매</p>
					</div>
					<div id="desc2-1">
						<h3>경매 절차</h3>
						<p>일정 기간에 경매 참여</p>
						<h2>---------------------------------------------------</h2>
					</div>
				</section>
				<section>
					<div id="desc3">
						<h2>♡플리마켓 이용안내</h2>
						<p>모든 고객들이 자유롭게 판매가능</p>

					</div>
					<div id="desc3-1">
						<h3>플리마켓 유형소개</h3>
						<p>참여형과 기본</p>
					</div>
					<div id="desc3-2">
						<h3>참여방법</h3>
						<p>플리마켓 개설 후 판매가능</p>
					</div>
				</section>
			</article>
		</div>
	</div>
</body>
<script>
	var toc = document.querySelector('.toc');
	var tocPath = document.querySelector('.toc-marker path');
	var tocItems;

	// Factor of screen size that the element must cross
	// before it's considered visible
	var TOP_MARGIN = 0.1, BOTTOM_MARGIN = 0.2;

	var pathLength;

	var lastPathStart, lastPathEnd;

	window.addEventListener('resize', drawPath, false);
	window.addEventListener('scroll', sync, false);

	drawPath();

	function drawPath() {

		tocItems = [].slice.call(toc.querySelectorAll('li'));

		// Cache element references and measurements
		tocItems = tocItems.map(function(item) {
			var anchor = item.querySelector('a');
			var target = document.getElementById(anchor.getAttribute('href')
					.slice(1));

			return {
				listItem : item,
				anchor : anchor,
				target : target
			};
		});

		// Remove missing targets
		tocItems = tocItems.filter(function(item) {
			return !!item.target;
		});

		var path = [];
		var pathIndent;

		tocItems
				.forEach(function(item, i) {

					var x = item.anchor.offsetLeft - 5, y = item.anchor.offsetTop, height = item.anchor.offsetHeight;

					if (i === 0) {
						path.push('M', x, y, 'L', x, y + height);
						item.pathStart = 0;
					} else {
						// Draw an additional line when there's a change in
						// indent levels
						if (pathIndent !== x)
							path.push('L', pathIndent, y);

						path.push('L', x, y);

						// Set the current path so that we can measure it
						tocPath.setAttribute('d', path.join(' '));
						item.pathStart = tocPath.getTotalLength() || 0;

						path.push('L', x, y + height);
					}

					pathIndent = x;

					tocPath.setAttribute('d', path.join(' '));
					item.pathEnd = tocPath.getTotalLength();

				});

		pathLength = tocPath.getTotalLength();

		sync();

	}

	function sync() {

		var windowHeight = window.innerHeight;

		var pathStart = pathLength, pathEnd = 0;

		var visibleItems = 0;

		tocItems.forEach(function(item) {

			var targetBounds = item.target.getBoundingClientRect();

			if (targetBounds.bottom > windowHeight * TOP_MARGIN
					&& targetBounds.top < windowHeight * (1 - BOTTOM_MARGIN)) {
				pathStart = Math.min(item.pathStart, pathStart);
				pathEnd = Math.max(item.pathEnd, pathEnd);

				visibleItems += 1;

				item.listItem.classList.add('visible');
			} else {
				item.listItem.classList.remove('visible');
			}

		});

		// Specify the visible path or hide the path altogether
		// if there are no visible items
		if (visibleItems > 0 && pathStart < pathEnd) {
			if (pathStart !== lastPathStart || pathEnd !== lastPathEnd) {
				tocPath.setAttribute('stroke-dashoffset', '1');
				tocPath.setAttribute('stroke-dasharray', '1, ' + pathStart
						+ ', ' + (pathEnd - pathStart) + ', ' + pathLength);
				tocPath.setAttribute('opacity', 1);
			}
		} else {
			tocPath.setAttribute('opacity', 0);
		}

		lastPathStart = pathStart;
		lastPathEnd = pathEnd;

	}
</script>


</html>
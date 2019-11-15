<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/진짜메인.css">
<link rel="stylesheet" href="css/detail.css">
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
		<div class="toc">
			<div class="col-md-4" style="width: 100%;">
				<ul>
					<li><a href="#intro">Intro</a></li>
					<li><a href="#dev">Developer Mode</a>
						<ul>
							<li><a href="#dev-edit-html">Edit HTML</a></li>
							<li><a href="#dev-element-classes">Element Classes</a></li>
							<li><a href="#dev-slide-classes">Slide Classes</a></li>
							<li><a href="#dev-export-html">Export HTML</a></li>
						</ul></li>
					<li><a href="#css">CSS Editor</a>
						<ul>
							<li><a href="#css-fonts">Custom Fonts</a></li>
							<li><a href="#css-developer-mode">Developer Mode</a></li>
							<li><a href="#css-examples">Examples</a></li>
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

		<div class="col-md-8">

			<section id="intro">
				<h2>Progress Nav</h2>
				<p>This page demonstrates an idea for how progress can be
					visualized inside of a standard page nav. Scroll the page and note
					how the marker animates to highlight all of the sections that are
					currently on screen.</p>

				<h2>Slides for Developers</h2>

				<p>There's also an API for creating new presentations with
					preset content and we're aiming to add additional APIs in the
					future.</p>
			</section>

			<section>
				<div id="dev">
					<h2>Developer Mode</h2>
				</div>

				<div id="dev-edit-html">
					<h3>Editing HTML</h3>
				</div>

				<div id="dev-element-classes">
					<h3>
						Element Classes <a href="/pricing" class="header-secondary-text">(Requires
							Pro)</a>
					</h3>
				</div>

				<div id="dev-slide-classes">
					<h3>플리마켓</h3>
				</div>

				<div id="dev-export-html">
					<h3>Export HTML</h3>

				</div>

			</section>

			<section>
				<div id="css">
					<h2>경매방법설명</h2>
				</div>
				<div id="css-fonts">
					<h3>Custom Fonts</h3>

				</div>
				<div id="css-developer-mode">
					<h3>Developer Mode</h3>

				</div>

				<div id="css-examples">
					<h1>룰루</h1>
				</div>

				<p>Here's where you can access the CSS editor from inside of the
					Style panel:</p>
				<img class="developer-image"
					src="https://static.slid.es.s3.amazonaws.com/site/developers/slides-css-editor-1.png">

				<p>A screenshot of the editor:</p>
				﻿<img class="developer-image"
					src="https://static.slid.es.s3.amazonaws.com/site/developers/slides-css-editor-2.png">

			</section>
		</div>
	</div>
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
				var target = document.getElementById(anchor
						.getAttribute('href').slice(1));

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
						&& targetBounds.top < windowHeight
								* (1 - BOTTOM_MARGIN)) {
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
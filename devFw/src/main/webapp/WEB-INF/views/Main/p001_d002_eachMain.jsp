<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//enter 눌렀을 때 처리
$(document).on('keypress', '#eachsearchbar', function() {
	if (event.which == 13) {
		clickEvent();
		return false;
	}
});

function clickEvent() {
	var searchVal = $("#searchbar").val();
	var eachsearchVal = $("#eachsearchbar").val();
	var frm = document.searchform;
	//검색어 유효성 검사
	if (eachsearchVal == "" && searchbar == "") {
		alert("검색어를 입력해주세요.");
		return false;
	}
	frm.method = "get";
	frm.action = "./eachsearchProduct.do";
	frm.submit();
}
</script>
<style>
.CategorySection img{
	width:60px;
	height:60px;
}
#highCategory{
	float:left;
	padding:12px;
	list-style-type : none;
	border:1px solid lightgray;
	position:static;
}
.CategorySection li:hover{
	cursor:pointer;
}
.CategorySection li:hover p{
	color:tomato;
}
.CategorySection li ul li:hover a{
	color:tomato;
	cursor:pointer;
}
.CategorySection li ul li{
	list-style-type : circle;
	margin-left: 51px;
    margin-top: 12px;
    margin-bottom: 12px;
}
#categoryNm{
	font-size: 12px;
    text-align: center;
    margin-top: 3px;
    margin-bottom: -3px;
}
.CategorySection li ul{
	position: absolute;
    top: 399px;
    left: 417px;
    width: 57%;;
    float:left;
    width: 1045px;
    display: none;
    border-left:1px solid lightgray; 
	border-right:1px solid lightgray;
	border-bottom:1px solid lightgray;
	padding-left:10px;
	background:white;
}
.CategorySection li ul li{
	   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
	float:left;
	width:20%;
}
.CategorySection li:hover ul{
	display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}
#search{
	position: absolute;
    top: 180px;
    left: 700px;
    width: 700px;
	
}

.searchbar{
	width:350px;
	display:block;
	margin:0px auto;
	margin-top:30px;
	margin-bottom:50px;
}
#sale_price {
	color: #BDBDBD;
	font-size: medium;
	text-decoration: line-through;
}
.title, .groupSearch{
	margin-top:12px;
	margin-left:12px;
}
.title, .title>a, .title>span{
	color:gray;
	font-size:medium;
}
.categorySearch, .groupSearch, .send_way{
	padding-top:10px;
	width: 97%;
    margin: 10px;
    display:block;
    height: 40px;
}
.left{
	display:block;
	float:left;
}
.right{
	float: left;
    margin-right: 6%;
}
#left{
	margin-left:15px;
}
#right{
    float: right;
    margin-top: -33px;
    margin-right: 15px;
}
#subRight{
	margin-left:100px;
	float:left;
}
#accent{
	color:tomato;
}
#detailSearch{
	padding:8px 13px;
	background:#dd5850;
	color:white;
	border:none;
}
#detailSearch:hover{
	background:white;
	color:#dd5850;
	border:1px solid #dd5850;
}
#down{
    width: 15px;
    height: 15px;
    border: 1px solid lightgray;
    margin: 2px;
    padding: 2px;
}
.middleCategory{
	border:1px solid gray;
	padding:10px;
	background:white;
}
a{
	cursor:pointer;
}
.right li ul {
	background: rgb(109,109,109);
	display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
	height:auto;
	padding:0px;
	margin:0px;
	border:0px;
	position:absolute;
	width:200px;
	z-index:200;
	list-style:none;
	cursor:pointer;
}
label{
	cursor:pointer;
}
.right li{
	list-style:none;
}
.right li:hover ul {
	display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}

#eachsearchbar{
    width: 65%;
}
.eachTitle{
	margin-left:50px;
}
</style>
</head>
<body>
<c:set var="highCategoryName" value="${highCategoryName }"/>
<c:set var="middleCategoryName" value="${middleCategoryName }"/>
<c:set var="category" value="${category }"/>
<c:set var="command" value="${command }"/>
<div class="container">
<br><br>
<div class="mainHeader">
<c:if test="${command == 'reused' }">
	<h1 class="eachTitle"><a href="./eachMain.do?command=reused" style="text-decoration:none">중고</a></h1>
</c:if>
<c:if test="${command == 'auction' }">
	<h1 class="eachTitle"><a href="./eachMain.do?command=auction" style="text-decoration:none">경매</a></h1>
</c:if>
	
	<form class="form-inline my-2 my-lg-0" id="search" name="searchform" method="POST" action="./eachsearchProduct.do">
		<input class="form-control mr-sm-2" type="text" id="eachsearchbar" name="searchVal" value="" placeholder="검색어를 입력하세요♡"> 
		<input type="submit" class="btn btn-secondary my-2 my-sm-0" id="btneachsearch" value="Search">
		<input type="hidden" id="division" name="division" value="${command }">
	</form>
</div>
	<br><hr><br>
	<div class="CategorySection">
		<ul>
			<c:forEach var="high" items="${high_category }" varStatus="index">
				<li id="highCategory"><img src="${contextPath }/resources/img/category/c${index.count }.png"><br><p id="categoryNm">${high.category_name }</p>
					<ul>
						<c:forEach var="middle" items="${middle_category }" varStatus="status">
							<c:if test="${middle.high_category == high.category_code }">
								<c:choose>
									<c:when test="${middle.category_code == category }">
										<li><a href="./eachMain.do?command=${command }&category=${high.category_name },${middle.category_name},${middle.category_code }" style="color:tomato;text-decoration:none;">${middle.category_name }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="./eachMain.do?command=${command }&category=${high.category_name },${middle.category_name},${middle.category_code }" style="text-decoration:none">${middle.category_name }</a></li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</div>
	<br><br><br><br><br><br><br>
	<p id="left">홈
	<c:if test="${highCategoryName != null }">
		> ${highCategoryName } > <span style="color:tomato;">${middleCategoryName }</span>
	</c:if></p>
	<div id="right">
	<select id="prodOption" name="prodOption">
		<option value="정렬방법" selected="selected">--정렬방법--</option>
		<option value="신제품순">신제품순</option>
		<option value="최저가순">최저가순</option>
		<option value="최고가순">최고가순</option>
	</select>
	</div>
	<hr><hr>
	<br>
	<div class="row">
		<c:forEach var="product" items="${prodList }" varStatus="status">
			<div class="col-sm-3">
				<div class="thumbnail">
					<c:if test="${product.reused_yn == 'y' }">
						<!-- 상품 판매 카테고리 -->
						<span class="group">중고</span>
					</c:if>
					<c:if test="${product.auction_yn == 'y' or product.auction_yn == 'w' or product.auction_yn == 'f'}">
						<span class="group">경매</span>
					</c:if>
					<c:if test="${product.flea_yn == 'y' }">
						<span class="group">플리</span>
					</c:if>
					<c:if test="${product.auction_yn == 'y' }">
						<span class="group" style="color:red;">(경매 진행 중)</span>
					</c:if>
					<img src="${product.represent_image }"
						style="width: 230px; height: 240px;" alt="..."
						onclick="location.href='./detail.do?prod_number=${product.prod_number }'">
					<div class="caption">
						<h3>${product.prod_title }
							<c:if test="${product.sale_percent != null }">
							[${product.sale_percent }%]
						</c:if>
						</h3>
						<c:choose>
							<c:when test="${product.auction_yn == 'y' }">
								<p id="p">
									<fmt:formatNumber value="${product.auction_bid }"
										type="number" />
									원 
								</p>
							</c:when>
							<c:when test="${((product.auction_yn == 'f' or product.auction_yn == 'w') and product.reused_yn == 'n' and product.flea_yn == 'n') or product.prod_amount == 0}">
								<p id="p" style="color:red; font-weight:bold">품절</p>
							</c:when>
							<c:otherwise>
								<c:if test="${product.sale_percent != null }">
									<p>
										<span id="p"><fmt:formatNumber
												value="${product.prod_price * (1-(product.sale_percent*0.01)) }"
												type="number" />원</span> <span id="sale_price"
											style="margin-bottom: 1re;"><fmt:formatNumber
												value="${product.prod_price }" type="number" />원</span>
									</p>
								</c:if>
								<c:if test="${product.sale_percent == null }">
									<p id="p">
										<fmt:formatNumber value="${product.prod_price }"
											type="number" />
										원
									</p>
								</c:if>
							</c:otherwise>
						</c:choose>


						<p id="p">
							<a href="#" class="btn btn-primary" id="ttt3" role="button">장바구니</a>
							<a href="${contextPath}/payInfo.do" class="btn btn-default"
								id="ttt4" role="button">구매하기</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>
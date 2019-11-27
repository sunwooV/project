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
<script type="text/javascript">
	$(document).on('click', '#detailSearch' , function(){
		var frm = document.searchForm;
		
		frm.method="get";
		frm.action="./searchProduct.do";
		frm.submit();
	});
</script>
<style>
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
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<body>
<form name="searchForm">
<c:set var="searchVal" value="${searchVal }"/>
<c:set var="size" value="${size }"/>
<c:set var="command" value="${command }"/>
<input type="hidden" name="searchVal" value="${searchVal }">
<div class="container">
<br>

<hr>
	<div class="detailSearch">
		<input type="hidden" name="command" value="detailSearch">
		<div class="title">
			<a href="./main.do">홈</a> > <span id="accent">"${searchVal }"</span> <span style="color:black;">검색 결과</span> : <span id="group">전체 </span>(<span id="accent"><fmt:formatNumber value="${size }" type="number"/></span>개의 상품)
		</div>
		<br>
		<%-- <div class="categorySearch">
			<div class="left"><h3>카테고리</h3></div>
			<div class="right">
			
			<c:choose>
				<c:when test="${command == 'categoryDetail' }">
					<c:forEach var="searchMiddleCategory" items="${selectMiddleCategory }" varStatus="status" >
						<li id="subRight">${searchMiddleCategory.category_name } (<fmt:formatNumber value="${searchMiddleCategory.m_cnt }" type="number"/>)
						</li>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="searchHighCategory" items="${searchHighCategory }" varStatus="status" >
						<li id="subRight"><input type="checkbox" name="category_select" id="categoryCheck${status.index }" value="${searchHighCategory.category_code }" ><label for="categoryCheck${status.index }">${searchHighCategory.category_name } (<fmt:formatNumber value="${searchHighCategory.b_cnt }" type="number"/>)</label> <img id="down" class="${status.index }" src="${contextPath }/resources/img/down.svg">
							
							<ul>
								<c:forEach var="searchMiddleCategory" items="${searchMiddleCategory }">
									<c:if test="${searchMiddleCategory.high_category == searchHighCategory.category_code }">
									<li class="middleCategory" id="m${status.index}">
										${searchMiddleCategory.category_name } (${searchMiddleCategory.m_cnt })
									</li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<hr> --%>
		<c:set var="reused" value="${reused }"/>
		<c:set var="auction" value="${auction }"/>
		<c:set var="flea" value="${flea }"/>
		<c:set var="send_way" value="${send_way }"/>
		<div class="groupSearch">
			<div class="left"><h3>판매그룹</h3></div>
			<div class="right">
				<c:if test="${reused != null }">
					<div id="subRight"><input type="checkbox" name="group_select" id="reused" value="reused" checked="checked"><label for="reused">중고상품</label></div>
				</c:if>
				<c:if test="${reused == null }">
					<div id="subRight"><input type="checkbox" name="group_select" id="reused" value="reused"><label for="reused">중고상품</label></div>
				</c:if>
				<c:if test="${auction != null }">
					<div id="subRight"><input type="checkbox" name="group_select" id="auction" value="auction" checked="checked"><label for="auction">경매상품</label></div>
				</c:if>
				<c:if test="${auction == null }">
					<div id="subRight"><input type="checkbox" name="group_select" id="auction" value="auction"><label for="auction">경매상품</label></div>
				</c:if>
				<c:if test="${flea != null }">
					<div id="subRight"><input type="checkbox" name="group_select" id="flea" value="flea" checked="checked"><label for="flea">플리마켓상품</label></div>
				</c:if>
				<c:if test="${flea == null }">
					<div id="subRight"><input type="checkbox" name="group_select" id="flea" value="flea"><label for="flea">플리마켓상품</label></div>
				</c:if>
				
			</div>
		</div>
		<hr>
		<div class="send_way">
			<div class="left"><h3>거래방법</h3></div>
			<div class="right">
				<c:if test="${send_way == 'direct' }">
					<div id="subRight"><input type="checkbox" name="send_way_select" id="direct" value="direct" checked="checked"><label for="direct">직거래</label></div>
					<div id="subRight"><input type="checkbox" name="send_way_select" id="delivery" value="delivery"><label for="delivery">택배거래</label></div>
				</c:if>
				<c:if test="${send_way == 'delivery' }">
					<div id="subRight"><input type="checkbox" name="send_way_select" id="direct" value="direct"><label for="direct">직거래</label></div>
					<div id="subRight"><input type="checkbox" name="send_way_select" id="delivery" value="delivery" checked="checked"><label for="delivery">택배거래</label></div>
				</c:if>
				<c:if test="${send_way == 'direct delivery' }">
					<div id="subRight"><input type="checkbox" name="send_way_select" id="direct" value="direct" checked="checked"><label for="direct">직거래</label></div>
					<div id="subRight"><input type="checkbox" name="send_way_select" id="delivery" value="delivery" checked="checked"><label for="delivery">택배거래</label></div>
				</c:if>
				<c:if test="${send_way == null }">
					<div id="subRight"><input type="checkbox" name="send_way_select" id="direct" value="direct"><label for="direct">직거래</label></div>
					<div id="subRight"><input type="checkbox" name="send_way_select" id="delivery" value="delivery"><label for="delivery">택배거래</label></div>
				</c:if>
			</div>
		</div>
		<center><input type="button" name="detailSearch" id="detailSearch" value="상세검색"></center>

		<hr>
	</div>
	<br>
	<div class="row">
		<c:forEach var="product" items="${searchProduct}" varStatus="status">
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
</form>
</body>
</html>
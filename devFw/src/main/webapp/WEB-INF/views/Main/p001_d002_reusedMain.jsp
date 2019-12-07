<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
<div class="container">
<br><br>
<div class="mainHeader">
	<h1><img src="${contextPath }/resources/img/main/mainflower.png" width="50px" height="50px">&nbsp중고</h1>
	<form class="form-inline my-2 my-lg-0" id="search" name="searchform">
		<input class="form-control mr-sm-2" type="text" id="searchbar" name="searchVal" value="" placeholder="검색어를 입력하세요♡"> 
		<input type="button" class="btn btn-secondary my-2 my-sm-0" id="btnsearch" value="Search" onclick="SearchProduct()">
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
								
								<li><a>${middle.category_name }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
</body>
</html>
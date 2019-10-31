<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding-left: 0;
}
.ui_title__txt{
  color: #333;
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 24px;
  padding-bottom: 4px;
  border-bottom: 1px solid #d9d9d9;
}
.wrap{
  width: 30%;
  position: absolute;
  top: 50%;
  left: 40%;
  transform: translate(-50%, -50%);
}
.search {
 width: 100%;
 position: relative;
 display: flex;
}
.searchTerm {
  width: 100%;
  border: 3px solid #b9bbbc;
  border-right: none;
  padding: 5px;
  height: 35px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
}

.searchTerm:focus{
  color: #b9bbbc;
}

.searchButton {
  width: 40px;
  height: 36px;
  border: 1px solid #00B4CC;
  background: #00B4CC;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
}
 .left-images, .left-categories-list {
   float: left;
}
.categories-list li {
    display: block;
    line-height: normal;
    margin: 0;
    padding: 5px 0;
}
.categories-list li :hover{
		background:inherit !important;
}
.left-images > p {
    background: none repeat scroll 0 0 #ff7f50;
    display: block;
    font-size: 18px;
    line-height: normal;
    margin: 0;
    padding: 5px 14px;
}
.categories-list span {
    font-size: 18px;
    padding-bottom: 5px;
    text-transform: uppercase;
}
.mm-view-more{
	background: none repeat scroll 0 0 #ff7f50;
    color: #fff;
    display: inline !important;
    line-height: normal;
    padding: 5px 8px !important;
	margin-top:10px;
}
.dropdownmenu ul, .dropdownmenu li {
	margin: 0;
	padding: 0;
	width : 100%;
}
.dropdownmenu ul {
	background: gray;
	list-style: none;
	width: 100%;
}
.dropdownmenu li {
	float: left;
	position: relative;
	width:auto;
}
.dropdownmenu a {
	background: #30A6E6;
	color: #FFFFFF;
	display: block;
	font: bold 12px/20px sans-serif;
	padding: 10px 25px;
	text-align: center;
	text-decoration: none;
	-webkit-transition: all .25s ease;
	-moz-transition: all .25s ease;
	-ms-transition: all .25s ease;
	-o-transition: all .25s ease;
	transition: all .25s ease;
}
.dropdownmenu li:hover a {
	background: #000000;
}
#submenu {
	left: 0;
	opacity: 0;
	position: absolute;
	top: 35px;
	visibility: hidden;
	z-index: 1;
}
li:hover ul#submenu {
	opacity: 1;
	top: 40px;	/* adjust this as per top nav padding top & bottom comes */
	visibility: visible;
}
#submenu li {
	float: none;
	width: 100%;
}
#submenu a:hover {
	background: #DF4B05;
}
#submenu a {
	background-color:#000000;
}

.profile-picture {
	border-radius: 100%;
	overflow: hidden;
	-webkit-box-sizing: content-box;
  	-moz-box-sizing: content-box;
  	box-sizing: content-box;	
  	margin-left: 50px;
  	
}
.big-profile-picture {
	width: 120px;
	height: 120px;
}
.add-button .icon {
	float: right;
	line-height: 18px;
	width: 23px;					
	border: 2px solid;
	border-radius: 100%;
	font-size: 18px;
	text-align: center;
	margin: 10px;					
}
.add-button .icon:hover {
	color: #e64c65;
	border-color: #e64c65;
}

.user-name {
	margin-left: 50px;
}
.profile-description {
	width: 210px;
	text-align: center;
}

.ui_card, .ui_card--flex-orientation, .ui_card--side, .ui_card--white {
    overflow: hidden;
    position: relative;
    display: inline-block;
    background: #f8f9fb;
    border-radius: 4px;
    border: 1px solid #d9d9d9;
    font-size: 12px;
    box-shadow: 0 1px 3px 0 hsla(0,0%,86.3%,.3);
}
element.style {
       background-image: url(https://image.idus.com/image/files/7c7e4972cbdc49b0a43cdb03973786e4_512.png);
}
.ui_card__img {
    position: relative;
    display: block;
    width: 100%;
    height: auto;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: 50%;
    transition: transform .5s ease-in-out;
}
.ui_card__img:after {
    content: "";
    display: block;
    padding-bottom: 100%;
}

.nav-links {
    border: 2px solid #555;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    padding: 16px;
}

.nav-links a {
    display: inline-block;
    width: 100%;
    font-size: 12px;
    color: #666;
    margin-top: 4px;
    vertical-align: middle;
}

.border-row:before {
    content: '';
    display: block;
    width: 100%;
    height: 16px;
    border-top: 1px solid #d9d9d9;
    margin-top: 16px;
}

dt { 
	float:left;
	width:50%;
} 
 	
dd { 
	float:left; 
	width:50%; 
}

layout-split:after {
    content: '';
    display: block;
    clear: both;
}

<!-- 구매후기 왼쪽-->
.layout-split.half>*:first-child {
    margin-left: 0;
}
.layout-split.half>* {
    width: 48%;
    margin-left: 1%;
}

.ui_card--side .ui_card__title {
    display: block;
    display: -webkit-box;
    height: 21px;
    font-size: 14px;
    line-height: 1.5;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    margin: 15px 0;
    font-weight: 700;
}

.ui_card--side .ui_card__inner {
    display: table;
}

.ui_card__inner {
    width: 100%;
    display: block;
    position: relative;
}
.ui_card--flex-orientation>*, .ui_card--side>*, .ui_card--white>*, .ui_card>* {
    text-align: left;
    box-sizing: border-box;
}

.cardlist_section .split-cardlist .ui_card--side {
    width: 100%;
}
.ui_card, .ui_card--flex-orientation, .ui_card--side, .ui_card--white {
    overflow: hidden;
    position: relative;
    display: inline-block;
    background: #f8f9fb;
    border-radius: 4px;
    border: 1px solid #d9d9d9;
    font-size: 12px;
    box-shadow: 0 1px 3px 0 hsla(0,0%,86.3%,.3);
}

.ui_card--flex-orientation>*, .ui_card--side>*, .ui_card--white>*, .ui_card>* {
    text-align: left;
    box-sizing: border-box;
}

.ui_card, .ui_card--flex-orientation, .ui_card--side, .ui_card--white {
    overflow: hidden;
    position: relative;
    display: inline-block;
    background: #f8f9fb;
    border-radius: 4px;
    border: 1px solid #d9d9d9;
    font-size: 12px;
    box-shadow: 0 1px 3px 0 hsla(0,0%,86.3%,.3);
}

.ui_card__img {
    position: relative;
    display: block;
    width: 100%;
    height: auto;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: 50%;
    transition: transform .5s ease-in-out;
}

<!-- 스토리 오른쪽 -->
.layout-split>* {
    float: left;
    margin-left: 24px;
    width: 336px;
}

</style>

<head>
<meta charset="UTF-8">
<title>금도끼은도끼| 플리마켓</title>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
</head>
<body>

<table border='1' width='800' align='center'>
   <tr align='center' bgcolor='#FFFF66'> 
     <td>멤버아이디</td>
     <td>플리마켓 타이틀</td>
     <td>플리마켓 내용</td>
     <td >플리마켓 코드</td>
     <td>수정</td>
</tr>

  <c:forEach var="flea" items="${searchList}" >	
	 <c:url var="url"  value="searchMod.do"  >
	   <c:param  name="p_mod_id" value="${member.id}" />
	 </c:url>     

     <tr align=center>
       <td>${flea.buyer_memberid}</td>
       <td>${flea.review_title}</td>
       <td>${flea.review_content}</td>
       <td>${flea.flea_code}</td>
       <td><a href='${url}'> 수정 </a></td>
     </tr>
  </c:forEach>
</table>

	 <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">금도끼 은도끼</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
     
		  <div class="wrap">
		   <div class="search">
		      <input type="text" class="searchTerm" placeholder="What are you looking for?">
		      <button type="submit" img src="${contextPath}/resources/magnifying-glass.png">
		        <i class="fas fa-search"></i>
		     </button>
		   </div>
		</div>
		
	 
      <!-- 
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="login.jsp">로그인
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">회원가입</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">고객센터</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
      -->
    </div>
  </nav>
  
   
  <nav class="dropdownmenu">
  <ul>
    <li><a href="http://www.jochaho.com/wordpress/">Home</a></li>
    <li><a href="http://www.jochaho.com/wordpress/about-pritesh-badge/">About Me</a></li>
    <li><a href="#">Articles on HTML5 & CSS3</a>
      <ul id="submenu">
        <li><a href="http://www.jochaho.com/wordpress/difference-between-svg-vs-canvas/">Difference between SVG vs. Canvas</a></li>
        <li><a href="http://www.jochaho.com/wordpress/new-features-in-html5/">New features in HTML5</a></li>
        <li><a href="http://www.jochaho.com/wordpress/creating-links-to-sections-within-a-webpage/">Creating links to sections within a webpage</a></li>
      </ul>
    </li>
    <li><a href="http://www.jochaho.com/wordpress/category/news/">News</a></li>
    <li><a href="http://www.jochaho.com/wordpress/about-pritesh-badge/">Contact Us</a></li>
  </ul>
  <br><br>
</nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <aside class="col-lg-3">

		<!-- 
        <h1 class="my-4">Shop Name</h1>
        <div class="list-group">
          <a href="#" class="list-group-item">Category 1</a>
          <a href="#" class="list-group-item">Category 2</a>
          <a href="#" class="list-group-item">Category 3</a>
        </div>
        -->
        <div class="profile block"> <!-- PROFILE (MIDDLE-CONTAINER) -->
             <div class="profile-picture big-profile-picture clear">
                 <img width="120px" height="120px" alt="Anne Hathaway picture" src="${contextPath}/resources/img/profile_ex.jpg" >
             </div>
             <h1 class="user-name"><font size="3">마카롱에 빠진날</font></h1>
             <div class="profile-description">
                 <p class="scnd-font-color"><font size="2">100% 핸드메이드 마카롱 &nbsp;좋은 과일을 보는 안목으로 만든 과일청</font></p>
             </div>
         </div>

           
           
         <fieldset class="ui-field border-row">
        <button type="button" class="btn btn-s btn-white toggle-heart detail-like pseudo-ico-love" data-name="starred-toolbar" data-starred-type="artist" data-init="" data-starred="" data-target-id="b20eee2f-b3eb-4fee-bc81-735f1e2318d6">
            <i class="ico-img">
                <span class="sp-icon icon-heart"></span>
                <span class="sp-icon icon-heart active"></span>
            </i>
            <em class="txt"><i class="ui_icon--heart"></i>스토어 찜하기</em>
        </button>
 		<br>
        <a href="/w/message/b20eee2f-b3eb-4fee-bc81-735f1e2318d6" class="btn btn-s btn-white pseudo-ico-message">
        <i class="ico-img"><span class="sp-icon icon-line-message"></span></i>
        메시지</a>
        <br>
        <button type="button" class="btn btn-m btn-white pseudo-ico-share" data-ui="url-copy" data-ui-option="short" data-icon-event="hover" data-clipboard-text="https://www.idus.com/w/artist/b20eee2f-b3eb-4fee-bc81-735f1e2318d6" data-clipboard-message="작가님 URL이 복사되었습니다.">
        <i class="ico-img"><span class="sp-icon icon-shareproduct"></span></i>
        공유하기<br></button>
    </fieldset>

		<div class="border-row">
	        <nav class="nav-links">
	        <!--  
	                        <a class="active" href="/w/artist/b20eee2f-b3eb-4fee-bc81-735f1e2318d6">
	                <i class="ui_icon--home"></i>
	                <span>홈</span>
	            </a>
	            -->
	            <span>홈<br></span>
	            <span>스토리<br></span>
	            <span>판매 작품<br></span>
	            <span>구매 후기<br></span>
	        </nav>
	    </div>

	 <div class="list-def border-row">
        <strong class="caption">활동정보</strong>
        <dl class="list">
            <dt><font size="2">
                좋아하는 사람</font>
            </dt>
            <dd>
                <a href="/w/artist/b20eee2f-b3eb-4fee-bc81-735f1e2318d6/favorite/list" data-modal-trigger="user-list" data-modal="open" data-type="favorite" data-title="좋아하는 사람"><span id="like-count">597</span><em>명</em></a>
            </dd>
            <dt><font size="2">
                판매중인 작품</font></dt>
            <dd>
                <a href="/w/artist/b20eee2f-b3eb-4fee-bc81-735f1e2318d6/product">11<em>개</em></a>
            </dd>
            <dt><font size="2">
                구매후기</font></dt>
            <dd>
                <a href="/w/artist/b20eee2f-b3eb-4fee-bc81-735f1e2318d6/review">124<em>개</em></a>
            </dd>
        </dl>
    </div>

      </aside>
      <!-- /.col-lg-3 -->

     <div class="col-lg-9">     

 <div class="layout-split half">
	   <section class="cardlist_section">
		 <div class="ui_title--sub">
             <h3 class="ui_title__txt"><font size="2">스토리</font></h3>
         </div>
                <ul class="split-cardlist lines5">
                                                <li class="ui_card--side">

                            <div class="ui_card__inner">
                                                                <div class="ui_card__imgcover">
                                    <a href="/w/story/a2318646-a0ca-4322-ac8b-da222ec885f6" class="ui_card__img" style="background-image: url(https://image.idus.com/image/files/4b1b9b058f5046d99b0ade714ecdc0c4_720.jpg)"></a>
                                </div>
                                                                <div class="ui_card__txtarea ">
                                    <div class="ui_card__info">
                                        <a href="/w/story/a2318646-a0ca-4322-ac8b-da222ec885f6" class="ui_card__title">2019년 10월 17일</a>
                                        <span class="ui_card__para">안녕하세요. 💖마카롱에 빠진날💖입니다. <br>
											<br>
											마카롱, 수제청으로 디저트를 만들기 시작한지 어느덧 <br>
											10여년이 되었네요.^^<br>
											</span>
                                    </div>
                                </div>
                            </div>
                        </li>
                                            </ul>
     </section>

</div>


      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
</body>


</html>
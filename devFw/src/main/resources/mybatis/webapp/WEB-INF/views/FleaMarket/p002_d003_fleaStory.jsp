<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "java.util.*, project.FleaMarket.*"
    isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
 request.setCharacterEncoding("utf-8");
 List list = (List)request.getAttribute("searchList");
 String flea_id = request.getParameter("flea_name");
 String intro_content = request.getParameter("intro_content");
 System.out.println("플리마켓 아이디="+flea_id);
 System.out.println("플리마켓 소개글=" + intro_content);
%>
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
  padding-left: 2px;
  border-bottom: 1px solid #d9d9d9;
}
.wrap{
  width: 30%;
  position: absolute;
  top: 50%;
  left: 40%;
  transform: translate(-50%, -50%);
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
.profile-picture {
 border-radius: 100%;
 overflow: hidden;
 -webkit-box-sizing: content-box;
   -moz-box-sizing: content-box;
   box-sizing: content-box; 
   display: block;
    margin: 0px auto;
   
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
<%--
.user-name {
 margin-left: 50px;
}
--%>
.profile-description .user_name{
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
<%-- 구매후기 왼쪽 --%>
.layout-split.half>*:first-child {
    margin-left: 0;
}
.layout-split.half>* {
    width: 48%;
    margin-left: 4%;
    float: left;
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
.artist-area {
    padding: 32px 16px 16px;
    border: 1px solid #d9d9d9;
    border-top: 0 none;
    padding-bottom: 18px;
    text-align: center;
    width: 250px;
    height: 700px;
}
.user-name {
    margin-top: 16px;
    margin-bottom: 8px;
    display: block;
    width: 100%;
    text-align: center;
    font-size: 16px;
    line-height: 1.5; 
    color: #333;
    word-break: break-word;
}
.row-left{
    display: -webkit-box;
    display: -ms-flexbox;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
    margin-top: 19px;
}
 
.addmember{
	text-align: right;
} 
 
.addmember > a:link{
	color: #513926;
} 
.addmember > a:visited{
	color: #513926;
} 
.addmember > a:hover{
	color: #7F593C;
} 
.center-flea{
	margin:0 300px;
}
.profile-setting{
	margin-top: -5%;
    margin-left: 20%;
}

#img-full{
	width:100%;
}

<%--프로필 수정 팝업--%>
a.selected {
  background-color:#1F75CC;
  color:white;
  z-index:100;
}

.messagepop {
  background-color:#FFFFFF;
  border:1px solid #999999;
  cursor:default;
  display:none;
  margin-top: 10%;
  margin-left: 40%;
  position:absolute;
  text-align:left;
  width:500px;
  z-index:50;
  padding: 25px 25px 20px;
}

label {
  display: block;
  margin-bottom: 3px;
  padding-left: 15px;
  text-indent: -15px;
}

.messagepop p, .messagepop.div {
  border-bottom: 1px solid #EFEFEF;
  margin: 8px 0;
  padding-bottom: 8px;
}

.img_wrap{
	width: 300px;
	margin-top: 50px;
}
.img_wrap img{
	max-width: 100%;
}
 
</style>
<head>
<meta charset="UTF-8">
<title>금도끼은도끼| 플리마켓</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	function deselect(e) {
	  $('.pop').slideFadeToggle(function() {
	    e.removeClass('selected');
	  });    
	}

	$(function() {
	  $('#contact').on('click', function() {
	    if($(this).hasClass('selected')) {
	      deselect($(this));               
	    } else {
	      $(this).addClass('selected');
	      $('.pop').slideFadeToggle();
	    }
	    return false;
	  });

	  $('.close').on('click', function() {
	    deselect($('#contact'));
	    return false;
	  });
	});

	$.fn.slideFadeToggle = function(easing, callback) {
	  return this.animate({ opacity: 'toggle', height: 'toggle' }, 'fast', easing, callback);
	};
	
});
</script>
<script>
	var cnt=1;
	function fn_addFile(){
		$("#d_file").append("<br>"+"<input  type='file' name='file"+cnt+"' />");
		cnt++;
	}
	var m_cnt=1;
	function fn_m_addFile(){
		$("#m_file").append("<br>"+"<input  type='file' name='m_file"+cnt+"' />");
		m_cnt++;
	}
</script>
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
<!-- 
<table border='1' width='800' align='center'>
   <tr align='center' bgcolor='#FFFF66'> 
     <td>플리마켓 코드</td>
     <td>멤버아이디</td>
     <td>플리마켓이름</td>
     <td >소개글</td>
     <td>좋아요 수</td>
     <td>프로필 사진</td>
     <td>메인 사진</td>
     <td>플리 그룹</td>
</tr>
  <c:forEach var="flea" items="${searchList}" > 
  <c:url var="url"  value="searchMod.do"  >
    <c:param  name="p_mod_id" value="${member.id}" />
  </c:url>     
     <tr align=center>
       <td>${flea.flea_code}</td>
       <td>${flea.memberid}</td>
       <td>${flea.flea_name}</td>
       <td>${flea.intro_cotent}</td>
       <td>${flea.flea_like_count}</td>
       <td>${flea.profile_photo}</td>
       <td>${flea.main_photo}</td>
       <td>${flea.flea_group}</td>
     </tr>
  </c:forEach>
</table>
 -->

<!-- Page Content -->
  
  
<!-- 프로필 수정 팝업창 -->
 <div class="messagepop pop">
 	<h2>프로필 설정</h2>
    <form method="post" id="new_message" action="/devFw/fleaProfileEdit.do" enctype="multipart/form-data">
        <p><label for="flea_name">플리마켓 스토어명&nbsp;</label><input type="text" size="30" name="flea_name" id="flea_name" /></p>
        <p><label for="intro_cotent">소개글</label><br><textarea rows="6" name="intro_cotent" id="intro_cotent" cols="35"></textarea></p>
 		
 		<p><label for="profile_photo">프로필 이미지</label><br>
        	<!--  <input type="file" id="profile_photo" name="profile_photo">
        	<input type="submit" value="사진 업로드"></p>-->
        	<input type="button" value="이미지 파일 추가" onClick="fn_addFile()" /><br>
        </p>
        	<div id="d_file">
        	</div>
        	
        <p><label for="profile_photo">메인 이미지</label><br>
        	<!--  <input type="file" id="profile_photo" name="profile_photo">
        	<input type="submit" value="사진 업로드"></p>-->
        	<input type="button" value="이미지 파일 추가" onClick="fn_m_addFile()" /><br>
        </p>
        	<div id="m_file">
        	</div>
        	
        <p><input type="submit" value="확인" name="commit" id="message_submit"/><a class="close" href="/">Cancel</a></p>
    </form>
    

</div>

  
 	<div class="center-flea">
     <div class="row-left">
      <aside class="artist-area">
        <div class="user-info card-style-profile "> <!-- PROFILE (MIDDLE-CONTAINER) -->
   
		             <p class="addmember"><a target="_blank" href="/devFw/FleaMarket/P001/D001/JoinForm.do?id=1"><i class="fas fa-user-plus pa-5x"></i></a></p>
		                <c:forEach var="flea" items="${searchList}" > 
		               		<c:out value="${flea.profile_photo}"/>
		              
				             <div class="profile-picture big-profile-picture clear">
				                 <img width="120px" height="120px" alt="Anne Hathaway picture" src= "${contextPath}/resources/img/profile_ex.jpg" >
				             <!-- 
				              <img width="120px" height="120px" alt="Anne Hathaway picture" src= "<c:url value="/img/${file.profile_photo }" />" >
				             -->
				             </div>
				             
				             <!-- 프로필 수정 아이콘 버튼-->
				             <div class="profile-setting">
				             	<a href="#" id="contact">
				                 <i class="fa fa-cog pa-5x"></i>
				                 </a>
				             </div>
				            
				             
				              <div class="user-name"><font size="3">
				            
				               <c:out value="${flea.flea_name}"/>
				              
				              </font></div>
				              
				              <div class="profile-description"><font size="2">
				           
				               <c:out value="${flea.intro_cotent}"/>
							</font></div>
				          </c:forEach>
		             

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
        <i class="fa fa-envelope"></i>&nbsp;메세지</a>
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
            
            
                <a href="/w/artist/b20eee2f-b3eb-4fee-bc81-735f1e2318d6/favorite/list" data-modal-trigger="user-list" data-modal="open" data-type="favorite" data-title="좋아하는 사람"><span id="like-count">
                  <c:forEach var="flea" items="${searchList}" > 
               <c:out value="${flea.flea_like_count}"/>
               </c:forEach>
                 </span><em>명</em>
                </a>
            </dd>
            <dt><font size="2">
                판매중인 작품</font></dt>
            <dd>
                <a href="/w/artist/b20eee2f-b3eb-4fee-bc81-735f1e2318d6/product">11<em>개</em></a>
            </dd>
            <dt><font size="2"><a href="/devFw/fleaReview.do">구매후기</a></font></dt>
            <dd>
                <a href="/w/artist/b20eee2f-b3eb-4fee-bc81-735f1e2318d6/review">124<em>개</em></a>
            </dd>
        </dl>
    </div>
      </aside>
      <!-- /.col-lg-3 -->
     <div class="col-lg-9">

<!--스토리  -->
 <div class="layout-split half">
     <section class="cardlist_section">
   <div class="ui_title--sub">
             <h3 class="ui_title__txt"><font size="2"><a href="/devFw/fleaStory.do">스토리</a></font></h3>
         </div>
                <ul class="split-cardlist lines5">
                                                <li class="ui_card--side">
                            <div class="ui_card__inner">
                                                                <div class="ui_card__imgcover">
                                    <a href="/w/story/a2318646-a0ca-4322-ac8b-da222ec885f6" class="ui_card__img" style="background-image: url(https://image.idus.com/image/files/4b1b9b058f5046d99b0ade714ecdc0c4_720.jpg)"></a>
                                </div>
                                                                <div class="ui_card__txtarea ">
                                    <div class="ui_card__info">
                                        <a href="${contextPath}/FleaMarket/P002/D003/searchList.do" class="ui_card__title">2019년 10월 17일</a>
                                        <span class="ui_card__para">안녕하세요. ??마카롱에 빠진날??입니다. <br>
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
    </div>
    <!-- /.row -->

  <!-- /.container -->
  <!-- Footer 
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
  </footer>
-->
  <!-- Bootstrap core JavaScript -->
  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
 <script src="https://kit.fontawesome.com/af7787acb6.js" crossorigin="anonymous"></script>

</body>

</html> 
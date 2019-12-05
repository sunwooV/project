<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
request.setCharacterEncoding("utf-8");
String flea_code = request.getParameter("flea_code");
System.out.println(":::::flea_code" + flea_code);
%>

<!DOCTYPE html>
<html>
<style>
.center-flea{
	margin:0 500px;
	max-width: 60%;
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
.artist-area {
    padding: 15px 16px 16px;
    border: 1px solid #d9d9d9;
    border-top: 0 none;
    padding-bottom: 18px;
    text-align: center;
    width: 213px;
    height: 700px;
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
.profile-setting{
	margin-top: -5%;
    margin-left: 20%;
}
#img-full{
	width: 1000px;
	height: 300px;
}
.carousel{
	padding-left: 10px;
}

.profile-description .user_name{
 text-align: center;
}

.profile-description{
	font-size: 12px;
}

.border-row:before {
    content: '';
    display: block;
    width: 100%;
    height: 16px;
    border-top: 1px solid #d9d9d9;
    margin-top: 16px;
}

.artist-area .nav-links {
    border: 2px solid #555;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    padding: 16px;
    font-size: 12px;
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

<%--프로필 수정 팝업--%>
a.selected {
  background-color:#1F75CC;
  color:white;
  z-index:100;
}

a.selected2 {
  background-color:#1F75CC;
  color:white;
  z-index:100;
}

.messagepop {
    border: 1px solid #999999;
    cursor: default;
    display: none;
    position: absolute;
    text-align: left;
    width: 50%;
    z-index: 50;
    background: #fff;
    padding: 25px 25px 20px;
    margin: 100px auto;
    margin-left: 25%;
  
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
#sale_price {
    color: #BDBDBD;
    font-size: medium;
    text-decoration: line-through;
}



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
  width: 200%;
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
.cardlist_section .split-cardlist .ui_card--side {
    width: 100%;
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
.cardlist_section .split-cardlist .ui_card--side {
    width: 100%;
}

.list-def{
	font-size: 12px;
}

/*pop-header*/
#pop-header{
	width:100%;
	height:50px;
	text-align:center;
	vertical-align:middle;
	/*
	border-bottom : 1px solid #C1CEF3;
	*/
}

#pop-header>div{
	display:inline-block;
	width:initial;
	font-family : nanumEB;
	font-size:1.5em;	
}

 /*pop-up*/
#user-add{
  background: rgba(0, 0, 0, 0.3);
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
  display:none;
  z-index:150;
}

#pop-up{
  margin: 100px auto;
  padding:20px;
  background: #fff;
  border-radius: 5px;
  width: 50%;
  position: relative;
}

 /*chat-header*/
  #chat-header{
     justify-content : space-between;
     align-items:center;   
  }
#chat-header>i{
	width:initial;
	height:initial;
	margin-right:15px;
	color:#8da5ee;
	border-radius:50%;
}

#chat-header>i:hover{
	color:#6780cc;	
}
	
#pop-close {
   float: right;
   font-size: 30px;
   font-weight: bold;
   text-decoration: none;
   color: #333;
}

#pop-search>input[type=text] {
    padding: 5px;
    width: 70%;
    height: 30px;
    border: none;
    background-color: rgba(100, 100, 100, 0.1);
    border-radius: 5px;
}

#pop-search>input[type=button] {
    width: 50px;
    margin-left: 10px;
    border-radius: 20px;
    border: none;
    background-color: #B9C9F8;
}

#pop-search>input[type=button]:hover,#pop-footer>input:hover{
		background-color:#8da5ee;	
	}	

#pop-search {
    display: flex;
    width: 100%;
    justify-content: center;
    padding-bottom: 10px;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

#pop-footer {
    display: flex;
    flex-flow: row-reverse;
    margin-top: 10px;
}

#pop-footer>input {
    border: none;
    width: 20%;
    height: 35px;
    border-radius: 5px;
    background-color: #B9C9F8;
}

.card-style.story .bordering {
    border: 1px solid #d9d9d9;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    padding: 12px;
    -webkit-transition: border-color 0.3s ease;
    -o-transition: border-color 0.3s ease;
    -moz-transition: border-color 0.3s ease;
    transition: border-color 0.3s ease;
    -webkit-box-shadow: 0 1px 3px 0 rgba(220,220,220,0.3);
    -moz-box-shadow: 0 1px 3px 0 rgba(220,220,220,0.3);
    box-shadow: 0 1px 3px 0 rgba(220,220,220,0.3);
}

.card-style .area-rating {
    overflow: hidden;
    padding-bottom: 16px;
    margin-bottom: 16px !important;
    border-bottom: 1px solid #d9d9d9;
}

.masonry-grid .card-style.story .desc {
    display: block;
    height: auto;
    overflow: hidden;
    -o-text-overflow: initial;
    text-overflow: initial;
    max-height: 170px;
}

.deal_buy_review{
    position: relative;
    padding: 30px 0 30px 58px;
    border: 1px solid #ddd;
    background-color: #f9f9f9;
}

.first-part{
   width: 200%;
}

.review_btn_area {
    width: 160px;
    position: absolute;
    top: 50%;
    right: 45px;
    margin-top: -25px;
    font-size: 16px;
    padding: 0 24px;
    line-height: 46px;
    border-color: transparent;
    background: #e55;;
    color: #fff;
    border-radius: 3px;
    text-align: center;
}

.btns_sys.red_big_d {
    background-position: 100% -729px;
    line-height: 48px;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
}

.rv_count {
    display: inline-block;
    margin: 4px 0 0 5px;
    font-size: 14px;
    line-height: 17px;
    color: #999;
    font-family: tahoma;
    vertical-align: top;
}

.list_type>li {
    position: relative;
    padding-left: 6px;
    color: #999;
}

.desc_cont .title_area.clear .total-sort span {
    cursor: pointer;
}

.title_area .sort {
    float: right;
}

.desc_cont .title_area.clear .sort .selbox_comm {
    width: 86px;
}
.selbox_comm.v2 {
    height: 30px;
    padding: 4px 12px 0px 14px;
}
.selbox_comm {
    float: left;
    position: relative;
    z-index: 10;
    width: auto;
    height: 36px;
    padding: 0 12px 0 8px;
    border: 1px solid #ddd;
    background-color: #fff;
}

}
.desc_cont .title_area.clear {
    min-height: 32px;
    margin-bottom: 15px;
}

.content_main .selbox_comm.on .btn_option:after, .ui-dialog .selbox_comm.on .btn_option:after {
    background-position: -190px -139px;
}

.selbox_comm.v2 .list_option a {
    line-height: 19px;
    padding-top: 2px;
}
.selbox_comm .list_option a {
    display: block;
    line-height: 34px;
    padding-top: 2px;
    color: #666;
    text-decoration: none;
    text-indent: 0px;
}


</style>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <title>금도끼은도끼| 플리마켓</title>
 
   <!-- Bootstrap core CSS -->
  <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
  <!-- Custom styles for this template -->
  <link href="${contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- 별점 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
    <link rel="stylesheet" href="/stylesheets/style.css" integrity="sha256-OlSbjYBfrJGGd2zbT3qCsAZsPGxRwKOSGjqqfjF8aiY= sha512-1aDUINxj8c9UXJ76eIMAkG2/ofIjG8FBW4drgHUglwY/rGn+YWUtm8iSkrpAOtwZ9b9LEva02KPrTDx3M5ib3w==" crossorigin="anonymous">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
  
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca839997c3bd98863fdc033319b76889&libraries=services"></script>
<!-- Jquery Rate Picker-->
<script type="text/javascript" src="${contextPath}/resources/js/jquery-rate-picker.js"></script>
<script>
$(document).ready(function(){
	$("#chat-header>i").on("click",addMember);
	
	function addMember(){
		$('#user-add').fadeIn();
	}
	
	//팝업 이벤트
    $("#chat-header>i").on("click",showPopup);
	$("#pop-close").on("click",closePopup);	 
	
	//팝업 검색
	$("#pop-search>input[type=text]").on("keydown",function(event){
		if(event.keyCode==13){
			popSearch();
		}
	});		
	$("#pop-search>input[type=button]").on("click",function(){
		alert("aa");
		popSearch();
	});
	
	function popSearch(/*웹소켓 객체*/){
		alert("확인;;;");
		$('#pop-footer>input').prop('disabled',false);
		var input=$('#pop-search>input[type=text]').toArray()[0];
		//입력값으로 select날려서 결과받아 뿌리기
		var contents={
			keyword : $(input).val()
		}
		sendText(ws,"search_member",contents);
	}
	
	function showPopup(){
		$('#pop-list').empty();
		$('#user-add').css('display','block');
		$('#pop-footer>input').prop('disabled',true);		
	}
	
	function closePopup(){
		$('#user-add').css('display','none');
	}
	
	function filter(){
		alert("타는지 확인");
        var value, name, item, i;

        value = document.getElementById("value").value.toUpperCase();
        item = document.getElementsByClassName("item");

        for(i=0;i<item.length;i++){
          name = item[i].getElementsByClassName("name");
          if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
            item[i].style.display = "flex";
          }else{
            item[i].style.display = "none";
          }
        }
      }
	
	
	
	
	function deselect(e) {
	  $('.pop').slideFadeToggle(function() {
	    e.removeClass('selected');
	  });    
	}
	
	function deselect2(e) {
		  $('.pop2').slideFadeToggle(function() {
		    e.removeClass('selected2');
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
	
	$(function() {
		  $('#participants_add').on('click', function() {
		    if($(this).hasClass('selected2')) {
		      deselect2($(this));               
		    } else {
		      $(this).addClass('selected2');
		      $('.pop2').slideFadeToggle();
		    }
		    return false;
		  });

		  $('.close2').on('click', function() {
		    deselect2($('#participants_add'));
		    return false;
		  });
		});

	$.fn.slideFadeToggle = function(easing, callback) {
	  return this.animate({ opacity: 'toggle', height: 'toggle' }, 'fast', easing, callback);
	};
	
	$(".selbox_comm").click(function(){
		alert("ssss");
		$(".selbox_comm").attr('class', 'selbox_comm v2 on ');
	});
	
});
</script>
<script>
$.ratePicker("#rating-2", {
    rate : function (stars){
        alert('Sample 3\'s Rate is ' + stars);
    }
});
</script>

</head>

<body>


<!-- 프로필 수정 팝업창 -->
 <div class="messagepop pop2">
 	<h2>참여자 추가</h2>
    <form method="post" id="new_message" action="/devFw/participantsInsert.do" enctype="multipart/form-data">    
        <p><label for="flea_name">회원 검색&nbsp;</label><input type="text" size="30" name="memberid" id="memberid" /></p>
        <p><input type="submit" value="확인" name="commit" id="message_submit"/><a class="close" href="/">Cancel</a></p>
        <c:forEach var="flea" items="${searchList}" > 
        	<input type="hidden" name="flea_code" value="${flea.flea_code}">
        </c:forEach>
    </form>
    

</div>


<div class="center-flea">
     <div class="row-left">
      <aside class="artist-area">
        <div class="user-info card-style-profile "> <!-- PROFILE (MIDDLE-CONTAINER) -->
   	<!--  
   	<p><a href="/devFw/fleaCreateStoreApproval.do">플리마켓 관리자(임시)</a></p>
   	-->
   	<p><a href="/devFw/fleaSearchInit.do">플리마켓 마이페이지(임시)</a></p>
					 
		             <p class="addmember"><a target="_blank" href="#" id="participants_add"><i class="fa fa-user-plus pa-5x"></i></a></p>
		            <!-- 
		            <div id="chat-header">
						<div id="user-info"></div>
						<i class="fa fa-user-plus pa-5x"></i>
			         </div>
		             -->
		            <c:forEach var="flea" items="${searchList}" > 
				             <div class="profile-picture big-profile-picture clear">
				                 <img width="120px" height="120px" alt="no picture" src="${flea.profile_photo}" />
					             <!-- 
					              <img width="120px" height="120px" alt="Anne Hathaway picture" src= "<c:url value="/img/${file.profile_photo }" />" >
					             -->
				             </div>
				             
				             <!-- 프로필 수정 아이콘 버튼-->
				             <div class="profile-setting">
				             	<a href="" id="contact" onclick="window.open('./editProfile.do?flea_code=${flea.flea_code}', 'window팝업', 'width=520, height=620, menubar=no, status=no, toolbar=no')">
				                 <i class="fa fa-cog pa-5x"></i>
				                </a>
				             </div>
				   
				              <div class="user-name"><font size="3">
				                 <c:out value="${flea.flea_name}"/>
				              </font></div>
				              
				              <div class="profile-description">
				                 <c:out value="${flea.intro_cotent}"/>
							  </div>
				   </c:forEach>
	               
         </div> 
             <fieldset class="ui-field border-row">
                <div id="chat-header">
					<div id="user-info"></div>
					<i class="fa fa-user-plus pa-5x">참가 신청</i>
		         </div>
		       
              <div id="chat-header">
               <div id="user-info"></div>
       			 <button type="button" class="btn btn-m btn-white pseudo-ico-share" data-ui="url-copy" data-ui-option="short" data-icon-event="hover" data-clipboard-text="#">
			     	<i class="fa fa-user-plus pa-5x"></i>참가 신청<br>
			     </button>  
			     
		      </div>

       			 <button type="button" class="btn btn-s btn-white toggle-heart detail-like pseudo-ico-love" data-name="starred-toolbar" data-starred-type="artist" data-init="" data-starred="" data-target-id="b20eee2f-b3eb-4fee-bc81-735f1e2318d6">
	             <i class="ico-img">
	                <span class="sp-icon icon-heart"></span>
	                <span class="sp-icon icon-heart active"></span>
	             </i>
                 <em class="txt"><i class="fa fa-heart"></i>스토어 찜하기</em>
                 </button><br>
              
		        <a href="#" class="btn btn-s btn-white pseudo-ico-message">
		        <i class="fa fa-envelope"></i>&nbsp;메세지</a><br>
		      	<button type="button" class="btn btn-m btn-white pseudo-ico-share" data-ui="url-copy" data-ui-option="short" data-icon-event="hover" data-clipboard-text="#">
			    <i class="fa fa-share-alt"></i>
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
	             <span><i class="fa fa-home pa-5x"></i>홈<br></span>
	             <span><i class="fa fa-book pa-5x"></i>스토리<br></span>
	             <span><i class="fas fa-store"></i>판매 작품<br></span>
	             <span><i class="fa fa-edit pa-5x"></i>구매 후기<br></span>
		         </nav>
		     </div>
		     
		   <div class="list-def border-row">
		        <!--  
		        <strong class="caption"><font size="3">활동정보</font></strong>
		        -->
		        <dl class="list">
		            <dt>좋아하는 사람</dt>
		            <dd>
		                <a href="#t" data-modal-trigger="user-list" data-modal="open" data-type="favorite" data-title="좋아하는 사람"><span id="like-count">
		                 <!--  
		                  <c:forEach var="flea" items="${searchList}" > 
		              		 <c:out value="${flea.flea_like_count}"/>
		               	  </c:forEach>
		               	  -->
		                  </span><em>명</em>
		                </a>
		            </dd>
		            <dt>판매중인 작품</dt>
		            <dd>
		                <a href="#">11<em>개</em></a>
		            </dd>
		            <dt><a href="/devFw/fleaReview.do">구매후기</a></dt>
		            <dd>
		                <a href="#">124<em>개</em></a>
		            </dd>
       		  </dl>
       		</div>
       		<br><br><br><br><br><br><br><br>
       		
   		   
   		   
    	<br><br><br><br>
  	</aside>  
	
	<!--  
	  <section class="cardlist_section" style="margin: 24px;">
   		 <div class="ui_title--sub">
             <h3 class="ui_title__txt" style="font-size: 26px;"><a href="/devFw/fleaReview.do">구매후기</a></h3>
         </div>
         <ul class="split-cardlist">
            <li class="ui_grid__item">
            <div class="ui_card--side">
                <div class="ui_card__inner">
                    <div class="ui_card__imgcover">
                        <a href="${contextPath}/FleaMarket/P002/D002/searchList.do" class="ui_card__img" aria-label="수제마카롱 30여종" target="_blank" style="background-image: url(https://image.idus.com/image/files/7c7e4972cbdc49b0a43cdb03973786e4_512.png)"></a>
                    </div>
                    <div class="ui_card__txtarea">
                        <div class="ui_card__info">
                            <a href="${contextPath}/FleaMarket/P002/D002/searchList.do" aria-label="수제마카롱 30여종" target="_blank" class="ui_card__title">수제마카롱 30여종</a>
                            <span class="ui_card__para">
                               	 포장이 너무 잘되어서 오고 너무 맛있어용??                            
                            </span>
                        </div>
                        <div class="ui_card__rating">
                            <div class="ui_card__vcenter">
                                <div class="ui_rating" data-ui="rating" data-value="5">
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <i class="ui_icon--star-fill" data-state="active"></i>
                                    <span>&nbsp;| 김연주</span>
                                </div>
                            </div>
                            <input name="paging_param" type="hidden" value="1571719189000">
                        </div>
                    </div>
                </div>
            </div>
        </li> 
      </ul>
    </section>
  </div>
  </div>
  -->
   <div class="cardlist_section" style="margin: 24px; width:50%; ">
   		 <div class="ui_title--sub">
             <h3 class="ui_title__txt"><a href="/devFw/fleaReview.do">구매후기</a>
                <span class="rv_count" data-review="count">
					(<em class="num">10</em>)
				</span>
             
             </h3>
          
         </div>
         
   <div class="first-part">      
         <div class="deal_buy_review" data-review="starInfo">  <div class="review_rating_box notxt">
		    <div class="average">
		      <div class="prev" style="font-size : 26px;">
			    <!-- 
			    <div class="star_rating">
                    <i class="fa fa-star" class="on" data-state="active"></i>
                    <i class="fa fa-star" class="on" data-state="active"></i>
                    <i class="fa fa-star" class="on" data-state="active"></i>
                    <i class="fa fa-star" class="on" data-state="active"></i>
                    <i class="fa fa-star" class="on" data-state="active"></i>
               	 </div>
               	 -->
               	 <c:forEach var="review" items="${reviewList}" > 
	               	 <span id="rating-1" style="cursor: pointer;" data-stars="4">
	               	 	<input name="rating-1" type="hidden" value="${review.review_score}">
	               	 	 	<c:forEach var="i" begin="1" end="${review.review_score}">
	               	 	 		<i class="fa fa-star" style="color: rgb(241, 196, 15);"></i>
	               	 		</c:forEach>
	               	 		<c:forEach var="i" begin="${review.review_score}" end="4">
	               	 			<i class="fa fa-star" style="color: rgb(236, 240, 241);"></i>
	               	 		</c:forEach>
	               	 </span>
          		</c:forEach>
               	

		        <strong class="grade">4.6</strong>
		        <span class="rv_num" style="font-size : 13px;">(총 <em>10</em> 건 구매후기 기준)</span>
		      </div>
		    </div>
		    <div class="review_btn_area ">
		      <a href="#" class="btns_sys red_big_d review_write"><span>구매후기 작성</span></a>
		    </div>
		  </div>
		</div>
		<ul class="list_type">
		    <li>구매후기는 구매완료 후 마이페이지 &gt; 주문배송조회에서 작성하실 수 있습니다.</li>
		</ul>
    </div>
    
    <br>
    
   <div class="title_area clear" data-review="sort" style="display: block; width: 200%;">
              <div class="total-sort">
                <span class="active" data-outputtype="1">전체</span><i style="display: inline-block;">|</i>
                <span data-outputtype="2" style="display: inline-block;">포토<em data-review="photoCount">(8)</em></span>
             
	              <!-- 정렬(베스트순/최신순) -->
	              <select id="selectSort" name="selectSort" style="float: right;">
					<option value="">--베스트순--</option>
					<option value="베스트순" selected="selected">베스트순</option>
					<option value="최신순" id="newest">최신순</option>
				  </select>
			  </div>
   </div>
     <br>
         
  	<!-- 
            <div class="ui_title hide-m">
                <h2 class="ui_title__txt">구매후기</h2>
            </div> -->
 <c:forEach var="review" items="${reviewList}" > 
   <ul class="masonry-grid x2" data-col="2" style="position: relative; height: 2221.64px;">
           <li class="card-style story" style="position: absolute; left: 0px; top: 0px;">
            <div class="bordering">

                <input name="time_stamp" type="hidden" value="1575262761000">
                <div class="area-txt">
                    <div class="area-rating">
                        <div class="img-bg" style="background-image: url(https://image.idus.com/image/files/d6c74ae706ad40f1b6f83af3d5b1334d_512.jpg)"></div>
                        <a href="#" class="title ellipsis">크리스마스강추🔥눈꽃송이귀걸이/귀찌</a>
                        <div class="ui_rating" data-ui="rating" data-value="5">
                            <i class="ui_icon--star-fill" data-state="active"></i>
                            <i class="ui_icon--star-fill" data-state="active"></i>
                            <i class="ui_icon--star-fill" data-state="active"></i>
                            <i class="ui_icon--star-fill" data-state="active"></i>
                            <i class="ui_icon--star-fill" data-state="active"></i>
                        </div>
                    </div>
 <c:forEach var="review" items="${reviewList}" > 
                    <a href="#" target="_blank">
                        <div class="split-hard">
                            <span class="split crop-circ" style="background-image: url(https://image.idus.com/image/files/37cec8c9f8bd47458facc5bdacfb0b24.jpg)"> </span>
                            <div class="split">
                            
                            	
					               	 <span id="rating-1" style="cursor: pointer;" data-stars="4">
					               	 	<input name="rating-1" type="hidden" value="${review.review_score}">
					               	 	 	<c:forEach var="i" begin="1" end="${review.review_score}">
					               	 	 		<i class="fa fa-star" style="color: rgb(241, 196, 15);"></i>
					               	 		</c:forEach>
					               	 		<c:forEach var="i" begin="${review.review_score}" end="4">
					               	 			<i class="fa fa-star" style="color: rgb(236, 240, 241);"></i>
					               	 		</c:forEach>
					               	 </span>
				          		
                            	
                                <span class="txt-strong">뽀또</span>
                                <span class="txt">2019년 12월 02일</span>
                            </div>
                        </div>
                        
                        <p class="desc">실제로 받아 보니까 더 예뻤어요!
							진주 눈꽃송이 등의 조합이라서 옷차림도 안 타고 웬만한 코디에 다 잘어울릴거 같아요ㅎㅎ
							귀찌 변경했는데 잘 착용하고 있어요!♡
							321은 배송도 빠르게 해주시고 귀찌 가능제품들도 많아서 졸아요 ㅠ_ㅠ 사장님의 친절함은 말모..! 감사합니다 💛
						</p>
                        
                        <img src="${review.review_photo}" style="width: 200px; height: 200px; " alt="...">
                        
                        <br>
                 

                   </a>
                  </c:forEach>
                   
                </div>

            </div>
        </li>
     </ul>
</c:forEach>
    </div>
  </div>
  </div>


  
</body>
</html>
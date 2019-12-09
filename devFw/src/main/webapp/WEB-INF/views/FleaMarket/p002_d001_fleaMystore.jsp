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

.ui_card__img {
    position: relative;
    display: block;
    width: 85%;
    height: auto;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: 50%;
    transition: transform .5s ease-in-out;
}
.ui_card__img, .ui_card__imgcover {
    overflow: hidden;
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
.ui_card--side .ui_card__imgcover {
    width: 40%;
}
.ui_card--side .ui_card__inner>* {
    display: table-cell;
    vertical-align: top;
}
.ui_card__img, .ui_card__imgcover {
    overflow: hidden;
}
.cardlist_section .split-cardlist .ui_card--side {
    width: 100%;
}
.ui_grid__item{
	width: 500px;
	margin-bottom: 12px;
	cursor: pointer;
	float: left;
    margin-right: 50px;
}
.ui_card__txtarea{
	padding: 15px;
}

.ui_card__inner{
	height: 135px;
	width: 390px;
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
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca839997c3bd98863fdc033319b76889&libraries=services"></script>
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
		        <c:forEach var="flea" items="${searchList}" > 
		        <dl class="list">
		            <dt>좋아하는 사람</dt>
		            <dd>
		                <a href="#t" data-modal-trigger="user-list" data-modal="open" data-type="favorite" data-title="좋아하는 사람"><span id="like-count">
		                  
		              		 <c:out value="${flea.flea_like_count}"/>
		               	 
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
       		    </c:forEach>
       		</div>
       		<br><br><br><br><br><br><br><br>
       		
   		   
   		   
    	<br><br><br><br>
  	</aside>  
		     
	<!-- /.col-lg-3 -->
     <div class="col-lg-9">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
        <!-- 
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
           -->
          <div class="carousel-inner" role="listbox">
          <!--  
           <c:forEach var="flea" items="${searchList}" > 
            <div class="carousel-item active">
              <img class="d-block img-fluid" id="img-full" src="${flea.main_photo}" alt="First slide">
            </div>
           </c:forEach>
           -->
           <!--  
            <div class="carousel-item">
              <img class="d-block img-fluid" id="img-full" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" id="img-full" src="http://placehold.it/900x350" alt="Third slide">
            </div>
          </div>
          -->
          <!--  
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
          -->
        </div>	     
		
  <!-- 플리마켓 맵 
   	<div class="fleaMap">
    	<a href="/devFw/fleaMap.do" id="fleaMap">
       	   <i class="fa fa-map-marker-alt pa-5x">오프라인 맵<br></i>
        </a>
    </div>
    -->
     <div class="ui_title__txt"><font size="2"><a href="#">오프라인 플리마켓 정보</a></font></div>
 	 <!-- 플리 맵 추가 -->
     <div id="map" style="width:100%;height:250px;"></div>
	   
	  	   
  	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		<c:forEach var="addressList" items="${searchList}">
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${addressList.join_offline_location}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">일자:  <c:out value="${addressList.join_offline_date}"/><br>시간: <i class="fas fa-clock"></i><c:out value="${addressList.join_offline_time}"/><br><i class="fas fa-map-marker-alt"></i>장소: <c:out value="${addressList.join_offline_location}"/><br></div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});   
		</c:forEach>
	</script>
		
		<br>
  <div class="ui_title__txt"><font size="2"><a href="/devFw/fleaProduct.do?flea_code=<%=flea_code%>">판매 상품</a></font></div>
        <div class="row">
         <c:forEach var="newProduct" items="${newProduct}">
          <c:if test="${newProduct.flea_yn == 'y' }">
          <div class="col-lg-4 col-md-6 mb-4">
          
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="${newProduct.represent_image }" alt="..." onclick="location.href='./detail.do?prod_number=${newProduct.prod_number }'"></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#"><font size="3">${newProduct.prod_title }
	                  <c:if test="${newProduct.sale_percent != null }">
						[${newProduct.sale_percent }%]
				 	  </c:if>
                  </font></a>
                </h4>
                <h5>
                	<c:if test="${newProduct.sale_percent != null }">
						<p>
							<span id="p"><fmt:formatNumber
									value="${newProduct.prod_price * (1-(newProduct.sale_percent*0.01)) }"
									type="number" />원</span> <span id="sale_price"
								style="margin-bottom: 1re;"><fmt:formatNumber
									value="${newProduct.prod_price }" type="number" />원</span>
						</p>
					</c:if>
					<c:if test="${newProduct.sale_percent == null }">
						<p id="p">
							<fmt:formatNumber value="${newProduct.prod_price }"
								type="number" />
							원
						</p>
					</c:if>
                </h5>
                <!-- 상품 간략 설명 -->
                <p class="card-text"><font size="2"><br></font></p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
           </c:if>
         </c:forEach>
	<br>
	 <div class="layout-split half" style="margin-left: 15px;">
	  <section class="cardlist_section">
   		 <div class="ui_title--sub">
             <h3 class="ui_title__txt"><font size="2"><a href="/devFw/fleaReview.do?flea_code=${flea.flea_code}">구매후기</a></font></h3>
         </div>
         <ul class="split-cardlist">
           <c:forEach var="bestStore" items="${searchList}">
				<li class="ui_grid__item" style="width: 400px;">
		            <div class="ui_card--side">
		                <div class="ui_card__inner">
		                    <div class="ui_card__imgcover">
		                    	<img src="${bestStore.profile_photo}" class="ui_card__img"
									style="width: 230; height: 240; " alt="..." onclick="location.href='./fleaMystore.do?flea_code=${bestStore.flea_code }'">
		                       <!--  <a href="#" class="ui_card__img" target="_blank" style="background-image: url('${bestStore.profile_photo}')">-->
		                    </div>
		
		                    <div class="ui_card__txtarea">
		                        <div class="ui_card__info">
		                            <a href="#" target="_blank" class="ui_card__title">${bestStore.flea_name }</a>
		                            <br>
		                            <span class="ui_card__para">
		                            	${bestStore.intro_cotent }
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
		                                    <span>&nbsp;| ${bestStore.memberid }</span>
		                                </div>
		                            </div>
		                            <input name="paging_param" type="hidden" value="1574744451000">
		                        </div>
		                       
		                        
		                    </div>
		                </div>
		            </div>
		        </li>
	</c:forEach>	      
        </ul>
       
     </section>
     
     <section class="cardlist_section">
        <c:forEach var="story" items="${storyList}" > 
	  		<div class="ui_title--sub">
	             <h3 class="ui_title__txt"><font size="2"><a href="/devFw/fleaStory.do?flea_code=${flea.flea_code}">스토리</a></font></h3>
	         </div>
	                <ul class="split-cardlist lines5">
	                        <li class="ui_card--side">
	                            <div class="ui_card__inner">
	                                                                <div class="ui_card__imgcover">
	                                    <a href="#" class="ui_card__img" style="background-image: url(https://image.idus.com/image/files/4b1b9b058f5046d99b0ade714ecdc0c4_720.jpg)"></a>
	                                </div>
	                                                                <div class="ui_card__txtarea ">
	                                    <div class="ui_card__info">
	                                        <a href="${contextPath}/FleaMarket/P002/D003/searchList.do" class="ui_card__title">${story.story_title }</a>
	                                        <span class="ui_card__para">${story.story_cotent }</span>
	       									   
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	         		</ul>
	    </c:forEach>
     </section>

</div>

      </div>
      <!-- /.col-lg-9 -->
    </div>
    </div>
    <!-- /.row -->
       
  </div>

</div>

<div id="user-add">
		<div id="pop-up">
		  <form method="post" id="new_message" action="/devFw/participantsInsert.do" enctype="multipart/form-data">    
			<div id="pop-header">
				<div>참여자 신청</div>
				<a id="pop-close">&times;</a>			
			</div>
			<div id="pop-search">
				<input onkeyup="filter()" type="text" placeholder="새로운 유저 검색"/>
				<input type="submit" id="value" value="검색">
			</div>
			<div id="pop-list"></div>
			<div id="pop-footer">
				<input type="button" value="선택">			
			</div>
		   <c:forEach var="flea" items="${searchList}" > 
       	     <input type="hidden" name="flea_code" value="${flea.flea_code}">
       	   </c:forEach>
		  </form>
		</div>
	</div>
	
<script type="text/javascript">
      function filter(){
        var value, name, item, i;
        var addressArray = [];
        
        
        
        /*
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
        */
      }
</script>
         
</body>
</html>
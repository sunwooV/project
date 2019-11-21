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
    padding: 32px 16px 16px;
    border: 1px solid #d9d9d9;
    border-top: 0 none;
    padding-bottom: 18px;
    text-align: center;
    width: 250px;
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
  background-color:#FFFFFF;
  border:1px solid #999999;
  cursor:default;
  display:none;
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
<script>
$(document).ready(function(){
	
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
<script>
	var cnt=1;
	function fn_addFile(){
		$("#d_file").append("<br>"+"<input  type='file' name='file"+cnt+"' />");
		//cnt++;
	}
	var m_cnt=1;
	function fn_m_addFile(){
		$("#m_file").append("<br>"+"<input  type='file' name='m_file"+cnt+"' />");
		//m_cnt++;
	}
</script>
</head>

<body>

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
        <input type="hidden" id="flea_code" name="flea_code" value="<%=flea_code %>">
    </form> 
    

</div>

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
   	
   	<p><a href="/devFw/fleaCreateStoreApproval.do">플리마켓 관리자(임시)</a></p>
   	<p><a href="/devFw/fleaSearchInit.do">플리마켓 마이페이지(임시)</a></p>
	
		             <p class="addmember"><a target="_blank" href="#" id="participants_add"><i class="fa fa-user-plus pa-5x"></i></a></p>
		                <c:forEach var="flea" items="${searchList}" > 
				             <div class="profile-picture big-profile-picture clear">
				                 <img width="120px" height="120px" alt="no picture" src="${flea.profile_photo}" />
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
	             <span>홈<br></span>
	             <span>스토리<br></span>
	             <span>판매 작품<br></span>
	             <span>구매 후기<br></span>
		         </nav>
		     </div>
		     
		   <div class="list-def border-row">
		        <strong class="caption">활동정보</strong>
		        <dl class="list">
		            <dt><font size="2">좋아하는 사람</font></dt>
		            <dd>
		                <a href="#t" data-modal-trigger="user-list" data-modal="open" data-type="favorite" data-title="좋아하는 사람"><span id="like-count">
		                  <c:forEach var="flea" items="${searchList}" > 
		              		 <c:out value="${flea.flea_like_count}"/>
		               	  </c:forEach>
		                  </span><em>명</em>
		                </a>
		            </dd>
		            <dt><font size="2">판매중인 작품</font></dt>
		            <dd>
		                <a href="#">11<em>개</em></a>
		            </dd>
		            <dt><font size="2"><a href="/devFw/fleaReview.do">구매후기</a></font></dt>
		            <dd>
		                <a href="#">124<em>개</em></a>
		            </dd>
       		 </dl>
   		   </div>
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
           <c:forEach var="flea" items="${searchList}" > 
            <div class="carousel-item active">
              <img class="d-block img-fluid" id="img-full" src="${flea.main_photo}" alt="First slide">
            </div>
           </c:forEach>
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
		
		<br>
  <div class="ui_title__txt"><font size="2"><a href="/devFw/fleaProduct.do">판매 상품</a></font></div>
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
	 <div class="layout-split half">
	  <section class="cardlist_section">
   		 <div class="ui_title--sub">
             <h3 class="ui_title__txt"><font size="2"><a href="/devFw/fleaReview.do">구매후기</a></font></h3>
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
       
  </div>


         
</body>
</html>
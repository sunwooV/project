<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/플리메인.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/af7787acb6.js" crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
</head>
<style>
.Relrr {
    width: 592px;
    height: 160px;
    background-color: rgb(255, 255, 255);
    margin-bottom: 12px;
    display: inline-flex;
    cursor: pointer;
    border-radius: 8px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(226, 230, 234);
    border-image: initial;
}
.bdycMe {
    width: 100%;
    box-sizing: border-box;
    padding: 32px;
}
.iGGFft {
    font-size: 26px;
    color: rgb(51, 52, 57);
    font-weight: bold;
    text-overflow: ellipsis;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow-wrap: break-word;
    white-space: nowrap;
    margin-top: 4px;
    overflow: hidden;
}
</style>

<body>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container" style="padding-top: 3%; max-width: 60%;">
		<h1 style="padding-bottom: 27px; font-size: 32px;">
			<span class="glyphicon glyphicon-tree-deciduous"></span>마켓 일정
		</h1>
		
		<!-- 플리마켓 맵-->
		<div class="content">
	        <div class="fleaMap">
	        	<a href="/devFw/fleaMap.do" id="fleaMap">
	           	   <i class="fas fa-map-marked-alt pa-5x">오프라인 맵</i>
	            </a>
	            &nbsp;
	            <a href="/devFw/fleaAddMap.do" id="addMap">
	           	   <i class="fas fa-map-marked-alt pa-5x">맵 등록 </i>
	            </a>
	        </div>
	      

	   <c:forEach var="bestStore" items="${searchList}">
	       <div class="Relrr">
	          <div class="bdycMe">
	             <div class="gFsGXG">
	             	${bestStore.join_offline_date}
	             <!-- 
	                 <time datetime="1576162800000">12.13</time>&nbsp;~&nbsp;<time datetime="1577804400000">01.01</time>&nbsp;</div>
	             -->
	                    <div class="iGGFft">${bestStore.join_offline_location}</div>
	                       <div class="fQIbEE">
	                           <i class="fas fa-clock">${bestStore.join_offline_time}</i>
	                       </div>
	             </div>
	          </div>
	      </div>
	   </c:forEach>
	 </div>
      
       
            
      
	
	
	
	
	</div>
 </body>
 </html>

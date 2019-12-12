<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/css/admin.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
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
   <div class="container"
      style="padding-bottom: 92px; padding-left: 75px;">
      <div id="myshopMain">
         <h1 style="padding-bottom: 27px; font-size: 32px;">
            <a href=#>ADMIN</a>
         </h1>
         <div class="myshopMain_sub1">
            <div id="list">
               <h3>
                  <a href="${contextPath }/fleaCreateStoreApproval.do"><strong>플리마켓 자체검사</strong></a>
               </h3>
               <h6 >
                  <a href="${contextPath }/fleaCreateStoreApproval.do">-플리마켓 개설여부 확인 페이지</a>
               </h6>
            </div>
         </div>
         <div class="myshopMain_sub2">
            <div id="list">
               <h3>
                  <a href="/member/modify.html"><strong>블랙리스트 관리</strong></a>
               </h3>
               <h6 >
                  <a href="/member/modify.html">-블랙리스트 회원 관리 페이지</a>
               </h6>
            </div>
         </div>
         <div class="myshopMain_sub3">
            <div id="list">
               <h3>
                  <a href="${contextPath }/outsearchInit.do"><strong>탈퇴 회원관리</strong></a>
               </h3>
                <h6 >
                  <a href="${contextPath }/outsearchInit.do">-탈퇴한 회원 정보 관리 페이지</a>
               </h6>
            </div>
         </div>
         <div class="myshopMain_sub4">
            <div id="list">
               <h3>
                  <a href="${contextPath }/gradesearchInit.do"><strong>판매자
                        등급 관리</strong></a>
               </h3>
                <h6 >
                  <a href="${contextPath }/gradesearchInit.do">-판매자 등급 처리 페이지</a>
               </h6>
            </div>
         </div>
         <div class="myshopMain_sub3">
            <div id="list">
               <h3>
                  <a href="${contextPath }/pointsearchInit.do"><strong>포인트
                        관리</strong></a>
               </h3>
            <h6 >
                  <a href="${contextPath }/pointsearchInit.do">-포인트 지급페이지 </a>
               </h6>
            </div>
         </div>
         <div class="myshopMain_sub4">
            <div id="list">
               <h3>
                  <a href="/myshop/coupon/coupon.html"><strong>판매자 점수
                        관리</strong></a>
               </h3>
                <h6 >
                  <a href="/myshop/coupon/coupon.html">-판매자 개별 점수 확인 페이지</a>
               </h6>
            </div>
         </div>
         <div class="myshopMain_sub3">
            <div id="list">
               <h3>
                  <a href="${contextPath }/boardsearchInit.do"><strong>게시판
                        관리</strong></a>
               </h3>
                 <h6 >
                  <a href="/myshop/deposits/historyList.html">-게시판 수정,삭제,추가 페이지
                  </a>
               </h6>
            </div>
         </div>
         <div class="myshopMain_sub4">
            <div id="list">
               <h3>
                  <a href="${contextPath }/searchInit.do"><strong>회원 관리</strong></a>
               </h3>
                <h6 >
                  <a href="${contextPath }/searchInit.do">-전체 회원 관리 페이지</a>
               </h6>
            </div>
         </div>
         <div class="myshopMain_sub5">
            <div id="list">
               <h3>
                  <a href="/myshop/coupon/coupon.html"><strong>상품 배송 조회
                        리스트</strong></a>
               </h3>
               <h6 >
                  <a href="/myshop/coupon/coupon.html">-상품 배송 현황 페이지</a>
               </h6>
            </div>
         </div>
         <div class="myshopMain_sub6">
            <div id="list">
               <h3>
                  <a href="/myshop/coupon/coupon.html"><strong>플리마켓 개설
                        승인</strong></a>
               </h3>
             <h6>
                  <a href="/myshop/coupon/coupon.html">-플리마켓 개설 승인페이지</a>
               </h6>
            </div>
         </div>
      </div>
   </div>
</body>
</html>
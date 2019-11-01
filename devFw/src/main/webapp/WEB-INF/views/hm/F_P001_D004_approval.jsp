<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<%
	request.setCharacterEncoding("utf-8");
	List list = (List)request.getAttribute("applyList");
	int size = list.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/자체검사.css">
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
      <h1 style="padding-top: 96px; padding-bottom: 27px; font-size: 32px;">ADMIN</h1>
      <h1>자체검사</h1>
      <table class="table table-hover">
         <thead>
            <tr class="table-dark" id="table">
               <th scope="col">No.</th>
               <th scope="col">플리마켓명</th>
               <th scope="col">플리마켓 운영자 ID</th>
               <th scope="col">입점 일자</th>
               <th scope="col">심사 상태</th>
               <th scope="col">처리</th>
            </tr>
         </thead>
         <tbody>
          <c:forEach var="member" items="${applyList}" >
            <tr class="table-light" id="table">
               <th scope="row">Light</th>
               <td>${member.memberId}</td>
               <td>${member.flea_code}</td>
               <td>${member.together_yn}</td>
               <td>${member.together_request_date}</td>
               <td>${member.together_approve_date}</td>
            </tr>
          </c:forEach>
         </tbody>
      </table>
   </div>
   <!-- 풋터 -->
   <div class="footer">
      <footer class="footer-inner">
         <div class="container" id="con1">
            <div class="row" id="foot">
               <div class="col-md-4" id="kkk1">
                  <h3 class="footer">회사소개</h3>
                  <ul class="footer-list" style="font-size: 14px;">
                     <li><a href="#" id="ftlist">Our story</a></li>
                     <li><a href="#" id="ftlist">Venue</a></li>
                     <li><a href="#" id="ftlist">Other</a></li>
                  </ul>
               </div>
               <div class="col-md-4" id="kkk1">
                  <h3 class="footer">고객센터</h3>
                  <ul class="footer-list" id="ftlist" style="font-size: 14px;">
                     <li><a href="#" id="ftlist">IKEA</a></li>
                     <li><a href="#" id="ftlist">MIO</a></li>
                     <li><a href="#" id="ftlist">BAUHAUS</a></li>
                  </ul>
               </div>
               <div class="col-md-4" id="kkk1">
                  <h3 class="footer">메일문의</h3>
                  <ul class="footer-list" id="ftlist" style="font-size: 14px;">
                     <li><a href="#" id="ftlist">Chat with us</a></li>
                     <li><a href="#" id="ftlist">+46(0)2453 352</a></li>
                     <li><a href="#" id="ftlist">E-mail us</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </footer>
   </div>
</body>
<script>
   $('.tree-toggle').click(function() {
      $(this).parent().children('ul.tree').toggle(200);
   });
   $(function() {
      $('.tree-toggle').parent().children('ul.tree').toggle(200);
   })
</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
	request.setCharacterEncoding("utf-8");
	List list = (List)request.getAttribute("searchList");
	int size = list.size();
	int idx = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/approve.css">
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
      <h1>스토어 개설 승인 처리</h1>
      <table class="table table-hover">
         <thead>
            <tr class="table-dark" id="table">
               <th scope="col">플리코드</th>
               <th scope="col">플리마켓명</th>
               <th scope="col">플리마켓 운영자 ID</th>
               <th scope="col">신청 일자</th>
               <th scope="col">심사 상태</th>
               <th scope="col">처리</th>
            </tr>
         </thead>
         <tbody>
          <c:forEach var="member" items="${searchList}" >
            <tr class="table-light" id="table">
               <td>${member.join_code}</td>
               <td>${member.join_group}</td>
               <td>${member.join_name}</td>
               <td>${member.join_date}</td>
               <td>${member.join_status}</td>
               <td><input type="button" value="개설 승인" id="approval_Y" onClick="location.href='${contextPath}/FleaMarket/P001/D004/updateMember.do?join_code=${member.join_code}'" />
                   <input type="button" value="개설 불가" id="approval_N" /></td>
            </tr>
          </c:forEach>
         </tbody>
      </table>
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
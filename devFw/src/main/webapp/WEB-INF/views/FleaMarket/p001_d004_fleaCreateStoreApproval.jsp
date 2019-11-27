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
               <th scope="col">플리마켓 코드</th>
               <th scope="col">회원 아이디</th>
               <th scope="col">신청자 이름</th>
               <th scope="col">신청자 전화번호</th>
               <th scope="col">신청자 이메일</th>
               <th scope="col">신청자 사업자번호</th>
               <th scope="col">신청 일자</th>
               <th scope="col">심사 상태</th>
               <th scope="col">플리마켓 일자</th>
               <th scope="col">플리마켓 시간</th>
               <th scope="col">플리마켓 장소</th>
               <th scope="col">미리결제 여부</th>
               <th scope="col">처리</th>
            </tr>
         </thead>
         <tbody>
          <c:forEach var="member" items="${searchList}" >
            <tr class="table-light" id="table">
               <td>${member.flea_code}</td>
               <td>${member.memberid}</td>
               <td>${member.join_name}</td>
               <td>${member.join_phonenumber}</td>
               <td>${member.join_email}</td>
               <td>${member.join_companynumber}</td>
               <td>${member.join_date}</td>
               <td>${member.join_status}</td>
               <td>${member.join_offline_date}</td>
               <td>${member.join_offline_time}</td>
               <td>${member.join_offline_location}</td>
               <td>${member.join_prepayment_yn}</td>
               <td><input type="button" value="개설 승인" id="approval_Y" onClick="location.href='${contextPath}/fleaApprovalStatusUpdate.do?flea_code=${member.flea_code}&memberid=${member.memberid}&join_name=${member.join_name }&join_offline_date=${member.join_offline_date}&join_offline_time=${member.join_offline_time}&join_offline_location=${member.join_offline_location}&join_prepayment_yn=${member.join_prepayment_yn}'" />
                   <input type="hidden" id="join_status" value="${member.join_status}">
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
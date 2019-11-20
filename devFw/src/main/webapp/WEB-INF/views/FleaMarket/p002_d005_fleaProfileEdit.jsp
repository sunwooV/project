<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
<meta "charset=UTF-8">
<title>결과창</title>
</head>
<body>
	<h1>업로드가 완료되었습니다.</h1>
	<label>플리마켓명:</label>
	 <input type="text" name="flea_name" value="${map.flea_name }" readonly><br>
	<label>소개글:</label>
	 <input type="text" name="intro_cotent" value="${map.intro_cotent }" readonly><br>
	<div class="result-images">
	 <input type="hidden" name="profile_photo" value="${map.profile_photo }" /> 
 
	<c:forEach var="imageFileName" items="${ map.fileList}"  >
	        <!--  <img src="${pageContext.request.contextPath }/download?imageFileName=${imageFileName }" style="width:150px"> -->
	        <!--  <img src="${contextPath }/fleaProfileUpdate.do?profile_photo=${profile_photo }">   -->
	      
	        
	        
	  </c:forEach>         
	
	</div><p> 
	
	 <a href="/devFw/fleaProfileUpdate.do?&flea_code=1&flea_name=${map.flea_name }&intro_cotent=${map.intro_cotent }&profile_photo=${map.fileList}"> 마이스토어 가기 </a> </p> 
	 <!--  <a href="/devFw/fleaProfileUpdate.do"> 마이스토어 가기 </a>-->
	 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
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

</body>
</html>
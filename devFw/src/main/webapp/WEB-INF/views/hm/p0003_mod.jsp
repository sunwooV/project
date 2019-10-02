<%@ page language="java" contentType="text/html; charset=UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript">
	function frm_update() {
		var frmPro = document.frm;
		frmPro.method = "post";
		frmPro.action = "${contextPath}/devFw/hm/p0003/updateMember.do"; 
		frmPro.submit();
	}
	
	function frm_add() {
		var frmPro = document.frm;
		frmPro.method = "post";
		frmPro.action = "${contextPath}/hm/p0003/insertMember.do"; 
		frmPro.submit();
	}	
   </script>
</head>
<body>
	<form name="frm" method="post" encType="UTF-8">
	고객 번호 :<input type="text" name="id" value="${p0003VO.cust_id}" readonly><br>
	고객 이름 :<input type="text" name="name" value="${p0003VO.cust_name}"><br>
	고객 주소 :<input type="text" name="address" value="${p0003VO.cust_address}"><br>
	고객 주 :<input type="text" name="state" value="${p0003VO.cust_state}"><br>
	고객 우편번호 :<input type="text" name="zip" value="${p0003VO.cust_zip}"><br>
	고객 국가 :<input type="text" name="country" value="${p0003VO.cust_country}"><br>
	고객 담당자 :<input type="text" name="contact" value="${p0003VO.cust_contact}"><br>
	고객 메일주소 :<input type="text" name="email" value="${p0003VO.cust_email}"><br>
	
<c:if test="${command=='modSearch'}" > 	
	<input type="submit" name='submit' value="수정" onclick = "frm_update()">
	<input type='hidden' name='command' value='modUpdate'   /> 
</c:if>

<c:if test="${command=='addSearch'}" > 	
	<input type="submit" name='submit' value="추가" onclick = "frm_add()"> 
	<input type='hidden' name='command' value='addUpdate'   />
</c:if>	
	</form>
</body>
</html>
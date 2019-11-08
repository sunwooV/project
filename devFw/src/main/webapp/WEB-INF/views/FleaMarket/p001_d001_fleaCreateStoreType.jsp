<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
h1{
    padding-top: 96px;
    padding-bottom: 27px;
    font-size: 32px;
    font-weight: 600;
}
</style>

<script>
	function radio_ch(){
		var frmCheck = document.frmJoinForm;
		var radio_btn = document.getElementsByName('join_group');
		
		var radio_bnt_value = 0;
		for(var i = 0; i < radio_btn.length; i++)
		{
			if(radio_btn[i].checked)
			{
				radio_bnt_value = radio_btn[i].value;
				//alert(radio_bnt_value);
				frmCheck.method = "post";
				frmCheck.action = "${contextPath}/fleaCreateStoreForm.do?type= " + radio_bnt_value;
				frmCheck.submit();
			}
		}
		if(radio_bnt_value == 0)
		{
			alert("개인형/참여형 중 하나를 선택하여 주시기 바랍니다.");
		}
		
	}

	
</script>

<meta charset="UTF-8">
<title>금도끼은도끼|플리마켓 스토어 등록</title>
</head>
<body>
 <div class="container"
      style="padding-bottom: 92px; padding-left: 75px;">
	 <h1>플리마켓 등록</h1>
	 <form name="frmJoinForm" method="post" action="${contextPath}/FleaMarket/P001/D001/Join.do">   
	 	<input type="radio" name="join_group" value="1" /><i class="fa fa-user fa-5x">개인형 등록</i>
	 	<input type="radio" name="join_group" value="2" /><i class="fa fa-users fa-5x">참여형 등록</i>
	   	<br><br>
		<input type="button" value="다음" onClick="radio_ch();" /><br>
    </form>
</div>
   
</body>
</html>
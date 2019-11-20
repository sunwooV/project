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
 <div class="container" style="padding-top: 3%;">
      <h1 style="padding-bottom: 27px; font-size: 32px;">
		  <span class="glyphicon glyphicon-tree-deciduous"></span>플리마켓 스토어 개설
	  </h1>

	 <form name="frmJoinForm" method="post" action="${contextPath}/FleaMarket/P001/D001/Join.do">	 
		<input type="radio" name="join_group" value="1" />
	 		<img src="./resources/image/개인형.PNG" width=230, height=240 alt="..." style="margin-left: 20%;">
	 		<img src="./resources/image/참여형.PNG" width=230, height=240 alt="..." style="margin-left: 5%;">
	 		<!--  <span class="fa-stack fa-lg"> 
	 			<i class="fa fa-circle fa-stack-2x"></i> 
	 			<i class="fa fa-user fa-stack-1x fa-inverse"></i> 
	 		</span>
	 		개인형 등록
	 		 	-->
	 	<input type="radio" name="join_group" value="2" />
	   	<br><br>
		<input type="button" value="다음" onClick="radio_ch();" /><br>
    </form>
</div>
   
</body>
</html>
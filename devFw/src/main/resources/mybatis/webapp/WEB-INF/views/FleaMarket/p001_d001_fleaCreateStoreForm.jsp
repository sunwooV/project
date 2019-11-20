<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<%
	String response_type = request.getParameter("type") == null? "0" : request.getParameter("type").trim();
	System.out.println(response_type);
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function frm_check(){
		var name = document.frmCheck.join_name.value;
		
		var join_product = document.getElementsByName('join_product');
		
		var radio_bnt_value = 0;
		for(var i = 0; i < join_product.length; i++)
		{
			if(join_product[i].checked)
			{
				radio_bnt_value = join_product[i].value;
			}
		}
		//alert(radio_bnt_value);
		join_product[0].value = radio_bnt_value;
		
		
		if(frmCheck.join_name.value == "")
		{
			
		 	alert("신청자명을 입력하세요.");
		 	frmCheck.join_name.focus();
		 	return false;
		}
		if(frmCheck.join_phonenumber.value == "")
		{
			
		 	alert("연락처를 입력하세요.");
		 	frmCheck.join_phonenumber.focus();
		 	return false;
		}
		if(frmCheck.join_email.value == "")
		{
			
		 	alert("이메일을 입력하세요.");
		 	frmCheck.join_email.focus();
		 	return false;
		}
		if(frmCheck.join_companynumber.value == "")
		{
			
		 	alert("사업자등록번호를 입력하세요.");
		 	frmCheck.join_companynumber.focus();
		 	return false;
		}
		
		//alert("입점 신청이 완료되었습니다♥ 입점 승인 시 개별 연락 드리겠습니다.");
		type = <%=response_type%>;
		var flea_group = document.getElementsByName("flea_group");
		flea_group[0].value = type;
		
		var result = confirm("입점 신청이 완료되었습니다♥ 입점 승인 시 개별 연락 드리겠습니다.");
		if(result){
			frmCheck.method ="post";
			//frmCheck.action ="${contextPath}/FleaMarket/P001/D001/Join.do";
			frmCheck.action ="${contextPath}/fleaCreateStoreInsert.do";
			frmCheck.submit();
		}
		else
		{
			frmCheck.method ="post";
			frmCheck.action ="${contextPath}/fleaMystore.do";
			frmCheck.submit();
		}
		
	}
</script>
<meta charset="UTF-8">

<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 

<title>Insert title here</title>
</head>


<style>
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  padding: 20px 15%;
}
form header {
  margin: 0 0 20px 0; 
}
form header div {
  font-size: 90%;
  color: #999;
}
form header h2 {
  margin: 0 0 5px 0;
}
form > div {
  clear: both;
  overflow: hidden;
  padding: 1px;
  margin: 0 0 10px 0;
}
form > div > fieldset > div > div {
  margin: 0 0 5px 0;
}
form > div > label,
legend {
	width: 25%;
  float: left;
  padding-right: 10px;
}
form > div > div,
form > div > fieldset > div {
  width: 75%;
  float: right;
}
form > div > fieldset label {
	font-size: 90%;
}
fieldset {
	border: 0;
  padding: 0;
}

input[type=text],
input[type=email],
input[type=url],
input[type=password],
textarea {
	width: 100%;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
  border-right: 1px solid #eee;
  border-bottom: 1px solid #eee;
}
input[type=text],
input[type=email],
input[type=url],
input[type=password] {
  width: 50%;
}
input[type=text]:focus,
input[type=email]:focus,
input[type=url]:focus,
input[type=password]:focus,
textarea:focus {
  outline: 0;
  border-color: #4697e4;
}

@media (max-width: 600px) {
  form > div {
    margin: 0 0 15px 0; 
  }
  form > div > label,
  legend {
	  width: 100%;
    float: none;
    margin: 0 0 5px 0;
  }
  form > div > div,
  form > div > fieldset > div {
    width: 100%;
    float: none;
  }
  input[type=text],
  input[type=email],
  input[type=url],
  input[type=password],
  textarea,
  select {
    width: 100%; 
  }
}
@media (min-width: 1200px) {
  form > div > label,
	legend {
  	text-align: right;
  }
}
</style>

<body>

<form name="frmCheck" method="post" action="${contextPath}/FleaMarket/P001/D001/Join.do">

  <header>
<%
	String id = request.getParameter("id");
	System.out.println("=========id="+id);
	if(id != null && id.length() != 0)
	{
%>
 	<h1 style="padding-bottom: 27px; font-size: 32px;">
		  <span class="glyphicon glyphicon-tree-deciduous"></span>플리마켓 참여자 신청
	</h1>
<%	
	}else{
%>
	  <h1 style="padding-bottom: 27px; font-size: 32px;">
		  <span class="glyphicon glyphicon-tree-deciduous"></span>플리마켓 입점 신청
	  </h1>
<%
	}
%>
    <div>안녕하세요. 금도끼은도끼 플리마켓 입점 신청 양식입니다.<br><br>
	아래 정보를 작성해주시면 확인 후 '입점 안내' 메일을 보내드리겠습니다.<br>
	안내 메일 받으신 후 입점 심사에 응해주시면 됩니다.<br><br>
	단, ~~~ 등은 불가합니다.
 	</div>
  </header>
  
  <div>
    <label class="desc" id="title1" for="Field1">신청자명(상호명)</label>
    <div>
      <input id="join_name" name="join_name" type="text" class="field text fn" value="" size="8" tabindex="1">
    </div>
  </div>
    
  <div>
    <label class="desc" id="title2" for="Field2">연락처</label>
    <div>
      <input id="join_phonenumber" name="join_phonenumber" type="text" spellcheck="false" value="" maxlength="255" tabindex="2"> 
   </div>
  </div>
  
   <div>
    <label class="desc" id="title3" for="Field3">이메일</label>
    <div>
      <input id="join_email" name="join_email" type="email" spellcheck="false" value="" maxlength="255" tabindex="3"> 
   </div>
  </div>
    
  <div>
    <label class="desc" id="title4" for="Field4">사업자등록번호</label>
    <div>
       <input id="join_companynumber" name="join_companynumber" type="text" spellcheck="false" value="" maxlength="255" tabindex="4">
    </div>
  </div>
    
  <div>
    <fieldset>
      <label class="desc" id="join_product" for="join_product">판매 품목</label>
      <div>
      	<input id="radioDefault_5" name="join_product" type="hidden" value="">
      	<div>
      		<input id="Field5_0" name="join_product" type="radio" value="식품" tabindex="5" checked="checked">
      		<label class="choice" for="Field5_0">식품</label>
      	</div>
        <div>
        	<input id="Field5_1" name="join_product" type="radio" value="악세사리" tabindex="6">
        	<label class="choice" for="Field5_1">악세사리</label>
        </div>
        <div>
        	<input id="Field5_2" name="join_product" type="radio" value="전자기기" tabindex="7">
        	<label class="choice" for="Field5_2">전자기기</label>
        </div>
        <div>
        	<input id="Field5_3" name="join_product" type="radio" value="기타" tabindex="8">
        	<label class="choice" for="Field5_3">기타</label>
        </div>
      </div>
    </fieldset>
  </div>
  
   <div>
    <label class="desc" id="join_sns" for="join_sns">
     SNS 또는 타 판매처<br>
     (자사몰, SNS(인스타그램, 트위터), 블로그 등 판매하실 작품을 참고할 수 있는 사이트를 넣어주세요.)
    </label>
  
    <div>
       <input id="join_sns" name="join_sns" type="email" spellcheck="false" value="" maxlength="255" tabindex="9">
    </div>
  </div>
   
  <div>
    <label class="desc" id="join_etc" for="join_etc">
       기타<br>
     (전기사용여부, 테이블, 의자 등 대여, 주차 등)
    </label>
    <div>
      <textarea id="join_etc" name="join_etc" spellcheck="true" rows="10" cols="50" tabindex="10"></textarea>
    </div>
  </div>
  <input type="hidden" value="" name="flea_group" />
  	<div>
		<div>
	  		<input type="button" id="saveForm" name="saveForm" value="등록" onclick="frm_check()"/>
	  		<input type="hidden" name="command" value="insertMember">
	  	    <input type="hidden" name="memberid" value="${member.getMemberid() }" />
	    </div>
	</div>
  
</form>
</body>
</html>
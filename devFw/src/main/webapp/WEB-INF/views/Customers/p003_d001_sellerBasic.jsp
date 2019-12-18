<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function frm_check(){
		var frm = document.frmCheck;
		
		var agreeCheck = document.getElementsByName("agreeCheck");
		var bank = $("#seller_bank").val();
		var name = document.getElementById("seller_name").value;
		var account = document.getElementById("seller_account_number").value;
		var mustCheck = document.getElementById("mustCheck");
		
		for(var i=0;i<agreeCheck.length;i++){
			if(agreeCheck[i].checked == true){
				var chk = agreeCheck[i].value;
			}
		}
		
		
		
		//유효성 확인
		if(chk == '미동의'){
			alert("이용약관에 동의해주세요.");
			document.getElementById("agree").focus();
			return false;
		}
		if(bank == ""){
			alert("은행명을 적어주세요.");
			document.getElementById("seller_bank").focus();
			return false;
		}
		if(name == ""){
			alert("예금주를 적어주세요.");
			document.getElementById("seller_name").focus();
			return false;
		}
		if(account == ""){
			alert("계좌번호를 적어주세요.");
			document.getElementById("seller_account_number").focus();
			return false;
		}
		if(!$("#mustCheck").is(":checked")){
			alert("필수 이용약관에 동의해주세요.");
			document.getElementById("mustCheck").focus();
			return false;
		}
		
		frm.method="POST";
		frm.action="./insertSellerInfo.do";
		frm.submit();
		
	}
	
// 	$(document).on('keydown', '#seller_account_number', function(){
// 		if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
// 			alert("ddd");
// 		} else {
// 			event.preventDefault();
// 		}
// 	});

	
</script>
<meta charset="UTF-8">

<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 

<title>Insert title here</title>
</head>


<style>
.containBox {
    border: 1px solid #D8D8D8;
    margin-left: 12%;
    margin-right: 12%;
    padding: 40px;
}

input[type=text],
input[type=number],
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
input[type=number],
input[type=email],
input[type=url],
input[type=password] {
  width: 50%;
}
input[type=text]:focus,
input[type=number]:focus,
input[type=email]:focus,
input[type=url]:focus,
input[type=password]:focus,
textarea:focus {
  outline: 0;
  border-color: #4697e4;
}
input[type=text],
input[type=number],
input[type=email],
input[type=url],
input[type=password],
textarea,
select {
  width: 100%; 
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>

<body>

<form name="frmCheck" method="post" action="${contextPath}/FleaMarket/P001/D001/Join.do">
<div class="containBox">
  <header>

 	<h1 style="padding-bottom: 27px; font-size: 32px;">
		  <span class="glyphicon glyphicon-tree-deciduous"></span>SELLER BASIC 신청
	</h1>


    <div>SELLLER BASIC을 신청하시면 중고 거래와 경매 거래에<br>
	상품을 자유롭게 등록할 수 있습니다.<br><br>
 	</div>
  </header>
  
  <div>
  <label class="desc" id="title2" for="Field2"><br>개인정보 수집·이용/제공 동의</label>
  	<textarea style="resize: none; height:180px;">본인과 관련하여 귀사가 본인의 개인정보를 수집·이용·제공하고자 하는 경우에는「개인정보 보호법」제15조 제1항 제1호, 제17조 제1항 제1호, 제24조 제1항 제1호에 따라 본인의 동의를 얻어야 합니다. 이에 본인은 아래의 내용과 같이 본인의 개인정보를 수집·이용·제공하는 것에 동의합니다.



		1. 개인정보의 수집·이용에 관한 사항
		
		￭ 수집·이용 목적
		
		‐ 귀하의 개인정보는 소기업 및 소상공인 지원을 위한 특별조치법 제10조의4에 의거하여 우리 사이트에서 진행하는 판매자 등록을 위해 지원자의 정보수집 및 조회를 위한 목적으로 이용됩니다. 
		
		￭ 개인정보의 수집항목
		
		‐ 성명, 계좌번호, 연락처(휴대전화, 이메일), 주소, 기타 선정 관련 개인정보
		
		￭ 보유 및 이용 기간
		
		‐ 귀하의 개인정보는 제공에 관한 동의일로부터 5년까지 보유·이용됩니다.
		
		￭ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
		
		‐ 위 개인정보의 수집·이용에 동의하지 않으실 경우 우리 사이트에서 판매자 등록이 불가능합니다.</textarea>
		<input type="radio" name="agreeCheck" value="동의" id="agree"><label for="agree">동의</label>
		<input type="radio" name="agreeCheck" value="미동의" id="disagree" checked><label for="disagree">미동의</label>
  </div>
  <br>
  <hr>
  <br>
  <h3>송금 정보</h3>
  <p>우리 사이트는 구매자가 구매 확정시 판매금액을 입금해주는 방식을 취합니다.</p>
  <p>정확한 입력 바랍니다. (정확한 송금 정보가 확인되지 않을시 입금이 어렵습니다.)</p>
  <div>
    <label class="desc" id="title2" for="Field2"><br>은행명</label>
    <div>
      <input id="seller_bank" name="seller_bank" type="text" spellcheck="false" value="" maxlength="255" tabindex="2" placeholder="ex)국민, 우리, 신한..."> 
   </div>
  </div>
  
   <div>
    <label class="desc" id="title3" for="Field3"><br>예금주</label>
    <div>
      <input id="seller_name" name="seller_name" type="email" spellcheck="false" value="" maxlength="255" tabindex="3" placeholder="회원명과 예금주명이 일치해야 인증이 가능합니다."> 
   </div>
  </div>
    
  <div>
    <label class="desc" id="title4" for="Field4"><br>계좌번호</label>
    <div>
       <input id="seller_account_number" name="seller_account_number" style="width: 100%;" type="number" spellcheck="false" value="" maxlength="255" tabindex="4" placeholder="숫자만 입력해주세요.">
    </div>
  </div>
  <br>
  <hr>
  <br>
  
    <div>
    <input type="checkbox" name="mustCheck" value="확인" id="mustCheck"><label for="mustCheck">본인은 현재 사업자 등록을 하지 않은 사실을 확인합니다.(필수)</label>
  	<span><br>단, 사업자 등록을 하신분은 <span style="color:orange">SELLER PLUS</span>으로 가입해주세요</span>
  </div>

  
  </div>

<br>

<div style="text-align:center;">
	<input type="button" id="saveForm" name="saveForm" value="등록" onclick="frm_check()"/>
	<input type="hidden" name="command" value="insertMember">
    <input type="hidden" name="memberId" value="${member.getMemberid() }" />
</div>
</form>
</body>
</html>
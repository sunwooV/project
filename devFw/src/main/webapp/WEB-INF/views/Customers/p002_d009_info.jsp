<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
session.removeAttribute("member");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<link rel="stylesheet" href="https://www.seedlogix.com/hubs/themes/clients/powerleads/enterprise/assets/css/normalize.css">
<link rel="stylesheet" href="https://www.seedlogix.com/hubs/themes/clients/powerleads/enterprise/assets/css/components.css">
<link rel="stylesheet" href="https://www.seedlogix.com/hubs/themes/clients/powerleads/enterprise/assets/css/style.css">
<link rel="stylesheet" href="https://www.seedlogix.com/hubs/themes/clients/psg/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.seedlogix.com/hubs/themes/clients/psg/pixons/style.css">
<script src="https://seedlogix.com/hubs/themes/clients/powerleads/enterprise/assets/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://www.seedlogix.com/hubs/themes/clients/powerleads/enterprise/assets/js/averon.js" type="text/javascript" charset="utf-8"></script>
<script src="https://www.seedlogix.com/hubs/themes/clients/powerleads/enterprise/assets/js/webfont.js" type="text/javascript" charset="utf-8"></script>
<script src="https://www.seedlogix.com/hubs/themes/clients/powerleads/enterprise/assets/js/main.js" type="text/javascript" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>

<script>

function showPopup() { window.open("${contextPath}/out_pw_check.do", "a", "width=400, height=300, left=100, top=50"); }
	
$(function(){
	
	if($("#pwForm").submit(function(){
		if($("#pw").val() !== $("#pw2").val()){
			alert("비밀번호가 다릅니다.");
			$("#pw").val("").focus();
			$("#pw2").val("");
			return false;
		}else if ($("#pw").val().length < 8) {
			alert("비밀번호는 8자 이상으로 설정해야 합니다.");
			$("#pw").val("").focus();
			return false;
		}else if($.trim($("#pw").val()) !== $("#pw").val()){
			alert("공백은 입력이 불가능합니다.");
			return false;
		}
	}));
})

function update_info(){
	var frm = document.update;
	
	frm.method = "POST";
	frm.action = "./update.do";
	alert("수정 완료.");
	frm.submit();
}
</script>

<style type="text/css">
/*  Process Section 
___________________________________*/
#home-process-section .w-col {

    float: none;
}

#home-process-section h2 {
    text-align: center;
    margin-top: 0;
    margin-bottom: 20px;
}

#home-process-section .tap-menu {
    text-align: center;
}

#home-process-section .tap-link.second {
    background: #ddd;
    -webkit-clip-path: polygon(
        95% 0,
        100% 50%,
        95% 100%,
        0% 100%,
        5% 50%,
        0% 0%
    );
    clip-path: polygon(95% 0, 100% 50%, 95% 100%, 0% 100%, 5% 50%, 0% 0%);
    width: 20%;
    text-align: center;
    padding: 20px;
    transition: all ease 0.3s;
    font-family: Oswald, sans-serif;
    font-weight: 500;
}

#home-process-section .tap-link.second.w--current {
    background: #0b4498;
    z-index: 999;
}

#home-process-section .tabs-content {
    margin-top: 20px;
    margin-left: 145px;
}

#home-process-section .tabs-content,
#home-process-section .tabs-content p {
    text-align: center;
    font-size: 17px;
    line-height: 1.9em;
}

#home-process-section p {
    font-size: 16px;
    text-align: center;
    line-height: 1.9em;
    max-width: 920px;
    margin: auto;
    margin-bottom: 30px;
}

@media only screen and (max-width: 768px) {
    
    #home-process-section .tap-link.second {
        width: 100%;
        clip-path: none;
    }
}

table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.type05 th {   
 
    text-align: center;
    width: 210px;
    padding: 25px;
    font-size: larger;
    font-weight: bold;
    vertical-align: center;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    width: 900px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

input[type=text]#id,#email,#name,#approval_status {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: none;
  border-bottom: 1px solid black;
}
</style>
<body>
<form name="update">
<!--  Process  -->
<div id="home-process-section">
   
        <div class="w-col w-col-12">
            <h2>내 정보</h2>
            <div class="w-tabs" data-duration-in="300" data-duration-out="100">
                <div class="tap-menu w-tab-menu">
                    <a class="second tap-link w-inline-block w-tab-link w--current" data-w-tab="Tab 1">
                        <div>회원정보수정 / 탈퇴</div>
                    </a>
                    <a class="second tap-link w-inline-block w-tab-link" data-w-tab="Tab 2">
                        <div>내 등급 / 포인트</div>
                    </a>
                    <a class="second tap-link w-inline-block w-tab-link" data-w-tab="Tab 3">
                        <div>Same-Day Installation</div>
                    </a>
                    <a class="second tap-link w-inline-block w-tab-link" data-w-tab="Tab 4">
                        <div>Service Agreement</div>
                    </a>
                </div>
                
                <div class="gray tabs-content w-tab-content" style ="width: 1200px; background-color: white;">
                    <div class="w-tab-pane w--tab-active" data-w-tab="Tab 1">
                        <p>
                         <form id="pwForm" action="./modify.do" method="post">
                        <table class="type05">
                        

    <tr>
        <th scope="row" id="id">아이디</th>
        <td><input type="text" id="memberid" name="memberid"  readonly value="<%= session.getAttribute("memberid") %>" required></td>
    </tr>
     <tr>
        <th scope="row">비민번호</th>
        <td>
                  <label>현재 비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input id="old_pw" name="old_pw" type="password" required><br><br>
                  <label>신규 비밀번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input  id="pw" name="pw" type="password" required><br><br>
                  <label>신규 비밀번호 다시 입력</label>&nbsp;
                  <input type="password" id="pw2" type="password" required><br><br>
                  <button type="submit">비밀번호 변경</button>
                    
               
   </td>
    </tr>
    <tr>
        <th scope="row">이메일</th>
       <td><input type="text" id="email" name="email" readonly value="<%= session.getAttribute("email") %>" required></td>
    </tr>
      <tr>
        <th scope="row">이메일 승인여부</th>
        <td><input type="text" id="approval_status" name="approval_status" readonly value="<%= session.getAttribute("approval_status") %>"  required></td>
    </tr>
    <tr>
        <th scope="row">이름</th>
        <td><input type="text" id="name" name="name" readonly value="<%= session.getAttribute("name") %>"  required></td>
        
    </tr>
    <tr>
        <th scope="row">배송지 관리</th>
        <td>
                  <input type="text" id="address" name ="address" value="<%= session.getAttribute("address") %>"  required>
                        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br><br>
                        <input type="text" id="roadAddress" name ="roadAddress" value="<%= session.getAttribute("roadAddress") %>"  required>
                        <input type="text" id="jibunAddress"  name ="jibunAddress" value="<%= session.getAttribute("jibunAddress") %>"  required><br><br>
                        <span id="guide" style="color:#999;display:none"></span>
                        <input type="text" id="detailAddress" name ="detailAddress" value="<%= session.getAttribute("detailAddress") %>"  required>
                        <input type="text" id="extraAddress" name ="extraAddress" value="<%= session.getAttribute("extraAddress") %>"  required>
                        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script></td>
    </tr>
    <tr>
        <th scope="row">닉네임</th>
        <td><input type="text" id="nickname" name="nickname"  value="<%= session.getAttribute("nickname") %>" required></td>
    </tr>
     <tr>
        <th scope="row">핸드폰</th>
        <td><input type="text" id="phonenumber" name="phonenumber"  value="<%= session.getAttribute("phonenumber") %>" placeholder="-없이 입력해주세요." required></td>
    </tr>
     <tr>
        <th scope="row">생일</th>
        <td><input type="text" id="birth" name="birth"  value="<%= session.getAttribute("birth") %>" placeholder="990101형식으로 입력해주세요."  required></td>
    </tr>
</table>
  <input type = "button" id="update" value="변경하기" onclick="update_info()">&emsp;&emsp;
  <input type = "button" id="out" onclick="showPopup();" value="탈퇴하기">

                      </form>
                        </p>
                    </div>
                    <div class="w-tab-pane" data-w-tab="Tab 2" style="">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quam arcu, auctor sed eros non, tincidunt euismod urna. Ut sollicitudin massa rutrum gravida faucibus. Curabitur suscipit tincidunt odio sit amet dictum. Fusce  elementum a dui vel elementum. Etiam molestie blandit dui. Fusce non mollis justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="w-tab-pane" data-w-tab="Tab 3" style="">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quam arcu, auctor sed eros non, tincidunt euismod urna. Ut sollicitudin massa rutrum gravida faucibus. Curabitur suscipit tincidunt odio sit amet dictum. Fusce elementum a dui vel elementum. Etiam molestie blandit dui. Fusce non mollis justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div class="w-tab-pane" data-w-tab="Tab 4" style="">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quam arcu, auctor sed eros non, tincidunt euismod urna. Ut sollicitudin massa rutrum gravida faucibus. Curabitur suscipit tincidunt odio sit amet dictum. Fusce elementum a dui vel elementum. Etiam molestie blandit dui. Fusce non mollis justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
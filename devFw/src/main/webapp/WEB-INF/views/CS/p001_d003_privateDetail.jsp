<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script>



$(document).ready(function(){
	var now = window.location.href;
	var loginCheck = document.getElementById("memberid").value;
	var num = 0;
	
	//질문 적기
	$(document).on('click', '#prod_inquiry_text', function(){
		if(loginCheck == null || loginCheck == "") {
			if(confirm("로그인 후 글을 쓸 수 있습니다.\n로그인 하시겠습니까?")){
				window.location.href="./loginInit.do?redirect=" + now;
			} else{
				return false;
			}
		} else {
			return false;
		}
	});

	//답변등록
	$(document).on('click', '.enrollInquiry', function(){
		
		var content = $("#prod_inquiry_text").val();
		var private_qna_num = $("#private_qna_num").val();
		var memberid = $("#memberid").val();
		var verify=$("#verify").val();
		var command = "insert";
		var private_memberid = $("#private_memberid").val();
		var private_answer_memberid = $("#private_answer_memberid").val();
		
		//console.log(secret);
	
		//질문 사항 내용이 있는지 체크
		if(content == ''){
			alert("답변을 입력해주세요.");
			return false;
		} else {
			content = content.split(' ').join('&nbsp;'); //replaceAll() 함수 효과
			content = content.replace(/(\r\n|\n|\n\n)/gi, '<br>');
		}
		
		var qna = {
				private_answer_content: content,
				private_qna_num: private_qna_num,
				private_answer_memberid: memberid,
				command: command
		}
		
	
		$.ajax({
			type: "post",
			async: false,
			url: "/devFw/detailcomment.do",
			data: qna,
			dataType : 'text',
			success: function(responseData){
				
				alert("답변이 등록되었습니다.");
	
				document.getElementById("prod_inquiry_text").value = "";
				var data = JSON.parse(responseData);
				
	            /* if(jsonInfo.error.error_yn == 'Y'){
	        	   alert(jsonInfo.error.error_text);
	        	   return;
	            } */
	            //console.log(data.length);
				var list = '';
				
	
				for(var i=0;i<data.length;i++){
					list += '<a href="javascript:void(0)" class="faq_open" id="'+data[i].answer_num+'">'
				     + '<input type="hidden" id="private_answer_memberid" value="'+ data[i].private_answer_memberid +'">'
				     +  '<table class="orderHistoryTable" id="orderHistoryTable">'
				     + '<tr>'
				     + '<td id="answer">답변</td>'
				     + '<td align="center" class="inquiry_text" id="text" style="font-weight:bold;">'+data[i].private_answer_content+'<td>'
				     + '<td id ="mid" align="center" class="member'+data[i].answer_num+'">'+ data[i].private_answer_memberid +'<td>'
				     + '<td id ="mdate" align="center">'+data[i].private_answer_date +'</td>';
			
					if(verify == 'Y'){
						list += '<td id ="commentdelete" align ="center"><p class="delete_qna" id="' + data[i].answer_num +'"><u>삭제</u></p></td>';
					}
					+ ' </tr>'
				}
					   list += '</table>';
						alert(list);
			$(".list_comment_inqury").html(list);
			},
			error: function(data, textStatus){
				alert("다시 시도해주세요.");
			},
			complete : function (data, textstatus){
			}
		});
	});

	//Q&A 삭제(구매자 입장에서 Q&A 작성한 게시글 삭제)
	$(document).on('click', '.delete_qna', function(){
		num = $(this).attr("id");
		//삭제 확인
		if(confirm("해당 답변을 삭제하시겠습니까?\n")){ //네 선택
			var product = $("#private_qna_num").val();
			var memberid = $("#memberid").val();
			var verify=$("#verify").val();
			
			
			var command = 'delete';

			var deleteInfo = {
					private_qna_num:product,
					answer_num:num,
					command:command
			}
			
			$.ajax({
				type: "post",
				async: false,
				url: "/devFw/detailcomment.do",
				data: deleteInfo,
				dataType : 'text',
				success: function(responseData){

					document.getElementById("prod_inquiry_text").value = "";
					
					var data = JSON.parse(responseData);
					
					alert(data);
		            /* if(jsonInfo.error.error_yn == 'Y'){
		        	   alert(jsonInfo.error.error_text);
		        	   return;
		            } */
		            //console.log(data.length);
					var list = '';
					

					for(var i=0;i<data.length;i++){
						
					list += '<input type="hidden" id="private_answer_memberid" value="'+ data[i].private_answer_memberid +'">'
					     +  '<table class="orderHistoryTable" id="orderHistoryTable">'
					     + '<tr>'
					     + '<td id="answer">답변</td>'
					     + '<td align="center" class="inquiry_text" id="text" style="font-weight:bold;">'+data[i].private_answer_content+'<td>'
					     + '<td id ="mid" align="center" class="member'+data[i].answer_num+'">'+ data[i].private_answer_memberid +'<td>'
					     + '<td id ="mdate" align="center">'+data[i].private_answer_date +'</td>';
					
					
						if(verify == 'Y'){
							list += '<td id ="commentdelete" align ="center"><p class="delete_qna" id="' + data[i].answer_num +'"><u>삭제</u></p></td>';
						}
						+ ' </tr>'
					}
						   list += '</table>';
						   console.log(list);
						
					$(".list_comment_inqury").html(list);
					alert("삭제되었습니다");
				},
				error: function(data, textStatus){
					alert("다시 시도해주세요.");
				},
				complete : function (data, textstatus){
				}
			});
		
			
			

		} else{ //아니오 선택
			return false;
		}
		
	});
	//상품 게시글목록
	$(document).on('click', '#list', function(){
	
		var frm = document.privatedetail;
	
	
		frm.method="post";
		frm.action="./privateInit.do";
		frm.submit();
	});

	//상품 게시글 수정
	$(document).on('click', '#modify', function(){
	
		var frm = document.privatedetail;
	
	
		frm.method="post";
		frm.action="./modifyProduct.do";
		frm.submit();
	});

	//상품 게시글 삭제
	$(document).on('click', '#delete', function(){
		var frm = document.privatedetail;
		
		if(confirm("해당 상품을 삭제하시겠습니까?\n")){
			frm.method="post";
			frm.action="./deleteProduct.do";
			frm.submit();
		} else{
			return false;
		}
	
	});

});


</script>
<style>
span.title{
margin-bottom: 25px;
}
div#private{
margin-left:250px;
margin-right:250px;
}
div#commentlist{
margin-left:250px;
margin-right:250px;
}
h3{
    margin-bottom: 25px;

}
* {
    font-family: "Noto Sans KR",sans-serif;
}
table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
}
table.type05 th {
    width: 150px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: darkgray;
    font-size:small;
}
table.type05 td {
    width: 1230px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type05 td.content{
height:500px;
}

#modify, #delete,#list{
	background: black;
    color: white;
    border: 2px solid black;
}
#modify:hover, #delete:hover,  #list:hover{
	background:lightgray;
	color:black;
	border: 2px solid lightgray;
}

/*Qna 작성*/
.prod_inquiry_wrap{
	width:99%;
	background:#f9f9f9;
	margin-top:2%;
	border: 1px solid #ddd;
	padding:30px 29px;
}

#prod_inquiry_text{
	width:100%;
	height:140px;
}

div#comment{
margin-left:250px;
margin-right:250px;
}

.text_area_wrap label {
    position: absolute;
    line-height: 16px;
    color: #c3c3c3;
}

.btn_area{
	text-align:center;
}

label{
	padding:5px;
}

textarea{
	-webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textarea;
    background-color: white;
    -webkit-rtl-ordering: logical;
    flex-direction: column;
    resize: auto;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(169, 169, 169);
    border-image: initial;
    padding: 2px;
}


/*Q&A 삭제*/
.delete_qna{
	float:center;
	cursor:pointer;
	color:red;
	text-align:center; 
}
#deleteQuestion{
    margin-top: -22px;
    margin-right: 10px;
	position: relative;
}


.orderHistoryContainer {
	/* padding: 위 오른쪽 아래 왼쪽;*/
	padding: 1% 15% 10% 15%;
}

.orderHistoryHeader {
	padding-top: 3%;
	margin-left: 15%;
}

.OHT_ttl, .OHC_cont {
	font-size: 13px;
	padding: 0.5%;
	text-align: center;
	border-bottom:1px solid darkgray;
	background: darkgray;
}

.orderHistoryTable {
    width:1390px;
	border-top:1px solid gray;
	border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 30px -45px;
    

}
td#answer{
width: 100px;
}
td{
width: 600px;
}
td#mid{
width: 100px;
}
td#mdate{
width: 150px;
}
td#commentdelete{
width:100px;
}
.OHtableTitle{
background-color:#faf5f1;
}


/*수정 삭제*/
#modify, #delete,#buy,#cart{
	background: black;
    color: white;
    border: 2px solid black;
}
#modify:hover, #delete:hover,#buy:hover,#cart:hover{
	background:lightgray;
	color:black;
	border: 2px solid lightgray;
}
</style>
<body>
<form name="privatedetail">
	<div id="private">
<h3 style="
    margin-top: 25px;
">1:1문의</h3>
    <span class="title">고객센터 > <b>1:1문의</b></span>
<table class="type05">
<c:set var="private_detail" value="${private_detail }" />
<c:set var="member" value="${member }" />



    <tr>
        <th scope="row">제목</th>
        <td>${private_detail.private_qna_title }</td>
    </tr>
    <tr>
        <th scope="row">작성자</th>
        <td>${private_detail.private_memberid }</td>
    </tr>
    <tr>
        <th scope="row">작성일</th>
        <td><fmt:formatDate value="${private_detail.private_qna_date }" pattern="yyyy-MM-dd HH:mm" /></td>
   
    </tr>
     <tr>
        <td colspan ="2" class="content">${private_detail.private_qna_content }</td>
    </tr>
</table>
<br><br>
<input type="button" id="list" value="목록" />
<c:if test="${member.getMemberid() == private_detail.private_memberid}"><!-- 글 작성자이거나 상품 작성자인 경우 -->
	<input type="button" id="modify" value="수정">
    <input type="button" id="delete" value="삭제">
    </c:if>
</div>
<div id= "comment">
<c:forEach var="list" items="${list}" >
<input type="hidden" id="private_qna_num" value="${list.private_qna_num}" >
<input type="hidden" id="memberid" value="${member.getMemberid() }" />
<input type="hidden" id="verify" value="${member.verify }" />
<div class="iqry_comments_area">

	<c:if test="${member.verify =='Y' }">
<div class="prod_inquiry_wrap">

						<h4>답변</h4>
						<div class="text_area_wrap">
									
									<textarea name="prod_inquiry_text" id="prod_inquiry_text" style="resize: none;" placeholder="답변을달아주세요."  ></textarea>
						</div>
						<br>

						<div class="btn_area">
							<input type="button" class="enrollInquiry" id="buy" value="등록">
							<input type="button" class="cancelInquiry" id="cart" value="취소">
						</div>
				</div>
			</c:if>
			</div>
			</c:forEach>
			</div>
					<div id="commentlist">
							<ul class="list_comment_inqury">
								<c:forEach var="prodQnA" items="${prodQnA }">
								<input type="hidden" id="private_answer_memberid" value="${prodQnA.private_answer_memberid }">
                     <table class="orderHistoryTable" id="orderHistoryTable">                     
                                <tr>
                                   <td id="answer">답변</td>
                                    <td align="center" class="inquiry_text" id="text" style="font-weight:bold;">${prodQnA.private_answer_content }</td>
                                   <td id ="mid" align="center" class="member${prodQnA.answer_num }">${prodQnA.private_answer_memberid }</td>
                                    <td id ="mdate" align="center"> ${prodQnA.private_answer_date }</td>
                                    <c:if test="${member.verify =='Y' }"><!-- 자신이 쓴 q&a 내용 삭제할 수 있음 -->
									<td id ="commentdelete" align ="center"><p class="delete_qna" id="${prodQnA.answer_num }"><u>삭제</u></p>
									</td>
									</c:if>
                                   
                                </tr>
                              </table>
                              </a>
								</c:forEach>

							</ul>
							</div>
						
		</form>
</body>
</html>
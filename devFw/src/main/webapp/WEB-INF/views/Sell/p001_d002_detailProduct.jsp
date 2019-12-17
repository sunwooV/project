<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
<!-- <script src="prettyPhoto_compressed_3.1.6/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="prettyPhoto_compressed_3.1.6/css/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
<script src="prettyPhoto_compressed_3.1.6/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script> -->
<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){ 
		var now = window.location.href;
		var loginCheck = document.getElementById("memberId").value;
		var num = 0;
		
		//paging
		$(document).on('click', '#paging a', function(){ 
            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text();
            
            if($id == "next")    selectedPage = next;
            if($id == "prev")    selectedPage = prev;
            
            var prod_number = $("#prod_number").val();
            var prod_title = $("#prod_title").val();
			var memberId = $("#memberId").val(); //로그인한 아이디
			var prod_memberId = $("#prod_memberId").val() //상품 글쓴이
			var qnaCnt = $("#qnaCnt").val();
            
            var page={
            		currentPage:selectedPage,
            		prod_number:prod_number
            }
            
            $.ajax({
				type: "post",
				async: false,
				url: "/devFw/paging.do",
				data: page,
				dataType : 'text',
				success: function(responseData){
					var data = JSON.parse(responseData);
				
					var list = "";
					for(var i=0;i<data.length;i++){
						list += '<li><a href="javascript:void(0)" class="faq_open" id="' + data[i].qna_number + '" name="' + data[i].secret_yn + '">'
							 + '<input type="hidden" id="qna_memberId" value="' + data[i].memberId + '">';
							if(data[i].answer_yn == 'y'){
								list += '<div class="cate id="cate'+ data[i].qna_number + '">답변 완료</div>';
							}
							else {
								list += '<div class="cate id="cate'+ data[i].qna_number + '"><p id="waitAnswer">답변 대기</p></div>';
							}
							
							list += '<div class="cont_box">'
							 +	'<span class="inquiry_prod">'+ prod_title + '</span>';
							 
							if(data[i].secret_yn == 'y'){ //비밀글일경우
								if(memberId == prod_memberId || memberId == data[i].memberId){ //글 작성자이거나 해당 상품 게시자인 경우
									list += '<span class="inquiry_text" id="contText" style="font-weight:bold;">' + data[i].qna_content + '</span>';
								} else { //제 3자의 경우
									list += '<span class="inquiry_text" id="secret_text" style="font-weight:bold;">비밀글입니다.<img src="${contextPath }/resources/img/detailProduct/secret.png" style="width:20px;"></span>';
								}
							} else{ //비밀글이 아닐 경우
								list += '<span class="inquiry_text" id="contText" style="font-weight:bold;">' + data[i].qna_content + '</span>';
							}
							 
							list += '</div>'
							+ '<div class="user">'
							+	'<span class="ff">' + data[i].secretMember + '</span>'
							+ '</div>'
							+ '<div class="date">'
							+	'<span>' + data[i].qna_date + '</span>'
							+ '</div>'
							+ '</a>'
							+ '<div class="faq_cont" style="display:none;" data-qna="listContents" data-open="open" id="a' + data[i].qna_number + '">'
							+ '<div class="question">'+ data[i].qna_content + '</div>';

							if(data[i].memberId == memberId){
								list += '<p class="delete_qna" id="deleteQuestion"><u>삭제</u></p>';
								
							}
							if(data[i].answer_yn == 'y'){
								if(memberId == prod_memberId){
									list += '<div class="answer" id="answer'+data[i].qna_number+'" style="display:block;">'
										+	'<span class="ico asw">답변</span>'
										
										+	'<span class="tit_asw">판매자'
										+		'<span>'+data[i].answer_date+'</span></span>'
										+  data[i].answer_content + '<p class="delete_qna" id="deleteAnswer"><u>삭제</u></p>'
										 + '</div>';
										 
			
								}else{
									list += '<div class="answer" id="answer'+data[i].qna_number+'" style="display:block;">'
										+	'<span class="ico asw">답변</span>'
										
										+	'<span class="tit_asw">판매자'
										+		'<span>'+data[i].answer_date+'</span></span>'
										+  data[i].answer_content
										 + '</div>';
								}
								
							} else {
								if(memberId == prod_memberId){
									list += '<div class="answer" id="answer'+ data[i].qna_number + '"'
										 +  'style="display: block;">'
										 + '<span class="ico asw">답변</span> <span class="tit_asw">판매자'
										 +	'<textarea id="answer_write" style="resize: none;"></textarea>'
										 +	'<input type="button" id="answer_enroll"'
										 + 	'class="answer_enroll" value="답변달기">'
										 + '</span></div>';
								}
								else{
									list += '<div class="answer" style="display:none;">'
										+	'<span class="ico asw">답변</span>'
										
										+	'<span class="tit_asw">판매자'
										+		'<span>'+data[i].answer_date+'</span></span>'
										+  data[i].answer_content
										 + '</div>';
								}
									 
								
							}
							list += '</div>' 
								+ '</li>';
						}
					$(".list_comment_inqury").html(list);
					
					var list2 = "";
					for(var i=1;i<=qnaCnt/10+1;i++){
						if(i == data[0].currentPage){
							list2 += '<a style="color:orange;">' + i + '</a>';
						} else{
							list2 += '<a>' + i + '</a>';
						}
					}
					$("#paging").html(list2);
				},
				error: function(data, textStatus){
					alert("다시 시도해주세요.");
				},
				complete : function (data, textstatus){
				}
			});
        });
		
		//관심 상품 등록하기
		$(document).on('click', '#heart', function(){
			if(loginCheck == null || loginCheck == "") { //로그인 안되어 있을 때
				if(confirm("로그인 후 관심상품을 등록할 수 있습니다..\n로그인 하시겠습니까?")){
					window.location.href="./loginInit.do?redirect=" + now;
				} else{
					return false;
				}
			} else { //로그인 되어있을 때 => 관심 상품 등록
				if($(this).attr('name') == 'n'){ //관심 상품 등록
					var heart = document.getElementById("heart");
					$(this).html('<img src="${contextPath}/resources/img/detailProduct/fillheart.png" style="width:30px; height:30px;"> 관심 상품  ');
					$(this).css("color", "#dd5850");
					heart.setAttribute("name", "y");
					
					var prod_number = $("#prod_number").val();
					var memberId = $("#memberId").val();
					var command = "like";
					
					var heart = {
							prod_number: prod_number,
							memberId: memberId,
							command:command
					}
			
					$.ajax({
						type: "post",
						async: false,
						url: "/devFw/detailLikeProd.do",
						data: heart,
						dataType : 'text',
						success: function(responseData){
							var data = JSON.parse(responseData);
							
							$(".heart").html(data.heart);
							
							console.log("관심상품 등록 완료");
							
						},
						error: function(data, textStatus){
							alert("다시 시도해주세요.");
						},
						complete : function (data, textstatus){
						}
					});
				} else{ //관심 상품 해제
					var heart = document.getElementById("heart");
					$(this).html('<img src="${contextPath }/resources/img/detailProduct/heart.png" style="width:30px; height:30px;"> 관심 상품  ');
					$(this).css("color", "black");
					heart.setAttribute("name", "n");
					
					var prod_number = $("#prod_number").val();
					var memberId = $("#memberId").val();
					var command = "dislike";
					
					var heart = {
							prod_number: prod_number,
							memberId: memberId,
							command: command
					}
					
					$.ajax({
						type: "post",
						async: false,
						url: "/devFw/detailLikeProd.do",
						data: heart,
						dataType : 'text',
						success: function(responseData){
							var data = JSON.parse(responseData);
							
							$(".heart").html(data.heart);
							
							console.log("관심상품 해제 완료");
							
						},
						error: function(data, textStatus){
							alert("다시 시도해주세요.");
						},
						complete : function (data, textstatus){
						}
					});
				}
				
			}
		});
		
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
		
		//질문 리스트 열기
		$(document).on('click', '.faq_open', function(){
			var secret = $(this).attr("name");
			var memberId = $("#memberId").val(); //로그인한 아이디
			var prod_memberId = $("#prod_memberId").val() //상품 글쓴이
			
			var id = $(this).attr("id");
			var writerId = $("#"+id).find("#qna_memberId").val();  //qna 글쓴이
			
			if(secret == 'y'){ //비밀글일 경우
				if(memberId == writerId || memberId == prod_memberId) { //로그인한 아이디가 글쓴이이거나 상품 글쓴이인 경우
					num = $(this).attr("id");

					var target = document.getElementById("a" + num);
					
					if(target.style.display == 'none'){ //접혀있는데 눌렀을 경우
						$('#a'+num).css("display", "block");
					} else { //펴져있는데 눌렀을 경우
						$('#a'+num).css("display", "none");
					}
				} else { //로그인한 아이디가 글쓴이가 아닐 경우
					alert("비밀글은 작성자만 조회할 수 있습니다.");
					return false;
				}
			} else { //비밀글이 아닐 경우
				num = $(this).attr("id");

				var target = document.getElementById("a" + num);
				
				if(target.style.display == 'none'){ //접혀있는데 눌렀을 경우
					$('#a'+num).css("display", "block");
				} else { //펴져있는데 눌렀을 경우
					$('#a'+num).css("display", "none");
				}
			}
		})
		
		
		//질문 등록
		$(document).on('click', '.enrollInquiry', function(){
			
			var content = $("#prod_inquiry_text").val();
			var product = $("#prod_number").val();
			var memberId = $("#memberId").val();
			var command = "insert";
			var prod_title = $("#prod_title").val();
			var secret = $("#secretSelect").val();
			var prod_memberId = $("#prod_memberId").val();
			var qna_memberId = $("#qna_memberId").val();
			
			//console.log(secret);

			//질문 사항 내용이 있는지 체크
			if(content == ''){
				alert("질문 사항을 입력해주세요.");
				return false;
			} else {
				content = content.split(' ').join('&nbsp;'); //replaceAll() 함수 효과
				content = content.replace(/(\r\n|\n|\n\n)/gi, '<br>');
			}
			
			var qna = {
					qna_content: content,
					prod_number: product,
					memberId: memberId,
					command: command,
					secret_yn: secret
			}
	
			$.ajax({
				type: "post",
				async: false,
				url: "/devFw/detailQna.do",
				data: qna,
				dataType : 'text',
				success: function(responseData){
					document.getElementById("prod_inquiry_text").value = "";
					
					var data = JSON.parse(responseData);
		            /* if(jsonInfo.error.error_yn == 'Y'){
		        	   alert(jsonInfo.error.error_text);
		        	   return;
		            } */
		            //console.log(data.length);
					var list = '';
					

					for(var i=0;i<data.length;i++){
					list += '<li><a href="javascript:void(0)" class="faq_open" id="' + data[i].qna_number + '" name="' + data[i].secret_yn + '">'
						 + '<input type="hidden" id="qna_memberId" value="' + data[i].memberId + '">';
						if(data[i].answer_yn == 'y'){
							list += '<div class="cate">답변 완료</div>';
						}
						else {
							list += '<div class="cate"><p id="waitAnswer">답변 대기</p></div>';
						}
						
						list += '<div class="cont_box">'
						 +	'<span class="inquiry_prod">'+ prod_title + '</span>';
						 
						if(data[i].secret_yn == 'y'){ //비밀글일경우
							if(memberId == prod_memberId || memberId == data[i].memberId){ //글 작성자이거나 해당 상품 게시자인 경우
								list += '<span class="inquiry_text" id="contText" style="font-weight:bold;">' + data[i].qna_content + '</span>';
							} else { //제 3자의 경우
								list += '<span class="inquiry_text" id="secret_text" style="font-weight:bold;">비밀글입니다.<img src="${contextPath }/resources/img/detailProduct/secret.png" style="width:20px;"></span>';
							}
						} else{ //비밀글이 아닐 경우
							list += '<span class="inquiry_text" id="contText" style="font-weight:bold;">' + data[i].qna_content + '</span>';
						}
						 
						list += '</div>'
						+ '<div class="user">'
						+	'<span class="ff">' + data[i].secretMember + '</span>'
						+ '</div>'
						+ '<div class="date">'
						+	'<span>' + data[i].qna_date + '</span>'
						+ '</div>'
						+ '</a>'
						+ '<div class="faq_cont" style="display:none;" data-qna="listContents" data-open="open" id="a' + data[i].qna_number + '">'
						+ '<div class="question">'+ data[i].qna_content + '</div>';

						if(data[i].memberId == memberId){
							list += '<p class="delete_qna" id="deleteQuestion"><u>삭제</u></p>';
							
						}
						if(data[i].answer_yn == 'y'){
							list += '<div class="answer" style="display:block;">'
								+	'<span class="ico asw">답변</span>'
								
								+	'<span class="tit_asw">판매자'
								+		'<span>'+data[i].answer_date+'</span></span>'
								+  data[i].answer_content
								 + '</div>';
						} else {
							list += '<div class="answer" style="display:none;">'
								+	'<span class="ico asw">답변</span>'
								
								+	'<span class="tit_asw">판매자'
								+		'<span>'+data[i].answer_date+'</span></span>'
								+  data[i].answer_content
								 + '</div>';
						}
						list += '</div>' 
							+ '</li>';
					}
				$(".list_comment_inqury").html(list);
				},
				error: function(data, textStatus){
					alert("다시 시도해주세요.");
				},
				complete : function (data, textstatus){
				}
			});			
		});
		
		
		//Q&A 답변 달기 버튼
		$(document).on('click', '#answer_enroll', function(){
			var product = $("#prod_number").val();
			var answer_content = $("#answer_write").val();
			var command = 'insert';

			//답변 유효성 검사
			if(answer_content == ''){
				alert("답변을 입력해주세요.");
				return false;
			} else {
				answer_content = answer_content.split(' ').join('&nbsp;'); //replaceAll() 함수 효과
				answer_content = answer_content.replace(/(\r\n|\n|\n\n)/gi, '<br>');
			}
			
			var answer = {
					answer_content: answer_content,
					prod_number: product,
					qna_number: num, //Q&A number -> 질문 펼칠 때 받아옴
					command: command		
			}

			$.ajax({
				type: "post",
				async: false,
				url: "/devFw/detailAnswer.do",
				data: answer,
				dataType : 'text',
				success: function(responseData){

					
					var data = JSON.parse(responseData);
		            /* if(jsonInfo.error.error_yn == 'Y'){
		        	   alert(jsonInfo.error.error_text);
		        	   return;
		            } */
		           console.log(data);
		           var answerString = '<span class="ico asw">답변</span>'
					+ '<span class="tit_asw">판매자'
					+ '<span>'+ data.answer_date +'</span>'
					+ '</span>' + data.answer_content
					+ '<p class="delete_qna" id="deleteAnswer"><u>삭제</u></p>';
					
				
					console.log(answerString);
		            var answer_number = data.qna_number;

		        	$("#answer"+answer_number).html(answerString);
		        	$("#cate"+answer_number).html('답변 완료');
		        	$("#cate"+answer_number).css('color', 'black');
				},
				error: function(data, textStatus){
					alert("다시 시도해주세요.");
				},
				complete : function (data, textstatus){
				}
			});
			
			
			
		});
		
		//Q&A 삭제(구매자 입장에서 Q&A 작성한 게시글 삭제)
		$(document).on('click', '#deleteQuestion', function(){

			//삭제 확인
			if(confirm("해당 답변을 삭제하시겠습니까?\n")){ //네 선택
				var product = $("#prod_number").val();
				var prod_title = $("#prod_title").val();
				var memberId = $("#memberId").val();
				
				var command = 'delete';

				var deleteInfo = {
						prod_number:product,
						qna_number:num,
						command:command
				}
				
				$.ajax({
					type: "post",
					async: false,
					url: "/devFw/detailQna.do",
					data: deleteInfo,
					dataType : 'text',
					success: function(responseData){

						
						var data = JSON.parse(responseData);
			            /* if(jsonInfo.error.error_yn == 'Y'){
			        	   alert(jsonInfo.error.error_text);
			        	   return;
			            } */
			            console.log(data.length);
						var list = '';
						

						for(var i=0;i<data.length;i++){
							list += '<li><a href="javascript:void(0)" class="faq_open" id="' + data[i].qna_number + '" name="' + data[i].secret_yn + '">'
								 + '<input type="hidden" id="qna_memberId" value="' + data[i].memberId + '">';
							if(data[i].answer_yn == 'y'){
								list += '<div class="cate">답변 완료</div>';
							}
							else {
								list += '<div class="cate"><p id="waitAnswer">답변 대기</p></div>';
							}
							
							list += '<div class="cont_box">'
							 +	'<span class="inquiry_prod">'+ prod_title + '</span>';
							 
							if(data[i].secret_yn == 'y'){ //비밀글일경우
								if(memberId == prod_memberId || memberId == data[i].memberId){ //글 작성자이거나 해당 상품 게시자인 경우
									list += '<span class="inquiry_text" id="contText" style="font-weight:bold;">' + data[i].qna_content + '</span>';
								} else { //제 3자의 경우
									list += '<span class="inquiry_text" id="secret_text" style="font-weight:bold;">비밀글입니다.<img src="${contextPath }/resources/img/detailProduct/secret.png" style="width:20px;"></span>';
								}
							} else{ //비밀글이 아닐 경우
								list += '<span class="inquiry_text" id="contText" style="font-weight:bold;">' + data[i].qna_content + '</span>';
							}
							 
							list += '</div>'
							+ '<div class="user">'
							+	'<span class="ff">' + data[i].secretMember + '</span>'
							+ '</div>'
							+ '<div class="date">'
							+	'<span>' + data[i].qna_date + '</span>'
							+ '</div>'
							+ '</a>'
							+ '<div class="faq_cont" style="display:none;" data-qna="listContents" data-open="open" id="a' + data[i].qna_number + '">'
							+ '<div class="question">'+ data[i].qna_content + '</div>';

							if(data[i].memberId == memberId){
								list += '<p class="delete_qna" id="deleteQuestion"><u>삭제</u></p>';
								
							}
							if(data[i].answer_yn == 'y'){
								list += '<div class="answer" style="display:block;">'
									+	'<span class="ico asw">답변</span>'
									
									+	'<span class="tit_asw">판매자'
									+		'<span>'+data[i].answer_date+'</span></span>'
									+  data[i].answer_content
									 + '</div>';
							} else {
								list += '<div class="answer" style="display:none;">'
									+	'<span class="ico asw">답변</span>'
									
									+	'<span class="tit_asw">판매자'
									+		'<span>'+data[i].answer_date+'</span></span>'
									+  data[i].answer_content
									 + '</div>';
							}
							list += '</div>' 
								+ '</li>';
						}
					$(".list_comment_inqury").html(list);

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
		
		
		//Q&A 답변 삭제(상품 게시자)
		$(document).on('click', '#deleteAnswer', function(){
			var product = $("#prod_number").val();

			var command = 'delete';

			var deleteInfo = {
					prod_number:product,
					qna_number:num,
					command:command
			}
			
			//삭제 확인
			if(confirm("해당 답변을 삭제하시겠습니까?\n")){ //네 선택
				
				$.ajax({
					type: "post",
					async: false,
					url: "/devFw/detailAnswer.do",
					data: deleteInfo,
					dataType : 'text',
					success: function(responseData){

						
						var data = JSON.parse(responseData);
			            /* if(jsonInfo.error.error_yn == 'Y'){
			        	   alert(jsonInfo.error.error_text);
			        	   return;
			            } */
			           console.log(data);
			           var answerString = '<span class="ico asw">답변</span>'
						+ '<span class="tit_asw">판매자'
						+	'<textarea id="answer_write" style="resize: none;"></textarea>'
						+	'<button id="answer_enroll" class="answer_enroll">답변달기</button>'
						+ '</span>';
				
					
			            var answer_number = data.qna_number;

			        	$("#answer"+answer_number).html(answerString);
			        	$("#cate"+answer_number).html('답변 대기');
			        	$("#cate"+answer_number).css("color", "#BDBDBD");
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
		
		
		//상품 게시글 수정
 	 	$(document).on('click', '#modify', function(){
		
 	 		var frm = document.detail;
			
			
			frm.method="post";
			frm.action="./modifyProduct.do";
			frm.submit();
		});
 	 	
		//상품 게시글 삭제
 		$(document).on('click', '#delete', function(){
			var frm = document.detail;

			if(confirm("해당 상품을 삭제하시겠습니까?\n")){
				frm.method="post";
				frm.action="./deleteProduct.do";
				frm.submit();
			} else{
				return false;
			}

		});
		
		//상품 문의 비밀글 여부
		$("#secretSelect").change(function(){
			if ($("#secretSelect").is(":checked")) { //비밀 글 선택
				document.getElementsByName("secret")[0].value = 'y';
			}else{
				document.getElementsByName("secret")[0].value = 'n';
			}
		});
		
		//대표 사진 확대 기능
	  //	$("a[rel^='prettyPhoto']").prettyPhoto();

	});
	
	//경매 상품 시간 계산 해주기 -> 처음 화면 펼칠 때 남은 시간 select한 후 화면단에서 시간 줄여주기                                                                                                                                   
	$(window).load(function(){
		var auction_yn = document.getElementsByName("auction_yn")[0].value;
		
		if(auction_yn == 'y'){
		
			var day = document.getElementById("left_day").value;
			var hour = document.getElementById("left_hour").value;
			var min = document.getElementById("left_min").value;
			var second = document.getElementById("left_second").value;
			
			setInterval(function(){
	
				if(second > 0){
					if(day == 0 && hour == 0 && min == 0 && second == 0){
						second = 0;
						return false;
					} else{
						second--;
					}
				} else{
					if(min > 0){
						second=59;
						min--;
					} else{
						if(hour > 0){
							min=59;
							hour--;
						} else{
							if(day > 0){
								min=59;
								day--;
							}
						}
					}
				}
				var tt = day + ' 일 ' + hour + ' 시간 ' + min + " 분 " + second + " 초 ";
				document.getElementById("auction_date_cal").innerHTML = tt;
		  }, 1000);
		}
	})

	

 	//경매 상품 시간 계산 해주기 -> 처음 화면 펼칠 때 남은 시간 select한 후 화면단에서 시간 줄여주기
	function time_cal(){
		location.reload();
		var day = document.getElementById("left_day").value;
		var hour = document.getElementById("left_hour").value;
		var min = document.getElementById("left_min").value;
		var second = document.getElementById("left_second").value;
		
		if(second > 0){
			second--;
		} else{
			if(min > 0){
				second=59;
				min--;
			} else {
				if(hour > 0){
					min=59;
					hour--;
				} else{
					min=59;
				}
			}
		}
	}
	
	//+, - 버튼 눌렀을 때 수량 변경
	function abuttonClick(pm){ 
		
 		var price = document.getElementById("prod_price").value;
 		
		var amount = document.getElementById("prod_amount");
	
		if(pm == 'minus'){
			if(amount.value == amount.min){ 
				return false;
			}else{
				amount.value--;
			}
		} else { //plus 버튼 눌렀을 때
			if(amount.value == amount.max){ //재고 수량보다 더 많이 주문할 수 없도록 설정
				return false;
			}else{
				amount.value++;
			}
		}
	
		// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
		Number.prototype.format = function(){
		    if(this==0) return 0;
		 
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		 
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		 
		    return n;
		};

		// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
		String.prototype.format = function(){
		    var num = parseFloat(this);
		    if( isNaN(num) ) return "0";
		 
		    return num.format();
		};

		var total = amount.value * price;


		document.getElementById("total").innerHTML = total.format(); //천단위 , 찍어서 표현
		document.getElementById("total_price").value = total;
	}
	 
	
	//상세정보, Q&A, 상품후기 나누는 탭
	function tab_menu(num){
		 var f = $('.menu_tab').find('li');
		 for ( var i = 0; i < f.length; i++ ) {
			  if ( i == num) {
			   f.eq(i).addClass('active');
			   $('.menu_tab0' + i ).show();
			  } else {
			   f.eq(i).removeClass('active');  
			   $('.menu_tab0' + i ).hide();
			  }
		}
	}

	
	//장바구니 클릭시 
	$(document).on('click','#cart', function(){
		
		var memberId = $("#memberId").val();
		var amount = $("#prod_amount").val();
		var product = $('#prod_number').val();
		var real_prod_price =$('#prod_price').val();
		alert("prod_amount 출력 = "+amount);
		
		var command ='insert';
		//로그인 안했을 때 로그인 창으로
		if(memberId == null || memberId == ''){
			location.href ="${contextPath}/loginInit.do";
		}else if(memberId !=null && amount == null){
			alert("옵션을 선택해주세요.");
			 
		}else{
			
			var insertCartInfo = {
					memberId:memberId,
					prod_number:product,
					prod_amount:amount,
					real_prod_price:real_prod_price,
					command:command
				};
					
			$.ajax({
				type: "get",
				async:false,
				url: "/devFw/checkCartList.do",
				data: {
					memberId:memberId,
					prod_number:product
				},
				dataType :'text',
				success: function(responseData){
					//문제지점
					var parsingData = JSON.parse(responseData);
					
					alert(parsingData.data);
					
					if(parsingData.data == 1){
					
						$.ajax({
							type:"get",
							async:false,
							url:"/devFw/editCart.do",
							data :insertCartInfo,
							dataType:"text",
							
							success: function(responseData){
								closeNotice();		
								console.log("장바구니 수정 성공");					
							},
							error:function(data, textStatus){
								alert("장바구니에 수정 실패");
							},
							complete : function(data, textStatus){
											
							} // end of second ajax complete
						});
										
					}else{
						
						$.ajax({
							type:"get",
							async:false,
							url:"/devFw/addCart.do",
							data :insertCartInfo,
							dataType:"text",
							
							success: function(responseData){
								closeNotice();
								console.log("장바구니 추가 성공");
				
							},
							error:function(data, textStatus){
								alert("장바구니에 상품담기 실패");
							},
							complete : function(data, textStatus){
									
							}
							
							 // end of second ajax complete
							
					});//end of ajax
						
						
					}
					
					
				
					
					
				},
				error: function(data, textStatus){
					alert("오류가 발생하였습니다.");
				},
				complete : function (data, textstatus){
					
				}
				
			
				}); // ajax 끝
			} //else 끝
			
	
			
		
		
		}); // 장바구니 클릭 함수 끝
		
	
		// 장바구니로 이동
		function moveToCart(){
			window.location.href="/devFw/cart.do";

		};
	
		//장바구니 성공 시 뜨는 div 닫는 함수 
		function closeNotice(){
			var checkType = $('#successNoticeBox').is(':visible');
			var styleOfPopup = document.getElementById("#successNoticeBox");
			if(checkType == false){
		
				$("#successNoticeBox").css("display", "block");
				
			}else{
				$("#successNoticeBox").css("display", "none");
			}
		};
		
		$(document).on('click', '#message', function(){
			
			
		});

		
</script>
<meta charset="UTF-8">
<title>상품 상세</title>
<style>
body {
	background: #f1f2f3;
	font-size: 13px;
	color: #262626;
	font-family: 'Arial', sans-serif;
}

div {
	display: block;
}

img {
	max-width: 100%;
}

#wrap {
	width: 90%;
	margin: 50px auto;
}

.up {
	width: 75%;
	margin: 0px auto;
}

.down {
	width: 75%;
	float: left;
	margin: 30px 13%;
}

.category {
	font-size: small;
	font-weight: bold;
	margin: 1% 20%;
	width: 25%;
}

.mainImg {
	display: block;
	box-sizing: border-box;
	margin: auto 100px;
	width: 35%;
	max-height: 750px;
	float: left;
}
.description{
	margin-left: 2%;
	float:left;
}
.price{
	color:red;
	font-size:xx-large; 
	font-weight:bold;
}
.content{
	color:black;
	font-size:medium;
}
.pay{
	display: inline-block;
	padding: 0;
	vertical-align: top;
	height: 56px;
	line-height: 56px;
	margin-left: 4px;
	width: 123px;
}
.tab-content{
	width: 758px;
    margin: 0px auto;
}

.alarm {
	color: red;
	font-weight: bold;
	font-size: large;
}
.alarm{
	color:red;
	font-weight:bold;
	font-size:large;
}

#cart {
	font-size: 16px;
	padding: 0 24px;
	line-height: 46px;
	border-color: #dd5850;
	background: #fff;
	color: #dd5850;
}

#buy, #bidding {
	font-size: 16px;
	padding: 0 24px;
	line-height: 46px;
	border-color: transparent;
	background: #dd5850;
	color: #fff;
}

#kakaoPay {
	font-size: 16px;
	background: #EBD402;
	padding: 0 24px;
	line-height: 46px;
	border-color: transparent;
	color: white;
}

#message, #heart {
	box-shadow: 0 1px 3px 0 hsla(0, 0%, 86.3%, .3);
	font-weight: 400;
	box-sizing: border-box;
	display: inline-block;
	border-radius: 2px;
	background: #fff;
	border: 1px solid #d9d9d9;
	vertical-align: middle;
	transition: background-color .2s cubic-bezier(.075, .82, .165, 1);
	transition: border-color .2s cubic-bezier(.075, .82, .165, 1);
	margin: 0;
	padding: 0;
	line-height: 1.5;
	text-align: center;
	text-decoration: none;
	color: rgb(221, 88, 80);
	cursor: pointer;
}

#heart {
	padding: 3px;
}

#sold_price {
	color: black;
	margin-left: 1%;
}

#auction_price {
	font-size: medium;
}

#sale_price {
	color: #BDBDBD;
	font-size: medium;
	text-decoration: line-through;
}

#total {
	font-weight: bold;
}

#gray-text {
	color: #848484;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

/*Qna 작성*/
.prod_inquiry_wrap {
	width: 99%;
	background: #f9f9f9;
	margin-top: 2%;
	border: 1px solid #ddd;
	padding: 30px 29px;
}

#prod_inquiry_text {
	width: 100%;
	height: 140px;
}

.text_area_wrap label {
	position: absolute;
	line-height: 16px;
	color: #c3c3c3;
}

.btn_area {
	text-align: center;
}

label {
	padding: 5px;
}

textarea {
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

/*qna 리스트*/
#QnA .list_comment_inqury {
	border-style: solid;
	border-color: #c3c3c3 transparent #ddd;
	border-width: 1px 0;
	padding: 0;
	margin: 0;
}

.list_comment_inqury li ~ li {
	border-top: 1px solid #ededed;
}

.list_comment_inqury {
	display: block;
	list-style: none;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.list_comment_inqury li {
	display: list-item;
	text-align: -webkit-match-parent;
	list-style: none;
}

#QnA .list_comment_inqury .faq_open {
	display: block;
	position: relative;
	padding: 20px 120px 68px 22px;
	background:
		url(//image.wemakeprice.com/images/resources_v2/front/deals/bg_inqury.gif)
		0 0 repeat-y;
	line-height: 22px;
	color: #666;
	text-align: center;
}

#QnA .list_comment_inqury .faq_open .cate {
	width: 86px;
	position: absolute;
	top: 50%;
	left: 0;
	margin-top: -11px;
}

#QnA a {
	text-decoration: none;
	cursor: pointer;
}

#QnA .user {
	width: 124px;
	padding-top: 2.5%;
}

#QnA .list_comment_inqury .cont_box {
	position: relative;
	padding: 0px 40px 0 75px;
	text-align: left;
}

#QnA .list_comment_inqury .date {
	width: 127px;
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -11px;
}

#QnA .list_comment_inqury .cont_box .inquiry_prod {
	display: block;
	width: 370px;
	margin-bottom: 2px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.list_comment_inqury div {
	display: block;
}

.cate, .cont_box, .user, .date {
	float: left;
}

#waitAnswer {
	color: #BDBDBD;
}

/*qna 답변*/
#QnA .list_comment_inqury .faq_cont {
	position: relative;
	background: #f9f9f9;
	line-height: 16px;
	display: none;
}

#QnA .list_comment_inqury .faq_cont div {
	position: relative;
	padding: 18px 45px 17px 20px;
	border-top: 1px solid #ededed;
}

#QnA .list_comment_inqury .faq_cont .answer {
	padding-bottom: 46px;
	padding-left: 120px;
}

#QnA .list_comment_inqury .faq_cont div {
	position: relative;
	padding: 18px 45px 17px 20px;
	border-top: 1px solid #ededed;
}

.ico {
	display: inline-block;
	overflow: hidden;
	background:
		url(//image.wemakeprice.com/images/resources_v2/front/common/ico_spr.png)
		no-repeat 0 0;
	text-indent: -9999px;
	*font-size: 0;
	*line-height: 0;
	*height: 0;
	*text-indent: 0;
}

#QnA .list_comment_inqury .faq_cont .answer .tit_asw {
	display: block;
	width: 50px;
	height: 20px;
	margin: 2px 0 -22px -80px;
	background: #00a9d4;
	font-size: 11px;
	line-height: 22px;
	color: #fff;
	text-align: center;
}

#QnA .list_comment_inqury .faq_cont .answer .tit_asw span {
	position: absolute;
	bottom: 13px;
	left: 120px;
	font-size: 12px;
	color: #999;
}

#QnA .list_comment_inqury .faq_cont .answer .ico.asw {
	width: 9px;
	height: 9px;
	position: absolute;
	top: 20px;
	left: 20px;
	border-style: solid;
	border-color: #999;
	border-width: 0 0 1px 1px;
	background: none;
}

/*qna 답변*/
#answer_write {
	position: absolute;
	bottom: 7px;
	left: 120px;
	font-size: 12px;
	color: #999;
	width: 50%;
}

#answer_enroll {
	margin-top: 6px;
	margin-left: 434px;
	position: absolute;
	color: #00a9d4;
	background: white;
	border: 1px solid #00a9d4;
}

/*Q&A 삭제*/
.delete_qna {
	float: right;
	cursor: pointer;
}

#deleteQuestion {
	margin-top: -22px;
	margin-right: 10px;
	position: relative;
}

/*수정 삭제*/
#modify, #delete {
	background: black;
	color: white;
	border: 2px solid black;
}

#modify:hover, #delete:hover {
	background: lightgray;
	color: black;
	border: 2px solid lightgray;
}

#successNoticeBox{
display:none;
}

#SNBContent {
border: 2px solid darkgray;
text-align:center;
padding:3%;
width:fit-content;

}

/*장바구니 담김완료 CSS*/
.noticeButton {
	
	position: relative;
	display: block;
	height: 45px;
	width: 150px;
	margin: 10px 7px;
	padding: 5px 5px;
	font-weight: 700;
	font-size: 15px;
	letter-spacing: 2px;
	color: #383736;
	border-radius: 4px;
	text-transform: uppercase;
	outline: 0;
	overflow: hidden;
	background: none;
	z-index: 1;
	cursor: pointer;
	transition: 0.08s ease-in;
	-o-transition: 0.08s ease-in;
	-ms-transition: 0.08s ease-in;
	-moz-transition: 0.08s ease-in;
	-webkit-transition: 0.08s ease-in;
}

#paging{
	text-align: center;
    margin-top: 15px;
}
#paging > a{
	padding-right:5px;
}
</style>
</head>
<body>

	<c:set var="fleaName" value="${fleaName }" />
	<form name="detail">
		<div id="wrap">
			<input type="hidden" id="command" name="command" value="">
			<c:forEach var="product" items="${detail}" varStatus="status">
				<input type="hidden" id="prod_memberId" value="${product.memberId }">
				<input type="hidden" id="prod_number" name="prod_number" value="${product.prod_number }">
				<div class="category">
				<c:if test="${product.flea_yn == 'y' }">
					<a href="./fleaMain.do">플리마켓</a>
				</c:if>
				<c:if test="${product.auction_yn == 'y' }">
					<a href="./eachMain.do?command=auction">경매</a>
				</c:if>
				<c:if test="${product.reused_yn == 'y' }">
					<a href="./eachMain.do?command=reused">중고</a>
				</c:if>
					>
					<c:forEach var="high_category" items="${high_category }">
				${high_category.category_name }
				<input type="hidden" name="high_category"
							value="${high_category.category_code }">
					</c:forEach>
					>
					<c:forEach var="middle_category" items="${middle_category }">
				${middle_category.category_name }
				<input type="hidden" name="middle_category"
							value="${middle_category.category_code }">
						<input type="hidden" name="prod_category_code"
							value="${middle_category.category_code }" />
					</c:forEach>
				</div>
				<div class="up">
					<div class="mainImg">
						<!-- 상품 대표 이미지 -->
						<a href="${product.represent_image }" rel="prettyPhoto"
							title="This is the description"><img
							src="${product.represent_image }" alt="This is the title" /></a>
					</div>

					<div class="description">
						<!-- 상품 설명 -->
						<c:if test="${product.reused_yn == 'y' }">
							<!-- 상품 판매 카테고리 -->
							<span> 중고 </span>
							<input type="hidden" name="reused_yn" value="y">
						</c:if>
						<c:if test="${product.reused_yn == 'n' }">
							<!-- 상품 판매 카테고리 -->

							<input type="hidden" name="reused_yn" value="n">
						</c:if>
						<c:if test="${product.auction_yn == 'y' }">
							<span> 경매 </span>
							<input type="hidden" name="auction_yn" value="y">
						</c:if>
						<c:if test="${product.auction_yn == 'n' }">
							<input type="hidden" name="auction_yn" value="n">
						</c:if>
						<c:if test="${product.auction_yn == 'w' }">
							<!-- 시간내에 경매 낙찰 됐을 경우 -->
							<span>경매</span>
							<input type="hidden" name="auction_yn" value="w">
						</c:if>
						<c:if test="${product.auction_yn == 'f' }">
							<!-- 시간내에 경매 낙찰 되지 않았을 경우 -->
							<span>경매</span>
							<input type="hidden" name="auction_yn" value="f">
						</c:if>
						<c:if test="${product.flea_yn == 'y' }">
							<span> 플리 </span>
							<input type="hidden" name="flea_yn" value="y">
						</c:if>
						<c:if test="${product.flea_yn == 'n' }">
							<input type="hidden" name="flea_yn" value="n">
						</c:if>
						<c:if test="${product.memberId == member.getMemberid()}">
							<div class="writer_option"
								style="float: right; margin-top: -30px;">
								<input type="button" id="modify" value="수정"> <input
									type="button" id="delete" value="삭제">
							</div>
						</c:if>
						<h1>${product.prod_title}</h1>

						<input type="hidden" id="prod_title"
							value="${product.prod_title }">
						<c:if test="${product.flea_yn == 'y' }">
							<!-- 플리마켓에 올라온 상품인 경우 플리마켓명도 함께 표시 -->
							<h3 id="gray-text"><a href="./fleaMystore.do?flea_code=${product.fleamarket}">${fleaName }</a><a href="./sellerPage.do?memberId=${product.memberId }">(${product.memberId })</a></h3>
						</c:if>
						<c:if test="${product.flea_yn == 'n' }">
							<h3 id="gray-text"><a href="./sellerPage.do?memberId=${product.memberId }">${product.memberId }</a></h3>
						</c:if>
						<br>
						<c:choose>
							<c:when test="${product.auction_yn == 'y' }">
								<!-- 경매 상품이면 시작가와 현재가를 표시해준다. -->
								<span class="price" id="sold_price"><fmt:formatNumber
										value="${product.auction_bid }" type="number" />원</span>
								<!-- 현재가 -->
								<span id="auction_price">시작가: <fmt:formatNumber
										value="${product.auction_price }" type="number" />원
								</span>
								<!-- 시작가 -->
								<a href="./bidRecord.do?prod_number=${product.prod_number }"
									style="font-size: medium; padding: 5px;"><u>경매기록</u></a>
							</c:when>
							<%-- 					<c:when test="${(product.auction_yn == 'f' and product.reused_yn == 'n' and product.flea_yn == 'n') or (product.auction_yn == 'w' and product.reused_yn == 'n' and product.flea_yn == 'n')}"> --%>
							<%-- 						<span class="price" id="sold_price"><fmt:formatNumber value="${product.auction_bid }" type="number" />원</span><!-- 현재가 --> --%>
							<%-- 						<span id="auction_price">시작가: <fmt:formatNumber value="${product.auction_price }" type="number" />원</span><!-- 시작가 --> --%>
							<%-- 						<a href="./bidRecord.do?prod_number=${product.prod_number }" style="font-size:medium; padding:5px;"><u>경매기록</u></a> --%>
							<%-- 					</c:when> --%>
							<c:otherwise>
								<!-- 경매가 아닌 상품들 -->
								<c:if test="${product.sale_percent != null }">
									<!-- 세일 퍼센트가 존재한다면 -->
									<span class="price">${product.sale_percent}%</span>
									<span class="price" id="sold_price" ><fmt:formatNumber
											value="${product.prod_price * (1-(product.sale_percent*0.01)) }"
											type="number" />원</span>
									<span id="sale_price" name="sold_price"><fmt:formatNumber
											value="${product.prod_price }" type="number" />원</span>
									<c:if
										test="${product.auction_yn == 'w' or product.auction_yn == 'f' }">
										<a href="./bidRecord.do?prod_number=${product.prod_number }"
											style="font-size: medium; padding: 5px;"><u>경매기록</u></a>
									</c:if>
									<input type="hidden" id="prod_price" name="sold_price"
										value="${product.prod_price * (1-(product.sale_percent*0.01)) }">

								</c:if>
								<c:if test="${product.sale_percent == null }">
									<!-- 세일 퍼센트가 존재하지 않는다면 -->
									<span class="price" id="sold_price"><fmt:formatNumber
											value="${product.prod_price }" type="number" />원</span>
									<c:if
										test="${product.auction_yn == 'w' or product.auction_yn == 'f' }">
										<a href="./bidRecord.do?prod_number=${product.prod_number }"
											style="font-size: medium; padding: 5px;"><u>경매기록</u></a>
									</c:if>
									<input type="hidden" id="prod_price" name="sold_price"
										value="${product.prod_price }">
								</c:if>
							</c:otherwise>
						</c:choose>

						<br>
						<h3 id="gray-text">
							<span class="heart">${product.heart}</span>명의 회원이 관심을 보였어요!
						</h3>
						<br>

						<c:set var="likeProd" value="${likeProd}" />

						<c:if test="${likeProd == null}">
							<div id="heart" name="n">
								<img src="${contextPath }/resources/img/detailProduct/heart.png"
									style="width: 30px; height: 30px;"> 관심 상품
							</div>
						</c:if>
						<c:if test="${likeProd == '0' }">
							<div id="heart" name="n">
								<img src="${contextPath }/resources/img/detailProduct/heart.png"
									style="width: 30px; height: 30px;"> 관심 상품
							</div>
						</c:if>
						<c:if test="${likeProd == '1' }">
							<div id="heart" name="y">
								<img
									src="${contextPath }/resources/img/detailProduct/fillheart.png"
									style="width: 30px; height: 30px;"> 관심 상품
							</div>
						</c:if>

						<br>
						<br>
						<div class="content">
							<c:choose>
						<c:when test="${product.auction_yn == 'y'}"><!-- 경매일 경우 수량은 한 상품 당 1개 -->
<!-- 							수량: <input type="hidden" id="prod_amount" style="width:4%; height:auto; text-align:right;" value="1"> 1 -->
						</c:when>
						<c:otherwise>
							max수량: ${product.prod_amount }
							<br>
							수량: 
							<input type="button" onClick="abuttonClick('minus')" value="-"><input type="number" id="prod_amount" min="1" max="${product.prod_amount }" style="width:4%; height:auto; text-align:right;" value=""><input type="button" onClick="abuttonClick('plus')" value="+">
							<br>
							총 금액: <span id="total"></span>원
						</c:otherwise>
					</c:choose>
							<input type="hidden" id="total_price" name="total_price" value=""> <br>
							<br>
							<div id ="deliveryTypeSection">
								<c:choose>
									<c:when test="${product.send_way == 'direct' }">
										<input type="radio" name="way_check" value="direct"
											checked="checked" id="direct">
										<label for="direct">직거래(장소 : ${product.direct_area })</label>
									</c:when>
									<c:when test="${product.send_way == 'delivery' }">
										<input type="radio" name="way_check" value="delivery"
											checked="checked" id="delivery">
										<label for="delivery">택배거래</label>
									</c:when>
									<c:when test="${product.send_way == 'receipt' }">
										<input type="radio" name="way_check" value="receipt"
											checked="checked" id="receipt">
										<label for="receipt">현장거래</label>
									</c:when>
									<c:otherwise>
										<input type="radio" name="way_check" value="direct"
											checked="checked" id="direct">
										<label for="direct">직거래(장소 : ${product.direct_area })</label>
										<input type="radio" name="way_check" value="delivery"
											id="delivery">
										<label for="delivery">택배거래</label>
									</c:otherwise>
								</c:choose>
								<div class ="successNoticeBox" id="successNoticeBox" style="display:none;"><p id ="SNBContent">장바구니 담기 혹은 수정 성공!<br><br>
								<input type="button" id ="noticeButton" value="창닫기" onClick="closeNotice();">&nbsp&nbsp&nbsp
								<input type="button" id ="noticeButton" value="장바구니" onClick="moveToCart()">
								</p></div>
			
							</div>
							<br>
							<div id="pay">
								<!-- 상품 판매 종료 관리 -->
								<c:choose>
									<c:when
										test="${product.auction_yn == 'f' and product.reused_yn == 'n' and product.flea_yn == 'n' }">
										<!-- 다른 메뉴 선택하지 않고 경매가 입찰되지 않았을 경우 -->
										<p class="alarm">===== 입찰 가능 시간이 지났습니다. =====</p>
										<input type="button" class="pay" id="message" value="메시지로 문의" />
									</c:when>
									<c:when test="${product.auction_yn == 'w' }">
										<!-- 경매가 낙찰됐을 때 -->
										<p class="alarm">===== 판매가 종료되었습니다. =====</p>
									</c:when>
									<c:when test="${product.prod_amount == 0 }">
										<!-- 상품 재고가 없을 때 -->
										<p class="alarm">===== 품절입니다. =====</p>
									</c:when>
									<c:when
										test="${product.auction_yn == 'f' and (product.reused_yn == 'y' or product.flea_yn == 'y') }">
										<!-- 경매 낙찰이 됐거나 경매 낙찰은 되지 않았는데 다른 메뉴도 선택했을 경우 -->
										<p class="alarm">===== 경매는 종료되었습니다.(일반 구매는 가능) =====</p>
									</c:when>
								</c:choose>
								<c:if
									test="${product.auction_yn == 'n' or (product.auction_yn == 'f' and (product.reused_yn == 'y' or product.flea_yn == 'y')) }">
									<c:if test="${member.getMemberid() == product.memberId }">
										<!-- 상품을 올린 사람이면 -->
										<input type="button" class="pay" id="cart" value="장바구니"
											style="background: lightgray;" disabled="disabled" />
										<input type="button" class="pay" id="buy" value="바로 구매"
											style="background: lightgray;" disabled="disabled" />
										<!-- 							<input type="button" class="pay" id="kakaoPay" value="kakaoPay" /> -->
										<input type="button" class="pay" id="message" value="메시지로 문의"
											style="background: lightgray; cursor: default;"
											disabled="disabled" />
									</c:if>
									<c:if test="${member.getMemberid() != product.memberId }">
										<input type="button" class="pay" id="cart" value="장바구니" />
										<input type="button" class="pay" id="buy" value="바로 구매" />
										<!-- 							<input type="button" class="pay" id="kakaoPay" value="kakaoPay" /> -->
										<input type="button" class="pay" id="message" value="메시지로 문의" />
									</c:if>

								</c:if>
								<c:if test="${product.auction_yn == 'y' }">
									<c:forEach var="auction_left_date"
										items="${auction_left_date }">
										<span id="auction_date_cal">${auction_left_date.left_day }
											일 ${auction_left_date.left_hour } 시간
											${auction_left_date.left_min } 분
											${auction_left_date.left_second } 초</span>
										<input type="hidden" id="left_day"
											value="${auction_left_date.left_day }" />
										<input type="hidden" id="left_hour"
											value="${auction_left_date.left_hour }" />
										<input type="hidden" id="left_min"
											value="${auction_left_date.left_min }" />
										<input type="hidden" id="left_second"
											value="${auction_left_date.left_second }" />
									</c:forEach>
									<span id="auction_left_date">남음 (종료 :
										${product.auction_end_date })</span>
									<br>
									<br>
									<c:if test="${member.getMemberid() == product.memberId }">
										<!-- 자신이 올린 상품일 경우 -->
										<input type="button" class="pay" id="bidding" value="입찰하기"
											style="background: lightgray;" disabled="disabled" />
										<input type="button" class="pay" id="message" value="메시지로 문의"
											style="background: lightgray; cursor: default"
											disabled="disabled" />
									</c:if>
									<c:if test="${member.getMemberid() != product.memberId }">
										<input type="button" class="pay" id="bidding" value="입찰하기"
											onclick="window.open('./bidProduct.do?prod_number=${product.prod_number}', 'window팝업', 'width=520, height=620, menubar=no, status=no, toolbar=no')" />
										<input type="button" class="pay" id="message" value="메시지로 문의" onClick="location.href='./chatInit.do?prod_number=${product.prod_number }'">
									</c:if>

								</c:if>


							</div>
						</div>
					</div>
				</div>
				<div class="down">
					<!-- 상품 상세설명, Q&A, 후기 -->
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#detail">상세정보</a></li>
						<li><a data-toggle="tab" href="#QnA">상품 Q&A</a></li>
						<li><a data-toggle="tab" href="#review">상품후기</a></li>
						<!--     <li><a data-toggle="tab" href="#menu3">Menu 3</a></li> -->
					</ul>
					<div class="tab-content">
						<div id="detail" class="tab-pane fade in active">
							<br>
							<h2>상세정보</h2>
							<br>
							<c:forEach var="tags" items="${tags }">
								<!-- 해시태그 출력 -->
								<c:choose>
									<c:when test="${tags == null }">

									</c:when>
									<c:otherwise>
										<c:if test="${tags.tag1 != null }">
											<a class="tag">#${tags.tag1 }</a>&nbsp
					    		</c:if>
										<c:if test="${tags.tag2 != null }">
											<a class="tag">#${tags.tag2 }</a>&nbsp
					    		</c:if>
										<c:if test="${tags.tag3 != null }">
											<a class="tag">#${tags.tag3 }</a>&nbsp
					    		</c:if>
										<c:if test="${tags.tag4 != null }">
											<a class="tag">#${tags.tag4 }</a>&nbsp
					    		</c:if>
										<c:if test="${tags.tag5 != null }">
											<a class="tag">#${tags.tag5 }</a>&nbsp
					    		</c:if>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<br> ${product.editor }
						</div>
						<div id="QnA" class="tab-pane fade">
							<input type="hidden" id="memberId"
								value="${member.getMemberid() }" /> <br>
							<h2>상품 Q&A</h2>
							<br>
							<ul>
								<li>상품 Q&A 게시판을 통한 취소나 환불, 교환, 반품신청은 처리되지 않습니다.</li>
								<li>본 상품과 관련되지 않은 내용이나 비방, 홍보글, 도배글, 개인정보가 포함된 글은 예고없이 삭제될
									수 있습니다.</li>
								<li>홈페이지 에러/장애 문의는 고객센터 또는1:1문의를 이용해주세요.</li>
							</ul>
							<div class="prod_inquiry_wrap">
								<h4>상품 문의</h4>
								<div class="text_area_wrap">
									<c:choose>
										<c:when test="${member.getMemberid() == null }">
											<!-- 로그인 하지 않았을 경우 -->
											<label for="prod_inquiry_text" style=""
												data-placeholder="로그인 후 글을 남길 수 있습니다."
												data-placeholder-for="textarea"></label>
											<textarea name="prod_inquiry_text" id="prod_inquiry_text"
												style="resize: none;" placeholder="로그인 후 글을 남길 수 있습니다."></textarea>
										</c:when>
										<c:when test="${member.getMemberid() == product.memberId }">
											<!-- 상품을 올린 당사자일 경우 -->
											<label for="prod_inquiry_text" style=""
												data-placeholder="판매자는 문의글을 쓸 수 없습니다."
												data-placeholder-for="textarea"></label>
											<textarea name="prod_inquiry_text" id="prod_inquiry_text"
												style="resize: none;" placeholder="판매자는 문의글을 쓸 수 없습니다."
												disabled></textarea>
										</c:when>
										<c:otherwise>
											<!-- 로그인했을 경우 -->
											<label for="prod_inquiry_text" style=""
												data-placeholder="전화번호, 주소, 이메일, 계좌번호 등의 개인정보는 타인에 의해 도용된 위험이 있으니, &#13;&#10;문의 시 입력하지 않도록 주의해 주시기 바랍니다."
												data-placeholder-for="textarea"></label>
											<textarea name="prod_inquiry_text" id="prod_inquiry_text"
												style="resize: none;"
												placeholder="전화번호, 주소, 이메일, 계좌번호 등의 개인정보는 타인에 의해 도용된 위험이 있으니, &#13;&#10;문의 시 입력하지 않도록 주의해 주시기 바랍니다."></textarea>
										</c:otherwise>
									</c:choose>
								</div>
								<br>
								<div class="secretBox">
									<input type="checkbox" name="secret" id="secretSelect"
										value="n"><label for="secretSelect">비밀글</label>
								</div>
								<div class="btn_area">
									<input type="button" class="enrollInquiry" id="buy" value="등록">
									<input type="button" class="cancelInquiry" id="cart" value="취소">
								</div>
							</div>
							<br>
							<br>
							<div class="listWrapper">
								<div class="iqry_comments_area">
									<ul class="list_comment_inqury">
										<c:forEach var="prodQnA" items="${prodQnA }">
											<li><a href="javascript:void(0)" class="faq_open"
												id="${prodQnA.qna_number }" name="${prodQnA.secret_yn }">
													<input type="hidden" id="qna_memberId"
													value="${prodQnA.memberId }">
													<div class="cate" id="cate${prodQnA.qna_number }">
														<c:if test="${prodQnA.answer_yn == 'y' }">
															<!-- 답변이 있으면 -->
													답변 완료
												</c:if>
														<c:if test="${prodQnA.answer_yn == 'n' }">
															<!-- 답변이 있으면 -->
															<p id="waitAnswer">답변 대기</p>
														</c:if>
													</div>
													<div class="cont_box">
														<span class="inquiry_prod">${product.prod_title }</span>
														<c:if test="${prodQnA.secret_yn == 'y' }">
															<!-- 비밀글일 경우 -->
															<c:if
																test="${member.getMemberid() == prodQnA.memberId or member.getMemberid() == product.memberId }">
																<!-- 글 작성자이거나 상품 작성자인 경우 -->
																<span class="inquiry_text" id="contText"
																	style="font-weight: bold;">${prodQnA.qna_content }</span>
															</c:if>
															<c:if
																test="${member.getMemberid() != prodQnA.memberId and member.getMemberid() != product.memberId }">
																<!-- 글작성자가 아닐 경우 -->
																<span class="inquiry_text" id="secret_text"
																	style="font-weight: bold;">비밀글입니다.<img
																	src="${contextPath }/resources/img/detailProduct/secret.png"
																	style="width: 20px;"></span>
															</c:if>
														</c:if>
														<c:if test="${prodQnA.secret_yn == 'n' }">
															<span class="inquiry_text" id="contText"
																style="font-weight: bold;">${prodQnA.qna_content }</span>
														</c:if>
													</div>
													<div class="user">
														<span class="member${prodQnA.qna_number }">${prodQnA.secretMember }</span>
													</div>
													<div class="date">
														<span>${prodQnA.qna_date }</span>
													</div>

											</a>

												<div class="faq_cont" style="display: none;"
													data-qna="listContents" data-open="open"
													id="a${prodQnA.qna_number }">
													<div class="question">${prodQnA.qna_content }</div>

													<c:if test="${prodQnA.memberId == member.getMemberid() }">
														<!-- 자신이 쓴 q&a 내용 삭제할 수 있음 -->
														<p class="delete_qna" id="deleteQuestion">
															<u>삭제</u>
														</p>
													</c:if>
													<c:choose>
														<c:when
															test="${product.memberId == member.getMemberid() }">
															<!-- 글작성자일 경우 -->
															<c:if test="${prodQnA.answer_yn == 'n' }">
																<div class="answer" id="answer${prodQnA.qna_number }"
																	style="display: block;">
																	<span class="ico asw">답변</span> <span class="tit_asw">판매자
																		<textarea id="answer_write" style="resize: none;"></textarea>
																		<input type="button" id="answer_enroll"
																		class="answer_enroll" value="답변달기">
																	</span>
																</div>
															</c:if>
															<c:if test="${prodQnA.answer_yn == 'y' }">
																<div class="answer" id="answer${prodQnA.qna_number }"
																	style="display: block;">
																	<span class="ico asw">답변</span> <span class="tit_asw">판매자
																		<span>${prodQnA.answer_date }</span>
																	</span> ${prodQnA.answer_content }
																	<p class="delete_qna" id="deleteAnswer">
																		<u>삭제</u>
																	</p>
																</div>
															</c:if>
														</c:when>
														<c:otherwise>
															<!-- 글작성자가 아닐 경우 -->
															<c:if test="${prodQnA.answer_yn == 'n' }">
																<!-- 답변이 달린 경우 -->
																<div class="answer" id="answer${prodQnA.qna_number }"
																	style="display: none;">
																	<span class="ico asw">${prodQnA.answer_content }</span>

																	<span class="tit_asw">판매자 <span>${prodQnA.answer_date }</span>
																	</span>
																</div>
															</c:if>
															<c:if test="${prodQnA.answer_yn == 'y' }">
																<!-- 답변이 달리지 않은 경우 -->
																<div class="answer" id="answer${prodQnA.qna_number }"
																	style="display: block;">
																	<span class="ico asw">답변</span> <span class="tit_asw">판매자
																		<span>${prodQnA.answer_date }</span>
																	</span> ${prodQnA.answer_content }

																</div>
															</c:if>
														</c:otherwise>
													</c:choose>
												</div></li>
										</c:forEach>
									</ul>
			
								</div>
								<c:set var="qnaCnt" value="${qnaCnt }"/>
								<c:set var="currentPage" value="${currentPage }"/>
								<input type="hidden" id="qnaCnt" value="${qnaCnt }">
								<c:if test="${qnaCnt != 0 }">
									<div class="paging_comm" id="paging">
									<c:choose>
										<c:when test="${qnaCnt%10 == 0 }">
											<c:forEach var="i" begin="1" end="${qnaCnt/10 }" step="1">
										
												<c:if test="${i == currentPage }">
												 	 <a style="color:orange;"><c:out value="${i }" /></a>
												</c:if>
												<c:if test="${i != currentPage }">
													 <a><c:out value="${i }" /></a>
												</c:if>
											   
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="i" begin="1" end="${qnaCnt/10 + 1 }" step="1">
										
												<c:if test="${i == currentPage }">
												 	 <a style="color:orange;"><c:out value="${i }" /></a>
												</c:if>
												<c:if test="${i != currentPage }">
													 <a><c:out value="${i }" /></a>
												</c:if>
											   
											</c:forEach>
										</c:otherwise>
									</c:choose>
										
									</div>
								</c:if>
							</div>
						</div>
						<div id="review" class="tab-pane fade">
							<h2>상품후기</h2>
							<p>Sed ut perspiciatis unde omnis iste natus error sit
								voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
						</div>
						<!-- <div id="menu3" class="tab-pane fade">
			      <h3>Menu 3</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div> -->
					</div>
				</div>
			</c:forEach>
		</div>
	</form>
</body>
</html>
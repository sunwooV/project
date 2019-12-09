	$(document).ready(function(){
		var now = window.location.href;
		var loginCheck = document.getElementById("memberId").value;
		var num = 0;
		
		
		
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
							},
							error:function(data, textStatus){
								alert("장바구니에 수정 실패")
							},
							complete : function(data, textStatus){
								alert("장바구니에 상품 옵션 수정완료!")				
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
				
							},
							error:function(data, textStatus){
								alert("장바구니에 상품담기 실패")
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
		

	 
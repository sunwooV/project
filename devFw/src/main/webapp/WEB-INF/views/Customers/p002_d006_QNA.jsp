<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/Mypage.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">
<style>
#event_td{
    text-align: center;
}
#answer{
	 padding-left: 100px;
	 text-align:left;
}
#answer_content{
	 margin-left: 25px;
    font-size: medium;
    color: black;
}
.delete{
	cursor:pointer;
}
.question{
	border-bottom: 1px solid lightgray;	
}
#nonhover:hover{
	background:white;
}
#paging{
	text-align: center;
    margin-top: 15px;
}
#paging > a{
	padding-right:5px;
	cursor:pointer;
}

#minTable{
	    min-height: 989px;
}
#selectDelete{
	background: #424242;
    color: white;
    border: 1px solid #424242;
}
#allDelete{
	background: white;
    color: #424242;
    border: 1px solid #424242;
}
</style>
<script>

	//질문 삭제 버튼
	$(document).on('click', '.delete', function(){
		var id=$(this).attr("id");
		
		var number = id.split(',');
		var prod_number = number[0];
		var qna_number = number[1];
		
		if(confirm("해당 상품 Q&A를 정말 삭제하시겠습니까?")){
			var oc = document.getElementById(id);
			oc.dataset.deleteyn = "yes";
			
			var deleteqnaInfo = {
					prod_number:prod_number,
					qna_number:qna_number
			}
			
			$.ajax({
				type: "post",
				async: false,
				url: "/devFw/mypageDeleteqna.do",
				data: deleteqnaInfo,
				dataType : 'text',
				success: function(responseData){
					var data = JSON.parse(responseData);
					var list = "";
					
					list += '<tr id="nonhover">'
						 + '<th>상품</th>'
						 + '<th>내용</th>'
						 + '<th>작성일</th>'
						 + '<th>답변여부</th>'
						 + '<th>삭제</th>'
						 + '</tr>';

					for(var i=0;i<data.length;i++){
						list += '<tr class="question" id="'+data[i].prod_number + ' ' + data[i].qna_number + '" data-oc="close">'
							 + '<td><a href="./detail.do?prod_number='+ data[i].prod_number + '"><img src="'+ data[i].represent_image + '" width="75px" height="75px"></a></td>'
							 + 	'<td style="width: 43%;">'+ data[i].qna_content + '</td>'
							 + 	'<td>'+ data[i].qna_date + '</td>'
							 + 	'<td>';
							 if(data[i].answer_yn == 'y'){
								 list += 'O';
							 } else {
								 list += 'X';
							 }
							 list += '</td>'
							 	  + '<td style="width: 9%;"><a class="delete" id="'+ data[i].prod_number + ','+ data[i].qna_number + '" data-deleteyn="no">삭제</a></td>'
								  + '</tr>'
							//답변
								  + '<tr style="border-bottom:1px solid lightgray; display:none;" id="a'+ data[i].prod_number + data[i].qna_number + '" data-oc="close">';
							if(data[i].answer_yn == 'y'){
								list += '	<td colspan="4" id="answer">└<span style="background:gray; color:white; width:fit-content;">답변</span><span id="answer_content">${qna.answer_content }</span></td>'
									  + '	<td>${qna.answer_date }</td>';
							} else {
								list += '	<td colspan="5" id="answer"><span id="answer_content">아직 답변이 없습니다.</span></td>';
							}

								list += '</tr>';
					}
				
					$("#event_td").html(list);
					
					console.log("삭제 완료");
					
				},
				error: function(data, textStatus){
					alert("다시 시도해주세요.");
				},
				complete : function (data, textstatus){
				}
			});
			
		} else{
			return false;
		}

	});
	
	//질문 클릭 시 답변 보이게
	$(document).on('click', '.question', function(){
		var id=$(this).attr("id");
		
		var split = id.split(' ');
		var oc = document.getElementById("a" + split[0] + split[1]);
		
		var oc2 = document.getElementById(split[0] + "," + split[1]);

		if(oc2.dataset.deleteyn == 'no'){
			if(oc.dataset.oc == 'close'){
				$("#a" + split[0] + split[1]).css("display", "");
				oc.dataset.oc = 'open';
			} else {
				$("#a" + split[0] + split[1]).css("display", "none");
				oc.dataset.oc = 'close';
			}
		}
		
		
	});		
	
	
	//paging
	$(document).on('click', '#paging a', function(){ 
        var $item = $(this);
        var $id = $item.attr("id");
        var selectedPage = $item.text();
        
        if($id == "next")    selectedPage = next;
        if($id == "prev")    selectedPage = prev;
        
		var memberId = $("#memberId").val(); //로그인한 아이디
		var qnaCnt = $("#qnaCnt").val();
        
        var page={
        		currentPage:selectedPage
        }
        
        $.ajax({
			type: "post",
			async: false,
			url: "/devFw/pagingMyqna.do",
			data: page,
			dataType : 'text',
			success: function(responseData){
				var data = JSON.parse(responseData);
			
				var list = "";
				
					list += '<tr id="nonhover">'
						 + '<th>상품</th>'
						 + '<th>내용</th>'
						 + '<th>작성일</th>'
						 + '<th>답변여부</th>'
						 + '<th>삭제</th>'
						 + '</tr>';

					for(var i=0;i<data.length;i++){
						list += '<tr class="question" id="'+data[i].prod_number + ' ' + data[i].qna_number + '" data-oc="close">'
							 + '<td><a href="./detail.do?prod_number='+ data[i].prod_number + '"><img src="'+ data[i].represent_image + '" width="75px" height="75px"></a></td>'
							 + 	'<td style="width: 43%;">'+ data[i].qna_content + '</td>'
							 + 	'<td>'+ data[i].qna_date + '</td>'
							 + 	'<td>';
							 if(data[i].answer_yn == 'y'){
								 list += 'O';
							 } else {
								 list += 'X';
							 }
							 list += '</td>'
							 	  + '<td style="width: 9%;"><a class="delete" id="'+ data[i].prod_number + ','+ data[i].qna_number + '" data-deleteyn="no">삭제</a></td>'
								  + '</tr>'
							//답변
								  + '<tr style="border-bottom:1px solid lightgray; display:none;" id="a'+ data[i].prod_number + data[i].qna_number + '" data-oc="close">';
							if(data[i].answer_yn == 'y'){
								list += '	<td colspan="4" id="answer">└<span style="background:gray; color:white; width:fit-content;">답변</span><span id="answer_content">${qna.answer_content }</span></td>'
									  + '	<td>${qna.answer_date }</td>';
							} else {
								list += '	<td colspan="5" id="answer"><span id="answer_content">아직 답변이 없습니다.</span></td>';
							}

								list += '</tr>';
					}
				
					$("#event_td").html(list);
				
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
	
	$(document).on('click', '.deleteProd', function(){
		var id = $(this).attr('id');
		var frm = document.sellerProduct;
		var myProductCheck = $("input:checkbox[name='myProductCheck']").is(":checked");
		var checkProd = document.getElementsByName("myProductCheck");

		if(id == 'selectDelete'){
			if(myProductCheck == false){
				alert("선택된 상품이 없습니다.");
				return false;
			} else {
				document.getElementById("division").value = id;
			}
		} else{
			//모두 체크해서 보내기
			for(i=0; i < checkProd.length; i++) {
				checkProd[i].checked = true;
			}
			document.getElementById("division").value = id;
		}
		
		if(confirm("정말 삭제하시겠습니까?")){

			frm.method="post";
			frm.action="/devFw/sellerPage.do";
			frm.submit();

		} else { //alert 취소 버튼 눌렀을 경우
			return false;
		}
	});
	
</script>
</head>
<body>
<c:set var="sellerId" value="${sellerId }"/>
<c:set var="seller" value="${seller }"/>
<c:set var="seller_group" value="${seller_group }"/>
<c:set var="flea_seller_group" value="${flea_seller_group }"/>

		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
	<div class="container">

<br><br>
			<h1>게시글 관리</h1>
			<br><hr><br>
			<form name="sellerProduct" method="post" encType="UTF-8">
					<ul class="nav nav-tabs">
						<c:if test="${seller_group == 'y  ' or seller_group == 'Y  ' }"> <!-- 판매자이면 -->
							<li class="active"><a data-toggle="tab" href="#sellProd">판매 물품</a></li>
							<li><a data-toggle="tab" href="#qna">상품 Q&A</a></li>
						</c:if>
						<c:if test="${seller_group == 'n  ' or seller_group == 'N  ' }">
							<li class="active"><a data-toggle="tab" href="#qna">상품 Q&A</a></li>
						</c:if>
						<li><a data-toggle="tab" href="#review">상품 후기</a></li>
					</ul>
					<div class="tab-content">
					<c:choose>
						<c:when test="${seller_group == 'y  ' or seller_group == 'Y  ' }">
							<!-- sellProd -->
							<div id="sellProd" class="tab-pane fade in active">
							<br>
							<h3>판매 물품</h3>
							<br>
							<div class="row">
									<c:forEach var="product" items="${sellerProduct }" varStatus="status">
										<div class="col-sm-3">
											<div class="thumbnail">
												<input type="checkbox" name="myProductCheck" id="myProductCheck" value="${product.prod_number }">
												
												<c:if test="${product.reused_yn == 'y' }">
													<!-- 상품 판매 카테고리 -->
													<span class="group">중고</span>
												</c:if>
												<c:if test="${product.auction_yn == 'y' or product.auction_yn == 'w' or product.auction_yn == 'f'}">
													<span class="group">경매</span>
												</c:if>
												<c:if test="${product.flea_yn == 'y' }">
													<span class="group">플리</span>
												</c:if>
												<c:if test="${product.auction_yn == 'y' }">
													<span class="group" style="color:red;">(경매 진행 중)</span>
												</c:if>
												<img src="${product.represent_image }"
													style="width: 230px; height: 240px;" alt="..."
													onclick="location.href='./detail.do?prod_number=${product.prod_number }'">
												<div class="caption">
													<h3>${product.prod_title }
														<c:if test="${product.sale_percent != null }">
														[${product.sale_percent }%]
													</c:if>
													</h3>
													<c:choose>
														<c:when test="${product.auction_yn == 'y' }">
															<p id="p">
																<fmt:formatNumber value="${product.auction_bid }"
																	type="number" />
																원 
															</p>
														</c:when>
														<c:when test="${((product.auction_yn == 'f' or product.auction_yn == 'w') and product.reused_yn == 'n' and product.flea_yn == 'n') or product.prod_amount == 0}">
															<p id="p" style="color:red; font-weight:bold">품절</p>
														</c:when>
														<c:otherwise>
															<c:if test="${product.sale_percent != null }">
																<p>
																	<span id="p"><fmt:formatNumber
																			value="${product.prod_price * (1-(product.sale_percent*0.01)) }"
																			type="number" />원</span> <span id="sale_price"
																		style="margin-bottom: 1re;"><fmt:formatNumber
																			value="${product.prod_price }" type="number" />원</span>
																</p>
															</c:if>
															<c:if test="${product.sale_percent == null }">
																<p id="p">
																	<fmt:formatNumber value="${product.prod_price }"
																		type="number" />
																	원
																</p>
															</c:if>
														</c:otherwise>
													</c:choose>
							
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
				
								<div id="sellerButton">
									<input type="hidden" name="prev" value="mypage">
									<input type="hidden" name="memberId" value="${sellerId }"/>
									<input type="hidden" class="division" name="division" id="division" value="">
									<input type="button" class="deleteProd" id="selectDelete" value="선택상품삭제">
									<input type="button" class="deleteProd" id="allDelete" value="전체상품삭제">
								</div>
							</div>
							<div id="qna" class="tab-pane fade">
							<br>
							<h3>상품 Q&A</h3>
							<br>
							<div id="minTable">
								<table class="table table-hover" id="event_td">
									<tr id="nonhover">
										<th>상품</th>
										<th>내용</th>
										<th>작성일</th>
										<th>답변여부</th>
										<th>삭제</th>
									</tr>
			
									<c:forEach var="qna" items="${qnaList}" varStatus='index'>
										<!-- 질문 -->
										<tr class="question" id="${qna.prod_number } ${qna.qna_number}">
											<td><a  href="./detail.do?prod_number=${qna.prod_number }"><img src="${qna.represent_image}" width="75px" height="75px"></a></td>
											<td style="width: 43%;">${qna.qna_content}</td>
											<td>${qna.qna_date}</td>
											<td><c:if test="${qna.answer_yn == 'y' }">O</c:if><c:if test="${qna.answer_yn == 'n' }">X</c:if></td>
											<td style="width: 9%;"><a class="delete" id="${qna.prod_number },${qna.qna_number }" data-deleteyn="no">삭제</a></td>
										</tr>
										<!-- 답변 -->
									 	<tr style="border-bottom:1px solid lightgray; display:none;" id="a${qna.prod_number }${qna.qna_number}" data-oc="close">
											<c:if test="${qna.answer_yn == 'y' }">
												<td colspan="4" id="answer">└<span style="background:gray; color:white; width:fit-content;">답변</span><span id="answer_content">${qna.answer_content }</span></td>
												<td>${qna.answer_date }</td>
											</c:if>
											<c:if test="${qna.answer_yn == 'n' }">
												<td colspan="5" id="answer"><span id="answer_content">아직 답변이 없습니다.</span></td>
											
											</c:if>
										</tr>
									</c:forEach>
								</table>
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
						</c:when>
						
						<c:otherwise>
						
						<!-- 상품 Q&A -->
						<div id="qna" class="tab-pane fade">
						<br>
						<h3>상품 Q&A</h3>
						<br>
						<div id="minTable">
							<table class="table table-hover" id="event_td">
								<tr id="nonhover">
									<th>상품</th>
									<th>내용</th>
									<th>작성일</th>
									<th>답변여부</th>
									<th>삭제</th>
								</tr>
		
								<c:forEach var="qna" items="${qnaList}" varStatus='index'>
									<!-- 질문 -->
									<tr class="question" id="${qna.prod_number } ${qna.qna_number}">
										<td><a  href="./detail.do?prod_number=${qna.prod_number }"><img src="${qna.represent_image}" width="75px" height="75px"></a></td>
										<td style="width: 43%;">${qna.qna_content}</td>
										<td>${qna.qna_date}</td>
										<td><c:if test="${qna.answer_yn == 'y' }">O</c:if><c:if test="${qna.answer_yn == 'n' }">X</c:if></td>
										<td style="width: 9%;"><a class="delete" id="${qna.prod_number },${qna.qna_number }" data-deleteyn="no">삭제</a></td>
									</tr>
									<!-- 답변 -->
								 	<tr style="border-bottom:1px solid lightgray; display:none;" id="a${qna.prod_number }${qna.qna_number}" data-oc="close">
										<c:if test="${qna.answer_yn == 'y' }">
											<td colspan="4" id="answer">└<span style="background:gray; color:white; width:fit-content;">답변</span><span id="answer_content">${qna.answer_content }</span></td>
											<td>${qna.answer_date }</td>
										</c:if>
										<c:if test="${qna.answer_yn == 'n' }">
											<td colspan="5" id="answer"><span id="answer_content">아직 답변이 없습니다.</span></td>
										
										</c:if>
									</tr>
								</c:forEach>
							</table>
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
						</c:otherwise>
					</c:choose>
						
						<!-------------------------------------------------------------------------------->
						
						<!-- 상품 후기 -->
						<div id="review" class="tab-pane fade">
							<br>
						<h3>상품 후기</h3>
						<br>
							
						</div>
						
						
					</div>
			</form>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
						list += '<tr class="question" id="'+data[i].prod_number + ' ' + data[i].qna_number + '">'
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
								  + '</tr>';
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
	
</script>
</head>
<body>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
<!-- 	<div class="container-fluid" -->
<!-- 		style="padding-left: 19%; padding-top: 3%; margin-right: -4%;"> -->
<!-- 		<div class="col-sm-2" id="col"> -->

<!-- 			<div class="table" id="sidebar" -->
<!-- 				style="font-size: 13px; border: 1px solid black;"> -->
<!-- 				<h1 style="font-size: 21px;">✔마이페이지</h1> -->
<%-- 				<li><a href="${contextPath}/detail1.do">주문 조회</a></li> --%>
<%-- 				<li><a href="${contextPath}/detail2.do">장바구니</a></li> --%>
<%-- 				<li><a href="${contextPath}/detail3.do">포인트</a></li> --%>
<%-- 				<li><a href="${contextPath}/detail4.do">관심상품</a></li> --%>
<%-- 				<li><a href="${contextPath}/detail4.do">게시글 관리</a></li> --%>
<%-- 				<li><a href="${contextPath}/detail4.do">탈퇴 하기</a></li> --%>
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- 사이드바------------------------------------------------------------------------------------------------------------------------ -->
	<div class="container">
<!-- 		<div class="col-sm-10" -->
<!-- 			style="padding-right: 11%; padding-left: 2%; font-size: 37px;"> -->
<br><br>
			<h1>게시글 관리</h1>
			<br><hr><br>
			<form name="frm" method="post" encType="UTF-8">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#qna">상품 Q&A</a></li>
						<li><a data-toggle="tab" href="#review">상품 후기</a></li>
					</ul>
					<div class="tab-content">
						<div id="qna" class="tab-pane fade in active">
						<br><br>
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
						<div id="review" class="tab-pane fade">
							
						</div>
<!-- 					<table class="table table-hover" id="evnet_td"> -->
<!-- 						<tr> -->
<!-- 							<th>상품번호</th> -->
<!-- 							<th>내용</th> -->
<!-- 							<th>답변여부</th> -->
<!-- 						</tr> -->

<%-- 						<c:forEach var="qna" items="${qnaList}" varStatus='index'> --%>
<!-- 							<tr> -->
<%-- 								<td>${qna.prod_number}</td> --%>
<%-- 								<td>${qna.qna_content}</td> --%>
<%-- 								<td>${qna.answer_YN}</td> --%>

<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<!-- 					</table> -->


<!-- 					<div style="padding-left: 46%; font-size: 12px;"> -->
<%-- 						<c:if test="${paging.startPage != 1 }"> --%>
<!-- 							<a -->
<%-- 								href="${contextPath}/event.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"><span --%>
<!-- 								class="glyphicon glyphicon-triangle-left" aria-hidden="true"> -->
<!-- 							</span></a> -->
<%-- 						</c:if> --%>
<%-- 						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" --%>
<%-- 							var="p"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${p == paging.nowPage }"> --%>
<%-- 									<b>${p }</b> --%>
<%-- 								</c:when> --%>
<%-- 								<c:when test="${p != paging.nowPage }"> --%>
<!-- 									<a -->
<%-- 										href="${contextPath}/event.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a> --%>
<%-- 								</c:when> --%>
<%-- 							</c:choose> --%>
<%-- 						</c:forEach> --%>
<%-- 						<c:if test="${paging.endPage != paging.lastPage}"> --%>
<!-- 							<a -->
<%-- 								href="${contextPath}/event.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a> --%>
<%-- 						</c:if> --%>
<!-- 					</div> -->



				</div>
			</form>
<!-- 		</div> -->
	</div>
</body>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "${contextPath}/event.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
</html>

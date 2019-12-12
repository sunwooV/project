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
									<c:forEach var="i" begin="1" end="${qnaCnt/10 + 1 }" step="1">
									
										<c:if test="${i == currentPage }">
										 	 <a style="color:orange;"><c:out value="${i }" /></a>
										</c:if>
										<c:if test="${i != currentPage }">
											 <a><c:out value="${i }" /></a>
										</c:if>
									   
									</c:forEach>
								</div>
							</c:if>
						</div>
						
						<!-------------------------------------------------------------------------------->
						
						<!-- 상품 후기 -->
						<div id="review" class="tab-pane fade">
							<br>
						<h3>상품 후기</h3>
						<br>
							<table class="table table-hover" id="event_td">
								<tr id="nonhover">
									<th>상품</th>
									<th>내용</th>
									<th>작성일</th>
									<th>별점</th>
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
				</div>
			</form>
	</div>
</body>
</html>

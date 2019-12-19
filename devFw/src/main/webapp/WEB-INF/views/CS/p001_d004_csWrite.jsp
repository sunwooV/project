<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼 은도끼|고객센터 문의내역 작성하기</title>
<script type="text/javascript">


	//문의내역 넘기는 함수
	$(document).on('click', '#write', function(){
	
		var frm = document.privatedetaill;
		
		var str = $('#private_qna_content').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#private_qna_content').val(str);

		frm.method="post";
		frm.action="./insertboard.do";
		frm.submit();
	});
	
	//작성취소 후 이전화면으로 돌아가기
	function cancelCsWrite() {
		history.back(-1);
	}
	
	//게시글 수정
	$(document).on('click', '#modify', function(){
	
		var frm = document.privatedetail;
		
		var str = $('#private_qna_content').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#private_qna_content').val(str);
	
		frm.method="post";
		frm.action="./updateboard.do";
		frm.submit();
	});
	
</script>
<style type="text/css">
.csWrite {
	text-align: center;
}

.csWriteDetail {
	width: 700px;
	height: 400px;
}

.csWriteHeader {
	text-align: center;
	padding: 3%;
}

.csWriteSubmitButton {
	text-align: center;
	padding: 3%;
}

.csWriteSubmitButton button {
	width: 100px;
	height: 30px;
	background-color: darkgray;
	color: white;
}
#modify,#write{
width: 100px;
	height: 30px;
	background-color: darkgray;
	color: white;
}

.selectOption, .csWriteTitle {
	text-align: left;
	margin-left: 32%;
	padding-bottom: 1%;
}

.selectQuestionType, .input_csWriteTitle {
	width: 500px;
}
</style>
</head>
<body>
<form name="privatedetail">
<c:set var="command" value="${command }" />
	<c:if test="${command == 'modify' }">
<div id="csWriteHeader" class="csWriteHeader">
		<h2>문의 상세내역 작성</h2>
	</div>
	<c:forEach var="boardinfo" items="${boardinfo}" >
	<input type="hidden" id="private_memberid" name ="private_memberid" value="${member.getMemberid() }" />
	<input type="hidden" id="private_qna_num" name ="private_qna_num" value="${boardinfo.private_qna_num}" />
		<div class="csWriteTitle">
		글 제목 :
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" id="private_qna_title" name="private_qna_title" class="input_csWriteTitle" value="${boardinfo.private_qna_title }" required>
	</div>

	<div class="selectOption" id="selectOption">
		문의 유형을 선택하세요: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<c:forEach var="boardnumlist" items="${boardnumlist}" >
		<select name="board_num" class="selectQuestionType" id="selectQuestionType" required>
			<option id="board_num" value="${boardnumlist.board_num }" selected="selected">${boardnumlist.board_name }</option>
		</select>
		</c:forEach>
	</div>
	
	<div id="csWrite" class="csWrite">
		<textarea id="private_qna_contentt" class="csWriteDetail"  name="private_qna_content" required>
		${boardinfo.private_qna_content }
		</textarea>
	</div>
	
	<div class="csWriteSubmitButton" id="csWriteSubmitButton">
	<input type="button" id="modify" value="수정">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onClick="cancelCsWrite()">작성 취소하기</button>
	</div>
	</c:forEach>
	</c:if>
	</form>
	

<form name="privatedetaill">
	<c:if test="${command != 'modify' }">
	<div id="csWriteHeader" class="csWriteHeader">
		<h2>문의 상세내역 작성</h2>
	</div>
	<c:forEach var="boardlist" items="${boardlist}" >
	
	<input type="hidden" id="private_memberid" name ="private_memberid" value="${member.getMemberid() }" />
		<div class="csWriteTitle">
		글 제목 :
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" id="private_qna_title" name="private_qna_title" class="input_csWriteTitle" value="${boardlist.board_name } 문의합니다♡" required>
	</div>

	<div class="selectOption" id="selectOption">
		문의 유형을 선택하세요: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<select name="board_num" class="selectQuestionType" id="selectQuestionType" required>
		<c:if test="${boardlist.board_num == boardlist.board_num }">
			<option id="board_num" value="${boardlist.board_num }" selected="selected">${boardlist.board_name }</option>
			</c:if>
		</select>
	</div>
	
	<div id="csWrite" class="csWrite">
		<textarea id="private_qna_content" class="csWriteDetail"  name="private_qna_content" required>
		
- 주문 번호     :
- 주문자 성함   :
		
--문의 사항--
=>
</textarea>
	</div>

	<div class="csWriteSubmitButton" id="csWriteSubmitButton">
	<input type="button" id="write" value="작성완료">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onClick="cancelCsWrite()">작성 취소하기</button>
	</div>
	
	</c:forEach>
	</c:if>
</form>
</body>
</html>
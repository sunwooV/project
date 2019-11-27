<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼 은도끼|고객센터 문의내역 작성하기</title>
<script type="text/javascript">
	//문의내역 넘기는 함수
	function submitCsWrite() {

	}
	//작성취소 후 이전화면으로 돌아가기
	function cancelCsWrite() {
		history.back(-1);
	}
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
	<div id="csWriteHeader" class="csWriteHeader">
		<h2>문의 상세내역 작성</h2>
	</div>
	<div class="csWriteTitle">
		글 제목 :
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type="text" id="input_csWriteTitle" class="input_csWriteTitle">
	</div>
	<div class="selectOption" id="selectOption">
		문의 유형을 선택하세요: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <select name="QType"
			class="selectQuestionType" id="selectQuestionType">
			<option value="OneToOne">1:1문의</option>
			<option value="changeAndRefund">교환 및 환불</option>
			<option value="shipping">배송문의</option>
			<option value="others">기타</option>
		</select>
	</div>
	<div id="csWrite" class="csWrite">
		<textarea id="csWriteDetail" class="csWriteDetail"
			placeholder="문의 내용을 자세하게 작성해주세요.">
</textarea>
	</div>
	<div class="csWriteSubmitButton" id="csWriteSubmitButton">
		<button onClick="submitCsWrite()">작성 완료</button>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<button onClick="cancelCsWrite()">작성 취소하기</button>
	</div>

</body>
</html>
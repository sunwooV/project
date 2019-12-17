<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
	List list = (List) request.getAttribute("searchList");
	int size = list.size();
	int idx = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Do+Hyeon|Merriweather|Noto+Sans+KR&display=swap&subset=korean"
	rel="stylesheet">


</head>

<style type="text/css">
#a {
	width: 8%;
	font-size: 12px;
}
</style>





<body>

	<!-- 메뉴사이드바랑 컨텐츠 ------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="container" style="margin-left: 14%; padding-top: 3%;">
		<h2>스토어 개설 승인 처리</h2>
		<table style="width: 1376px; margin-top: 2%;">
			<thead>
				<tr class="table-danger"
					style="text-align: center; width: 18%; height: 45px;">
					<th id="a">플리마켓 코드</th>
					<th id="a">회원 아이디</th>
					<th id="a">신청자 이름</th>
					<th id="a">신청자 전화번호</th>
					<th id="a">신청자 이메일</th>
					<th id="a">신청자 사업자번호</th>
					<th id="a">신청 일자</th>
					<th id="a">심사 상태</th>
					<th id="a">플리마켓 일자</th>
					<th id="a">플리마켓 시간</th>
					<th id="a">플리마켓 장소</th>
					<th id="a">미리결제 여부</th>
					<th id="a">처리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${searchList}">
					<tr class="table-secondary"
						style="border-bottom: 1px solid lightgray; text-align: center;">
						<td><h6>${member.flea_code}</h6></td>
						<td><h6>${member.memberid}</h6></td>
						<td><h6>${member.join_name}</h6></td>
						<td><h6>${member.join_phonenumber}</h6></td>
						<td><h6>${member.join_email}</h6></td>
						<td><h6>${member.join_companynumber}</h6></td>
						<td><h6>${member.join_date}</h6></td>
						<td><h6>${member.join_status}</h6></td>
						<td><h6>${member.join_offline_date}</h6></td>
						<td><h6>${member.join_offline_time}</h6></td>
						<td><h6>${member.join_offline_location}</h6></td>
						<td><h6>${member.join_prepayment_yn}</h6></td>
						<td><input type="button" value="개설 승인" id="approval_Y"
							style="margin-bottom: 6%; margin-top: 6%;"
							onClick="location.href='${contextPath}/fleaApprovalStatusUpdate.do?flea_code=${member.flea_code}&memberid=${member.memberid}&join_name=${member.join_name }&join_offline_date=${member.join_offline_date}&join_offline_time=${member.join_offline_time}&join_offline_location=${member.join_offline_location}&join_prepayment_yn=${member.join_prepayment_yn}&join_date=${member.join_date}'" />
							<input type="hidden" id="join_status"
							value="${member.join_status}"> <input type="button"
							style="margin-bottom: 6%;" value="개설 불가" id="approval_N" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


</body>
<script>
	$('.tree-toggle').click(function() {
		$(this).parent().children('ul.tree').toggle(200);
	});
	$(function() {
		$('.tree-toggle').parent().children('ul.tree').toggle(200);
	})
</script>

</html>
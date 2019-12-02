<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
h2{
    text-align: center;
     margin-top:100px;
}
* {
    font-family: "Noto Sans KR",sans-serif;
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
}

.orderHistoryTable {
	text-align: center;
	width: 1300px;
	border-top:1px solid gray;
	border-collapse:collapse;

}

.OHtableTitle{
background-color:#faf5f1;
}
.tab-content{
	width: 758px;
	margin-left:-100px;

}
</style>
<body>
<h2>1:1 문의 게시판</h2>
			    	<br>
			    	   <div class="orderHistoryHeader"></div>
	<div class="orderHistoryContainer">
		<!-- 주문 상품 정보 테이블 시작  -->
		<table class="orderHistoryTable" id="orderHistoryTable">
			<!-- 주문 상품 정보 테이블 상단 제목   -->
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><span>게시판 번호<br>
					</span></th>
					<th class="OHT_ttl"><span>제목</span></th>
					<th class="OHT_ttl"><span>작성자</span></th>
					<th class="OHT_ttl"><span>작성일</span></th>
				</tr>
			</thead>
	
	<c:set var="size" value="${listSize }"/>
	<c:choose>
                        <c:when test="${size == 0}">
                            <tr>
                                <td colspan="20" align="center">
                              		조회된 결과가 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="row" items="${list}" >
                                <tr>
                                    <td align="center">${row.private_qna_num}</td>
                                   <td align="center"><a href="${contextPath}/privatdetail.do?private_qna_num=${row.private_qna_num }">${row.private_qna_title}</a></td>
                                    <td align="center">${row.private_memberid}</td>
                                    <td align="center">
                                    <fmt:formatDate value="${row.private_qna_date}" pattern="yyyy-MM-dd HH:mm" />
                                     </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise> 
                    </c:choose>
		</table>
	</div>
</body>
</html>
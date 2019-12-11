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
  margin-left:290px;
}

span.title{
  margin-bottom: 25px;
  margin-left:290px;
}
* {
    font-family: "Noto Sans KR",sans-serif;
}
.orderHistoryContainer {
	/* padding: 위 오른쪽 아래 왼쪽;*/
	padding: 1% 15% 10% 15%;
}

.orderHistoryHeader {
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
#write{
	background: black;
    color: white;
    border: 2px solid black;
    margin-left: 58%;
}
#write:hover{
	background:lightgray;
	color:black;
	border: 2px solid lightgray;
}
.contents{
color: black;
    border-bottom: 1px solid lightgray;
    height: 55px;
}
    #waitAnswer {
	color: #BDBDBD;
}
    
</style>
<body>
<c:forEach var="boardlist" items="${boardlist}" >
<h2 style="margin-top:100px;">${boardlist.board_name }</h2>
    <span class="title"><a href="${contextPath}/cs.do">고객센터</a> > <b>${boardlist.board_name }</b></span>
    	<c:set var="member" value="${member }" />
				<c:if test="${ member != null}">
    <a href="${contextPath}/csWrite.do?board_num=${boardlist.board_num }">
    <input type="button" id="write" value="글쓰기">
    </a>
    	</c:if>
			    	<br>
			    	   <div class="orderHistoryHeader"></div>
	<div class="orderHistoryContainer">
		<!-- 주문 상품 정보 테이블 시작  -->
		<table class="orderHistoryTable" id="orderHistoryTable">
			<!-- 주문 상품 정보 테이블 상단 제목   -->
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><span>게시글 번호<br>
					</span></th>
					<th class="OHT_ttl"><span>제목</span></th>
					<th class="OHT_ttl"><span>작성자</span></th>
					<th class="OHT_ttl"><span>작성일</span></th>
					<th class="OHT_ttl"><span>답변</span></th>
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
                                <tr class="contents">
                                    <td align="center">${row.private_qna_num}</td>
                                    <c:if test="${member.memberid == row.private_memberid or member.verify =='Y' }">
                                   <td align="center"><a href="${contextPath}/privatdetail.do?private_qna_num=${row.private_qna_num }&board_num=${boardlist.board_num }">${row.private_qna_title}</a></td>
                                   </c:if>
                                    <c:if test="${member.memberid != row.private_memberid and member.verify =='N'}">
                                   <td align="center"><img src="${contextPath }/resources/img/detailProduct/secret.png" style="width: 20px;">${row.private_qna_title}</td>
                                   </c:if>
                                    <td align="center">${row.private_memberid}</td>
                                    <td align="center">
                                    <fmt:formatDate value="${row.private_qna_date}" pattern="yyyy-MM-dd HH:mm" />
                                     </td>
                                     <c:if test="${row.private_answer_yn =='N' }">
                                      <td id ="waitAnswer" align="center">답변대기</td>
                                     </c:if>
                                       <c:if test="${row.private_answer_yn =='Y' }">
                                      <td align="center">답변완료</td>
                                     </c:if>
                                    
                                </tr>
                            </c:forEach>
                        </c:otherwise> 
                    </c:choose>
		</table>
	</div>
	</c:forEach>
</body>
</html>
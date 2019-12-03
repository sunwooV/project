<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
//상품 게시글 수정
$(document).on('click', '#modify', function(){

	var frm = document.privatedetail;


frm.method="post";
frm.action="./modifyProduct.do";
frm.submit();
});

//상품 게시글 삭제
$(document).on('click', '#delete', function(){
var frm = document.privatedetail;

if(confirm("해당 상품을 삭제하시겠습니까?\n")){
	frm.method="post";
	frm.action="./deleteProduct.do";
	frm.submit();
} else{
	return false;
}

});

//상품 게시글목록
$(document).on('click', '#list', function(){

	var frm = document.privatedetail;


frm.method="post";
frm.action="./privateInit.do";
frm.submit();
});

</script>
<style>
span.title{
margin-bottom: 25px;
}
div#private{
margin-left:250px;
margin-right:250px;
}
h3{
    margin-bottom: 25px;

}
* {
    font-family: "Noto Sans KR",sans-serif;
}
table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
}
table.type05 th {
    width: 150px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: darkgray;
    font-size:small;
}
table.type05 td {
    width: 1230px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type05 td.content{
height:500px;
}

#modify, #delete,#list{
	background: black;
    color: white;
    border: 2px solid black;
}
#modify:hover, #delete:hover,  #list:hover{
	background:lightgray;
	color:black;
	border: 2px solid lightgray;
}
</style>
<body>
<form name="privatedetail">
	<div id="private">
<h3 style="
    margin-top: 25px;
">1:1문의</h3>
    <span class="title">고객센터 > <b>1:1문의</b></span>
<table class="type05">
<c:set var="private_detail" value="${private_detail }" />
    <tr>
        <th scope="row">제목</th>
        <td>${private_detail.private_qna_title }</td>
    </tr>
    <tr>
        <th scope="row">작성자</th>
        <td>${private_detail.private_memberid }</td>
    </tr>
    <tr>
        <th scope="row">작성일</th>
        <td><fmt:formatDate value="${private_detail.private_qna_date }" pattern="yyyy-MM-dd HH:mm" /></td>
   
    </tr>
     <tr>
        <td colspan ="2" class="content">${private_detail.private_qna_content }</td>
    </tr>
</table>
<br><br>
    <input type="button" id="list" value="목록">
	<input type="button" id="modify" value="수정">
    <input type="button" id="delete" value="삭제">
</div>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
  background:#f1f2f3;
  font-size:13px;
  color:#262626;
  font-family:'Arial',sans-serif;
}
div{
	display:block;
}
img{ 
  max-width:100%;
}
#wrap{
  width:90%;
  margin:50px auto;
}
.up{
	width:75%;
	margin:0px auto;
}
.down{
	width:75%;
	float:left;
	margin:30px 13%;
}
.category{
	font-size: small;
    font-weight: bold;
    margin: 1% 20%;
    width: 25%;
}
.mainImg{
	display:block;
	box-sizing:border-box;
	margin:auto 100px;
	width:35%;
	max-height:750px;
	float:left;
}
.description{
	margin-left: 2%;
	float:left;
}
.price{
	color:red;
	font-size:xx-large; 
	font-weight:bold;
}
.content{
	color:black;
	font-size:medium;
}
.pay{
	display: inline-block;
    padding: 0;
    vertical-align: top;
    height: 56px;
    line-height: 56px;
    margin-left: 4px;
    width: 123px;
}
.tab-content{
	width: 758px;
    margin: 0px auto;
}
.tag{
	color:#dd5850;
	padding:3px;
	font-weight:bold;
	cursor:pointer;
}
.alarm{
	color:red;
	font-weight:bold;
	font-size:large;
}
#panels {margin:10px 20px 10px 0px; font-size:1.2em; line-height:1.5em; }
#cart{
	font-size: 16px;
    padding: 0 24px;
    line-height: 46px;
    border-color: #dd5850;
    background: #fff;
    color: #dd5850;
}
#buy, #bidding{
	font-size: 16px;
    padding: 0 24px;
    line-height: 46px;
    border-color: transparent;
    background: #dd5850;
    color: #fff;
}
#kakaoPay{
	font-size: 16px;
	background:#EBD402;
	padding: 0 24px;
	line-height: 46px;
	border-color: transparent;
	color:white;
}
#message, #heart{
	box-shadow: 0 1px 3px 0 hsla(0,0%,86.3%,.3);
    font-weight: 400;
    box-sizing: border-box;
    display: inline-block;
    border-radius: 2px;
    background: #fff;
    border: 1px solid #d9d9d9;
    vertical-align: middle;
    transition: background-color .2s cubic-bezier(.075,.82,.165,1);
    transition: border-color .2s cubic-bezier(.075,.82,.165,1);
    margin: 0;
    padding: 0;
    line-height: 1.5;
    text-align: center;
    text-decoration: none;
    color: rgb(221, 88, 80);
    cursor: pointer;
}
#heart{
	padding: 3px;
}
#sold_price{
	color:black;
	margin-left:1%;
}
#auction_price{
	font-size:medium;

}
#sale_price{
	color:#BDBDBD;
	font-size:medium;
	text-decoration:line-through;
}
#total{
	font-weight:bold;
}
#gray-text{
	color:#848484;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

/*Qna 작성*/
.prod_inquiry_wrap{
	width:99%;
	background:#f9f9f9;
	margin-top:2%;
	border: 1px solid #ddd;
	padding:30px 29px;
}

#prod_inquiry_text{
	width:100%;
	height:140px;
}

.text_area_wrap label {
    position: absolute;
    line-height: 16px;
    color: #c3c3c3;
}

.btn_area{
	text-align:center;
}

label{
	padding:5px;
}

textarea{
	-webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textarea;
    background-color: white;
    -webkit-rtl-ordering: logical;
    flex-direction: column;
    resize: auto;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(169, 169, 169);
    border-image: initial;
    padding: 2px;
}

/*qna 리스트*/
#QnA .list_comment_inqury {
    border-style: solid;
    border-color: #c3c3c3 transparent #ddd;
    border-width: 1px 0;
    padding:0;
	margin:0;	
}
.list_comment_inqury li ~ li {
    border-top: 1px solid #ededed;
}
.list_comment_inqury{
    display: block;
    list-style:none;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    
}
.list_comment_inqury li {
    display: list-item;
    text-align: -webkit-match-parent;
    list-style:none;
}
#QnA .list_comment_inqury .faq_open {
    display: block;
    position: relative;
    padding: 20px 120px 68px 22px;
    background: url(//image.wemakeprice.com/images/resources_v2/front/deals/bg_inqury.gif) 0 0 repeat-y;
    line-height: 22px;
    color: #666;
    text-align: center;
}
#QnA .list_comment_inqury .faq_open .cate {
    width: 86px;
    position: absolute;
    top: 50%;
    left: 0;
    margin-top: -11px;
}
#QnA a{
	text-decoration:none;
	cursor:pointer;
}
#QnA .user{
	width:124px;
	padding-top: 2.5%;
}
#QnA .list_comment_inqury .cont_box {
    position: relative;
    padding: 0px 40px 0 75px;
    text-align: left;
}
#QnA .list_comment_inqury .date {
    width: 127px;
    position: absolute;
    top: 50%;
    right: 0;
    margin-top: -11px;
}
#QnA .list_comment_inqury .cont_box .inquiry_prod {
    display: block;
    width: 370px;
    margin-bottom: 2px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.list_comment_inqury div{
	display: block;
}
.cate, .cont_box, .user, .date{
	float:left;
}
#waitAnswer{
	color:#BDBDBD;
}

/*qna 답변*/
#QnA .list_comment_inqury .faq_cont {
    position: relative;
    background: #f9f9f9;
    line-height: 16px;
    display: none;
}
#QnA .list_comment_inqury .faq_cont div {
    position: relative;
    padding: 18px 45px 17px 20px;
    border-top: 1px solid #ededed;
}
#QnA .list_comment_inqury .faq_cont .answer {
    padding-bottom: 46px;
    padding-left: 120px;
}
#QnA .list_comment_inqury .faq_cont div {
    position: relative;
    padding: 18px 45px 17px 20px;
    border-top: 1px solid #ededed;
}

.ico {
    display: inline-block;
    overflow: hidden;
    background: url(//image.wemakeprice.com/images/resources_v2/front/common/ico_spr.png) no-repeat 0 0;
    text-indent: -9999px;
    *font-size: 0;
    *line-height: 0;
    *height: 0;
    *text-indent: 0;
}

#QnA .list_comment_inqury .faq_cont .answer .tit_asw {
    display: block;
    width: 50px;
    height: 20px;
    margin: 2px 0 -22px -80px;
    background: #00a9d4;
    font-size: 11px;
    line-height: 22px;
    color: #fff;
    text-align: center;
}
#QnA .list_comment_inqury .faq_cont .answer .tit_asw span {
    position: absolute;
    bottom: 13px;
    left: 120px;
    font-size: 12px;
    color: #999;
}
#QnA .list_comment_inqury .faq_cont .answer .ico.asw {
    width: 9px;
    height: 9px;
    position: absolute;
    top: 20px;
    left: 20px;
    border-style: solid;
    border-color: #999;
    border-width: 0 0 1px 1px;
    background: none;
}

/*qna 답변*/
#answer_write {
    position: absolute;
    bottom: 7px;
    left: 120px;
    font-size: 12px;
    color: #999;
    width:50%;
}

#answer_enroll{
	margin-top: 6px;
    margin-left: 434px;
    position: absolute;
    color: #00a9d4;
    background: white;
    border: 1px solid #00a9d4;
}

/*Q&A 삭제*/
.delete_qna{
	float:right;
	cursor:pointer;
}
#deleteQuestion{
    margin-top: -22px;
    margin-right: 10px;
	position: relative;
}

/*수정 삭제*/
#modify, #delete{
	background: black;
    color: white;
    border: 2px solid black;
}
#modify:hover, #delete:hover{
	background:lightgray;
	color:black;
	border: 2px solid lightgray;
}

</style>
</head>
<body>
<div id="QnA" class="tab-pane fade">
			    	<input type="hidden" id="memberId" value="${member.getMemberid() }" />
			    	<br>
			    	<h2>상품 Q&A</h2>
			    	<br>
			    	<ul>
		    			<li>상품 Q&A 게시판을 통한 취소나 환불, 교환, 반품신청은 처리되지 않습니다.</li>
						<li>본 상품과 관련되지 않은 내용이나 비방, 홍보글, 도배글, 개인정보가 포함된 글은 예고없이 삭제될 수 있습니다.</li>
						<li>홈페이지 에러/장애 문의는 고객센터 또는1:1문의를 이용해주세요.</li>
			    	</ul>
					<div class="prod_inquiry_wrap">
						<h4>상품 문의</h4>
						
						<br>
						
					</div>
					<br><br>
					<div class="listWrapper">
						<div class="iqry_comments_area">
							<ul class="list_comment_inqury">
								<c:forEach var="prodQnA" items="${prodQnA }">
									<li>
										<a href="javascript:void(0)" class="faq_open" id="${prodQnA.qna_number }" name="${prodQnA.secret_yn }">
											<input type="hidden" id="qna_memberId" value="${prodQnA.memberId }">
											<div class="cate" id="cate${prodQnA.qna_number }">
												<c:if test="${prodQnA.answer_yn == 'y' }"><!-- 답변이 있으면 -->
													답변 완료
												</c:if>
												<c:if test="${prodQnA.answer_yn == 'n' }"><!-- 답변이 있으면 -->
													<p id="waitAnswer">답변 대기</p>
												</c:if>
											</div>
											<div class="cont_box">
												<span class="inquiry_prod">${product.prod_title }</span>
												<c:if test="${prodQnA.secret_yn == 'y' }"> <!-- 비밀글일 경우 -->
													<c:if test="${member.getMemberid() == prodQnA.memberId or member.getMemberid() == product.memberId }"> <!-- 글 작성자이거나 상품 작성자인 경우 -->
														<span class="inquiry_text" id="contText" style="font-weight:bold;">${prodQnA.qna_content }</span>
													</c:if>
													<c:if test="${member.getMemberid() != prodQnA.memberId and member.getMemberid() != product.memberId }"> <!-- 글작성자가 아닐 경우 -->
														<span class="inquiry_text" id="secret_text" style="font-weight:bold;">비밀글입니다.<img src="${contextPath }/resources/img/detailProduct/secret.png" style="width:20px;"></span>	
													</c:if>
												</c:if>
												<c:if test="${prodQnA.secret_yn == 'n' }">
													<span class="inquiry_text" id="contText" style="font-weight:bold;">${prodQnA.qna_content }</span>	
												</c:if>
											</div>
											<div class="user">
												<span class="member${prodQnA.qna_number }">${prodQnA.secretMember }</span> 
											</div>
											<div class="date">
												<span>${prodQnA.qna_date }</span>
											</div>
										
										</a>
										
										<div class="faq_cont" style="display:none;" data-qna="listContents" data-open="open" id="a${prodQnA.qna_number }">
											<div class="question">${prodQnA.qna_content }</div>
											
											<c:if test="${prodQnA.memberId == member.getMemberid() }"><!-- 자신이 쓴 q&a 내용 삭제할 수 있음 -->
												<p class="delete_qna" id="deleteQuestion"><u>삭제</u></p>
											</c:if>
											<c:choose>
												<c:when test="${product.memberId == member.getMemberid() }"> <!-- 글작성자일 경우 -->
													<c:if test="${prodQnA.answer_yn == 'n' }">
														<div class="answer" id="answer${prodQnA.qna_number }" style="display:block;">
															<span class="ico asw">답변</span>
															<span class="tit_asw">판매자
																<textarea id="answer_write" style="resize: none;"></textarea>
																<input type="button" id="answer_enroll" class="answer_enroll" value="답변달기">
															</span>
														</div>
													</c:if>
													<c:if test="${prodQnA.answer_yn == 'y' }">
														<div class="answer" id="answer${prodQnA.qna_number }" style="display:block;">
															<span class="ico asw">답변</span>
															<span class="tit_asw">판매자
																<span>${prodQnA.answer_date }</span>
															</span>
															${prodQnA.answer_content }
															<p class="delete_qna" id="deleteAnswer"><u>삭제</u></p>
														</div>
													</c:if>
												</c:when>
												<c:otherwise> <!-- 글작성자가 아닐 경우 -->
													<c:if test="${prodQnA.answer_yn == 'n' }"> <!-- 답변이 달린 경우 -->
														<div class="answer" id="answer${prodQnA.qna_number }" style="display:none;">
															<span class="ico asw">${prodQnA.answer_content }</span>
														
															<span class="tit_asw">판매자
																<span>${prodQnA.answer_date }</span>
															</span>
														</div>
													</c:if>
													<c:if test="${prodQnA.answer_yn == 'y' }"> <!-- 답변이 달리지 않은 경우 -->
														<div class="answer" id="answer${prodQnA.qna_number }" style="display:block;">
															<span class="ico asw">답변</span>
														
															<span class="tit_asw">판매자
																<span>${prodQnA.answer_date }</span>
															</span>
															${prodQnA.answer_content }
													
														</div>
													</c:if>
												</c:otherwise>
											</c:choose>
											
										</div> 
										
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="paging_comm">
						
						</div>
					</div>
			    </div>
</body>
</html>
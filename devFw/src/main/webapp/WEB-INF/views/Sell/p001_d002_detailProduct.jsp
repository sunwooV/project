<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="prettyPhoto_compressed_3.1.6/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="prettyPhoto_compressed_3.1.6/css/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
<script src="prettyPhoto_compressed_3.1.6/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
		var now = window.location.href;
		var loginCheck = document.getElementById("memberId").value;
		$("#prod_inquiry_text").click(function(){
			if(loginCheck == null || loginCheck == "") {
				if(confirm("로그인 후 글을 쓸 수 있습니다.\n로그인 하시겠습니까?")){
					window.location.href="./loginInit.do?redirect=" + now;
				} else{
					return false;
				}
			} else {
				return false;
			}
	  	});
		
		
		
		$(".enrollInquiry").click(function(){

			var content = $("#prod_inquiry_text").val();
			var product = $("#prod_number").val();
			var memberId = $("#memberId").val();
			var command = 'insert';
			
			//질문 사항 내용이 있는지 체크
			if(content == ''){
				alert("질문 사항을 입력해주세요.");
				return false;
			} else {
				content = content.split(' ').join('&nbsp;'); //replaceAll() 함수 효과
				content = content.replace(/(\r\n|\n|\n\n)/gi, '<br>');
			}
			
			var qna = {
					qna_content: content,
					prod_number: product,
					memberId: memberId,
					command: command
			}
	
			$.ajax({
				type: "post",
				async: false,
				url: "/devFw/detail/qna.do",
				data: qna,
				dataType : 'text',
				success: function(responseData){
					document.getElementById("prod_inquiry_text").value = "";
					
					var data = JSON.parse(responseData);
		            /* if(jsonInfo.error.error_yn == 'Y'){
		        	   alert(jsonInfo.error.error_text);
		        	   return;
		            } */
		            console.log(data.length);
					var list = '';
		            
					for(var i=0;i<data.length;i++){
					list += '<li><a href="javascript:void(0)" class="faq_open" id="' + i + '">'
						 + '<div class="cate">답변 대기</div>'
						 + '<div class="cont_box">'
						 +	'<span class="inquiry_prod">${product.prod_title }</span>'
						 + 	'<span class="inquiry_text">' + data[i].qna_content + '</span>'
						+ '</div>'
						+ '<div class="user">'
						+	'<span class="ff">' + data[i].memberId + '</span>'
						+ '</div>'
						+ '<div class="date">'
						+	'<span>' + data[i].qna_date + '</span>'
						+ '</div>'
					
						+ '</a>'
						+ '<div class="faq_cont" style="display:none;" data-qna="listContents" data-open="open" id="a' + i + '">'
						+ '<div class="question">'+ data[i].qna_content+ '</div>'
						+ '<div class="answer" style="display:none;">'
						 +	'<span class="ico asw">답변</span>'
						
						+	'<span class="tit_asw">판매자'
						+		'<span>2019-11-11 13:11</span>'
						+ '답변 내용'
							
						 + '</div>'
					+ '</div>' 
				+ '</li>';
					}
					
				$(".list_comment_inqury").html(list);
		            console.log(list);
				},
				error: function(data, textStatus){
					alert("다시 시도해주세요.");
				},
				complete : function (data, textstatus){
				}
			});
			
			$(".faq_open").click(function(){
				var num = $(this).attr("id");
				var target = document.getElementById("a" + num);
				
				if(target.style.display == 'none'){ //접혀있는데 눌렀을 경우
					$('#a'+num).css("display", "block");
				} else { //펴져있는데 눌렀을 경우
					$('#a'+num).css("display", "none");
				}
			})
			
		});
		
		//대표 사진 확대 기능
	  	$("a[rel^='prettyPhoto']").prettyPhoto();
	});
	
	                                                                                                                                                    
	$(window).load(function(){
		var day = document.getElementById("left_day").value;
		var hour = document.getElementById("left_hour").value;
		var min = document.getElementById("left_min").value;
		var second = document.getElementById("left_second").value;
		
		setInterval(function(){

			if(second > 0){
				second--;
			} else{
				if(min > 0){
					second=59;
					min--;
				} else{
					if(hour > 0){
						min=59;
						hour--;
					} else{
						min=59;
					}
				}
			}
			var tt = day + ' 일 ' + hour + ' 시간 ' + min + " 분 " + second + " 초 ";
			document.getElementById("auction_date_cal").innerHTML = tt;
	  }, 1000);
	})
	
	//경매 상품 시간 계산 해주기 -> 처음 화면 펼칠 때 남은 시간 select한 후 화면단에서 시간 줄여주기
	function time_cal(){

		location.reload();
		var day = document.getElementById("left_day").value;
		var hour = document.getElementById("left_hour").value;
		var min = document.getElementById("left_min").value;
		var second = document.getElementById("left_second").value;
		
		if(second > 0){
			second--;
		} else{
			if(min > 0){
				second=59;
				min--;
			} else {
				if(hour > 0){
					min=59;
					hour--;
				} else{
					min=59;
				}
			}
		}
	}
	
	//+, - 버튼 눌렀을 때 수량 변경
	function buttonClick(pm){ 
		var price = document.getElementById("prod_price").value;
		var amount = document.getElementById("prod_amount");
		
		if(pm == 'minus'){
			if(amount.value == amount.min){ 
				return false;
			}else{
				amount.value--;
			}
		} else { //plus 버튼 눌렀을 때
			if(amount.value == amount.max){ //재고 수량보다 더 많이 주문할 수 없도록 설정
				return false;
			}else{
				amount.value++;
			}
		}
	
		// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
		Number.prototype.format = function(){
		    if(this==0) return 0;
		 
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		 
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		 
		    return n;
		};
		 
		// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
		String.prototype.format = function(){
		    var num = parseFloat(this);
		    if( isNaN(num) ) return "0";
		 
		    return num.format();
		};

		var total = amount.value * price;

		document.getElementById("total").innerHTML = total.format(); //천단위 , 찍어서 표현
		document.getElementById("total_price").value = total;
	}
	
	//상세정보, Q&A, 상품후기 나누는 탭
	function tab_menu(num){
		 var f = $('.menu_tab').find('li');
		 for ( var i = 0; i < f.length; i++ ) {
			  if ( i == num) {
			   f.eq(i).addClass('active');
			   $('.menu_tab0' + i ).show();
			  } else {
			   f.eq(i).removeClass('active');  
			   $('.menu_tab0' + i ).hide();
			  }
		}
	}
	

	

	 
</script>
<meta charset="UTF-8">
<title>상품 상세</title>
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
	margin:5px 13%;
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
	margin:1%;
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
#panels {margin:10px 20px 10px 0px; font-size:1.2em; line-height:1.5em; }
#cart{
	font-size: 16px;
    padding: 0 24px;
    line-height: 46px;
    border-color: #dd5850;
    background: #fff;
    color: #dd5850;
}
#buy{
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
    color: #333;
    cursor: pointer;
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
</style>
</head>
<body>
<div id="wrap">
		
	<c:forEach var="product" items="${detail }" varStatus="status" >
		<input type="hidden" id="prod_number" value="${product.prod_number }">
		<div class="category">
			<c:forEach var="high_category" items="${high_category }">
				${high_category.category_name }
			</c:forEach>
			>
			<c:forEach var="middle_category" items="${middle_category }">
				${middle_category.category_name }
			</c:forEach>
		</div>
		<div class="up">
			<div class="mainImg"> <!-- 상품 대표 이미지 -->
				<a href="${product.represent_image }" rel="prettyPhoto" title="This is the description"><img src="${product.represent_image }" alt="This is the title" /></a>	
			</div>
			<div class="description"> <!-- 상품 설명 -->
				<c:if test="${product.reused_yn == 'y' }"> <!-- 상품 판매 카테고리 -->
					<P> 중고 </P>
				</c:if>
				<c:if test="${product.auction_yn == 'y' }">
					<P> 경매 </P>
				</c:if>
				<c:if test="${product.flea_yn == 'y' }">
					<P> 플리 </P>
				</c:if>
				<h1>${product.prod_title }</h1>
				<!-- <h3>#${product.tag1 }, #${product.tag2 }, #${product.tag3 }, #${product.tag4 }, #${product.tag5 }</h3> -->
				<h3 id="gray-text">${product.memberId }</h3>
				<br>
				<c:choose>
					<c:when test="${product.auction_yn == 'y' }"> <!-- 경매 상품이면 시작가와 현재가를 표시해준다. -->
						<span class="price" id="sold_price"><fmt:formatNumber value="${product.auction_price }" type="number" />원</span><!-- 현재가 -->
						<span id="auction_price">시작가: <fmt:formatNumber value="${product.auction_price }" type="number" />원</span><!-- 시작가 -->
						<a href="#" style="font-size:medium; padding:5px;"><u>경매기록</u></a>
					</c:when>
					<c:otherwise> <!-- 경매가 아닌 상품들 -->
						<c:if test="${product.sale_percent != null }"> <!-- 세일 퍼센트가 존재한다면 -->
							<span class="price">${product.sale_percent }%</span>
							<span class="price" id="sold_price"><fmt:formatNumber value="${product.prod_price * (1-(product.sale_percent*0.01)) }" type="number" />원</span>
							<span id="sale_price"><fmt:formatNumber value="${product.prod_price }" type="number" />원</span>
							<input type="hidden" id="prod_price" value="${product.prod_price * (1-(product.sale_percent*0.01)) }">
						</c:if> 
						<c:if test="${product.sale_percent == null }"> <!-- 세일 퍼센트가 존재하지 않는다면 -->
							<span class="price" id="sold_price"><fmt:formatNumber value="${product.prod_price }" type="number" />원</span>
							<input type="hidden" id="prod_price" value="${product.prod_price }">
						</c:if>
					</c:otherwise>
				</c:choose>
	
				<br>
				<h3 id="gray-text">지난 일주일간 ${product.heart }명의 회원이 관심을 보였어요!</h3>
				<br>
				<button id="heart"><img src="${contextPath }/resources/img/detailProduct/heart.png" style="width:30px; height:30px;"> 관심 상품 추가 </button>
				<br><br>
				<div class="content">
					<c:choose>
						<c:when test="${product.auction_yn == 'y' }"><!-- 경매일 경우 수량은 한 상품 당 1개 -->
							수량: <input type="number" id="prod_amount" style="width:4%; height:auto; text-align:right;" value="1" readonly>
						</c:when>
						<c:otherwise>
							max수량: ${product.prod_amount }
							<br>
							수량: <button id="minus" onclick="buttonClick('minus')">-</button><input type="number" id="prod_amount" min="1" max="${product.prod_amount }" style="width:4%; height:auto; text-align:right;" value=""><button id="plus" onclick="buttonClick('plus')">+</button>
							<br>
							총 금액: <span id="total"></span>원
						</c:otherwise>
					</c:choose>
					
					
					<input type="hidden" id="total_price" value="">
					<br><br>
					<div>
						<c:choose>
							<c:when test="${product.send_way == 'direct' }">
								<input type="radio" name="way_check" value="direct" checked="checked"> 직거래
							</c:when>
							<c:when test="${product.send_way == 'delivery' }">
								<input type="radio" name="way_check" value="delivery" checked="checked"> 택배거래
							</c:when>
							<c:otherwise>
								<input type="radio" name="way_check" value="direct" checked="checked"> 직거래
								<input type="radio" name="way_check" value="delivery"> 택배거래
							</c:otherwise>
						</c:choose>
					</div>
					<br>
					<div id="pay">
						<c:if test="${product.auction_yn == 'n' }">
							<input type="button" class="pay" id="cart" value="장바구니" />
							<input type="button" class="pay" id="buy" value="바로 구매" />
							<input type="button" class="pay" id="kakaoPay" value="kakaoPay" />
							<input type="button" class="pay" id="message" value="메시지로 문의" />
						</c:if>
						<c:if test="${product.auction_yn == 'y' }">
							<c:forEach var="auction_left_date" items="${auction_left_date }">
								<span id="auction_date_cal">${auction_left_date.left_day } 일 ${auction_left_date.left_hour } 시간 ${auction_left_date.left_min } 분 ${auction_left_date.left_second } 초</span>
								<input type="hidden" id="left_day" value="${auction_left_date.left_day }"/>
								<input type="hidden" id="left_hour" value="${auction_left_date.left_hour }"/>
								<input type="hidden" id="left_min" value="${auction_left_date.left_min }"/>
								<input type="hidden" id="left_second" value="${auction_left_date.left_second }"/>
							</c:forEach>
								<span id="auction_left_date">남음 (종료 : ${product.auction_end_date })</span>
							<br><br>
							<input type="button" class="pay" id="buy" value="입찰하기" />
							<input type="button" class="pay" id="message" value="메시지로 문의" />
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="down"> <!-- 상품 상세설명, Q&A, 후기 -->
			<ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#detail">상세정보</a></li>
			    <li><a data-toggle="tab" href="#QnA">상품 Q&A</a></li>
			    <li><a data-toggle="tab" href="#review">상품후기</a></li>
			<!--     <li><a data-toggle="tab" href="#menu3">Menu 3</a></li> -->
			</ul>
			<div class="tab-content">
			    <div id="detail" class="tab-pane fade in active">
			    	<br>
			    	<h2>상세정보</h2>
			    	<br>
			    	${product.editor }
			    </div>
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
						<div class="text_area_wrap">
							<c:choose>
								<c:when test="${member.getMemberid() == null }"> <!-- 로그인 하지 않았을 경우 -->
									<label for="prod_inquiry_text" style="" data-placeholder="로그인 후 글을 남길 수 있습니다." data-placeholder-for="textarea"></label>
									<textarea name="prod_inquiry_text" id="prod_inquiry_text" style="resize: none;" placeholder="로그인 후 글을 남길 수 있습니다."></textarea>
								</c:when>
								<c:otherwise>
									<label for="prod_inquiry_text" style="" data-placeholder="전화번호, 주소, 이메일, 계좌번호 등의 개인정보는 타인에 의해 도용된 위험이 있으니, &#13;&#10;문의 시 입력하지 않도록 주의해 주시기 바랍니다." data-placeholder-for="textarea"></label>
									<textarea name="prod_inquiry_text" id="prod_inquiry_text" style="resize: none;" placeholder="전화번호, 주소, 이메일, 계좌번호 등의 개인정보는 타인에 의해 도용된 위험이 있으니, &#13;&#10;문의 시 입력하지 않도록 주의해 주시기 바랍니다."></textarea>
								</c:otherwise>
							</c:choose>
						</div>
						<br>
						<div class="secretBox">
							<label for="secretSelect"><input type="checkbox" name="secret">비밀글</label>
						</div>
						<div class="btn_area">
							<input type="button" class="enrollInquiry" id="buy" value="등록">
							<input type="button" class="cancelInquiry" id="cart" value="취소">
						</div>
					</div>
					<br><br>
					<div class="listWrapper">
						<div class="iqry_comments_area">
							<ul class="list_comment_inqury">
								<li>
									<a href="javascript:void(0)" class="faq_open" id="1">
										<div class="cate">답변 대기</div>
										<div class="cont_box">
											<span class="inquiry_prod">${product.prod_title }</span>
											<span class="inquiry_text">안녕하세요.</span>
										</div>
										<div class="user">
											<span class="ff">qna</span> 
										</div>
										<div class="date">
											<span>2019-11-11</span>
										</div>
									
									</a>
									<div class="faq_cont" style="display:none;" data-qna="listContents" data-open="open" id="a1">
										<div class="question">안녕안녕</div>
										<div class="answer" style="display:none;">
											<span class="ico asw">답변</span>
										
											<span class="tit_asw">판매자
												<span>2019-11-11 13:11</span>
											</span>
										</div>
									</div> 
								</li>
							
							</ul>
						</div>
						<div class="paging_comm">
						
						</div>
					</div>
			    </div>
			    <div id="review" class="tab-pane fade">
			      <h2>상품후기</h2>
			      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
			    </div>
			    <!-- <div id="menu3" class="tab-pane fade">
			      <h3>Menu 3</h3>
			      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
			    </div> -->
			  </div>
		</div>
	</c:forEach>
</div>
</body>
</html>
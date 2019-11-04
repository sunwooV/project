<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="prettyPhoto_compressed_3.1.6/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="prettyPhoto_compressed_3.1.6/css/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
<script src="prettyPhoto_compressed_3.1.6/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
	  $("a[rel^='prettyPhoto']").prettyPhoto();
	  
	  
	});
	function buttonClick(pm){ //+, - 버튼 눌렀을 때 수량 변경
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
	 
</script>
<meta charset="UTF-8">
<title>상품 상세</title>
<style>
body{
  background:#f1f2f3;
  font-size:62%;
  color:#262626;
  font-family:'Arial',sans-serif;
}
img{ 
  max-width:100%;
}
#wrap{
  width:90%;
  margin:50px auto;
}
#up{
	width:75%;
	margin:0px auto;
}
.mainImg{
	display:block;
	box-sizing:border-box;
	margin:auto 100px;
	width:35%;
	float:left;
}
.description{
	margin:3%;
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
#message{
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

</style>
</head>
<body>
<div id="wrap">
	<c:forEach var="detail" items="${detail }" >	
		<div id="up">
			<div class="mainImg"> <!-- 상품 대표 이미지 -->
				<a href="${detail.represent_image }" rel="prettyPhoto" title="This is the description"><img src="${detail.represent_image }" alt="This is the title" /></a>	
			</div>
			<div class="description"> <!-- 상품 설명 -->
				<h3>${detail.prod_group }</h3>
				<h1>${detail.prod_title }</h1>
				<h3 id="gray-text">${detail.memberId }</h3>
				<br>
				<c:if test="${detail.sale_percent != null }"> <!-- 세일 퍼센트가 존재한다면 -->
					<span class="price">${detail.sale_percent }%</span>
					<span class="price" id="sold_price"><fmt:formatNumber value="${detail.prod_price * (1-(detail.sale_percent*0.01)) }" type="number" />원</span>
					<span id="sale_price"><fmt:formatNumber value="${detail.prod_price }" type="number" />원</span>
					<input type="hidden" id="prod_price" value="${detail.prod_price * (1-(detail.sale_percent*0.01)) }">
				</c:if> 
				<c:if test="${detail.sale_percent == null }"> <!-- 세일 퍼센트가 존재하지 않는다면 -->
					<span class="price" id="sold_price"><fmt:formatNumber value="${detail.prod_price }" type="number" />원</span>
					<input type="hidden" id="prod_price" value="${detail.prod_price }">
				</c:if>
				<br>
				<h3 id="gray-text">지난 일주일간 ${detail.prodViews }명의 회원이 관심을 보였어요!</h3>
				<br>
				<div class="content">
					수량: <button id="minus" onclick="buttonClick('minus')">-</button><input type="number" id="prod_amount" min="1" max="${detail.prod_amount }" style="width:4%; height:auto; text-align:right;"><button id="plus" onclick="buttonClick('plus')">+</button>
					<br>
					총 금액: <span id="total">0</span>원
					<input type="hidden" id="total_price" value="">
					<br><br>
					<div>
						<c:choose>
							<c:when test="${detail.send_way == 'direct' }">
								<input type="radio" name="way_check" value="direct" checked="checked"> 직거래
							</c:when>
							<c:when test="${detail.send_way == 'delivery' }">
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
						<input type="button" class="pay" id="cart" value="장바구니" />
						<input type="button" class="pay" id="buy" value="바로 구매" />
						<input type="button" class="pay" id="kakaoPay" value="kakaoPay" />
						<input type="button" class="pay" id="message" value="메시지로 문의" />
					</div>
				</div>
			</div>
		</div>
		<div id="down"> <!-- 상품 상세설명, Q&A, 후기 -->
		
		</div>
	</c:forEach>
</div>
</body>
</html>
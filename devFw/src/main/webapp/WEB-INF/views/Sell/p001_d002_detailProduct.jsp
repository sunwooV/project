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
	  $("a[rel^='prettyPhoto']").prettyPhoto();
	  
	});
	
	$(window).load(function(){
		var day = document.getElementById("left_day").value;
		var hour = document.getElementById("left_hour").value;
		var min = document.getElementById("left_min").value;
		var second = document.getElementById("left_second").value;
		
		setInterval(function(){
			console.log("time");
			
			
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
			} else{
				if(hour > 0){
					min=59;
					hour--;
				} else{
					min=59;
				}
			}
		}
	}
	
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

</style>
</head>
<body>
<div id="wrap">
		
	<c:forEach var="product" items="${detail }" varStatus="status" >

		<div class="category">
			<c:forEach var="high_category" items="${high_category }">
				${high_category.category_name }
			</c:forEach>
			
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
			    <li class="active"><a data-toggle="tab" href="#detail">상품 상세</a></li>
			    <li><a data-toggle="tab" href="#QnA">Q & A</a></li>
			    <li><a data-toggle="tab" href="#review">상품 후기</a></li>
			<!--     <li><a data-toggle="tab" href="#menu3">Menu 3</a></li> -->
			</ul>
			<div class="tab-content">
			    <div id="detail" class="tab-pane fade in active">
			    	<br>
			    	${product.editor }
			    </div>
			    <div id="QnA" class="tab-pane fade">
			      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			    </div>
			    <div id="review" class="tab-pane fade">
			      <h3>Menu 2</h3>
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
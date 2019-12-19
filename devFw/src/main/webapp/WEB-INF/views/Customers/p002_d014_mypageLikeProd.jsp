<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//check box 전체 선택 
$(document).ready(function(){
	
	$("#allCheck").click(function(){
		if($("#allCheck").prop("checked")){
			$("input[name=checkProd]").prop("checked",true);
		}else{
			$("input[name=checkProd]").prop("checked",false);
		}
	}) //1번 end
	
	var checkProd = document.getElementsByName("checkProd");

	//모두 체크해서 보내기
	for(i=0; i < checkProd.length; i++) {
		checkProd[i].checked = true;
	}//for end

	  document.getElementsByName("allCheck")[0].checked = true;
	
	$("#checkProd").click(function(){
		for(i=0; i < checkProd.length; i++) {
			if(checkProd[i].checked == false){
				document.getElementsByName("allCheck")[0].checked = false;
				checkProd[i].checked = false;
			}
		}
	})// end of checkProd click function
	
	//장바구니 담기 - 상품에서 바로 장바구니 담기 누를 때
	$(document).on('click','#basket', function(){
// 		var check = $("input:checkbox[name=checkProd]:checked");
// 		console.log(check.val());
//		var checkProd =[];
// 		for(var i =0; i<check.length;i++){
// 			checkProd[i] = check.val();
// 		console.log(checkProd[i]);	
// 		}
		var ba = document.getElementById("basket");
		var aa = ba.dataset.prod;

		var memberId = document.getElementById("memberId").value;
		var num = 1;
		var real_prod_price = document.getElementById("prod_price").value;
		console.log(real_prod_price)
		
	/* 	var product =[];
		check.each(function(i){
			var tr = check.parent().parent().eq(i);
			
			var td = tr.children();
			console.log(td);
			
			product[i] = td.eq(0);
			console.log(product[i]);
		})//end of checkEach */
		
		var checkData ={
				prod_number:aa,
				memberid:memberId
		}
		
		var insertCartInfo = {
				prod_number:aa,
				memberid:memberId,
				cart_count : num,
				real_prod_price:real_prod_price	,
				command:"command"
				
		}
		
		var deleteLikeProd = {
				prod_number:aa,
				memberid:memberId,
				command:"delete"
		}
		
		$.ajax({
			type:"get",
			async:false,
			url: "/devFw/checkCartList.do",
			data: checkData,
			dataType : 'text',
			
			success:function(responseData){
				 if(responseData == 1){
					 alert("동일한 상품이 장바구니에 담겨 있습니다.");
					 return false;
				 }else{
			
					$.ajax({
						type:"get",
						async:false,
						url:"/devFw/addCart.do",
						data: insertCartInfo,
						dataType: "text",
						success:function(responsData){
							
						console.log("장바구니 담기 성공");
							
						},
						error:function(data, textStatus){
							alert("장바구니 담기 실패");
						},
						complete:function(data, textStatus){
							
						}
					})//end of ajax
					
				 }//end of else
			},
			error:function(data, textStatus){
				alert("오류가 발생했습니다.")
			},
			complete:function(data, textStatus){
				
			} // complete end
			
			
		})//ajax end
			
	});// 장바구니 담기 처리 끝;
}); 

	
	//관심 상품 삭제
	$(document).on('click', '#delete', function(){
		if(confirm("정말 삭제하시겠습니까?")){

			var prod_number = $(this).attr("name");
			var memberId = $("#memberId").val();
			var command = "delete";
			
			var deleteLikeProd = {
					prod_number:prod_number,
					memberId:memberId,
					command:command
			}
			
			$.ajax({
				type: "post",
				async: false,
				url: "/devFw/detailLikeProd.do",
				data: deleteLikeProd,
				dataType : 'text',
				success: function(responseData){
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
	
					var data = JSON.parse(responseData);
					
					var list = "";
					
					for(var i=0;i<data.length;i++){
						list += '<tr class="orderHistoryContents">'
							+'<td class="OHC_cont"><input type="checkbox" id="checkProd" value="'+ data[i].prod_number + '"></td>'
							+'<td class="OHC_cont"><img src="' + data[i].represent_image + '" class="represent_img"></td>'
							+'<td class="OHC_cont">'+ data[i].prod_title + '</td>'
							+'<td class="OHC_cont">';
						
						if(data[i].reused_yn == 'n' && data[i].flea_yn == 'n' && (data[i].auction_yn == 'y' || data[i].auction_yn == 'w' || data[i].auction_yn == 'f')){ //경매면 최대 입찰액 표시
							list += data[i].auction_bid.format() + '원';
						} else if(data[i].auction_yn == 'n' || (data[i].auction_yn == 'f' && (data[i].reused_yn == 'y' || data[i].flea_yn == 'y'))){
							list += data[i].prod_price.format() + '원';
						}
						
						list += '</td>'
							+'<td class="OHC_cont">';
						if(data[i].send_way == 'direct'){
							list += '직거래';
						} else if(data[i].send_way == 'delivery'){
							list += '택배거래';
						} else{
							list += '직거래<br>택배거래';
						}
					
						list += '</td>'
							+'<td class="OHC_cont">'
							+'	<input type="button" value="주문하기" class="orderButton" id="order">'
							+'	<br>'
							+'	<input type="button" value="장바구니담기" class="orderButton" id="basket"> '
							+'	<br> '
							+'	<input type="button" value="X 삭제" class="orderButton" id="delete" name="'+data[i].prod_number +'">'
							+'</td>'
							+'</tr>';
					}
		           $(".listLikeProd").html(list);
				},
				error: function(data, textStatus){
					alert("다시 시도해주세요.");
				},
				complete : function (data, textstatus){
				}
			});
		} else{
			return false;
		}
		
	});

	//선택된 상품 삭제
	$(document).on('click', '#checkDelete', function(){
		var frm = document.mypageLikeProd;
		var checkProd = $("input:checkbox[name='checkProd']").is(":checked");

		if(checkProd == false){
			alert("선택된 상품이 없습니다.");
			return false;
		}
		
		document.getElementsByName("command")[0].value = "delete";
		
		frm.method="post";
		frm.action="/devFw/mypageLikeProd.do";
		frm.submit();
	});
	
	//관심 상품 모두 삭제
	$(document).on('click', '#allDelete', function(){
		var frm = document.mypageLikeProd;
		var checkProd = document.getElementsByName("checkProd");
		
		var size = $("#size").val();

		if(size == 0){
			alert("관심 상품이 없습니다.");
			return false;
		}
		//모두 체크해서 보내기
		for(i=0; i < checkProd.length; i++) {
			checkProd[i].checked = true;
		}
		document.getElementsByName("command")[0].value = "delete";
		
		frm.method="post";
		frm.action="/devFw/mypageLikeProd.do";
		frm.submit();
	});
	
	
	
/* 	//tr show&hide
	function showChooseOptionTr(){
		$('#selectOption').css("display","block");
	}
	 */
	/* //+, - 버튼 눌렀을 때 수량 변경
	function abuttonClick(pm){ 
		
 		
 		
		var amount = document.getElementById("cartCount").value;
	
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
	}
	
	//장바구니 수량 체크 후 담기 눌렀을 떄 최종적으로 addCart
	$(document).on('click','#finalGoToCart', function(){
		
		
		
		
	})//function end */
	
</script>
<style type="text/css">
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
	border-bottom: 1px solid lightgray;
}

.orderHistoryTable {
	text-align: center;
	width: -webkit-fill-available;
	border-top: 1px solid lightgray;
	border-collapse: collapse;
}

.OHtableTitle {
	background-color: #ccc;
}
.represent_img{
    width: 100px;
    height: 125px;
}
.orderButton{
	margin-top:3px;
}
#order, #allOrder{
	background:#424242;
	color:white;
	border:1px solid #424242;
}
#basket, #delete, #checkBasket{
	background:white;
	color:#424242;
	border:1px solid #A4A4A4;
}
#basket:hover, #delete:hover, #checkBasket:hover{
	border:1px solid #424242;
}
.left{
	float:left;
	margin-top:8px;
	margin-left:3px;
}
.right{
	float:right;
	margin-top:8px;
	margin-right:3px;
}
#checkDelete, #allDelete{
	background:#848484;
	color:white;
	border:1px solid #848484;
}
#checkDelete:hover, #allDelete:hover{
	background:#6E6E6E;
}
#allOrder, #allDelete{
	padding:10px;
}
input[type=button]{
	border-radius:6%;
}
</style>
</head>
<body>
<form name="mypageLikeProd">
<input type="hidden" name="memberId" id="memberId" value="${member.getMemberid() }">
<input type="hidden" name="command" value="">
<c:set var="size" value="${size }"/>
<input type="hidden" id="size" value="${size }">
<!-- 주문내역 상단 -->
	<div class="orderHistoryHeader">
		<h3>관심 상품 조회</h3>
	</div>
	<div class="orderHistoryContainer">
		<!-- 주문 상품 정보 테이블 시작  -->
		<table class="orderHistoryTable" id="orderHistoryTable">
			<!-- 주문 상품 정보 테이블 상단 제목   -->
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><input type="checkbox" id="allCheck" name="allCheck"></th>
					<th class="OHT_ttl"><span>상품이미지</span></th>
					<th class="OHT_ttl"><span>상품정보</span></th>
					<th class="OHT_ttl"><span>판매가</span></th>
					<th class="OHT_ttl"><span>거래방법</span></th>
					<th class="OHT_ttl"><span>선택</span></th>
				</tr>
			</thead>
			<tbody class="listLikeProd">
				<!-- 관심 상품 내용 -->
				<c:forEach var="myLikeProd" items="${myLikeProd }">
				<tr class="orderHistoryContents">
				
					<td class="OHC_cont"><input type="checkbox" name="checkProd" id="checkProd" value="${myLikeProd.prod_number }"></td>
					<td class="OHC_cont"><img src="${myLikeProd.represent_image }" class="represent_img"></td>
					<td class="OHC_cont">${myLikeProd.prod_title }</td>
					<td class="OHC_cont">
				
					<c:choose>
						<c:when test="${myLikeProd.reused_yn == 'n' and (myLikeProd.auction_yn == 'y' or myLikeProd.auction_yn == 'w' or myLikeProd.auction_yn == 'f') }"> <!-- 경매만 진행 -->
							<fmt:formatNumber value="${myLikeProd.auction_bid }" type="number" />원
							<input type="hidden" name="prod_price" id="prod_price" value="${myLikeProd.auction_bid }">
						</c:when>
						<c:when test="${myLikeProd.reused_yn == 'y' and (myLikeProd.auction_yn == 'y' or myLikeProd.auction_yn == 'w' or myLikeProd.auction_yn == 'f') }"> <!-- 경매와 중고 진행 -->
							<fmt:formatNumber value="${myLikeProd.auction_bid }" type="number" />원
							<input type="hidden" name="prod_price" id="prod_price" value="${myLikeProd.auction_bid }">
						</c:when>
						<c:when test="${myLikeProd.reused_yn == 'y' or myLikeProd.flea_yn == 'y' }"> <!-- 플리마켓이거나 중고 가격 표시 -->
							<fmt:formatNumber value="${myLikeProd.prod_price }" type="number" />원
							<input type="hidden" name="prod_price" id="prod_price" value="${myLikeProd.prod_price }">
						</c:when>
					</c:choose>
					</td>
					<td class="OHC_cont">
					<c:if test="${myLikeProd.send_way == 'direct'}">
						직거래
					</c:if>
					<c:if test="${myLikeProd.send_way == 'delivery'}">
						택배거래
					</c:if>
					<c:if test="${myLikeProd.send_way == 'direct delivery '}">
						직거래<br>택배거래
					</c:if>
					<c:if test="${myLikeProd.send_way == 'receipt'}">
						현장수령
					</c:if>
					</td>

					<td class="OHC_cont">
						<input type="button" value="주문하기" class="orderButton" id="order">
						<br>
						<input type="button" value="장바구니담기" class="orderButton" id="basket" data-prod="${myLikeProd.prod_number }"> 
						<br> 
						<input type="button" value="X 삭제" class="orderButton" id="delete" name="${myLikeProd.prod_number}">
					</td>
				</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<div id="buttons">
			<span class="left">선택상품을</span> 
			<input type="button" class="left" id="checkDelete" value="X 삭제하기">
			<input type="button" class="left" id="checkBasket" value="장바구니 담기">
			<input type="button" class="right" id="allDelete" value="관심상품 비우기">
			<input type="button" class="right" id="allOrder" value="전체상품주문">
		</div>
	</div>
</form>
</body>
</html>
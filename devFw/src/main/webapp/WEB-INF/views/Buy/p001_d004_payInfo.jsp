<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<%
   request.setCharacterEncoding("UTF-8");
   int ttlPrice = Integer.parseInt(request.getParameter("subTotalPrice"));
   String title = (String) request.getParameter("prod_title");
   int cnt = Integer.parseInt(request.getParameter("countProd"));
%>
<!DOCTYPE html>
<html lang="en">
<head>


<style type="text/css">
.orderHistoryHeader {
	padding: 5%;
}

.headerForPayInfo {
	margin-left: 10%;
	padding-top: 2%;
	y
}

.tableTr th {
	width: 150px;
	height: 28px;
	padding: 2%;
	font-size: 18px;
}

.tableTr td {
	width: 500px;
	height: 28px;
	padding: 2%;
	font-size: 18px;
}

.payForOrder {
	text-align: center;
	font-size: 15px;
}

.OHT_ttl {
	width: 18%;
	border-right: 1px solid lightgray;
	font-size: 15px;
	text-align: center;
	padding: 1%;
}

.OHC_cont {
	font-size: 13px;
	padding-left: 3%;
}

#pay {
	width: 39%;
	padding-top: 2%;
}

#form {
	width: 108%;
}

#input_new_Address, #ppay {
	font-size: 18px;
	border: 1px solid #afacac;
	border-radius: 9px;
	background-color: #e6e5e5;
}
/* #d1 {
	border-bottom: 1px solid lightgray;
} */
</style>
<!-- jQuery -->
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

   //페이지 켜자마자 총 주문 금액 계산
   $(document).ready(function(){

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
      
      var price = document.getElementById('finalPrice');
      price.value = Number(<%=ttlPrice%>)+2500;

      var finalPrice = price.value.format();
      
      price.innerHTML = finalPrice+"원";
      
   });
   
   //결제하기 눌렀을 때 결제창 띄우기
   function requestPay() {      
      var name = document.getElementById('buyerName').value; // 주문자 이름
      var buyerMemberId = document.getElementById('buyer_memberId').value; //주문자 아이디
      var postCode = document.getElementById('postcode').value; // 우편번호
      var detailAddr = document.getElementById('detailAddr').value; //상세주소
      var email = document.getElementById('email').value; //주문자 이메일
      var phoneNum = document.getElementById('buyerPhone').value; //주문자 연락처
      var product = "<%=title%>";
      var orderWant = document.getElementById('orderWant').value;
      
      var pay_method = $('input[name=size]:checked').val();
      console.log(pay_method);
      var price = <%=ttlPrice %>;
      
      var addr = "("+postCode+")"+detailAddr;
      
      // IMP.request_pay(param, callback) 호출
      IMP.init("imp43398102"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
      IMP.request_pay({ // param
         pg : "inicis",
         pay_method : pay_method,
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : product,
         amount : price,
         buyer_email : email,
         buyer_name : name,
         buyer_tel : phoneNum,
         buyer_addr : detailAddr,
         buyer_postcode : postCode
         
         
      }, function(rsp) { // callback
         if (rsp.success) {
               
            var orderInfo ={
                  order_num:rsp.merchant_uid,
                  pay_method:pay_method,
                  order_state: "결제완료",
                  buyer_memberId: buyerMemberId,
                  total_price: price,
                  order_want: orderWant
            }
            
            var destInfo ={
                  recipient: name,
                  destination_address: addr,
                  call_number:phoneNum,
                  memberid:buyerMemberId
            }
            
            $.ajax({
               type:"post",
               async:false,
               url:"/devFw/insertOrders.do",
               data :orderInfo,
               dataType:"text",
               
               success: function(responseData){
                  console.log('결제성공');
                  //결제 성공 시 배송지 정보에 저장!
                  $.ajax({
                     type:"post",
                     async:false,
                     url:"/devFw/insertDest.do",
                     data :destInfo,
                     dataType:"text",
                     
                     success: function(responseData){
                        console.log('주문 정보 삽입 성공');      
                     },
                     error:function(data, textStatus){
                        console.log("주문 정보 삽입 실패")
                     },
                     complete : function(data, textStatus){
                              
                     }
                  })//end of ajax2
                  
               },
               error:function(data, textStatus){
                  alert("결제실패")
               },
               complete : function(data, textStatus){
               
               }
            })//end of ajax
               
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;

         } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
         }
         alert(msg);
      });

   }
</script>
</head>
<body>
	<input type="hidden" id="buyer_memberId"
		value="${member.getMemberid()}">


	<form name="payInfo">
		<h2 style="padding-left: 18%; padding-top: 4%;">📃주문 및 결제 정보</h2>
		<div class="container" id="pay">
			<h3 style="font-size: 22px;">배송지 정보</h3>
			<!-- 배송정보 테이블 -->
			<input type="hidden" id="email" name="email"
				value=<%=session.getAttribute("email")%>>
			<table id="form">
				<tr id="d1">
					<th class="OHT_ttl">배송지 선택</th>
					<td class="OHC_cont"><input type="button" value="새로운 주소+"
						id="input_new_Address" onClick="newAddress()"></td>
				</tr>


				<tr id="d1">
					<th class="OHT_ttl">이름</th>
					<td class="OHC_cont"><span id="buyerName"><%=session.getAttribute("name")%></span></td>
				</tr>

				<tr id="d1">
					<th class="OHT_ttl">연락처</th>
					<td class="OHC_cont"><span id="buyerPhone"><%=session.getAttribute("phonenumber")%></span></td>
				</tr>

				<tr id="d1">
					<th class="OHT_ttl">주소</th>
					<td class="OHC_cont"><span id="postcode">(<%=session.getAttribute("address")%>)
					</span><span id="detailAddr"> <%=session.getAttribute("roadAddress")%>
							<%=session.getAttribute("detailAddress")%></span></td>
				</tr>
				<tr>
					<th class="OHT_ttl">배송메모</th>
					<td class="OHC_cont"><input type="text" id="orderWant"
						placeholder="배송메모를 작성해주세요.(200자이내)" style="width: 278px;"></td>
				</tr>
			</table>

			<br> <br> <br> <br> <br> <br>

			<!--결제하기 포인트 적용-->
			<h3 style="font-size: 22px;">결제 수단 선택</h3>
			<br>
			<table id="form">
				<tr>
					<th class="OHT_ttl">결제 수단</th>
					<td style="padding-left: 1%;">&nbsp&nbsp<input type="radio"
						name="size" id="kakaopay" value="small" /><label for="size_1">카카오페이</label>&nbsp&nbsp&nbsp&nbsp
						<input type="radio" name="size" id="card" value="small" /> <label
						for="size_2">신용카드</label>&nbsp&nbsp&nbsp&nbsp <input type="radio"
						name="size" id="samsungPay" value="small" /> <label for="size_3">삼성페이</label>&nbsp&nbsp&nbsp&nbsp
						<input type="radio" name="size" id="LPay" value="small" /> <label
						for="size_3">L.Pay</label>&nbsp&nbsp&nbsp&nbsp <input type="radio"
						name="size" id="SSGPay" value="small" /> <label for="size_3">SSGPay</label>&nbsp&nbsp&nbsp&nbsp
						<input type="radio" name="size" id="PAYCO" value="small" /> <label
						for="size_3">PAYCO</label>
					</td>
				</tr>
				<!-- 				<tr>
					<th class="OHT_ttl">포인트</th>
					<td class="OHC_cont"><input type="number" id="custPoint">&nbsp&nbspP&nbsp&nbsp&nbsp&nbsp보유포인트 </td>
				</tr>
 -->
			</table>

			<br> <br> <br> <br> <br> <br>
			<!-- 주문상품 정보 -->

			<h3 style="font-size: 22px;">주문 상품 정보</h3>
			<br>
			<table id="form">
				<tr>
					<th class="OHT_ttl">상품정보</th>
					<td class="OHC_cont"><%=title%>외</td>
				</tr>
				<tr>

					<th class="OHT_ttl">상품 금액</th>
					<td class="OHC_cont" id="prod_price"><%=ttlPrice%>원</td>
				</tr>
				<tr>

					<th class="OHT_ttl">총 주문 금액</th>
					<td class="OHC_cont" id="finalPrice"><%=ttlPrice%></td>
				</tr>
			</table>

			<br> <br>
			<div class="payForOrder" style="margin-left: 30%">
				<input type="button" id="ppay" value="결제하기" onClick="requestPay()">
			</div>
		</div>
		<!-- End Content -->
	</form>
</body>
</html>
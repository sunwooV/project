<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/main.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">


   //check box 전체 선택 
   $(document).ready(function(){
      
      $("#allCheck").click(function(){
    	  
         if($("#allCheck").prop("checked")){
            $("input[name=checkProd]").prop("checked",true);
         }else{
            $("input[name=checkProd]").prop("checked",false);
         }
      })
      
      var checkProd = document.getElementsByName("checkProd");

      //모두 체크해서 보내기
      for(i=0; i < checkProd.length; i++) {
         checkProd[i].checked = true;
      }
      
      document.getElementsByName("allCheck")[0].checked = true;
      
      $("#checkProd").click(function(){
         for(i=0; i < checkProd.length; i++) {
            if(checkProd[i].checked == false){
               document.getElementsByName("allCheck")[0].checked = false;
               checkProd[i].checked = false;
            
            }
         }
      })// end of checkProd click function
      
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

      //check된 가격만 계산하기
      var cnt = $("input:checkbox[name=checkProd]:checked"); // 체크된 체크박스 가져오기
      
      var priceTtl=[];
      
      var total = 0;
      cnt.each(function(i){
         var tr = cnt.parent().parent().eq(i);
         var td = tr.children();
         
         priceTtl[i] = td.eq(5).text();
         var realPrice =[];
         realPrice[i] = Number(priceTtl[i].substring(0,priceTtl[i].lastIndexOf("원")-1));
         
         console.log(realPrice[i]);
         
         total = total+realPrice[i];
         console.log(total);
      })
      var subTotal = document.getElementById("subTotal");
         subTotal.innerHTML = total.format()+"원";
      var subTotalPrice = document.getElementById("subTotalPrice");
      subTotalPrice.value= total;
      
      
   });
   
   //선택 상품 삭제 
   $(document).on('click','#delProd',function(){
      var memberId = $("#memberId").val();
      var delProd = [];
      $("input[name=checkProd]:checked").each(function(i){
         delProd[i] = $(this).val();
         console.log(delProd);
      })
      
      var delCartInfo ={
         delProd:delProd,
         memberId:memberId
      };
      
      if(confirm("선택한 상품을 삭제하시겠습니까?\n")){
         
         $.ajax({
            type:"post",
            async:false,
            url:"/devFw/delCart.do",
            data: delCartInfo,
            success:function(responseData){
               alert("삭제 성공");
               location.reload();
               
            },
            error:function(data, textStaus){
             alert("삭제 실패");
             return false;
            },
            complete:function(data,textStatus){
            
            }
         })//end of ajax
      }//end of if
      
   })
   
   //+, - 버튼 눌렀을 때 수량 변경
   function abuttonClick(pm, num){ //pm:plus,minus / num: prod_number 
       var price = $(".pri" + num).text();
      var amount = document.getElementsByName("count" + num)[0];

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
      var memberId=$('#memberId').val();
      var command = $("#command").val();
      var prod_number = num;
      var editCount = 'a'+prod_number;
      
      var count = $("."+editCount).val();
      console.log(count);
   
      var insertOrderInfo = {
            command:command,
            memberid:memberId,
            prod_number:prod_number,
            cart_count:count
      }
      $.ajax({
         type:"get",
         async:false,
         url:"/devFw/editCart.do",
         data :insertOrderInfo,
         dataType:"text",
         
         success: function(responseData){
            
            
         },
         error:function(data, textStatus){
            console.log("장바구니에 수정 실패");
         },
         complete : function(data, textStatus){
            
         } // end of second ajax complete
      });//end of ajax
   
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


      document.getElementsByName("t"+num)[0].innerHTML = total.format(); //천단위 , 찍어서 표현
      document.getElementsByName("t"+num)[0].value = total;
   }

   
   //click 시 주문결제로~~
   function moveToPayInfo() {
      var frm = document.Mycart;
      var cnt = $("input:checkbox[name=checkProd]:checked").length;
      
      var countProd = document.getElementById("countProd");
      countProd.value=cnt;
      
   
      frm.method = "get";
      frm.submit();
      frm.action = "/devFw/payInfo.do";

   }
   
   
   //관심상품 이동 후 카트에서 삭제
    

</script>

<style type="text/css">
.orderHistoryContainer {
	/* padding: 위 오른쪽 아래 왼쪽;*/
	padding: 1% 15% 1% 15%;
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
	background-color: #f9f9f9;
}

.expectCost {
	width: -webkit-fill-available;
}

.cta {
	margin-left: 50%;
}

.goToPayButton {
	padding-left: 48%;
}

.choiceOrder {
	margin-left: 15%
}

#delProd, #gotoLikeprod, #go {
	height: 31px;
	width: 10%;
	background-color: white;
	border: 1px solid gray;
	margin-left: 2%;
	border-radius: 7px;
}
</style>

</head>
<body>

	<form name="Mycart" method="post" action="./payInfo.do">
		<input type="hidden" id="command" name="command" value="edit">
		<input type="hidden" id="subTotalPrice" name="subTotalPrice" value="">
		<input type="hidden" id="countProd" name="countProd" value="">
		<input type="hidden" id="memberId" value="${member.getMemberid()}">
		<!-- 장바구니 상단 -->
		<div class="orderHistoryHeader">
			<h2>👜장바구니</h2>
		</div>
		<div class="orderHistoryContainer">
			<!-- 주문 상품 정보 테이블 시작  -->
			<table class="orderHistoryTable" id="orderHistoryTable">
				<!-- 주문 상품 정보 테이블 상단 제목   -->
				<thead class="orderHistoryTableTitles">
					<tr class="OHtableTitle">
						<th class="OHT_ttl"><input type="checkbox" id="allCheck"
							name="allCheck"></th>
						<th class="OHT_ttl"><span>상품이미지</span></th>
						<th class="OHT_ttl"><span>상품정보</span></th>
						<th class="OHT_ttl"><span>수량</span></th>
						<th class="OHT_ttl"><span>단가</span></th>
						<th class="OHT_ttl"><span>총 상품 금액</span></th>
					</tr>
					<!-- 상품 내용 cif 처리하기 -->
					<c:set var="total" value="0" />
					<c:set var="firstProdTitle" value="" />
					<c:forEach var="cartList" items="${dataList}" varStatus="status">
						<input type="hidden" id="prod_price"
							value="${cartList.prod_price}">
						<tr class="orderHistoryContents">
							<td class="OHC_cont"><input type="checkbox" name="checkProd"
								id="checkProd" value="${cartList.prod_number}"> <%--          <input type="hidden" name="prod_number" value="${cartList.prod_number}"> --%>
							</td>
							<td class="OHC_cont"><a
								href="${contextPath}/detail.do?prod_number=${cartList.prod_number}"><img
									src="${cartList.represent_image}" name="represent_image"
									style="width: 100px; height: 125px;"> </a></td>
							<td class="OHC_cont">${cartList.prod_title}<c:if
									test="${status.index eq 0 }">
									<c:set var="firstProdTitle" value="${cartList.prod_title}" />
								</c:if> <input type="hidden" name="prod_title"
								value="${firstProdTitle}">
							</td>
							<td class="OHC_cont"><input type="button"
								onClick="abuttonClick('minus',${cartList.prod_number })"
								value="-"> <input type="number"
								class="a${cartList.prod_number }" id="cart_count"
								name="count${cartList.prod_number }" min="1"
								max="${cartList.prod_amount}"
								style="text-align: center; border: 1px solid white; width: 10%; height: auto; text-align: right;"
								value="${cartList.cart_count}"> <input type="button"
								onClick="abuttonClick('plus',${cartList.prod_number })"
								class="${cartList.prod_number }" value="+"></td>
							<td class="OHC_cont" id="prod_price"><span
								class="pri${cartList.prod_number }">${cartList.real_prod_price}</span>원
							</td>
							<td class="OHC_cont"><span id="prod_ttl_price"
								name="t${cartList.prod_number }">${cartList.real_prod_price * cartList.cart_count}
							</span>원</td>

						</tr>
					</c:forEach>
					<tr>
						<td class="OHC_cont" colspan="6"
							style="height: 100px; font-size: 35px; text-align: right;">
							<h3 style="color: #da2626;">
								예상 결제 금액 = <span id="subTotal"></span>
							</h3>

						</td>

					</tr>
				</tbody>
			</table>
		</div>
		<div class="choiceOrder">
			<input type="button" id="delProd" value="선택상품 삭제하기">&nbsp&nbsp
			<input type="button" id="gotoLikeprod" value="관심상품으로 이동">
		</div>
		<div class="goToPayButton">
			<input type="button" id="go" onClick="moveToPayInfo()"
				style="font-size: 16px;" value="주문하기">
		</div>


		<!-- End Content -->
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).on('click', '.deleteProd', function(){
		var id = $(this).attr('id');
		var frm = document.SellerProduct;
		var myProductCheck = $("input:checkbox[name='myProductCheck']").is(":checked");
		var checkProd = document.getElementsByName("myProductCheck");

		if(id == 'selectDelete'){
			if(myProductCheck == false){
				alert("선택된 상품이 없습니다.");
				return false;
			} else {
				document.getElementById("division").value = id;
			}
		} else{
			//모두 체크해서 보내기
			for(i=0; i < checkProd.length; i++) {
				checkProd[i].checked = true;
			}
			document.getElementById("division").value = id;
		}
		
		if(confirm("정말 삭제하시겠습니까?")){
			
			
			frm.method="post";
			frm.action="/devFw/sellerPage.do";
			frm.submit();

		} else { //alert 취소 버튼 눌렀을 경우
			return false;
		}
	});
</script>
<style>
.rank{
	border: 3px solid #8a8282;
    border-radius: 70px;
    padding: 7px;
}
</style>
</head>
<body>
<form name="SellerProduct">
<div class="container">
<c:set var="sellerId" value="${sellerId }"/>
<c:set var="seller" value="${seller }"/>
<c:set var="seller_group" value="${seller_group }"/>
<c:set var="flea_seller_group" value="${flea_seller_group }"/>
<input type="hidden" name="memberId" value="${sellerId }"/>
	<br><br><br>
	<c:if test="${seller == 'yes' }"> <!-- seller 자신이 들어왔을 경우 -->
		<h1>나의 판매 물품 관리</h1>
	</c:if>
	<c:if test="${seller == 'no' }">
	<h1 style="text-align:center;">
		<c:if test="${(seller_group == 'y  ' or seller_group == 'Y  ') and flea_seller_group == 'N  '}"> <!-- 일반 판매자 -->
			<img class="rank" src="${contextPath }/resources/img/memberDivision/sellerMember.png" width="50px" height="50px">"${sellerId }" 님의 판매 물품
		</c:if>
		<c:if test="${(seller_group == 'y  ' or seller_group == 'Y  ') and flea_seller_group == 'y  '}"> <!-- 일반 판매자 -->
			<img class="rank" src="${contextPath }/resources/img/memberDivision/fleaMember.png" width="50px" height="50px">"${sellerId }" 님의 판매 물품
		</c:if>
		<c:if test="${seller_group == 'n  ' or seller_group == 'N  '}"> <!-- 일반 판매자 -->
			해당 회원은 판매자가 아닙니다.
		</c:if>
	</h1>
	</c:if>
	<hr><br>
	<div class="row">
		<c:forEach var="product" items="${sellerProduct }" varStatus="status">
			<div class="col-sm-3">
				<div class="thumbnail">
					<c:if test="${seller == 'yes' }">
						<input type="checkbox" name="myProductCheck" id="myProductCheck" value="${product.prod_number }">
					</c:if>
					<c:if test="${product.reused_yn == 'y' }">
						<!-- 상품 판매 카테고리 -->
						<span class="group">중고</span>
					</c:if>
					<c:if test="${product.auction_yn == 'y' or product.auction_yn == 'w' or product.auction_yn == 'f'}">
						<span class="group">경매</span>
					</c:if>
					<c:if test="${product.flea_yn == 'y' }">
						<span class="group">플리</span>
					</c:if>
					<c:if test="${product.auction_yn == 'y' }">
						<span class="group" style="color:red;">(경매 진행 중)</span>
					</c:if>
					<img src="${product.represent_image }"
						style="width: 230px; height: 240px;" alt="..."
						onclick="location.href='./detail.do?prod_number=${product.prod_number }'">
					<div class="caption">
						<h3>${product.prod_title }
							<c:if test="${product.sale_percent != null }">
							[${product.sale_percent }%]
						</c:if>
						</h3>
						<c:choose>
							<c:when test="${product.auction_yn == 'y' }">
								<p id="p">
									<fmt:formatNumber value="${product.auction_bid }"
										type="number" />
									원 
								</p>
							</c:when>
							<c:when test="${((product.auction_yn == 'f' or product.auction_yn == 'w') and product.reused_yn == 'n' and product.flea_yn == 'n') or product.prod_amount == 0}">
								<p id="p" style="color:red; font-weight:bold">품절</p>
							</c:when>
							<c:otherwise>
								<c:if test="${product.sale_percent != null }">
									<p>
										<span id="p"><fmt:formatNumber
												value="${product.prod_price * (1-(product.sale_percent*0.01)) }"
												type="number" />원</span> <span id="sale_price"
											style="margin-bottom: 1re;"><fmt:formatNumber
												value="${product.prod_price }" type="number" />원</span>
									</p>
								</c:if>
								<c:if test="${product.sale_percent == null }">
									<p id="p">
										<fmt:formatNumber value="${product.prod_price }"
											type="number" />
										원
									</p>
								</c:if>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<c:if test="${seller == 'yes' }">
		<div id="sellerButton">
			<input type="hidden" class="division" name="division" id="division" value="">
			<input type="button" class="deleteProd" id="selectDelete" value="선택상품삭제">
			<input type="button" class="deleteProd" id="allDelete" value="전체상품삭제">

			
		</div>

	
	</c:if>
</div>
</form>
</body>
</html>
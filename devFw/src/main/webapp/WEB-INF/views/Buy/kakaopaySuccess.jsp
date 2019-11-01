<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>결제창</title>
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.12.min.js" type="application/javascript"></script>
<script type="text/javascript">
function kakaoPay(){
	
}

</script>
</head>
<body>
카카오 페이 결제가 정상적으로 완료되었습니다.
결제일시:  [[${info.approved_At}]]<br>
주문번호 :  [[${info.partner_order_id}]]<br>
상품명:  [[${info.item_name}]]<br>
상품수량 
   
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MIU|장바구니 담김성공</title>
<style type="text/css">
.contentText {
	padding-top: 29%;
    padding-bottom:11%;
    font-size: 25px;
	text-align: center;
}

#button_ToOtherPage {
	text-align: center;
}

#button_ToOtherPage button {
	text-align: center;
	border: 1px solid gray;
	background-color: white;
	padding: 5px;
	border: 1px solid gray;
}

#button_ToOtherPage button:hover {
	color: white;
	background-color: black;
}

.StyleOfButton {
	position: relative;
  //display:block;
  height: 45px;
  width: 150px;
  margin: 10px 7px;
  padding: 5px 5px;
  font-weight: 700;
  font-size: 15px;
  letter-spacing: 2px;
  color: #383736;
  border: 2px #383736 solid;
  border-radius: 4px;
  text-transform: uppercase;
  outline: 0;
  overflow:hidden;
  background: none;
  z-index: 1;
  cursor: pointer;
  transition:         0.08s ease-in;
  -o-transition:      0.08s ease-in;
  -ms-transition:     0.08s ease-in;
  -moz-transition:    0.08s ease-in;
  -webkit-transition: 0.08s ease-in;
}

#ttl_content_payComplete {
	padding:10%;
}
.StyleOfButton:hover {
  color: whitesmoke;
}

.StyleOfButton:before {
  content: "";
  position: absolute;
  background: #383736;
  bottom: 0;
  left: 0;
  right: 0;
  top: 100%;
  z-index: -1;
  -webkit-transition: top 0.09s ease-in;
}

.StyleOfButton:hover:before {
  top: 0;
}
</style>
<script type="text/javascript">
	// 현재 팝업창 종료
/*	function closePopup() {
		self.close();
	}

	//리뷰 창으로 이동 + 현재 팝업창 종료
	function goToCart() {
		if (window.opener && !window.opener.closed) { //부모창이 존재하고 닫혀있지 않을때 
			window.opener.location = "./cart.do"; // 부모창에서 해당주소로 이동해라 -> 장바구니 이동
			window.close(); //그리고 열려있는 창을 닫아라
		}

	}
	*/
</script>
</head>
<body>
	<div id="ttl_content_changeProdComplete">
		<div class="contentText">
			상품이 장바구니에 담겼습니다.<br> <br>
		</div>

		<div id="button_ToOtherPage">
			<input type="button" class="StyleOfButton"
				id="StyleOfButton" value="쇼핑계속하기" onClick="closePopup()" /> 
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<input type="button" class="StyleOfButton"
				id="StyleOfButton" value="장바구니로" onClick="goToCart()" />
		</div>
	</div>
</body>
</html>
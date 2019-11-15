<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
	var removedItem, sum = 0;

	$(function() {
		// calculate the values at the start
		calculatePrices();

		// Click to remove an item
		$(document).on("click", "a.remove", function() {
			removeItem.apply(this);
		});

		// Undo removal link click
		$(document).on("click", ".removeAlert a", function() {
			// insert it into the table
			addItemBackIn();
			//remove the removal alert message
			hideRemoveAlert();
		});

		$(document).on("change", "input.quantity", function() {
			var val = $(this).val(), pricePer, total

			if (val <= "0") {
				removeItem.apply(this);
			} else {
				// reset the prices
				sum = 0;

				// get the price for the item
				pricePer = $(this).parents("td").prev("td").text();
				// set the pricePer to a nice, digestable number
				pricePer = formatNum(pricePer);
				// calculate the new total
				total = parseFloat(val * pricePer).toFixed(2);
				// set the total cell to the new price
				$(this).parents("td").siblings(".itemTotal").text(total+"원");

				// recalculate prices for all items
				calculatePrices();
			}
		});

	});

	function removeItem() {
		// store the html
		removedItem = $(this).closest("tr").clone();
		// fade out the item row
		$(this).closest("tr").fadeOut(500, function() {
			$(this).remove();
			sum = 0;
			calculatePrices();
		});
		// fade in the removed confirmation alert
		$(".removeAlert").fadeIn();

		// default to hide the removal alert after 5 sec
		setTimeout(function() {
			hideRemoveAlert();
		}, 5000);
	}

	function hideRemoveAlert() {
		$(".removeAlert").fadeOut(500);
	}

	function addItemBackIn() {
		sum = 0;
		$(removedItem).prependTo("table.items tbody").hide().fadeIn(500)
		calculatePrices();
	}

	function updateSubTotal() {
		$("table.items td.itemTotal").each(function() {
			var value = $(this).text();
			// set the pricePer to a nice, digestable number
			value = formatNum(value);

			sum += parseFloat(value);
			$("table.pricing td.subtotal").text(sum.toFixed(2)+"원");
		});
	}

	function addTax() {
		var tax = parseFloat(sum * 0.1).toFixed(2);
		$("table.pricing td.tax").text(tax+"원");
	}

	function calculateTotal() {
		var subtotal = $("table.pricing td.subtotal").text(), tax = $(
				"table.pricing td.tax").text(), shipping = $(
				"table.pricing td.shipping").text(), total;

		subtotal = formatNum(subtotal);
		tax = formatNum(tax);
		shipping = formatNum(shipping);

		total = (subtotal + tax + shipping).toFixed(2);

		$("table.pricing td.orderTotal").text(total+"원");
	}

	function calculatePrices() {
		updateSubTotal();
		addTax();
		calculateTotal();
	}

	function formatNum(num) {
		return parseFloat(num.replace(/[^0-9-.]/g, ','));
	}
</script>
<style type="text/css">
@import
	url(https://fonts.googleapis.com/css?family=Bitter:400,400italic,700);

#tableTr {
	font-size: 20px;
	text-align: center;
	
}

.contentCart, .cost{
	text-align: center;
	padding :3%;
}

.items{
margin-left:32%
}
.items tr{
width:200px;
}
.descForOption{
margin:1%;
}

</style>
</head>
<body>

	<div class="contentCart">
		<h1>
		 장바구니
		</h1>
		<p class="descForOption">상품 옵션에 관한 수정 및 삭제가 가능합니다. 변경 후 최종 주문을 원하시면 결제하기를 클릭해주세요.</p>

		<table class="items">
			<thead>
				<tr>
					<th id="tableTr">상품명</th>
					<th id="tableTr">수량</th>
					<th id="tableTr">총 금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="item">
							<div class="item-front">
								<img src="${Path}/resources/image/케익.jpg" width="200px"
									height="200px" />
							</div>
						</div>
						<p>
							테스트용 케익<sup>&reg;</sup><br /> <span class="itemNum">제품코드</span>
						</p>

					</td>
					<td><input type="number" class="quantity" value="1" min="1" />
						<a href="#" class="remove">삭제하기</a></td>
					<td class="itemTotal">5000</td>
				</tr>
				<tr>
					<td>
						<div class="item">
							<div class="item-front">
								<img src="${Path}/resources/image/케익.jpg" width="200px"
									height="200px" />
							</div>
						</div>
						<p>
							Hario Skerton Grinder<br /> <span class="itemNum">제품코드</span>
						</p>

					</td>
					<td><input type="number" class="quantity" value="1" min="1" />
						<a href="#" class="remove">삭제하기</a></td>
					<td class="itemTotal">4000</td>
				</tr>
				<tr>
					<td>
						<div class="item">
							<div class="item-front">
								<img src="${Path}/resources/image/케익.jpg" width="200px"
									height="200px" />
							</div>
						</div>
						<p>
							Hario V60 Kettle<br /> <span class="itemNum">제품코드</span>
						</p>

					</td>
					
					<td><input type="number" class="quantity" value="1" min="1" />
						<a href="#" class="remove">삭제하기</a></td>
					<td class="itemTotal">6000</td>
				</tr>
				<tr>
					<td>
						<div class="item">
							<div class="item-front">
								<img src="${Path}/resources/image/케익.jpg" width="200px"
									height="200px" />
							</div>
						</div>
						<p>
							Zingerman&rsquo;s Brazil Sweet Yellow<br /> <span
								class="itemNum">제품코드</span>
						</p>

					</td>
					
					<td><input type="number" class="quantity" value="1" min="1" />
						<a href="#" class="remove">삭제하기</a></td>
					<td class="itemTotal">3000</td>
				</tr>
			</tbody>
		</table>

		<div class="cost">
			<h2>예상 결제 내역</h2>

			<table class="pricing">
				<tbody>
					<tr>
						<td>총 상품 금액</td>
						<td class="subtotal"></td>
					</tr>
					<tr>
						<td>부가가치세(10%)</td>
						<td class="tax"></td>
					</tr>
					<tr>
						<td>배송비</td>
						<td class="shipping">2500원</td>
					</tr>
					<tr>
						<td><strong>결제 예상 금액</strong></td>
						<td class="orderTotal"></td>
					</tr>
				</tbody>
			</table>
			<button class="cta" onClick="location.href='#'">결제하기 &raquo;</button>
		</div>
	</div>
	<!-- End Content -->
</body>
</html>
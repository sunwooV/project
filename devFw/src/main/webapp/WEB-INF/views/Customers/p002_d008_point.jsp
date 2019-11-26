<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>


h2{
    text-align: center;
    

}
.ec-base-box.gHalf {
    position: relative;
    padding: 20px 0;
       width: 1510px;

}

.ec-base-box {
    padding: 24px;
    margin-left: auto;
    margin-right: auto;
    border: 1px solid #dcdcdc;
    color: #404040;
}
.xans-myshop-summary {
    margin: 0 0 20px;
}
* {
    font-family: "Noto Sans KR",sans-serif;
}

div {
    display: block;
}

body, code {
    font-size: 12px;
    color: #353535;
    background: #fff;
}

html {
    color: -internal-root-color;
}
.ec-base-box.gHalf:before {
    position: absolute;
    top: 0;
    left: 50%;
    display: block;
    content: "";
    width: 1px;
    height: 100%;
    background-color: #e6e6e6;
}


.ec-base-box.gHalf:before {
    position: absolute;
    top: 0;
    left: 50%;
    display: block;
    content: "";
    width: 1px;
    height: 100%;
    background-color: #e6e6e6;
}

* {
    font-family: "Noto Sans KR",sans-serif;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.ec-base-box {
    padding: 24px;
    margin-left: auto;
    margin-right: auto;
    border: 1px solid #dcdcdc;
    color: #404040;
}
body, code {
    font-size: 12px;
    color: #353535;
    background: #fff;
}

html {
    color: -internal-root-color;
}
.xans-myshop-summary ul:after {
    content: "";
    display: block;
    clear: both;
}

.xans-myshop-summary ul li {
    float: left;
    margin: 5px 0;
    padding: 0 45px;
    width: 50%;
    height: 20px;
    font-size: 12px;
    line-height: 1.6;
    vertical-align: top;
    box-sizing: border-box;
}

.xans-myshop-summary .data {
    float: right;
    width: 50%;
    padding: 0 10px 0 10px;
    text-align: right;
    box-sizing: border-box;
}
li {
    list-style: none
    }

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
	border-bottom:1px solid darkgray;
}

.orderHistoryTable {
	text-align: center;
	width: -webkit-fill-available;
	border-top:1px solid darkgray;
	border-collapse:collapse;
}

.OHtableTitle{
background-color:#faf5f1;
}

</style>
<body>
<h2 style="margin: 45px;">포인트 조회</h2>
<div class="xans-element- xans-myshop xans-myshop-summary ec-base-box gHalf"><ul>
<li class="">
<strong class="title">총 포인트</strong> <span class="data"><span id="xans_myshop_summary_total_mileage">${point.total_point }point</span>&nbsp;</span>
</li>
            <li class="">
           <div class="mainImg"> <!-- 상품 대표 이미지 -->
				<a href="${grad.grade_img }" rel="prettyPhoto" title="This is the description"><img src="" alt="This is the title" /></a>	
			</div>

</li>
            <li class="">
<strong class="title">사용가능 포인트</strong> <span class="data"><span id="xans_myshop_summary_used_mileage">${point.useable_point  }point</span>&nbsp;</span>
</li>
            <li class="">
            	

</li>
            <li class="">
<strong class="title">사용 포인트</strong> <span class="data"><span id="xans_myshop_summary_returned_mileage">${point.use_point }point</span>&nbsp;</span>
</li>
            <li class="">

</li>
           <li class="">
<strong class="title">소멸 포인트</strong> <span class="data"><span id="xans_myshop_summary_returned_mileage">${point.disappear_point }point</span>&nbsp;</span>
</li>
        </ul>
</div>

	<!-- 주문내역 상단 -->
	<div class="orderHistoryHeader">
		<h3>주문 내역 조회</h3>
	</div>
	<div class="orderHistoryContainer">
		<!-- 주문 상품 정보 테이블 시작  -->
		<table class="orderHistoryTable" id="orderHistoryTable">
			<!-- 주문 상품 정보 테이블 상단 제목   -->
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><span>주문일자<br>[주문번호]
					</span></th>
					<th class="OHT_ttl"><span>상품이미지</span></th>
					<th class="OHT_ttl"><span>상품정보</span></th>
					<th class="OHT_ttl"><span>수량</span></th>
					<th class="OHT_ttl"><span>상품구매금액</span></th>
					<th class="OHT_ttl"><span>주문처리상태</span></th>
					<th class="OHT_ttl"><span>제품상태처리</span></th>
				</tr>
			</thead>
			<tbody>
				<!-- 첫 번째 상품 내용 -->
				<tr class="orderHistoryContents">
					<td class="OHC_cont"><span class="orderDate" id="orderDate">2019-11-20</span>
						<br> <a href="#" class="orderNum" id="orderNum">[20191120-0000000]</a></td>

					<td class="OHC_cont"><span class="prod_1st_img" id="prod_1st_img">이미지</span></td>
					<td class="OHC_cont"><span class="prod_short_detail"
						id="prod_short_detail">상품 정보 설명들어감 제목 + 선택한 옵션</span></td>
					<td class="OHC_cont"><span class="prod_cnt" id="prod_cnt">2</span></td>
					<td class="OHC_cont"><span class="ttl_eachProd_price"
						id="ttl_eachProd_price">29,000원</span></td>
					<td class="OHC_cont"><span class="order_state"
						id="order_state">배송준비중</span></td>

					<td class="OHC_cont"><input type="button" value="취소신청 및 교환 신청"
						class="orderButton" id="cancel_order" onClick="location.href='${contextPath}/changeProduct.do'">
						<br>
						<input type="button" value="리뷰쓰기"
						class="orderButton" id="review_order" onClick="location.href='${contextPath}/review.do'">
						<br>
						<input type="button" value="구매확정하기"
						class="orderButton" id="confirmBuy_order" onClick="location.href='${contextPath}/confirmBuy.do'">
						</td>
				</tr>
				<!-- 2번째 상품 내용 -->
			</tbody>
		</table>
	</div>

</body>
</html>
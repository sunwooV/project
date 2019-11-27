<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script type="text/javascript">

            
        	//상세정보, Q&A, 상품후기 나누는 탭
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
	width: 1300px;
	border-top:1px solid gray;
	border-collapse:collapse;

}

.OHtableTitle{
background-color:#faf5f1;
}
.tab-content{
	width: 758px;
	margin-left:-100px;

}

.up{
	width:75%;
	margin:0px auto;
}
.down{
	width:75%;
	float:left;
	margin:30px 13%;
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

<div class="down"> 
<!-- 상품 상세설명, Q&A, 후기 -->
			<ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#usablepoint">적립 포인트</a></li>
			    <li><a data-toggle="tab" href="#usepoint">사용한 포인트</a></li>
			    <li><a data-toggle="tab" href="#disappear">소멸예정 포인트</a></li>
			<!--     <li><a data-toggle="tab" href="#menu3">Menu 3</a></li> -->
			</ul>
			<div class="tab-content">
			<div id="usablepoint" class="tab-pane fade in active">
			<br>
			    	<h2>적립포인트</h2>
			    	<br>
			    	   <div class="orderHistoryHeader"></div>
	<div class="orderHistoryContainer">
		<!-- 주문 상품 정보 테이블 시작  -->
		<table class="orderHistoryTable" id="orderHistoryTable">
			<!-- 주문 상품 정보 테이블 상단 제목   -->
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><span>적립날짜<br>
					</span></th>
					<th class="OHT_ttl"><span>내용</span></th>
					<th class="OHT_ttl"><span>적립금</span></th>
				</tr>
			</thead>
	
	<c:set var="size" value="${listSize }"/>
	<c:choose>
                        <c:when test="${size == 0}">
                            <tr>
                                <td colspan="20" align="center">
                              		조회된 결과가 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="row" items="${list}" >
                            
                                <tr>
                                
                                    <td align="center">
                                     <fmt:formatDate value="${row.point_start}" pattern="yyyy-MM-dd HH:mm:ss" />
                                     </td>
                                       <td align="center">${row.content}</td>
                                    <td align="center">${row.score}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise> 
                    </c:choose>
		</table>
	</div>
			</div>
			
			
			 <div id="usepoint" class="tab-pane fade">
			 <br>
			      <h2>사용포인트</h2>
			      <br>
			      <div class="orderHistoryHeader"></div>
	<div class="orderHistoryContainer">
		<!-- 주문 상품 정보 테이블 시작  -->
		<table class="orderHistoryTable" id="orderHistoryTable">
			<!-- 주문 상품 정보 테이블 상단 제목   -->
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><span>사용날짜<br>
					</span></th>
					<th class="OHT_ttl"><span>내용</span></th>
					<th class="OHT_ttl"><span>사용한 포인트</span></th>
				</tr>
			</thead>
	
	<c:set var="size" value="${listSize }"/>
	<c:choose>
                        <c:when test="${size == 0}">
                            <tr>
                                <td colspan="20" align="center">
                              		조회된 결과가 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="row" items="${list}" >
                            
                                <tr>
                                
                                    <td align="center">
                                     <fmt:formatDate value="${row.point_start}" pattern="yyyy-MM-dd HH:mm:ss" />
                                     </td>
                                       <td align="center">${row.content}</td>
                                    <td align="center">${row.score}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise> 
                    </c:choose>
		</table>
	</div>
</div>

 <div id="disappear" class="tab-pane fade">
 <br>
			      <h2>소멸포인트</h2>
			      <br>
			           <div class="orderHistoryHeader"></div>
	<div class="orderHistoryContainer">
		<!-- 주문 상품 정보 테이블 시작  -->
		<table class="orderHistoryTable" id="orderHistoryTable">
			<!-- 주문 상품 정보 테이블 상단 제목   -->
			<thead class="orderHistoryTableTitles">
				<tr class="OHtableTitle">
					<th class="OHT_ttl"><span>적립날짜<br></span></th>
					<th class="OHT_ttl"><span>소멸예정날짜<br></span></th>
					<th class="OHT_ttl"><span>내용</span></th>
					<th class="OHT_ttl"><span>소멸 포인트</span></th>
				</tr>
			</thead>
	
	<c:set var="size" value="${listSize }"/>
	<c:choose>
                        <c:when test="${size == 0}">
                            <tr>
                                <td colspan="20" align="center">
                              		조회된 결과가 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="row" items="${list}" >
                            
                                <tr>
                                
                                    <td align="center">
                                     <fmt:formatDate value="${row.point_start}" pattern="yyyy-MM-dd HH:mm:ss" />
                                     </td>
                                      <td align="center">
                                     <fmt:formatDate value="${row.point_start}" pattern="yyyy-MM-dd HH:mm:ss" />
                                     </td>
                                       <td align="center">${row.content}</td>
                                    <td align="center">${row.score}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise> 
                    </c:choose>
		</table>
	</div>
			    </div>
</div>
</div>



	
</form>
</body>
</html>
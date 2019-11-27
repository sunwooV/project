<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금도끼은도끼|리뷰작성</title>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<style type="text/css">
/*******************************************
  = LESS
*******************************************/
/* LESS - Mixins */
/*******************************************
  = TYPOGRAPHY
*******************************************/

/*******************************************
  = LAYOUT
*******************************************/
* {
	-webit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border: 0;
}
/*******************************************
  = RATING
*******************************************/
/* RATING - Form */
.rating-form {
	margin-top: 40px;
}
/* RATING - Form - Group */
.rating-form .form-group {
	position: relative;
	border: 0;
}
/* RATING - Form - Legend */
.rating-form .form-legend {
	display: none;
	margin: 0;
	padding: 0;
	font-size: 20px;
	font-size: 2rem;
	/*background: green;*/
}
/* RATING - Form - Item */
.rating-form .form-item {
	position: relative;
	margin: auto;
	width: 500px;
	text-align: center;
	direction: rtl;
	/*background: green;*/
}

.rating-form .form-legend+.form-item {
	padding-top: 10px;
}

.rating-form input[type='radio'] {
	position: absolute;
	left: -9999px;
}
/* RATING - Form - Label */
.rating-form label {
	display: inline-block;
	cursor: pointer;
}

.rating-form .rating-star {
	display: inline-block;
	position: relative;
}

.rating-form input[type='radio']+label:before {
	content: attr(data-value);
	position: absolute;
	right: 30px;
	top: 83px;
	font-size: 30px;
	font-size: 3rem;
	opacity: 0;
	direction: ltr;
	-webkit-transition: all 0s ease 0s;
	-moz-transition: all 0s ease 0s;
	-o-transition: all 0s ease 0s;
	transition: all 0s ease 0s;
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

.rating-form input[type='radio']:checked+label:before {
	right: 8px;
	opacity: 1;
}

.rating-form input[type='radio']+label:after {
	content: "";
	position: absolute;
	right: 5px;
	top: 96px;
	font-size: 15px;
	font-size: 15px;
	opacity: 0;
	direction: ltr;
	-webkit-transition: all 0s ease 0s;
	-moz-transition: all 0s ease 0s;
	-o-transition: all 0s ease 0s;
	transition: all 0s ease 0s;
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

.rating-form input[type='radio']:checked+label:after {
	/*right: 5px;*/
	opacity: 1;
}

.rating-form label .fa {
	font-size: 60px;
	font-size: 6rem;
	line-height: 60px;
	-webkit-transition: all 0s ease 0s;
	-moz-transition: all 0s ease 0s;
	-o-transition: all 0s ease 0s;
	transition: all 0s ease 0s;
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

.rating-form label:hover .fa-star-o, .rating-form label:focus .fa-star-o,
	.rating-form label:hover ~ label .fa-star-o, .rating-form label:focus 
	 ~ label .fa-star-o, .rating-form input[type='radio']:checked ~ label .fa-star-o
	{
	opacity: 0;
}

.rating-form label .fa-star {
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
}

.rating-form label:hover .fa-star, .rating-form label:focus .fa-star,
	.rating-form label:hover ~ label .fa-star, .rating-form label:focus ~
	label .fa-star, .rating-form input[type='radio']:checked ~ label .fa-star
	{
	opacity: 1;
}

.rating-form input[type='radio']:checked ~ label .fa-star {
	color: gold;
}

.rating-form .ir {
	position: absolute;
	left: -9999px;
}
/* RATING - Form - Action */
.rating-form .form-action {
	opacity: 0;
	position: absolute;
	left: 5px;
	bottom: -40px;
	-webkit-transition: all 0s ease 0s;
	-moz-transition: all 0s ease 0s;
	-o-transition: all 0s ease 0s;
	transition: all 0s ease 0s;
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

.rating-form input[type='radio']:checked ~ .form-action {
	cursor: pointer;
	opacity: 1;
}

.rating-form .btn-reset {
	display: inline-block;
	margin: 0;
	padding: 4px 10px;
	border: 0;
	font-size: 10px;
	font-size: 1rem;
	background: #fff;
	color: #333;
	cursor: auto;
	border-radius: 5px;
	outline: 0;
	-webkit-transition: all 0s ease 0s;
	-moz-transition: all 0s ease 0s;
	-o-transition: all 0s ease 0s;
	transition: all 0s ease 0s;
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

.rating-form .btn-reset:hover, .rating-form .btn-reset:focus {
	background: gold;
}

.rating-form input[type='radio']:checked ~ .form-action .btn-reset {
	cursor: pointer;
}
/* RATING - Form - Output */
.rating-form .form-output {
	display: none;
	position: absolute;
	right: 15px;
	bottom: -45px;
	font-size: 30px;
	font-size: 3rem;
	opacity: 0;
	-webkit-transition: all 0s ease 0s;
	-moz-transition: all 0s ease 0s;
	-o-transition: all 0s ease 0s;
	transition: all 0s ease 0s;
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

.no-js .rating-form .form-output {
	right: 5px;
	opacity: 1;
}

.rating-form input[type='radio']:checked ~ .form-output {
	right: 5px;
	opacity: 1;
}

.textArea {
	padding: 3%;
	text-align: center;
}

.reviewTextArea {
	border: 1px solid black;
	width: 500px;
	height: 300px;
}

.ReviewTitle {
	text-align: center;
	font-size: 20px;
	padding-top: 3%;
	font-size: 20px;
}

.ReviewButton {
	text-align: center;
}

.ReviewButtonStyle {
	width: 100px;
	height: 30px;
	background-color: darkgray;
	color: white;
}

.TotalReviewSection {
	padding: 5%;
}
.form-action{
padding:10% 10% 8.5% 0%;
}

</style>
	<script type="text/javascript">
		//리뷰 내용 썼는지 체크
		function submitReview() {
			var frm = document.ratefrm;
			//리뷰내용 가져오기
			var reviewDetail = document.getElementsByName('review_content')[0].value;
			alert(reviewDetail);
			
			if(reviewDetail != null || reviewDetail != ''){
				
				moveToAnotherPage();
				alert("타고 들어가니?")
			}else if(reviewDetail == null || reviewDetail == ''){
				alert("리뷰 내용을 입력하세요!");
			}
			

			frm.method="get";
			frm.action = "./insertReview.do";
			frm.submit();//name이 있는 것을 모두 넘겨준당~~~~~
		}

		
		
		function cancelReview(){
			self.close(); // 자기자신의 창을 닫아라!!
					}
	</script>
</head>
<body>
	<div class="TotalReviewSection">
		<div class="ReviewTitle">
			<h2>리뷰작성</h2>
		</div>
		<!-- RATING - Form -->
		<form class="rating-form" name="ratefrm">
			<fieldset class="form-group">

				<legend class="form-legend">Rating:</legend>

				<div class="form-item">

					<input id="rating-5" name="review_score" type="radio" value="5" /> <label
						for="rating-5" data-value="5"> <span class="rating-star">
							<i class="fa fa-star-o"></i> <i class="fa fa-star"></i>
					</span> <span class="ir">5</span>
					</label> <input id="rating-4" name="review_score" type="radio" value="4" /> <label
						for="rating-4" data-value="4"> <span class="rating-star">
							<i class="fa fa-star-o"></i> <i class="fa fa-star"></i>
					</span> <span class="ir">4</span>
					</label> <input id="rating-3" name="review_score" type="radio" value="3" /> <label
						for="rating-3" data-value="3"> <span class="rating-star">
							<i class="fa fa-star-o"></i> <i class="fa fa-star"></i>
					</span> <span class="ir">3</span>
					</label> <input id="rating-2" name="review_score" type="radio" value="2" /> <label
						for="rating-2" data-value="2"> <span class="rating-star">
							<i class="fa fa-star-o"></i> <i class="fa fa-star"></i>
					</span> <span class="ir">2</span>
					</label> <input id="rating-1" name="review_score" type="radio" value="1" /> <label
						for="rating-1" data-value="1"> <span class="rating-star">
							<i class="fa fa-star-o"></i> <i class="fa fa-star"></i>
					</span> <span class="ir">1</span>
					</label>
<br><br>
					<div class="form-action">
						<input class="btn-reset" type="reset" value="Reset" />
					</div>

					<div class="form-output">
					
					</div>
<br><br>
				</div>
				<div class="textArea">
					<textarea class="reviewTextArea" id="reviewTextArea" name="review_content" placeholder="리뷰를 작성해주세요"></textarea>
				</div>
				<div class="ReviewButton" id="ReviewButton">
					<input type="button" class="ReviewButtonStyle" onClick="submitReview()" value="리뷰작성완료" />
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
					<input type="button" class="ReviewButtonStyle" onClick="cancelReview()" value="취소하기" />
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>
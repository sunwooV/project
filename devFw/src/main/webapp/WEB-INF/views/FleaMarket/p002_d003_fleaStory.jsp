<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("utf-8");
	String flea_code = request.getParameter("flea_code");
	System.out.println(":::::flea_code" + flea_code);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>금도끼은도끼| 플리마켓</title>
<link rel="stylesheet"
	href="${contextPath }/resources/css/shop-homepage.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="${contextPath}/resources/css/shop-homepage.css"
	rel="stylesheet">
<!-- 별점 -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg=="
	crossorigin="anonymous">
<link rel="stylesheet" href="/stylesheets/style.css"
	integrity="sha256-OlSbjYBfrJGGd2zbT3qCsAZsPGxRwKOSGjqqfjF8aiY= sha512-1aDUINxj8c9UXJ76eIMAkG2/ofIjG8FBW4drgHUglwY/rGn+YWUtm8iSkrpAOtwZ9b9LEva02KPrTDx3M5ib3w=="
	crossorigin="anonymous">
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca839997c3bd98863fdc033319b76889&libraries=services"></script>
<!-- Jquery Rate Picker-->
<script type="text/javascript"
	src="${contextPath}/resources/js/jquery-rate-picker.js"></script>
<script>
	$(document).ready(
					function() {
						$("#chat-header>i").on("click", addMember);

						function addMember() {
							$('#user-add').fadeIn();
						}

						//팝업 이벤트
						$("#chat-header>i").on("click", showPopup);
						$("#pop-close").on("click", closePopup);

						//팝업 검색
						$("#pop-search>input[type=text]").on("keydown",
								function(event) {
									if (event.keyCode == 13) {
										popSearch();
									}
								});
						$("#pop-search>input[type=button]").on("click",
								function() {
									alert("aa");
									popSearch();
								});

						function popSearch(/*웹소켓 객체*/) {
							alert("확인;;;");
							$('#pop-footer>input').prop('disabled', false);
							var input = $('#pop-search>input[type=text]')
									.toArray()[0];
							//입력값으로 select날려서 결과받아 뿌리기
							var contents = {
								keyword : $(input).val()
							}
							sendText(ws, "search_member", contents);
						}

						function showPopup() {
							$('#pop-list').empty();
							$('#user-add').css('display', 'block');
							$('#pop-footer>input').prop('disabled', true);
						}

						function closePopup() {
							$('#user-add').css('display', 'none');
						}

						function filter() {
							alert("타는지 확인");
							var value, name, item, i;

							value = document.getElementById("value").value
									.toUpperCase();
							item = document.getElementsByClassName("item");

							for (i = 0; i < item.length; i++) {
								name = item[i].getElementsByClassName("name");
								if (name[0].innerHTML.toUpperCase().indexOf(
										value) > -1) {
									item[i].style.display = "flex";
								} else {
									item[i].style.display = "none";
								}
							}
						}

						function deselect(e) {
							$('.pop').slideFadeToggle(function() {
								e.removeClass('selected');
							});
						}

						function deselect2(e) {
							$('.pop2').slideFadeToggle(function() {
								e.removeClass('selected2');
							});
						}

						$(function() {
							$('#contact').on('click', function() {
								if ($(this).hasClass('selected')) {
									deselect($(this));
								} else {
									$(this).addClass('selected');
									$('.pop').slideFadeToggle();
								}
								return false;
							});

							$('.close').on('click', function() {
								deselect($('#contact'));
								return false;
							});
						});

						$(function() {
							$('#participants_add').on('click', function() {
								if ($(this).hasClass('selected2')) {
									deselect2($(this));
								} else {
									$(this).addClass('selected2');
									$('.pop2').slideFadeToggle();
								}
								return false;
							});

							$('.close2').on('click', function() {
								deselect2($('#participants_add'));
								return false;
							});
						});

						$.fn.slideFadeToggle = function(easing, callback) {
							return this.animate({
								opacity : 'toggle',
								height : 'toggle'
							}, 'fast', easing, callback);
						};

						$(".selbox_comm").click(
								function() {
									alert("ssss");
									$(".selbox_comm").attr('class',
											'selbox_comm v2 on ');
								});

						$(document)
								.on(
										'click',
										'.enrollstory',
										function() {
											//alert("====story 등록 클릭 시 =====");
											var story_cotent = $(
													'#prod_story_text').val();
											var story_title = $(
													'.story_title_text').val();
											var command = 'insert';
											var flea_code =
<%=flea_code%>
	;
											var memberId = $("#memberId").val();

											//alert(story_cotent + "/"
											//		+ story_title + "/"
											//		+ command + "/" + flea_code
											//		+ "/" + memberId);

											var data = {
												story_title : story_title,
												story_cotent : story_cotent,
												command : command,
												flea_code : flea_code,
												memberId : memberId
											}

											$
													.ajax({
														type : "post",
														async : false,
														url : "/devFw/storyComment.do",
														data : data,
														dataType : 'text',
														success : function(
																responseData) {
															//alert("등록 클릭 시 success");
															var data = JSON
																	.parse(responseData);
															//alert(data);
															var list = '';

															for (var i = 0; i < data.length; i++) {
																list += '<div class="bordering style="width: 200%; margin-bottom: 10px;"><input name="time_stamp" type="hidden" value="1575262761000">';
																list += '<div class="area-txt"><div class="area-rating"><div class="img-bg" style="background-image: url(https://image.idus.com/image/files/d6c74ae706ad40f1b6f83af3d5b1334d_512.jpg)"></div>';
																list += '<a href="#" class="title ellipsis">'
																		+ data[i].story_title
																		+ '</a></div>';
																list += '<a href="#" target="_blank"><div class="split-hard"><span class="split crop-circ" style="background-image: url(https://image.idus.com/image/files/37cec8c9f8bd47458facc5bdacfb0b24.jpg)"> </span>';
																list += '<div class="split"><span class="txt-strong">'
																		+ data[i].memberid
																		+ '</span><span class="txt">'
																		+ data[i].story_write_date
																		+ '</span> </div></div>';
																list += '<p class="desc">'
																		+ data[i].story_cotent
																		+ '</p><br></a></div></div>';

															}
															$("#storyAdd")
																	.html(list);
														},
														error : function(data,
																textStatus) {
															alert("다시 시도해주세요.");
														},
														complete : function(
																data,
																textstatus) {
														}
													});

										});

					});

	//paging
	$(document)
			.on(
					'click',
					'#paging a',
					function() {
						var $item = $(this);
						var $id = $item.attr("id");
						var selectedPage = $item.text();

						if ($id == "next")
							selectedPage = next;
						if ($id == "prev")
							selectedPage = prev;

						var memberId = $("#memberId").val(); //로그인한 아이디
						var qnaCnt = $("#qnaCnt").val();
						var flea_code =
<%=flea_code%>
	;

						var page = {
							currentPage : selectedPage,
							flea_code : flea_code
						}

						$
								.ajax({
									type : "post",
									async : false,
									url : "/devFw/pagingStory.do",
									data : page,
									dataType : 'text',
									success : function(responseData) {
										var data = JSON.parse(responseData);

										var list = "";

										for (var i = 0; i < data.length; i++) {
											list += '<div class="bordering" style="width: 386px; margin-bottom: 10px; float:left;">'
													+ '<input name="time_stamp" type="hidden" value="1575262761000">'
													+ '<div class="area-txt"><div class="area-rating">'
													+ ' <div class="img-bg" style="background-image: url(https://image.idus.com/image/files/d6c74ae706ad40f1b6f83af3d5b1334d_512.jpg)"></div>'
													+ '<a href="#" class="title ellipsis">'
													+ data[i].story_title
													+ '</a></div>'
													+ '<a href="#" class="title ellipsis">'
													+ data[i].story_title
													+ '</a>'
													+ '   </div>'

													+ '  <a href="#" target="_blank">'
													+ '        <div class="split-hard">'
													+ '          <span class="split crop-circ" style="background-image: url(https://image.idus.com/image/files/37cec8c9f8bd47458facc5bdacfb0b24.jpg)"> </span>'
													+ '           <div class="split">   	'
													+ '              <span class="txt-strong">'
													+ data[i].memberId
													+ '</span>'
													+ '               <span class="txt">'
													+ data[i].story_write_date
													+ '</span>'
													+ '          </div>'
													+ '       </div>    '
													+ '      <p class="desc">'
													+ data[i].story_content
													+ '</p>'
													+ '     <br>'
													+ '  </a>'
													+ ' </div>'
													+ '  </div>';
										}
										$("#storyAdd").html(list);

										var list2 = "";
										for (var i = 1; i <= qnaCnt / 10 + 1; i++) {
											if (i == data[0].currentPage) {
												list2 += '<a style="color:orange;">'
														+ i + '</a>';
											} else {
												list2 += '<a>' + i + '</a>';
											}
										}
										$("#paging").html(list2);
									},
									error : function(data, textStatus) {
										alert("다시 시도해주세요.");
									},
									complete : function(data, textstatus) {
									}
								});
					});
</script>
<script>
	$.ratePicker("#rating-2", {
		rate : function(stars) {
			alert('Sample 3\'s Rate is ' + stars);
		}
	});
</script>

</head>

<body>


	<!-- 프로필 수정 팝업창 -->
	<div class="messagepop pop2">
		<h2>참여자 추가</h2>
		<form method="post" id="new_message"
			action="/devFw/participantsInsert.do" enctype="multipart/form-data">
			<p>
				<label for="flea_name">회원 검색&nbsp;</label><input type="text"
					size="30" name="memberid" id="memberid" />
			</p>
			<div>
				<input type="submit" value="✔️" name="commit"
					id="message_submit" /> <a class="close" href="/">❌취소</a>
			</div>

		</form>


	</div>

	<div class="row" id="flea">
		<div class=".col-sm-4" style="width: 18%;">
			<aside class="artist-area">
				<div class="user-info card-style-profile ">
					<!--
					<h4>
					  
						<a href="/devFw/fleaSearchInit.do">플리마켓 마이페이지(임시)</a>
					</h4>
					-->



					<c:forEach var="flea" items="${searchList}">
						<div class="profile-picture big-profile-picture clear">
							<img width="120px" height="120px" alt="no picture"
								src="${flea.profile_photo}" />
							<!-- 
					              <img width="120px" height="120px" alt="Anne Hathaway picture" src= "<c:url value="/img/${file.profile_photo }" />" >
					             -->
						</div>

						<!-- 프로필 수정 아이콘 버튼-->
						<div class="profile-setting">
							<a href="" id="contact"
								onclick="window.open('./editProfile.do?flea_code=${flea.flea_code}', 'window팝업', 'width=520, height=620, menubar=no, status=no, toolbar=no')">
								<i class="fa fa-cog pa-5x"></i>
							</a>
						</div>

						<div class="user-name">
							<font size="3"> <c:out value="${flea.flea_name}" /> <a
								target="_blank" href="#" id="participants_add"><i
									class="fa fa-user-plus pa-5x"></i></a>
							</font>
						</div>

						<div class="profile-description">
							<c:out value="${flea.intro_cotent}" />
						</div>
					</c:forEach>
				</div>
				<fieldset class="ui-field border-row">
					<div id="chat-header">
						<div id="user-info"></div>
						<i class="fa fa-user-plus pa-5x">참가 신청</i>
					</div>

					<div id="chat-header">
						<div id="user-info"></div>
						<button type="button" class="btn btn-m btn-white pseudo-ico-share"
							data-ui="url-copy" data-ui-option="short" data-icon-event="hover"
							data-clipboard-text="#">
							<i class="fa fa-user-plus pa-5x"></i>참가 신청<br>
						</button>

					</div>

					<button type="button"
						class="btn btn-s btn-white toggle-heart detail-like pseudo-ico-love"
						data-name="starred-toolbar" data-starred-type="artist"
						data-init="" data-starred=""
						data-target-id="b20eee2f-b3eb-4fee-bc81-735f1e2318d6">
						<i class="ico-img"> <span class="sp-icon icon-heart"></span> <span
							class="sp-icon icon-heart active"></span>
						</i> <em class="txt"><i class="fa fa-heart"></i>스토어 찜하기</em>
					</button>
					<br> <a href="#"
						class="btn btn-s btn-white pseudo-ico-message"> <i
						class="fa fa-envelope"></i>&nbsp;메세지
					</a><br>
					<button type="button" class="btn btn-m btn-white pseudo-ico-share"
						data-ui="url-copy" data-ui-option="short" data-icon-event="hover"
						data-clipboard-text="#">
						<i class="fa fa-share-alt"></i> 공유하기<br>
					</button>

				</fieldset>

				<div class="border-row">
					<nav class="nav-links">
						<!--  
		                         <a class="active" href="/w/artist/b20eee2f-b3eb-4fee-bc81-735f1e2318d6">
		                 <i class="ui_icon--home"></i>
		                 <span>홈</span>
		             </a>
		             -->
						<span>🏠홈<br></span> <span>📜스토리<br></span> <span>🧸판매
							작품<br>

						</span> <span>✍️구매 후기<br></span>
					</nav>
				</div>

				<div class="list-def border-row">
					<!--  
		        <strong class="caption"><font size="3">활동정보</font></strong>
		        -->
					<dl class="list">
						<dt>좋아하는 사람</dt>
						<dd>
							<a href="#t" data-modal-trigger="user-list" data-modal="open"
								data-type="favorite" data-title="좋아하는 사람"><span
								id="like-count"> <c:forEach var="flea"
										items="${searchList}">
										<c:out value="${flea.flea_like_count}" />
									</c:forEach>

							</span><em>명</em> </a>
						</dd>
						<dt>판매중인 작품</dt>
						<dd>
							<a href="#">11<em>개</em></a>
						</dd>
						<dt>
							<a href="/devFw/fleaReview.do">구매후기</a>
						</dt>
						<dd>
							<a href="#">124<em>개</em></a>
						</dd>
					</dl>
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br>
			</aside>
		</div>
		<div class=".col-sm-8"
			style="width: 72%; border-left: 1px solid lightgray; padding-left: 1%;">
			<div class="ui_title--sub">
				<div class="ui_title__txt">
					<font size="3"><a href="/devFw/fleaReview.do">📝스토리</a></font> <span
						class="rv_count" data-review="count"> (<em class="num">10</em>)
					</span> <input type="hidden" id="memberId"
						value="${member.getMemberid() }" /> <br>
				</div>

			</div>

			<div class="prod_story_wrap">
				<h4>스토리 작성</h4>

				<input class="story_title_text" type="text"
					placeholder="스토리 제목을 입력해주세요." value="" style="width: 100%;">

				<div class="text_area_wrap">
					<c:choose>
						<c:when test="${member.getMemberid() == null }">
							<!-- 로그인 하지 않았을 경우 -->
							<label for="prod_story_text" style=""
								data-placeholder="로그인 후 글을 남길 수 있습니다."
								data-placeholder-for="textarea"></label>
							<textarea name="prod_story_text" id="prod_story_text"
								style="resize: none;" placeholder="로그인 후 글을 남길 수 있습니다."></textarea>
						</c:when>
						<c:otherwise>
							<!-- 로그인했을 경우 -->
							<label for="prod_story_text" style=""
								data-placeholder="전화번호, 주소, 이메일, 계좌번호 등의 개인정보는 타인에 의해 도용된 위험이 있으니, &#13;&#10;스토리 작성 시 입력하지 않도록 주의해 주시기 바랍니다."
								data-placeholder-for="textarea"></label>
							<textarea name="prod_story_text" id="prod_story_text"
								style="resize: none;"
								placeholder="전화번호, 주소, 이메일, 계좌번호 등의 개인정보는 타인에 의해 도용된 위험이 있으니, &#13;&#10;스토리 작성 시 입력하지 않도록 주의해 주시기 바랍니다."></textarea>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="btn_area">
				<!--  
					<button type="button" class="btn btn-outline-dark" class="enrollstory" id="buy"
						style="font-size: 15px; size: 14px;">등록</button>
					<button type="button" class="btn btn-outline-dark" class="cancelstory" id="cart"
						style="font-size: 15px; size: 14px;">취소</button>
				-->
					<input type="button" class="enrollstory" id="buy" value="등록">
					<input type="button" class="cancelstory" id="cart" value="취소">
				</div>


			</div>

			<br> <br>

			<ul class="masonry-grid x2" data-col="2" style="position: relative; height: 71%;">
				<li class="card-style story" id="storyAdd">
					<c:forEach var="story" items="${storyList}">
						<div class="bordering" style="margin-left: 1%; width: 46%; margin-right: 3%; float: left; margin-bottom: 5%;">

							<input name="time_stamp" type="hidden" value="1575262761000">
							<div class="area-txt">
								<div class="area-rating">
									<div class="img-bg"
										style="background-image: url(https://image.idus.com/image/files/d6c74ae706ad40f1b6f83af3d5b1334d_512.jpg)"></div>
									<a href="#" class="title ellipsis"><h5>❣️${story.story_title}</h5></a>

								</div>

								<a href="#" target="_blank">
									<div class="split-hard">
										<span class="split crop-circ"
											style="background-image: url(https://image.idus.com/image/files/37cec8c9f8bd47458facc5bdacfb0b24.jpg)">
										</span>
										<div class="split">


											<span class="txt-strong">${story.memberid}</span> <span
												class="txt">${story.story_write_date}</span>
										</div>
									</div>

									<p class="desc">${story.story_cotent }</p> <br>


								</a>
							</div>
						</div>
					</c:forEach></li>
			</ul>

			<c:set var="qnaCnt" value="${storyCnt }" />
			<c:set var="currentPage" value="${currentPage }" />
			<input type="hidden" id="qnaCnt" value="${storyCnt }">
			<c:if test="${qnaCnt != 0 }">
				<div class="paging_comm" id="paging">
					<c:choose>
						<c:when test="${qnaCnt%10 == 0 }">
							<c:forEach var="i" begin="1" end="${qnaCnt/10 }" step="1">

								<c:if test="${i == currentPage }">
									<a style="color: orange;"><c:out value="${i }" /></a>
								</c:if>
								<c:if test="${i != currentPage }">
									<a><c:out value="${i }" /></a>
								</c:if>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="1" end="${qnaCnt/10 + 1 }" step="1">

								<c:if test="${i == currentPage }">
									<a style="color: orange;"><c:out value="${i }" /></a>
								</c:if>
								<c:if test="${i != currentPage }">
									<a><c:out value="${i }" /></a>
								</c:if>

							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>
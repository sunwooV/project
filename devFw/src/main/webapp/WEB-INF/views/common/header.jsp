<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link
   href="https://fonts.googleapis.com/css?family=Gothic+A1|Gugi|Nanum+Gothic|Nanum+Myeongjo|Noto+Sans+KR|Noto+Serif+KR|Sunflower:300&display=swap&subset=korean"
   rel="stylesheet">
<link
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
   rel="stylesheet">
   <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'
         rel='stylesheet' />
<link href='${contextPath}/resources/css/test.css'
         rel='stylesheet' />



</head>
<body>
   <div class="site-outer">
      <nav class="navbar navbar-fixed-top">
         <section class="container-fluid">
            <div class="row">
               <div class="container-menu">
                  <nav class="menu" id="hb">
                     <div></div>
                     <div></div>
                     <div></div>
                  </nav>
                  <div class="logotype">
                     <div class="big"><img src="${contextPath}/resources/img/로고.jpg" width = 180px; height = 50px;/></div>
                  </div>
                  <div class="checkout">
                     <h3>
                        <a href="#">LOGIN</a>
                        <td><a href="#">JOIN</a> <a href="#"><i
                              class="fa fa-shopping-cart red"></i> 장바구니 <span
                              class="badge badge-red">0</span></a>
                     </h3>
                  </div>
               </div>
            </div>
         </section>
      </nav>
   </div>
      <ul id="adajaxmenu" class="admenus">
         <li><a href='/'><i class='fa fa-home fa-lg'></i></a></li>
         <li><a href="#">Category 1</a>
         <ul>
            <li><a
               href="https://mastamvan.blogspot.co.id/search/label/Blogger">Blogger</a></li>
            <li><a href="https://mastamvan.blogspot.com/search/label/CSS">CSS</a></li>
            <li><a href="https://mastamvan.blogspot.com/search/label/HTML">HTML</a></li>
            <li><a
               href="https://mastamvan.blogspot.com/search/label/Tools">Tools</a></li>
            <li><a
               href="https://mastamvan.blogspot.com/search/label/Widget">Widget</a></li>
         </ul></li>
         <li><a href="#">Category 2</a>
            <ul>
               <li><a
                  href="https://mastamvan.blogspot.com/search/label/Templates">Template</a></li>
               <li><a href="https://mastamvan.blogspot.com/search/label/Seo">Seo</a></li>
               <li><a
                  href="https://mastamvan.blogspot.com/search/label/Tips Dan Trik">Tips
                     Dan Trik</a></li>
               <li><a href="https://mastamvan.blogspot.com/search/label/Umum">Umum</a></li>
               <li><a
                  href="https://mastamvan.blogspot.com/search/label/Widget">Personal</a></li>
            </ul></li>
         <li><a href="#">Category 3</a>
         <ul>
            <li><a
               href="https://mastamvan.blogspot.com/search/label/Blogger">Design</a></li>
            <li><a href="https://mastamvan.blogspot.com/search/label/CSS">Material</a></li>
            <li><a href="https://mastamvan.blogspot.com/search/label/HTML">Ebok
                  Google</a></li>
            <li><a
               href="https://mastamvan.blogspot.com/search/label/Tools">Tools</a></li>
            <li><a
               href="https://mastamvan.blogspot.com/search/label/Widget">Widget</a></li>
         </ul></li>
         <li><a href="https://mastamvan.blogspot.com/p/blog-page.html">Sitemap</a></li>
         <li><a href="https://fb.com/tejasukmana99">Contact</a></li>
         <li class='search-form'>
            <form action='/search' class='searchblog' method='get'>
               <input class='searchbar' name='q' placeholder='검색어입력' size='30'
                                 type='text' />
               <input class='searchsubmit' type='submit' value='검색' />
            </form>
             <p class='search-alert'>검색어를 입력하세요!
         </li>    
         </ul>
         
<!--  
   <div class="footer">
      <footer class="footer-inner">
         <div class="container">
            <div class="row">
               <div class="col-md-3">
                  <h3 class="h3">회사소개</h3>
                  <ul class="footer-list">
                     <li><a href="#">Our story</a></li>
                     <li><a href="#">Venue</a></li>
                     <li><a href="#">Other</a></li>
                  </ul>
               </div>
               <div class="col-md-3">
                  <h3 class="h3">고객센터</h3>
                  <ul class="footer-list">
                     <li><a href="#">IKEA</a></li>
                     <li><a href="#">MIO</a></li>
                     <li><a href="#">BAUHAUS</a></li>
                  </ul>
               </div>
               <div class="col-md-3">
                  <h3 class="h3">메일문의</h3>
                  <ul class="footer-list">
                     <li><a href="#">Chat with us</a></li>
                     <li><a href="#">+46(0)2453 352</a></li>
                     <li><a href="#">E-mail us</a></li>
                  </ul>
               </div>
               <div class="col-md-3">
                  <h3 class="h3">Socials</h3>
                  <ul class="footer-list footer-list-inline">
                     <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                     <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                     <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                  </ul>
               </div>
            </div>
         </div>
      </footer>
   </div>
   -->
   <!-- NAVIGATION -->
   <div class="navigation">
      <button class="navigation-login">
         <i class="fa fa-shopping-cart"></i> 장바구니 <span
                  class="badge badge-white">0</span>
      </button>
      <div class="navigation-search">
         <div id="search">
            <input type="text" name="input" class="input" placeholder="Search" />
            <button type="reset" class="search" id="search-button"></button>
         </div>
      </div>
      <div class="navigation-content">
         <h3>Menu</h3>
         <ul class="navigation-menu">
            <li><a href="#" class="active">홈</a></li>
            <li><a href="#"><i class="red fa fa-circle"></i> 여기를
                  </a></li>
            <li><a href="#"><i class="beige fa fa-circle"></i> 목록
                  </a></li>
            <li><a href="#"><i class="orange fa fa-circle"></i>
                  카테고리</a></li>
            <li><a href="#"><i class="blue fa fa-circle"></i> 로 </a></li>
         </ul>
         <h3>플리마켓</h3>
         <ul class="navigation-menu">
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">Info</a></li>
            <li><a href="#">Collaboration</a></li>
            <li><a href="#">Customer Service</a></li>
         </ul>
      </div>
   </div>
   <!-- CHECKOUT -->
</body>
<script>
   (function() {
      var expand;
      expand = function() {
         var $input, $search;
         $search = $('.search');
         $input = $('.input');
         if ($search.hasClass('close')) {
            $search.removeClass('close');
            $input.removeClass('square');
         } else {
            $search.addClass('close');
            $input.addClass('square');
         }
         if ($search.hasClass('close')) {
            $input.focus();
         } else {
            $input.blur();
         }
      };

      $(function() {
         var $container, $menu, $menubtn, $navbar;
         $menubtn = $('#hb');
         $navbar = $('.navbar');
         $menu = $('.navigation');
         $container = $('.site-inner');
         $menubtn.on('click', function(e) {
            if ($menubtn.hasClass('active')) {
               $menubtn.removeClass('active');
               $menu.removeClass('slide-right');
               $container.removeClass('slide-right');
               $navbar.removeClass('slide-right');
            } else {
               $menubtn.addClass('active');
               $menu.addClass('slide-right');
               $container.addClass('slide-right');
               $navbar.addClass('slide-right');
            }
         });
      });
      $(function() {
         var $button, clickOrTouch;
         clickOrTouch = 'click touchstart';
         $button = $('#search-button');
         $button.on(clickOrTouch, expand);
      });
      $(function() {
         var $box;
         $box = $('.sm-box');
         $box.on('click', function(e) {
            e.preventDefault();
            var $this;
            $this = $(this);
            if ($this.hasClass('active')) {
               $this.removeClass('active');
            } else {
               $this.addClass('active');
            }
         });
      });
   }.call(this));

   $("select").each(function() {
      var $this = $(this), $options = $(this).children("option").length;

      $this.addClass("select-hidden");
      $this.wrap("<div class='select'></div>");
      $this.after("<div class='select-styled'></div>");

      var $styledSelect = $this.next("div.select-styled");
      $styledSelect.text($this.children("option").eq(0).text());

      var $list = $("<ul />", {
         "class" : "select-options"
      }).insertAfter($styledSelect);

      for (var i = 0; i < $options; i++) {
         $("<li />", {
            text : $this.children("option").eq(i).text(),
            rel : $this.children("option").eq(i).val()
         }).appendTo($list);
      }

      var $listItems = $list.children("li");

      $styledSelect.on("click", function(e) {
         e.stopPropagation();
         $("div.select-styled.active").each(function() {
            $(this).removeClass("active").next("ul.select-options").hide();
         });

         $(this).toggleClass("active").next("ul.select-options").toggle();
      });

      $listItems.on("click", function(e) {
         e.stopPropagation();
         $styledSelect.text($(this).text()).removeClass("active");
         $this.val($(this).attr("rel"));
         $list.hide();
      });

      $(document).on("click", function() {
         $styledSelect.removeClass("active");
         $list.hide();
      });

      $(".select-sibling").next(".select-styled").css({
         "border-top" : "0px"
      });
   });

   (function() {
      var $addItem = $("#add-item");
      var $badge = $(".badge");
      var $count = 1;

      $addItem.on("click", function(e) {
         e.preventDefault();
         $badge.html($count++);
      });
   }.call(this));
</script>
<script type='text/javascript'>
   //<![CDATA[
   if (typeof (jQuery) == 'undefined') {
      document
            .write("<scr" + "ipt type=\"text/javascript\" src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js\"></scr" + "ipt>");
   }
   //]]>
</script>
<!--  
<script type="text/javascript">
   jQuery(document).ready(function($) {
      $('#adajaxmenu').ajaxBloggerMenu({
         numPosts : 4, // Number of Posts to show
         defaultImg : 'https://url-to-image.com/default-image.jpeg' // Default thumbnail Image
      });
   });

   $(function() {
      $('.searchblog')
            .submit(
                  function(e) {
                     if ($('.search-form .searchbar').val().length == 0) {
                        $('.search-form .search-alert')
                              .fadeIn().css('display',
                                    'inline-block');
                        e.preventDefault();
                     }
                  });
   });
</script>

<script>
//This is "probably" IE9 compatible but will need some fallbacks for IE8
//- (event listeners, forEach loop)

//wait for the entire page to finish loading
window.addEventListener('load', function() {
   
   // setTimeout to simulate the delay from a real page load
   setTimeout(lazyLoad, 1000);
   
});

</script>
-->
</html>
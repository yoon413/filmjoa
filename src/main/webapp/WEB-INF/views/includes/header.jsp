<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="UTF-8">
   <head>
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
	
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Title -->
      <title>Filmjoa</title>
      <!-- Favicon -->
      <link rel="icon" type="image/png" sizes="32x32" href="/resources/main/img/favicon/favicon-32x32.png">
      <!--Bootstrap css-->
      <link rel="stylesheet" href="/resources/main/css/bootstrap.css">
      <!--Font Awesome css-->
      <link rel="stylesheet" href="/resources/main/css/font-awesome.min.css">
      <!--Magnific css-->
      <link rel="stylesheet" href="/resources/main/css/magnific-popup.css">
      <!--Owl-Carousel css-->
      <link rel="stylesheet" href="/resources/main/css/owl.carousel.min.css">
      <link rel="stylesheet" href="/resources/main/css/owl.theme.default.min.css">
      <!--Animate css-->
      <link rel="stylesheet" href="/resources/main/css/animate.min.css">
      <!--Slicknav css-->
      <link rel="stylesheet" href="/resources/main/css/slicknav.min.css">
      <!--Site Main Style css-->
      <link rel="stylesheet" href="/resources/main/css/style.css">
      <!--Responsive css-->
      <link rel="stylesheet" href="/resources/main/css/responsive.css">
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   </head>
   <body>
       
       
      <!-- Header Area Start -->
      <header class="filmoja-header-area">
          
         <!-- Header Top Area Start -->
         <div class="header-top-area">
            <div class="container">
               <div class="row">
                  <div class="col-lg-6 col-sm-4">
                     <div class="header-top-social">
                        <ul>
                           <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                           <li><a href="#"><i class="fa fa-twitter-square"></i></a></li>
                           <li><a href="#"><i class="fa fa-google-plus-square"></i></a></li>
                           <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
                           <li><a href="#"><i class="fa fa-pinterest-square"></i></a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-lg-6 col-sm-8">
                     <div class="header-top-menu">
                     	<sec:authorize access="isAnonymous()">
                        	<ul>
                          		<li><a href="#"></a></li>
                           		<li><a href="#"></a></li>
                           		<li><a href="#"></a></li>
                           	    <li><a href="/main/Login">Login</a></li>
                           	    <li><a href="/main/register">register</a></li>
                           	 </ul>
                        </sec:authorize>
                        <!-- 로그 아웃 -->
                        <form role="form" id="formLogout" method="post" action="/logout">   
                           <sec:authorize access="isAuthenticated()"> 
                         	<ul> 
                         	 	<li><a href="#"></a></li>
                           		<li><a href="#"></a></li>
                           		<li><a href="#"></a></li>
                         	 	<sec:authorize access="hasRole('ROLE_MEMBER')">		                         	 
                         	 		<li><a id="btnMyPage" href="/member/myPage?user_id=<sec:authentication property='principal.username'/>">MyPage</a></li>
                         	 	</sec:authorize>
                         	 	<sec:authorize access="hasRole('ROLE_ADMIN')">
                         	 		<li><a href="/admin/movieSetting">Admin</a></li>
                         	 	</sec:authorize>
                         	 	<li><a id="btnLogout" href="#">LogOut</a></li>
                         	</ul> 
						   </sec:authorize>
                       
                        	<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
                         </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- Header Top Area End -->
          
         <!-- Main Header Area Start -->
         <div class="main-header-area">
            <div class="container">
               <div class="row">
                  <div class="col-lg-2">
                     <div class="site-logo">
                        <a href="/">
                        <img src="/resources/main/img/logo.png" alt="filmoja" />
                        </a>
                     </div>
                     <!-- Responsive Menu Start -->
                     <div class="filmoja-responsive-menu"></div>
                     <!-- Responsive Menu End -->
                  </div>
                  <div class="col-lg-4">
                     <div class="header-main-search hide-mobile">
                        <form method = "get" action="/main/movieList">
                           <input type="search" name="searchKeyword" placeholder="Search...">
                           <button type="submit">
                           <i class="fa fa-search"></i>
                           </button>
                        </form>
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="mainmenu">
                        <nav>
                           <ul id="responsive_navigation">
                              <!-- Mobile Search Start -->
                              <li class="header-main-search hide-desktop">
                                 <form method = "get" action="/main/searchMovie">
                                    <input type="search"  placeholder="Search...">
                                    <button type="submit">
                                    <i class="fa fa-search"></i>
                                    </button>
                                 </form>
                              </li>
                              <!-- Mobile Search End -->
                              <li>
                              	<a href="/board/notice">공지사항</a>
                              </li>
                              <li>
                              	<a href="/board/article">자유 게시판</a>
                              </li>
                              <li>
                                 <a href="/main/movieList">영화 리스트</a>                              
                              </li>                                                        
                           </ul>
                        </nav>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- Main Header Area End -->
          
      </header>
      <!-- Header Area End -->
<script>
	$(document).ready(function(){
		
		$("#btnLogout").click(function(e){
		 	e.preventDefault();
			$("#formLogout").submit();
		 	alert("로그아웃 되었습니다.");
			});
	
 			
	});		
 	</script>    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
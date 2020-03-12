<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html lang="UTF-8">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">



  <!-- Custom fonts for this template -->
  <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
	
			                         	                       	 	                    	 	
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gray-900 sidebar sidebar-dark accordion" id="accordionSidebar">
	  <li>
	  	<sec:authorize access="hasRole('ROLE_MEMBER')">   
        	<div class="sidebar-brand d-flex align-items-center justify-content-center sidebar-brand-text mx-3">
				회원 설정
		 	</div>
		 </sec:authorize>
		 <sec:authorize access="hasRole('ROLE_ADMIN')">
		 	<div class="sidebar-brand d-flex align-items-center justify-content-center sidebar-brand-text mx-3">
				관리자 설정
		 	</div>
		 </sec:authorize>
	  </li>
	  <!-- 회원용 -->
	  <sec:authorize access="hasRole('ROLE_MEMBER')">
	  	<!-- Nav Item - 회원 정보 -->
      	<li class="nav-item">
        	<a class="nav-link" href="/member/myPage?user_id=<sec:authentication property='principal.username'/>">
          	<i class="fas fa-fw fa-tachometer-alt"></i>
          	<span>마이 페이지</span></a>
      	</li>
      
      	<!-- Nav Item - 회원 정보 -->
      	<li class="nav-item">
        	<a class="nav-link" href="/member/userInfo?user_id=<sec:authentication property='principal.username'/>">
          	<i class="fas fa-fw fa-tachometer-alt"></i>
          	<span>회원 정보</span></a>
      	</li>

      	<!-- Nav Item - 회원 탈퇴 -->
      	<li class="nav-item">
        	<a class="nav-link" href="/member/withdrawal?user_id=<sec:authentication property='principal.username'/>">
         	<i class="fas fa-fw fa-table"></i>
          	<span>회원 탈퇴</span></a>
      	</li>
		</sec:authorize>
		
		<!-- 관리자용 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<!-- Nav Item - 영화 설정 -->
			<li class="nav-item">
        		<a class="nav-link" href="/admin/movieSetting">
         		<i class="fas fa-fw fa-table"></i>
          		<span>영화 설정</span></a>
      		</li>
      		
      		<!-- Nav Item - 회원 탈퇴 -->
      		<li class="nav-item">
        	<a class="nav-link" href="/member/withdrawal?user_id=<sec:authentication property='principal.username'/>">
         	<i class="fas fa-fw fa-table"></i>
          	<span>관리자 탈퇴</span></a>
      	</li>
		</sec:authorize>
    </ul>
    
    <!-- End of Sidebar -->
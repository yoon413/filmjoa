<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
       
       
<!-- Breadcrumb Area Start -->
<section class="filmoja-breadcrumb-area section_70">
	<div class="container">
    	<div class="row">
        	<div class="col-md-12">
            	<div class="breadcrumb-box">
                	<h2>로그인</h2>
                    <ul>
                    	<li><a href="/">홈</a></li>
                        <li class="active-breadcromb">로그인</li>
                    </ul>
            	</div>
        	</div>
    	</div>
	</div>
</section>
<!-- Breadcrumb Area End -->
       
       
<!-- Login Area Start -->
<section class="filmoja-login-area section_70">
	<div class="container">
    	<div class="row">
        	<div class="col-lg-6">
            	<div class="auth-box-right">
                	<h3>회원이 아니십니까?</h3>
                    <div class="login-box">
                    	<h4>새로운 회원이 되어 보십시오</h4>
                        <p>최소한의 인적사항으로 손쉽게 회원 가입이 가능합니다. 회원이 되시면 여러 영화의 정보를 감상할 수 있으며, 영화 리뷰를 작성할 수 있습니다.
                        	당신의 노력으로 더 좋은 영화 정보를 다른 이용자들에게 제공할 수 있습니다. </p>
                        <a href="/main/register">회원 가입하기</a>
                     </div>
                 </div>
			</div>
            <div class="col-lg-6">
            	<div class="auth-box-left margin-top">
                	<h3>로그인</h3>
                	<div class="login-box">
                    	<form role="form" method='post' action="/login">
                        	<p>
                        		<label for="username">회원 ID</label>
                        		<input type="text" name="username" id="username" placeholder="ID" autofocus >
                           	</p>
                           	<p>
                            	<label for="password">비밀번호</label>
                            	<input type="password" name="password" id="password" placeholder="비밀번호" >
                           	</p>
                           	<p>
                            	<a id="btnLogin" href="#">로그인</a>
                           	</p>
                           	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                	</div>
            	</div>
        	</div>
    	</div>
	</div>
</section>
<!-- Login Area End -->
       
<script>
	$("#btnLogin").click(function(e){
		e.preventDefault();
		$("form").submit();
			
	});
   
	//뒤로 가기 문제 해결
    $(document).ready(function(){
    	var result = '<c:out value= "${result}"/>';
       	checkModal(result);
       	history.replaceState({},null,null);
       		
       	function checkModal(result){
       		if (result === '' || history.state) {
       			return;
       		} else{
       			alert("아이디 혹은 비밀번호를 잘못 입력하셨습니다");
       		}
       	}
       	
 });	 
     	 
     	 
</script> 
      
<%@include file="../includes/footer.jsp"%>




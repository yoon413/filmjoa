<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
       
       
<!-- Breadcrumb Area Start -->
<section class="filmoja-breadcrumb-area section_70">
	<div class="container">
    	<div class="row">
        	<div class="col-md-12">
            	<div class="breadcrumb-box">
                	<h2>회원 등록</h2>
                    <ul>
                    	<li><a href="index.html">홈</a></li>
                        <li class="active-breadcromb">회원 등록</li>
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
	    	<div class="col-lg-12">
            	<div class="auth-box-left margin-top">
                	<h3>회원 정보 입력</h3>
                	<div class="login-box">
                		<!-- 회원 등록 Form -->
                        <form role="form" action="/main/register" method="post" >
                        	<div class="row">
                            	<div class="col-lg-6">
                                	<p>
                                    	<label for="user_id">아이디<var></var></label>            
                                 		<span id = "userIdOverlap"></span>
                                    	<input type="text" name="user_id" id="user_id" placeholder="Id">
                                 	</p>
                              	</div>
                            	<div class="col-lg-6">
                                	<p>
                                    	<label for="Email">이메일</label>
                                    	<span id = "userEmailCondition"></span>
                                    	<input type="email" name="user_email" id="user_email" placeholder="Email Address">
                                 	</p>
                              	</div>
                           	</div>
                           	<div class="row">
                            	<div class="col-lg-6">
                                	<p>
                                    	<label for="password">비밀번호</label>
                                    	<span id = "userPwCondition"></span>
                                    	<input type="password" name="user_pw" id="user_pw" placeholder="Password">
                                 	</p>
                              	</div>
                              	<div class="col-lg-6">
                                	<p>
                                    	<label for="password2">비밀번호 확인</label>
                                    	<span id = "userPw2Condition"></span>
                                    	<input type="password" name="user_pw2" id="user_pw2" placeholder="Confirm Password">
                                 	</p>
                              	</div>
                           	</div>
                           	<div class="row">
                            	<div class="col-md-12">
                                	<button type="submit" id ="register">회원 가입</button>                                     
                                </div>
                          	</div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                        <!-- 회원 등록 Form  End-->
                	</div>
            	</div>
        	</div>
    	</div>
	</div>
</section>
<!-- Login Area End -->
       
<script type="text/javascript">
  $(document).ready(function(){
	 
	  //정규 표현식으로 표현한 조건
	  var idCondition = /^[a-z0-9]{4,12}$/;
	  var mailCondition = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  var pwCondition = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	  
	  //아이디 중복값 처리
	  var idOverlap = 1;
	  
	  //등록 처리
	  $("#register").on("click", function(e) {
			e.preventDefault();
			var userId =  $("#user_id").val();
			var userEmail = $("#user_email").val();
			var userPw = $("#user_pw").val();
			var userPw2 = $("#user_pw2").val();
			if(userId.length < 1 || userEmail.length <1 || userPw.length <1 || userPw2.length <1 || idCondition.test(userId)==false || mailCondition.test(userEmail)==false || pwCondition.test(userPw)==false
					|| userPw != userPw2 || idOverlap == 0){
				alert("회원 정보를 올바르게 입력하세요");
				console.log(idOverlap);
			} else {
				$("form").submit();
			}
	  });
	  
	  //아이디 중복 예외 처리(포커스 잃을 때)
	  $("#user_id").blur(function(){
		  var user_id = $("#user_id").val();
		  $.ajax({
			  url : "/main/idCheck?user_id=" + user_id,
			  type : "get",
			  success : function(data) {
				  console.log("1= 중복ok // 0 = 중복x : " +data);
				  // 아이디가 이미 존재할 경우
				  if (data == 1) {
					  $("#userIdOverlap").html("중복된 아이디입니다.");
					  $("#userIdOverlap").css("color", "red");
					 idOverlap = 0;
					  
				  } else {
					  if(idCondition.test(user_id)){
						  $("#userIdOverlap").html("");
						  idOverlap = 1;
					  } else if(user_id ==""){
						  $("#userIdOverlap").html("아이디를 입력해주세요.");
						  $("#userIdOverlap").css("color", "red");
						  
					  } else {
						  $("#userIdOverlap").html("아이디는 소문자, 숫자로 4~12자리로 입력.")
						  $("#userIdOverlap").css("color", "red");
						  
					  }
					  
				  }
			  },
			  error : function() {
				  console.log("실패");
			  }
		  });
	  });
	  
	  //이메일 유효성 체크
	  $("#user_email").blur(function(){
		  var user_email = $("#user_email").val();
		  if(mailCondition.test(user_email)){
			  $("#userEmailCondition").html("");			
			  	return
		  	} else {
			  $("#userEmailCondition").html("이메일을 올바르게 입력.");
			  $("#userEmailCondition").css("color", "red");
			 
		  	}
								  
		});
	 
	  //비밀번호 검사
	  $("#user_pw").blur(function(){
		  var user_pw = $("#user_pw").val();
		  if(pwCondition.test(user_pw)){
			  $("#userPwCondition").html("");
			  
			  return
		  } else {
			  $("#userPwCondition").html("대,소,특문자,숫자 포함 8자리 이상 입력.");
			  $("#userPwCondition").css("color", "red");
			  
		  }
								  
			});
	  //비밀번호 확인
	  $("#user_pw2").blur(function(){
		  var user_pw = $("#user_pw").val();
		  var user_pw2 = $("#user_pw2").val();
		  if(user_pw2 == user_pw){
			  $("#userPw2Condition").html("");			  			 
		  } else {
			  $("#userPw2Condition").html("비밀번호가 일치하지 않습니다.");
			  $("#userPw2Condition").css("color", "red");
			  
		  }
								  
			});
	  
	  
	  });
 
   
</script> 
       
<%@include file="../includes/footer.jsp"%>


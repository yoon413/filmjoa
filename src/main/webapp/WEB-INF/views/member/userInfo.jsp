<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/sidebar.jsp"%>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
	 <!-- Main Content -->
     <div id="content">
		<%@ include file="../includes/header.jsp"%>
        <!-- Begin Page Content -->
        <div class="container-fluid">
        	<h1 class="h3 mb-2 text-gray-800"></h1>
          	<p class="mb-4"></p>         	
          		<div class="card shadow mb-4">
            		<div class="card-header py-3">
              			<h6 class="m-0 font-weight-bold text-primary">회원 정보</h6>
            		</div>
            		<div class="card-body">
              			<div class="table-responsive">
              				<!-- 회원 정보 수정 Form  -->
                			<form method="post" action="/member/updateUserInfo">
                				<table class="table table-bordered">                                   
                					<tr>
                     					<td>회원 ID</td>             
                     					<td width="70%">
                     						<c:out value="${userInfo.user_id}"/>
                     						<input type="hidden" name="user_id" value="<c:out value="${userInfo.user_id}"/>" />
                     					</td>   
                  					<tr>
                  						<td>비밀번호</td>
                  						<td width="70%">
                  							<div class="row">
                  								<div class="col-sm-12">   
                  									<input type="password" id="user_pw" name="user_pw">	
                  									<div id = "userPwCondition"></div>				 					
                  								</div> 	
                  							</div>
                  						</td>	
                  					</tr>
                  					<tr>
                  						<td>비밀번호 확인</td>
                  						<td width="70%">
                  							<div class="row">
                  								<div class="col-sm-12">   
                  									<input type="password" id="user_pw2">	
                  									<div id = "userPw2Condition"></div>				 					
                  								</div> 	
                  							</div>	
                  						</td>
                  					</tr>
                  					<tr>
                  						<td>이메일</td>
                  						<td width="70%">
                  							<div class="row">
                  								<div class="col-sm-12">              				
                  									<input type="text" id="user_email" name="user_email" value="<c:out value='${userInfo.user_email}'/>">
                  									<div id = "userEmailCondition"></div>	                 					
                  								</div> 
                  							</div>
                  						</td>
                  					</tr>                 	               	                 	
                				</table>
               		 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
                				<button type="submit" class="btn btn-primary" id="updateBtn" style="float:right">수정하기</button>
                			</form>
                			<!-- 회원 정보 수정 Form End  -->
              			</div>
            		</div>
          		</div>
        	</div>
        	<!-- /.container-fluid -->
      	</div>
      	<!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->
  </div>
  <!-- End of Page Wrapper -->


  <script>
  
  //정규화 검사
  var mailCondition = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  var pwCondition = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	
  $(document).ready(function(){
		
  	  //이메일 유효성 체크
  	  $(document).on("blur", "#user_email", function(){
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
  	  
  	//등록 처리	
  	$("#updateBtn").on("click", function(e) {
		e.preventDefault();		
		var userEmail = $("#user_email").val();
		var userPw = $("#user_pw").val();
		var userPw2 = $("#user_pw2").val();
		if(userEmail.length <1 || userPw.length <1 || userPw2.length <1 || mailCondition.test(userEmail)==false || pwCondition.test(userPw)==false
				|| userPw != userPw2){
			alert("회원 정보를 올바르게 입력하세요");
			
		} else {
			$("form").submit();
		}
  });
  	
  	});
  </script>
<%@include file="../includes/footer.jsp"%>

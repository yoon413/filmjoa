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
        
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800"></h1>
          <p class="mb-4"></p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">탈퇴 안내</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
               	 사용중인 아이디는 탈퇴할 경우 <strong>재사용 및 복구가 불가능</strong>하니 신중하게 선택하시기 바랍니다.<br>
				<br>
				탈퇴 후에도 작성하신 영화 리뷰는 그대로 남아 있습니다.<br>
				삭제를 원하는 리뷰가 있다면 반드시 탈퇴 전에 삭제하여 주시기 바랍니다.<br>
				탈퇴 후에는 현재 로그인 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br>		

				정말 탈퇴하시겠습니까?<br>
              </div>
            </div>
            <div class="card-footer py-3">
            	안내 사항을 모두 확인하였으며, 이에 동의합니다
            	<form method="post" action="/main/Logout2">
            	<input type="checkbox" id="leave_agree" class="checkbox"><br>
            	<input type="hidden" id="user_id" name="user_id" value="<sec:authentication property='principal.username'/>" />
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
            	<button type="submit" id="deleteBtn" class="btn btn-danger">회원 탈퇴</button>
            	</form>
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
  	$("#deleteBtn").on("click", function(e){
  		e.preventDefault();
  		$("form").submit();
  	});
  </script>
<%@include file="../includes/footer.jsp"%>
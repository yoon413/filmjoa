<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header.jsp" %>

<section class="filmoja-breadcrumb-area section_70">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="breadcrumb-box">
					<h1 id="boxName">공지사항</h1>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="filmoja-login-area section_70">
	<div class="container">		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-defualt">		
				<!--  /.panel-heading -->
					<div class="panel-body">
						<!--  등록 form -->
						<form role="form" action="/board/register" method="post" id="submitForm">
							<div class="form-group">
								<label>제목</label> <input class="form-control" name="brd_title">
							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="3" name="brd_content" id="content"></textarea>
							</div>
							<input type="hidden" id="user_id" name="user_id" value="<sec:authentication property='principal.username'/>"/>
							<input type="hidden" id="brd_table" name="brd_table" value="${brd_table}"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />				
							<button type="reset" class="btn btn-secondary">다시 쓰기</button>
							<button type="submit" id="brdSubmit" class="btn btn-primary pull-right">글 등록</button>											
						</form>
						<!--  등록 form  end -->
					</div>
					<!-- end panel-body -->
				</div>
				<!-- end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		<!-- /.row -->
	</div>
</section>

<script>
$(document).ready(function(e){
	
	//박스 내용 변경
	var boxName = '${brd_table}'
	if(boxName == 'article'){			
		$("#boxName").text("자유게시판");
	} 
	
	
})
</script>	
	
<%@include file="../includes/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%@include file="../includes/header.jsp"%>


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
					<!--  수정 Form  -->
					<form role="form" action="/board/modify" method="post" id="submitForm">
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        				<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    				<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>				
						<div class="form-group">
							<div class="row">
								<div class="col-lg-4">
									<label>글 번호</label>
									<input class="form-control" name="bno" value="${board.bno}" readonly>
								</div>
								<div class="col-lg-4">	
									<label>최초 등록일</label>
									<input class="form-control" name="brd_regdate" value="<fmt:formatDate pattern = " yyyy-MM-dd hh:mm:ss" value = "${board.brd_regdate}" />" disabled>
								</div>	
								<div class="col-lg-4">	
									<label>수정일</label>
									<input class="form-control" name="brd_updatedate" value="<fmt:formatDate pattern = " yyyy-MM-dd hh:mm:ss" value = "${board.brd_updatedate}" />" disabled>
								</div>	
							</div>
						</div>
						<div class="form-group">
							<label>제목</label> 
							<input class="form-control" id="brd_title" name="brd_title" value="${board.brd_title}">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="brd_content">${fn:replace(board.brd_content, replaceChar, "<br/>" )}</textarea>
						</div>
						<input type="hidden" id="user_id" name="user_id" value="<sec:authentication property='principal.username'/>"/>
						<input type="hidden" id="brd_table" name="brd_table" value="${board.brd_table }"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />				
						<button type="submit" id="brdSubmit" class="btn btn-primary pull-right">글 수정</button>								
					</form>
					<!-- 수정 Form end -->
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
		var boxName = '${board.brd_table}'
		if(boxName == 'article'){			
			$("#boxName").text("자유게시판");
		} 
		
		//수정 시에 맨 상위글이 아닌 경우에는 답글이므로 제목 수정 불가처리
		var groupOrd = '${board.brd_groupOrd}'
		if (groupOrd != 1){
			$("#brd_title").prop('readonly', true);
		}
	})
</script>

  




<%@include file="../includes/footer.jsp"%>

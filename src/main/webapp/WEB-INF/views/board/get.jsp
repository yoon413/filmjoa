<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<%@ include file="../includes/header.jsp"%>


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
				<div class="panel panel-default">					
					<div class="panel-body">
						<table class="table table-bordered" >
							<thead style="text-align:center">
								<tr class="table-active" >
									<th><c:out value="${board.brd_title}"/></th>
								</tr>
							</thead>
								<tr>
									<td>
										<p>Date: <fmt:formatDate pattern = " yyyy-MM-dd hh:mm:ss" value = "${board.brd_updatedate}" /></p>
										<p>Name: <c:out value="${board.user_id}"/></p>
									</td>
								</tr>
							<tbody>	
								<tr id="content">
									<td>${fn:replace(board.brd_content, replaceChar, "<br/>" )}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--  end pannel-body -->
					<sec:authorize access="isAuthenticated()">
					<div class="btnDiv">
				
					</div>			
							<form method="post" id="operForm" action="/board/remove">
								<input type="hidden" value="${board.bno}" name ="bno">
								<input type='hidden' name='brd_table' value='${board.brd_table}'>
								<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        						<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    						<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
							</form>
					</sec:authorize>
				</div>
				<!-- end panel -->
			</div>
		</div>
		<!--  /.row -->
	</div>
</section>



<script>

	$(document).ready(function(e){
		
		var userName = '${board.user_id}'
		var loginedId = '<sec:authentication property='principal.username'/>';
		
		//로그인된 계정에 따른 버튼 추가
		if(userName != loginedId) {			
			$(".btnDiv").html('<button class="btn pull-right" data-oper= "reply" type="button" id="replyBtn" style="margin-left: 10px">답변하기</button>');
		} else {
			var str = "";
			str += '<button class="btn pull-right " data-oper= "delete" type="submit" id="deleteBtn" style="margin-left: 10px">삭제하기</button>';
			str += '<button class="btn pull-right" data-oper= "modify" type="button" id="modifyBtn" style="margin-left: 10px">수정하기</button>';			
			
			$(".btnDiv").html(str);
			
		}
		
		// 박스네임 변경
		var boxName = '${board.brd_table}'
		if(boxName == 'article'){			
			$("#boxName").text("자유게시판");
		} 
		
		var operForm  = $("#operForm");
		
		//수정 버튼
		$("button[data-oper='modify']").on("click", function(e){			
			operForm.attr("method", "get");
			operForm.find("#csrf").remove();		
			operForm.attr("action", "/board/modify").submit();
		});
		
		//답변 버튼
		$("button[data-oper='reply']").on("click", function(e){			
			operForm.attr("method", "get");
			operForm.find("#csrf").remove();		
			operForm.attr("action", "/board/reply").submit();
		});
		
		//삭제 버튼
		$("button[data-oper='delete']").on("click", function(e){
			operForm.append("<input type='hidden' name='brd_groupOrd' value='${board.brd_groupOrd}'>");
			operForm.attr("action", "/board/remove");
			operForm.submit();
		});
		
	});
	
</script>

<%@include file="../includes/footer.jsp"%>
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
                	<h1>자유게시판</h1>
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
                	<div class="panel-heading">   
                		<sec:authorize access="isAuthenticated()">
                			<form method="get" action="/board/register">
                				<input type="hidden" name="brd_table" value='article' /> 
                   				<button id="regBtn" type="submit" class="btn btn-xs pull-right">글 등록</button>   
                   			</form> 	
                    	</sec:authorize>                     
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                    	<table class="table table-striped table-hover">
                        	<thead>
                            	<tr>
                                	<th>No.</th>
                                	<th>제목</th>
                                	<th>작성자</th>
                                	<th>작성일</th>
                                </tr>
                            </thead> 
                            <c:forEach items="${boardList}" var="boardList">
                            	<tr>
                            		<td>${boardList.bno}</td>
                            		<td><a class="get" href="${boardList.bno}">${boardList.brd_title}</a></td>
                            		<td>${boardList.user_id}</td>
                            		<td><fmt:formatDate pattern = " yyyy-MM-dd hh:mm:ss" value = "${boardList.brd_regdate}" /></td>
                            	</tr>
                            </c:forEach>  		                               	                                                       
                        </table>
                        <!-- table end -->
                            
                        <div class='row'>
                        	<div class="col-lg-12">
                            	<!--  검색 처리 -->
                            	<form id='searchForm' action="/board/article" method='get'>
                            		<select name="type">
                            			<option value=""
                            				<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--
                            			</option>
                            			<option value="T"
                            				<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목
                            			</option>
                            			<option value="C"
                            				<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용
                            			</option>
                            			<option value="W"
                            				<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자
                            			</option>
                            			<option value="TC"
                            				<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용
                            			</option>
                            			<option value="TW"
                            				<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자
                            			</option>
                            			<option value="TWC"
                            				<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자
                            			</option>                            				
                            		</select>
                            		
                            		<input type="text" name="keyword" 
                            			value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
                            			type="hidden" name="pageNum"
                            			value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
                            			type="hidden" name="amount"
                            			value='<c:out value="${pageMaker.cri.amount}"/>' />                   
                            		<button class="btn btn-default">Search</button>
                            	</form>
                            	<!--  검색 처리 end -->
                            </div>
                        </div>
                        <!-- row end -->
                        
                       <div class="pull-right">
                       	<ul class="pagination">
                        	<c:if test="${pageMaker.prev}">
                            	<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
                            </c:if>
                            	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            		<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''} ">
                            			<a href="${num}">${num}</a>
                            		</li>	
                            	</c:forEach>
                            		
                            <c:if test="${pageMaker.next}">
                            	<li class="paginate_button next"><a href="${pageMaker.endPage +1}">Next</a></li>
                            </c:if>	 	
                        </ul>
                      </div>
                      <!-- end Pagination -->
                      
                      <form id="actionForm" action="/board/article" method="get">
                           <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                           <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                           <input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type}"/>">
                            <input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>">          	
                      </form>                               
                    </div>
      				<!--  end pannel-body -->
            	</div>
            	<!-- end panel -->
            </div>
          </div>
          <!--  /.row -->
        </div>
    </section> 
    
<script type="text/javascript">
	$(document).ready(function(){
		
		// 글 등록 정상적일 경우 처리
		var result = '<c:out value="${result}"/>';
		
		checkReuslt(result);
		
		history.replaceState({},null,null);
		
		function checkReuslt(result){
  			if (result === '' || history.state) {
  				return;
  			} else if (result === "success"){
  			alert("정상적으로 처리되엇습니다.");
  			}
  		}
		
		
		// 페이징 처리
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		// 해당 글로 이동
		$(".get").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='brd_table' value='${pageMaker.cri.tableType}'>");
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		});
		
		//검색 처리
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e){
			
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요.");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefualt();
			
			searchForm.submit();
		});
	});
</script>

<%@include file="../includes/footer.jsp" %>

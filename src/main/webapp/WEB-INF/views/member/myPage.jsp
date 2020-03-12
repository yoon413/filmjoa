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
				<!-- DataTales -->
          		<div class="card shadow mb-4">
            		<div class="card-header py-3">
              			<h6 class="m-0 font-weight-bold text-primary">작성 리플 모음</h6>
            		</div>
            		<div class="card-body">
              			<div class="table-responsive">
                			<table class="table table-bordered">
                  				<thead>
                    				<tr>
                      					<th>영화</th>
                      					<th>리플 제목</th>
                      					<th>리플 내용</th>
                      					<th>평점</th>
                      					<th>날짜</th>
                      					<th></th>
                    				</tr>
                  				</thead> 
                  				<tbody id="tbody">
                  				</tbody>
                			</table>
              			</div>
              			<div class= "row">
             				<div class="col-md-12">
                   				<div id="reviewPaging">
                                         		
                   				</div>
               				</div>
             			</div>
            		</div>
          		</div>
          		<!-- DataTales End-->
        	</div>
        	<!-- /.container-fluid -->
      	</div>
      	<!-- End of Main Content -->
    </div>
    <!-- End of Content Wrapper -->
 </div>
 <!-- End of Page Wrapper -->

	


	<script>
		//뒤로 가기 문제 해결
      	$(document).ready(function(){
      		var result = '<c:out value= "${result}"/>';
      		checkModal(result);
      		history.replaceState({},null,null);
      		
      		function checkModal(result){
      			if (result === '' || history.state) {
      				return;
      			} else if(result === 'success'){
      				alert("회원 정보 수정이 완료되었습니다.");
      			} else {
      				alert("리플이 정상적으로 삭제되었습니다.")
      			}
      		}
      		
      		 showList(1);
      		 var mno = "";
      		//페이징 및 조회처리
      		function showList(page){
      			var user = "<sec:authentication property='principal.username'/>";
      			var replyUL = $("#tbody");
      			$.getJSON("/member/mypage/" + user + "/" + page + ".json", function(data){
      				console.log(data)
      				var list = data.reviewList;
  		       		var str="";
  		       	    var mnoValue="";
  		       	 if(list == null || list.length == 0){  			        
  			        replyUL.html(""); 
  			        return;
  			      }
  		       		
  		       		for (var i = 0, len = list.length || 0; i < len; i++) {
  		       		str+= "<tr>"
                    str+= "<td><a href='/main/get?mno="+list[i].mno+"'>"+list[i].movieVO.title+"</a></td>"
                    str+= "<td>"+list[i].review_title+"</td>"
                    str+= "<td>"+list[i].review_content+"</td>"   
                    str+= "<td>"+list[i].star_score+"</td>"   
                    str+= "<td>"+displayTime(list[i].updateDate)+"</td>" 
                    str+= "<form method='post' class='deleteReview' action='/review/removeReview'>";
                    str+= "<td><button class='btn btn-danger' data-mno='"+list[i].mno+"' id='btn"+list[i]+"' type='submit'>삭제</button></td>"
                    str+= "</form>";
                    str+= "</tr>"
 		         }		       		
  		    		$("#tbody").html(str);
  		    		showReviewPage(data.replyCnt);
  		     	 });//end function
  		      
  		   }//end showList      	
      			

  		   //페이징 버튼 처리
      		var pageNum = 1;
	        var reviewPageFooter = $("#reviewPaging");
	        
	        function showReviewPage(replyCnt){
	        	
	          var endNum = Math.ceil(pageNum / 10.0) * 10;  
	          var startNum = endNum - 9;  
	          
	          var prev = startNum != 1;
	          var next = false;

	          if(endNum * 10 >= replyCnt){
	            endNum = Math.ceil(replyCnt/10.0);
	          }
	          
	          if(endNum * 10 < replyCnt){
	            next = true;
	          } 
	          var str = "<ul class='pagination pull-right'>";	          
	          if(prev){
	            str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
	          } 
	          for(var i = startNum ; i <= endNum; i++){       
	            var active = pageNum == i? "active":"";            
	            str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	          }  
	          if(next){
	            str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
	          }       
	          str += "</ul></div>";                 
	          reviewPageFooter.html(str);
	        }
	   
	        // 페이징 번호 버튼 누름
	        reviewPageFooter.on("click","li a", function(e){
	            e.preventDefault();
	            console.log("page click");
	            
	            var targetPageNum = $(this).attr("href");
	            
	            console.log("targetPageNum: " + targetPageNum);
	            
	            pageNum = targetPageNum;
	            
	            showList(pageNum);
	          }); 		
      		
	      	// 리뷰 목록 삭제 버튼 처리
	        $("body").on("click", "[id^=btn]", function(e){
      				str = "";
      				e.preventDefault();
      				var mnoValue = $(this).data("mno");
      				var user_id = "<sec:authentication property='principal.username'/>"
      				str+= "<input type='hidden' name='user_id' value='"+user_id+"' />";
      				str+= "<input type='hidden' name='mno' value='"+mnoValue+"' />";
      				str+= "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />";
      				$(".deleteReview").append(str);
      				$(".deleteReview").submit();
      			});
	      	
	     	 //시간 처리 메서드
	      	function displayTime(timeValue) {
	    		var today = new Date();
	    		var gap = today.getTime() - timeValue;
	    		var dateObj = new Date(timeValue);
	    		var str = "";

	    		if (gap < (1000 * 60 * 60 * 24)) {
	    			var hh = dateObj.getHours();
	    			var mi = dateObj.getMinutes();
	    			var ss = dateObj.getSeconds();
	    			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
	    					':', (ss > 9 ? '' : '0') + ss ].join('');

	    		} else {
	    			var yy = dateObj.getFullYear();
	    			var mm = dateObj.getMonth() + 1; 
	    			var dd = dateObj.getDate();

	    			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
	    					(dd > 9 ? '' : '0') + dd ].join('');
	    		}
	    	}	
		    		
			});
      	</script>
<%@include file="../includes/footer.jsp"%>

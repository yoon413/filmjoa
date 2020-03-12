<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
             
<!-- Breadcrumb Area Start -->
<section class="filmoja-breadcrumb-area section_70 " style="background-color:black">
	<div class="container" >
    	<div class="row">
        	<div class="col-md-12">
            	<div class="movie-details-banner" >
                	<div class="row">
                		<!-- 영화 이미지 -->
                    	<div class="col-lg-3 col-sm-4" >                         
                        	<div class="details-banner-thumb" >
                            	<c:url value="/main/img" var="img">                           		
            						<c:param name="img_path" value="${getMovieInfo.imageVO.img_path}"/>
            						<c:param name="img_name" value="${getMovieInfo.imageVO.img_name}"/>            		
            				    </c:url>
                           		<img src="${img}"alt="movie" />
                            </div>
                        </div>
                        <!-- 영화 이미지 end -->
                        <!-- 영화 제목, 장르, 상영시간, 트레일러 -->
                        <div class="col-lg-6 col-sm-8">
                        	<div class="details-banner-info">
                        		<h3><c:out value="${getMovieInfo.title}"/> </h3>
                            	<p class="details-genre">
									<c:out value='${getMovieInfo.genre1}'/>
                              		<c:if test='${getMovieInfo.genre2 != null}'>
                              			, <c:out value='${getMovieInfo.genre2}'/>
                              		</c:if>
                              		<c:if test='${getMovieInfo.genre3 != null}'>
                              			, <c:out value='${getMovieInfo.genre3}'/>
                              		</c:if>
							    </p>
                              	<p class="details-time-left"><i class="fa fa-clock-o"></i><c:out value="${getMovieInfo.time}"/></p>
                                <a href="<c:out value="${getMovieInfo.trailer}"/>" class="filmoja-btn tablet-action">
                                	<i class="fa fa-play"></i>watch trailer
                                </a>
                           	</div>
                        </div>
                        <!-- 영화 제목, 장르, 상영시간, 트레일러 end-->
                        <!-- 트레일러 큰 화면일때 버튼 -->
                        <div class="col-lg-3">
                        	<div class="details-banner-action">
                              <a href="<c:out value="${getMovieInfo.trailer}"/>" class="filmoja-btn">
                              	<i class="fa fa-play"></i>watch trailer
                              </a>
                           </div>
                        </div>
                        <!-- 트레일러 큰 화면일때 버튼 end-->
                     </div>
            	</div>
        	</div>
    	</div>
   	</div>
  </section>
  <!-- Breadcrumb Area End -->
      
  <!-- The Modal -->
  <div class="modal" id="myModal">
  	<div class="modal-dialog">
    	<div class="modal-content">
        	<!-- Modal Header -->
        	<div class="modal-header">
          		<h4 class="modal-title">리뷰 수정</h4>
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
        	</div>
        	<!-- Modal Header End -->
        	<!-- Modal body -->
        	<div class="modal-body">
          		<div class="form-group">
                	<label>리뷰 타이틀</label> 
                	<input class="form-control" id="titleName">
              	</div>      
              	<div class="form-group">
                	<label>내용</label> 
                	<textarea class="form-control" id="titleContent" ></textarea>
              	</div>
              	<div class="form-group">
                	<div class="review_rating form-item">
                 		<p>rate now:</p>
                 		<input type="radio" id="modStar5"  name="modScore" value="5" />
                 			<label class="full" for="modStar5" title="Awesome - 5 stars"></label>
                 		<input type="radio" id="modStar4" name="modScore" value="4" />
                 			<label class="full" for="modStar4" title="Pretty good - 4 stars"></label>
                 		<input type="radio" id="modStar3" name="modScore" value="3" />
                 			<label class="full" for="modStar3" title="Meh - 3 stars"></label>                                               
                 		<input type="radio" id="modStar2" name="modScore" value="2" />
                 			<label class="full" for="modStar2" title="Kinda bad - 2 stars"></label>                                                
                 		<input type="radio" id="modStar1"  name="modScore" value="1" />
                 			<label class="full" for="modStar1" title="Sucks big time - 1 star"></label>
                 	</div>
              	</div>
        	</div>
        	<!-- Modal body End -->
        	<!-- Modal footer -->
        	<div class="modal-footer">
          		<button type="button" class="btn btn-info" id="modReviewBtn" data-dismiss="modal">수정</button>
          		<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>  
        	</div>
        	<!-- Modal footer End-->
      	</div>
    </div>
 </div>
 <!-- The Modal End -->      
 	<!-- Movie Details Page Start -->
    <section class="filmoja-movie-details-page section_70">
    	<div class="container">
        	<div class="row">
            	<div class="col-lg-9 offset-lg-3">
                	<div class="movie-details-page-box">
                    	<!--  감독, 개봉일, 배우 , 시청 연령 -->
                    	<ul>
                        	<li><span>감독</span> : <c:out value="${getMovieInfo.director}"/></li>
                        	<li><span>개봉일</span> : <c:out value="${getMovieInfo.release}"/></li>
                        	<li><span>배우</span> : 
                        		<c:out value='${getMovieInfo.actor1}'/>
                              	<c:if test='${getMovieInfo.actor2 != null}'>
                              		, <c:out value='${getMovieInfo.actor2}'/>
                              	</c:if>
                              	<c:if test='${getMovieInfo.actor3 != null}'>
                              		, <c:out value='${getMovieInfo.actor3}'/>
                              	</c:if>
                              	<c:if test='${getMovieInfo.actor4 != null}'>
                              		, <c:out value='${getMovieInfo.actor4}'/>
                              	</c:if>
                         	</li>
                        	<li><span>시청 연령</span> : <c:out value="${getMovieInfo.age}"/></li>
                     	</ul>
                     	<!--  감독, 개봉일, 배우 , 시청 연령  end-->
                     	<div class="tv-panel-list">
                        	<div class="tv-tab">
                           		<ul class="nav nav-pills tv-tab-switch" id="pills-tab" role="tablist">
                              		<li class="nav-item">
                                		<a class="nav-link active show" id="pills-brief-tab" data-toggle="pill" href="#pills-brief" role="tab" aria-controls="pills-brief" aria-selected="true">영화 줄거리</a>
                              		</li>             
                              		<li class="nav-item">
                                 		<a class="nav-link" id="pills-reviews-tab" data-toggle="pill" href="#pills-reviews" role="tab" aria-controls="pills-reviews" aria-selected="false">작성 리뷰</a>
                              		</li>
                           		</ul>
                        	</div>
                        <div class="tab-content" id="pills-tabContent">
                        	<!-- 줄거리  -->
                        	<div class="tab-pane fade active show" id="pills-brief" role="tabpanel" aria-labelledby="pills-brief-tab">
                            	<div class="tab-movies-details">
                                	<div class="row">
                                    	<div class="col-md-12">
                                       		<div class="tab-body">
                                          		<p><c:out value="${getMovieInfo.plot}"/></p>
                                       		</div>
                                    	</div>
                                 	</div>
                              	</div>
                           	</div>
                            <!-- 줄거리  End -->
                            <!-- 작성 리뷰 Div -->
                            <div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab">
                            	<div class="tab-movies-details">
                                	<div class="row">
                                    	<div class="col-md-12">
                                        	<div class="reviews">
                                          		<ul class="reviews-box">
                                          	
                                          		</ul>           
													<!-- 리뷰 등록 Div -->                      		               						               								             							
                                          			<div id="revewFormDiv">
                                          				<!--  리뷰 작성 Form  -->
                                          				<form id="reviewForm" action="/review/new" class="form" method="post">
                                             				<div class="form-item">
                                                				<input type="text" name="review_title" id="review_title" placeholder="Review Title">
                                             				</div>
                                             				<div class="form-item">
                                                				<textarea name="review_content" id="review_content" placeholder="내용 입력..."></textarea>
                                             				</div>
                                             				<div class="review_rating form-item">
                                                				<p>영화 평점:</p>
                                                				<input type="radio" id="star5" name="star_score" value="5" /><label class="full" for="star5" title="Awesome - 5 stars"></label>
                                                				<input type="radio" id="star4" name="star_score" value="4" /><label class="full" for="star4" title="Pretty good - 4 stars"></label>
                                                				<input type="radio" id="star3" name="star_score" value="3" /><label class="full" for="star3" title="Meh - 3 stars"></label>                                               
                                                				<input type="radio" id="star2" name="star_score" value="2" /><label class="full" for="star2" title="Kinda bad - 2 stars"></label>                                                
                                                				<input type="radio" id="star1" name="star_score" value="1" /><label class="full" for="star1" title="Sucks big time - 1 star"></label>
                                             				</div>
                                             				<input type="hidden" id="mno" name="mno" value="<c:out value='${getMovieInfo.mno}'/>" />
                                             				<input type="hidden" id="user_id" name="user_id" value="<sec:authentication property='principal.username'/>" />
                                             				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                             				<div class="form-item">
                                                				<button id="registerBtn" type="submit">리뷰 등록</button>                                            
                                             				</div>
                                          				</form>
                                          				<!--  리뷰 작성 Form End  -->
                                          			</div>
                                          			<!-- 리뷰 등록 Div End -->
                                       			</div>
                                    		</div>
                                 		</div>
                                 		<!-- End Row -->
                                 		<!-- 리뷰 페이징 Div -->
                                 		<div class= "row">
                                 			<div class="col-md-12">
                                 				<div id="reviewPaging">
                                 		
                                 				</div>
                                 			</div>
                                 		</div>
                                 		<!-- 리뷰 페이징 Div End-->
                              		</div>
                           		</div>
                           		<!-- 작성 리뷰 Div -->
                        	</div>
                     	</div>
                  	</div>
               	</div>
            </div>
    	</div>
	</section>
    <!-- Movie Details Page End -->
      
    <script>    
    	var mnoValue = '<c:out value="${getMovieInfo.mno}"/>';	
      	var loginedUserId = "<sec:authentication property='principal.username'/>";
      	
      	// csrf 공격방지 위한 변수
      	var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
  		var getTitle = "";
      	var getContent = "";
      	var star_score = "";
      	
      	$(document).ready(function(){
      		// form데이터 json으로 변환시켜주는 메서드
      		$.fn.serializeObject = function() {
            	  var result = {}
            	  var extend = function(i, element) {
            	    var node = result[element.name]
            	    if ("undefined" !== typeof node && node !== null) {
            	      if ($.isArray(node)) {
            	        node.push(element.value)
            	      } else {
            	        result[element.name] = [node, element.value]
            	      }
            	    } else {
            	      result[element.name] = element.value
            	    }
            	  }

            	  $.each(this.serializeArray(), extend)
            	  return result
            	}    
          	     		
      		      		
      		//페이징 및 조회처리
      		function showList(page){
      			var mnoValue = '<c:out value = "${getMovieInfo.mno}"/>';
      			$.getJSON("/review/pages/" + mnoValue + "/" + page + ".json", function(data){
      				var list = data.reviewList;
  		    	  	if(page == -1) {
  		    		  pageNum = Math.ceil(data.replyCnt/10.0);
  		    		  showList(pageNum);
  		    	    }
  		    	  	
  		       		var str="";	       		
  		      		for(var i=0; i<list.length; i++){
	      				console.log(data)
	                	str +=  "<li class='single-reviews'>"
	                	str +=  "<div class='reviews-autor'>"             
	                	str +=  "<img class='reviews-avatar' src='/resources/main/img/avatar.jpg' alt=''>"
	                	str +=  "<span id='reviewTitle' class='reviews-title'>"+list[i].review_title +"</span>"
	               	 	str +=  "<span class='reviews-date'>"+displayTime(list[i].updateDate)+"<strong id='id' data-user='"+list[i].user_id+"'>"+list[i].user_id+"</strong></span>"
	                	str +=  "<span class='reviews-rating'><i class='fa fa-star'></i>"+list[i].star_score+"</span>"
	                	str +=  "</div>"
	                	str +=  "<p class='reviews-text'>"+list[i].review_content+"</p>"		               
	    	   			str +=  "</li>"
	    	   			//자신이 작성한 리뷰가 존재하고, 작성한 리뷰일때
	    	   			if(list[i].user_id == loginedUserId){
	    	   				getTitle = list[i].review_title;	    	   	
	    	      			getContent = list[i].review_content;
	    	      			star_score = list[i].star_score;
	    	   				str +="<button type='button' class='btn btn-outline-info btn-sm' id='reviewMod' data-toggle='modal' data-target='#myModal'>수정</button>"                                              		
	    	   				str +="<button type='button' class='btn btn-outline-danger btn-sm' id='reviewDelete'>삭제</button>"    
	    	   				// 리뷰 등록 창은 숨김
	    	   				$("#revewFormDiv").hide();
	    	   			
	    	   			
	    	   			}// 작성 리뷰가 없을 경우
	    	   			if (list.length == 0){
	      					$("#revewFormDiv").show();
	      					$("#review_title").val("");
            				$("#review_content").val("");
            				$('input:radio[name=modScore]:input[value='+star_score +']').prop('checked', false);
	      				}
	    	   		
	                }
  		   	 	$(".reviews-box").html(str);
  		    	showReviewPage(data.replyCnt);
  		      });//end function
  		      
  		   }//end showList      	
      		
  		   // 기본 페이징 조회
  		   showList(1);
  		 
  		   	//페이징 버튼 처리
      		var pageNum = 1;
	        var reviewPageFooter = $("#reviewPaging");
	        
	        // 리뷰 페이징 메서드
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
	          
	          	console.log(str);
	          
	          	reviewPageFooter.html(str);
	        }
	   		
	        //페이징 버튼 누를시 반응
	        reviewPageFooter.on("click","li a", function(e){
	            e.preventDefault();
	            console.log("page click");
	            
	            var targetPageNum = $(this).attr("href");
	            
	            console.log("targetPageNum: " + targetPageNum);
	            
	            pageNum = targetPageNum;
	            showList(pageNum);
	          });   
      		
      		      		
      		//리뷰등록
      		$("#registerBtn").on("click", function(e){
      			e.preventDefault();
      			var csrfHeaderName = "${_csrf.headerName}";
      			var csrfTokenValue = "${_csrf.token}";
      			
      			//json 데이터 타입으로 직렬화시켜서 변수에 담음
      			var formData = $("#reviewForm").serializeObject();
      			
      			//비동기 처리
      			$.ajax({
      				type : 'post',
      				url : '/review/new',
      				data : JSON.stringify(formData),
      				contentType : "application/json; charset=utf-8",
      				beforeSend: function(xhr){
      					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      				},
      				success : function(result, status, xhr) {	
      					showList(-1)
      				},
      				error : function(xhr, status) {
      					alert("리뷰 제목, 내용, 평점을 정확히 입력해 주세요.")
      				}
      			})
      		});
      		
      		
      		//리뷰삭제
    		$(document).on("click", "#reviewDelete" ,function(e){
 			
    			$.ajax({
    				type : 'post',
    				url : '/review/' + mnoValue + "/" + loginedUserId,
    				beforeSend: function(xhr){
    					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    				},
    				data: JSON.stringify({mno:mnoValue, user_id:loginedUserId}),
    				contentType : "application/json; charset=utf-8",
    				success : function(result, status, xhr) {
    					if (result) {
    						showList(pageNum)
    						$("#revewFormDiv").show();
    						$("#review_title").val("");
                			$("#review_content").val("");
                			$('input:radio[name=modScore]:input[value='+star_score +']').prop('checked', false);
    					}
    				},
    				error : function(xhr, status, er) {
    					if (error) {
    						alert("리뷰 삭제가 되지 않았습니다.")
    					}
    				}
    			});
	
    		});
      		
      		//수정 버튼 누를 시 등록한 내용 가져오기
    		$(document).on("click", "#reviewMod" ,function(e){
    			console.log(getTitle)
    		
    			$("#titleName").val(getTitle);
    			$("#titleContent").val(getContent);
    			$('input:radio[name=modScore]:input[value='+star_score +']').attr("checked", true)
    			
    		});
      		
      		//리뷰 수정
      		$(document).on("click", "#modReviewBtn" ,function(e){
      			var modalReviewTitle = $("#titleName").val();
      			var modalReviewContent = $("#titleContent").val();
      			var modalReviewScore = $('input[name=modScore]:checked').val();
      			console.log(modalReviewScore)
      			$.ajax({
    				type : 'post',
    				url : '/review/modify/' + mnoValue + "/" + loginedUserId,
    				beforeSend: function(xhr){
    					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    				},
    				data: JSON.stringify({mno:mnoValue, user_id:loginedUserId, review_title: modalReviewTitle,
    					review_content: modalReviewContent, star_score: modalReviewScore }),
    				contentType : "application/json; charset=utf-8",
    				success : function(result, status, xhr) {
    					if (result) {
    						showList(pageNum)	
    					}
    				},
    				error : function(xhr, status, er) {
    					if (error) {
    						alert("리뷰 수정이 되지 않았습니다.")	
    					}
    				}
    			});
      		});
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

      </script> 
      
<%@include file="../includes/footer.jsp" %>
